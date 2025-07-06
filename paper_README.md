# Spatial-VAE: Learning Spatially-Informed Gene Expression Representations

This repository contains the academic paper for the Spatial-VAE project, which presents a novel variational autoencoder architecture for jointly learning gene expression and spatial information from brain atlas data.

## Paper Abstract

Understanding the spatial organization of gene expression in brain tissue is crucial for comprehending neural development, function, and disease mechanisms. We present Spatial-VAE, a novel variational autoencoder architecture that jointly learns gene expression representations while preserving spatial information. Our model incorporates multi-objective learning with reconstruction, classification, and regression tasks to capture both discrete and continuous spatial relationships.

## Files

- `spatial_vae_paper.tex` - Main LaTeX source file for the paper
- `references.bib` - Bibliography file with all cited references
- `recreation.ipynb` - Original implementation notebook (analysis source)
- `README.md` - This file

## Paper Sections

1. **Abstract** - Overview of the method and contributions
2. **Introduction** - Motivation and problem statement
3. **Related Work** - Survey of spatial transcriptomics and VAE methods
4. **Methods** - Detailed description of the Spatial-VAE architecture
5. **Experimental Setup and Results** - Evaluation on Allen Brain Atlas data
6. **Discussion** - Biological implications and technical contributions
7. **Conclusion** - Summary and future directions

## Key Contributions

1. **Multi-objective VAE Architecture**: Simultaneously optimizes reconstruction, spatial classification, and spatial regression objectives
2. **Comprehensive Evaluation**: Experimental validation on high-resolution brain atlas data with 5-fold cross-validation
3. **Spatial-Expression Representations**: Learned representations preserve both gene expression patterns and spatial organization
4. **Open-source Implementation**: Reproducible research with documented methodology

## Methodology Highlights

### Model Architecture
- **Encoder**: Fully connected layers with batch normalization and dropout
- **Decoder**: Gene expression reconstruction network
- **Spatial Heads**: Classification and regression networks for spatial coordinate prediction
- **Multi-task Loss**: Combines reconstruction, KL divergence, classification, and regression objectives

### Loss Function
The model optimizes a multi-objective loss function:
```
L = L_recon + β*L_KL + w_cls*(L_cls,z + L_cls,y + L_cls,x) + w_reg*(L_reg,z + L_reg,y + L_reg,x) + w_reg*L_euclidean
```

### Dataset
- **Allen Mouse Brain Atlas**: 3D voxel grid (67×41×58) with gene expression measurements
- **Preprocessing**: Robust z-score normalization, top 3,000 variable genes
- **Cross-validation**: 5-fold with 80/10/10 train/validation/test splits

## Compiling the Paper

### Prerequisites
- LaTeX distribution (e.g., TeX Live, MiKTeX)
- Required packages: amsmath, amsfonts, graphicx, natbib, algorithm, algorithmic

### Compilation Commands
```bash
# Compile the PDF
pdflatex spatial_vae_paper.tex
bibtex spatial_vae_paper
pdflatex spatial_vae_paper.tex
pdflatex spatial_vae_paper.tex
```

Or using latexmk:
```bash
latexmk -pdf spatial_vae_paper.tex
```

## Results Summary

The experimental evaluation demonstrates:
- **Effective Convergence**: Consistent training across 5-fold cross-validation
- **Quality Reconstruction**: Gene expression reconstruction with low MSE loss
- **Spatial Preservation**: Accurate spatial coordinate prediction from learned representations
- **Stable Performance**: Low variance across different data partitions

### Training Performance
- Training loss: 280,000 → 5,500-6,200 (final)
- Validation loss: ~27,000-30,000 (stable)
- Reconstruction loss: ~3,000-4,000 (final)
- Spatial regression losses: 200-600 range

## Future Directions

1. **Graph-Based Extensions**: Incorporate spatial neighborhood relationships
2. **Hierarchical Representations**: Multi-scale spatial organization modeling
3. **Multi-Modal Integration**: Combine with histological and connectivity data
4. **Biological Constraints**: Incorporate pathway and regulatory network information

## Citation

If you use this work, please cite:
```
@article{ahmed2024spatial,
  title={Spatial-VAE: Learning Spatially-Informed Gene Expression Representations through Variational Autoencoders},
  author={Ahmed, Ziad A. T.},
  journal={arXiv preprint},
  year={2024}
}
```

## Contact

For questions about the paper or methodology, please contact the author or open an issue in this repository.