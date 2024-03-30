
  
  # Load necessary libraries

library(dendextend)
library(cluster)

# Load the Iris dataset
data(iris)

# Specify the columns to be used for clustering
data_attributes <- iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]

# Compute distance matrix
dist_matrix <- dist(data_attributes)

# Perform DBSCAN clustering
dbscan_result <- dbscan(data_attributes, eps = 0.5, MinPts = 5)

# Plot dendrogram for hierarchical clustering
hc <- hclust(dist_matrix, method = "ward.D2")
dend <- as.dendrogram(hc)
plot(dend)

# Plot DBSCAN clusters
plot(dbscan_result, data_attributes)

# Visualize DBSCAN clusters on a scatter plot
plot(data_attributes[, c("Sepal.Length", "Sepal.Width")], 
     col = dbscan_result$cluster + 1, 
     main = "DBSCAN Clustering of Iris Dataset",
     xlab = "Sepal Length", 
     ylab = "Sepal Width")
legend("topright", legend = unique(dbscan_result$cluster), col = unique(dbscan_result$cluster) + 1, pch = 1, title = "Cluster")