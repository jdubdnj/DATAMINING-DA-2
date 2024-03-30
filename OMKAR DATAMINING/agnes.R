
  
  # Load necessary libraries
  library(tidyverse)
library(cluster)
library(factoextra)
library(dendextend)

# Load the Iris dataset provided in R
data(iris)

# Selecting columns for clustering
iris_selected <- iris[, 1:4]

# Perform AGNES clustering
agnes_model <- agnes(dist(iris_selected), method = "ward")

# Plot the dendrogram
plot(agnes_model, which.plot = 2, hang = -1)