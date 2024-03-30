
  
  # Load required libraries
  library(cluster)
library(factoextra)

# Load the Iris dataset
data(iris)

# Perform DIANA clustering on Iris dataset
X_iris <- iris[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
diana_model_iris <- diana(X_iris)

# Plot dendrogram
fviz_dend(as.dendrogram(diana_model_iris))