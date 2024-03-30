
  
  # Load necessary libraries
  library(e1071)
library(ggplot2)

# Load the Iris dataset
data(iris)

# Select numerical attributes for clustering
selected_attributes <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")

# Subset the dataset to include only the selected attributes
iris_selected <- iris[selected_attributes]

# Check for missing values
if (sum(is.na(iris_selected)) > 0) {
  stop("Missing values found in the dataset. Please handle missing values before clustering.")
}

# Perform fuzzy clustering (Fuzzy C-Means)
fcm_model <- cmeans(iris_selected, centers = 3, m = 1.25)

# Extract cluster memberships
cluster_memberships <- fcm_model$cluster

# Create a data frame with cluster memberships
iris_clusters <- cbind(iris_selected, Cluster = factor(cluster_memberships))

# Plot the clusters
ggplot(iris_clusters, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point() +
  labs(title = "Fuzzy C-Means Clustering of Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()