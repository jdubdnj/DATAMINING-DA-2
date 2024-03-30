
  
  library(cluster)
library(tidyverse)
library(factoextra)

# Load the Iris dataset
data(iris)

# Select only the numerical attributes for clustering
iris_numeric <- iris %>% select(-Species)

# Perform clustering analysis using CLARA
clara_result <- clara(iris_numeric, k = 2)

# Determine the optimal number of clusters using silhouette method
optimal_clusters <- fviz_nbclust(iris_numeric, FUNcluster = clara, method = "silhouette")  
print(optimal_clusters)

# Perform CLARA clustering with k = 2
clara_res <- clara(iris_numeric, 2, metric = "euclidean", stand = TRUE, correct.d = FALSE)
print(clara_res)

# Combine clustering results with original data
dd <- data.frame(iris_numeric, cluster = clara_res$clustering)
head(dd)

# Filter out constant columns
constant_columns <- sapply(iris_numeric, function(x) length(unique(x)) <= 1)
iris_filtered <- iris_numeric[, !constant_columns]

# Perform CLARA clustering on filtered data with k = 5
clara_res_filtered <- clara(iris_filtered, k = 5)

# Visualize the clusters
fviz_cluster(clara_res_filtered, data = iris_filtered)