# Supplementary Figures for Spatial-VAE Paper

This document describes the figures that should be generated to accompany the Spatial-VAE paper. These figures can be created from the analysis in `recreation.ipynb`.

## Figure 1: Model Architecture Overview
**File**: `figure1_architecture.pdf`
**Description**: Schematic diagram showing the Spatial-VAE architecture
**Components**:
- Input: Gene expression vector (3000 genes)
- Encoder: Fully connected layers with batch norm and dropout
- Latent space: 50-dimensional representation
- Decoder: Gene expression reconstruction
- Spatial heads: Classification and regression networks
- Loss components: Reconstruction, KL divergence, spatial losses

## Figure 2: Training Loss Curves
**File**: `figure2_training_curves.pdf`
**Description**: Training and validation loss curves across 5-fold cross-validation
**Subplots**:
- (a) Total loss (train/validation) over epochs
- (b) Reconstruction loss over epochs
- (c) KL divergence loss over epochs
- (d) Spatial regression losses (x, y, z coordinates)

**Implementation note**: Extract from training history saved during model training

## Figure 3: Data Preprocessing and Visualization
**File**: `figure3_data_overview.pdf`
**Description**: Overview of the Allen Brain Atlas data and preprocessing
**Subplots**:
- (a) Raw 3D brain voxel grid visualization
- (b) Gene expression heatmap (sample genes across voxels)
- (c) Spatial coordinate distributions
- (d) Gene variance distribution and selection of top 3000 genes

## Figure 4: Learned Representations Analysis
**File**: `figure4_representations.pdf`
**Description**: Analysis of the learned latent representations
**Subplots**:
- (a) t-SNE visualization of latent representations colored by spatial coordinates
- (b) Correlation between latent dimensions and spatial coordinates
- (c) Gene expression reconstruction quality (predicted vs actual)
- (d) Spatial prediction accuracy (predicted vs actual coordinates)

## Figure 5: Clustering and Spatial Organization
**File**: `figure5_clustering.pdf`
**Description**: Spatial clustering results from the original notebook analysis
**Subplots**:
- (a) K-means clustering results (k=12) on spatial voxels
- (b) 3D visualization of clusters with anatomical context
- (c) Cluster assignments in different brain slices (coronal, sagittal, horizontal)
- (d) Cluster silhouette scores and evaluation metrics

## Figure 6: Cross-Validation Results
**File**: `figure6_cross_validation.pdf`
**Description**: Performance consistency across 5-fold cross-validation
**Components**:
- Box plots showing loss distributions across folds
- Performance metrics table
- Standard deviation and confidence intervals
- Statistical significance tests between folds

## Figure 7: Ablation Study Results
**File**: `figure7_ablation.pdf`
**Description**: Results from ablation studies removing different loss components
**Comparisons**:
- Full model vs. reconstruction-only VAE
- With/without spatial regression losses
- Different loss weight configurations
- Impact on spatial preservation and reconstruction quality

## Figure 8: Biological Interpretation
**File**: `figure8_biological.pdf`
**Description**: Biological relevance of learned representations
**Subplots**:
- (a) Gene loadings in latent space
- (b) Pathway enrichment analysis of latent dimensions
- (c) Correlation with known anatomical regions
- (d) Spatially variable gene identification

## Supplementary Figures

### Supplementary Figure S1: Detailed Architecture
**File**: `supplementary_s1_detailed_architecture.pdf`
**Description**: Detailed network architecture with layer dimensions and activation functions

### Supplementary Figure S2: Hyperparameter Analysis
**File**: `supplementary_s2_hyperparameters.pdf`
**Description**: Impact of different hyperparameters (latent dimension, loss weights, learning rate)

### Supplementary Figure S3: Computational Performance
**File**: `supplementary_s3_performance.pdf`
**Description**: Training time, memory usage, and scalability analysis

### Supplementary Figure S4: Comparison with Baselines
**File**: `supplementary_s4_baselines.pdf`
**Description**: Comparison with other dimensionality reduction methods (PCA, standard VAE, etc.)

## Code to Generate Figures

Each figure can be generated using the data and analysis from `recreation.ipynb`. The following Python functions should be implemented:

```python
def generate_figure1_architecture():
    """Generate model architecture diagram"""
    pass

def generate_figure2_training_curves(history_files):
    """Generate training curves from saved history"""
    pass

def generate_figure3_data_overview(data_raw, data_processed):
    """Generate data overview plots"""
    pass

def generate_figure4_representations(model, data, latent_representations):
    """Generate representation analysis plots"""
    pass

def generate_figure5_clustering(cluster_results, spatial_coords):
    """Generate clustering visualization"""
    pass

# Additional functions for supplementary figures...
```

## Figure Quality Guidelines

- **Resolution**: All figures should be generated at 300 DPI for publication quality
- **Format**: Save as both PDF (for LaTeX) and PNG (for preview)
- **Colors**: Use colorblind-friendly palettes
- **Fonts**: Use consistent font sizes (10-12pt for labels, 8-10pt for annotations)
- **Style**: Maintain consistent styling across all figures
- **Size**: Design for single or double column layout in academic paper format

## Dependencies for Figure Generation

```python
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd
import plotly.graph_objects as go
import plotly.express as px
from sklearn.manifold import TSNE
from sklearn.decomposition import PCA
from sklearn.metrics import silhouette_score
import torch
```