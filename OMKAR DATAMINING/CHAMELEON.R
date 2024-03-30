
  
  # Load required libraries
  library(cluster)

# Load the Iris dataset
data(iris)

# Perform hierarchical clustering using dynamic modeling
dist_matrix <- dist(iris[, -5])  # Calculate the distance matrix (excluding Species column)
hc_model <- hclust(dist_matrix, method = "ward.D2")  # Apply hierarchical clustering with Ward linkage

# Plot the dendrogram to visualize the clustering
plot(hc_model, main = "Hierarchical Clustering Dendrogram for Iris Dataset", xlab = "Sample Data Points")

# Cut the dendrogram to get cluster labels
cluster_labels <- cutree(hc_model, k = 3)  # Specify the number of clusters (k) you want

# Print the cluster labels
print(cluster_labels)