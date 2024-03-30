
  
  # Load the Iris dataset
  data(iris)

library("cluster")
numClusters <- 2
X <- iris[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
distances <- dist(X, method = "manhattan")
kmedoids_model <- pam(distances, k = numClusters)

plot(X$Sepal.Length, X$Sepal.Width, col = kmedoids_model$clustering, pch = 19, 
     main = paste('K-medoids Clustering with', numClusters, 'Clusters'))
points(X[kmedoids_model$id.med, 'Sepal.Length'], X[kmedoids_model$id.med, 'Sepal.Width'], 
       col = 1:numClusters, pch = 'x', cex = 2)