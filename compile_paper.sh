#!/bin/bash

# Compile the Spatial-VAE paper
# This script compiles the LaTeX document and handles bibliography

echo "Compiling Spatial-VAE paper..."

# Check if required files exist
if [ ! -f "spatial_vae_paper.tex" ]; then
    echo "Error: spatial_vae_paper.tex not found!"
    exit 1
fi

if [ ! -f "references.bib" ]; then
    echo "Error: references.bib not found!"
    exit 1
fi

# Create output directory
mkdir -p output

# First compilation
echo "First LaTeX compilation..."
pdflatex -output-directory=output spatial_vae_paper.tex

# Run BibTeX
echo "Running BibTeX..."
cd output
bibtex spatial_vae_paper
cd ..

# Second compilation
echo "Second LaTeX compilation..."
pdflatex -output-directory=output spatial_vae_paper.tex

# Third compilation (to resolve all references)
echo "Third LaTeX compilation..."
pdflatex -output-directory=output spatial_vae_paper.tex

# Check if PDF was generated successfully
if [ -f "output/spatial_vae_paper.pdf" ]; then
    echo "✅ Success! Paper compiled to output/spatial_vae_paper.pdf"
    echo "📄 File size: $(du -h output/spatial_vae_paper.pdf | cut -f1)"
    echo "📖 Pages: $(pdfinfo output/spatial_vae_paper.pdf 2>/dev/null | grep Pages | awk '{print $2}')"
else
    echo "❌ Error: PDF not generated. Check the log files in output/ directory."
    exit 1
fi

# Clean up auxiliary files (optional)
read -p "Clean up auxiliary files? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd output
    rm -f *.aux *.bbl *.blg *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
    echo "🧹 Auxiliary files cleaned up"
fi

echo "Done!"