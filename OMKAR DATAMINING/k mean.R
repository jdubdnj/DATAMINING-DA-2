
  
  # Load the Iris dataset
  data(iris)

# Perform K-means clustering
numClusters <- 2
X <- iris[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
kmeans_model <- kmeans(X, centers = numClusters)

# Visualize the clusters
plot(X$Sepal.Length, X$Sepal.Width, col = kmeans_model$cluster, pch = 19, 
     main = paste('K-means Clustering with', numClusters, 'Clusters'))
points(kmeans_model$centers[, c('Sepal.Length', 'Sepal.Width')], 
       col = 1:numClusters, pch = 'x', cex = 2)