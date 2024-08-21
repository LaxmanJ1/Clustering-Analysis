# Set working directory and load data
setwd("C:\\Users\\Laxman\\Desktop\\Portfolio")
seeds <- read.csv("seeds_dataset.csv")  # Load the seeds dataset
real <- read.csv("seeds_real.csv")      # Load the real classifications

# Convert the 'Real' column into an array
column_array <- real$Real 

# Source the custom R script containing the WK_R function
source("WK_R.R")

# Perform k-means clustering with k = 3
kmeans_fit <- kmeans(seeds, 3)
kmeans_clusters <- kmeans_fit$cluster 

# Calculate the Euclidean distance matrix for the seeds dataset
distance_matrix <- dist(seeds, method = "euclidean")

# Perform hierarchical clustering with average linkage
hclust_avg <- hclust(distance_matrix, method = "average")
hclust_avg_clusters <- cutree(hclust_avg, k = 3) 

# Plot the hierarchical clustering results
plot(seeds, col = hclust_avg_clusters, main = "Hierarchical Clustering (Average Linkage)")
plot(hclust_avg, main = "Dendrogram (Average Linkage)")

# Calculate the WK_R values for k-means and hierarchical clustering
wk_kmeans <- WK_R(kmeans_clusters, column_array)
print(paste("WK_R for K-means: ", wk_kmeans))

wk_hclust_avg <- WK_R(hclust_avg_clusters, column_array)
print(paste("WK_R for Hierarchical Clustering (Average Linkage): ", wk_hclust_avg))

# Loop to calculate and store WK_R values for different clustering solutions
wk_values <- c()
methods <- c()

for (x in 2:6) {
  # K-means clustering
  kmeans_fit <- kmeans(seeds, x)
  kmeans_clusters <- kmeans_fit$cluster
  wk_kmeans <- WK_R(kmeans_clusters, column_array)
  wk_values <- c(wk_values, wk_kmeans)
  methods <- c(methods, paste("K-means (k=", x, ")", sep=""))
  
  # Hierarchical clustering with average linkage
  hclust_avg <- hclust(distance_matrix, method = "average")
  hclust_avg_clusters <- cutree(hclust_avg, x)
  wk_hclust_avg <- WK_R(hclust_avg_clusters, column_array)
  wk_values <- c(wk_values, wk_hclust_avg)
  methods <- c(methods, paste("Avg, k=", x, sep=""))
  
  # Hierarchical clustering with complete linkage
  hclust_complete <- hclust(distance_matrix, method = "complete")
  hclust_complete_clusters <- cutree(hclust_complete, x)
  wk_hclust_complete <- WK_R(hclust_complete_clusters, column_array)
  wk_values <- c(wk_values, wk_hclust_complete)
  methods <- c(methods, paste("Complete, k=", x, sep=""))
  
  # Hierarchical clustering with single linkage
  hclust_single <- hclust(distance_matrix, method = "single")
  hclust_single_clusters <- cutree(hclust_single, x)
  wk_hclust_single <- WK_R(hclust_single_clusters, column_array)
  wk_values <- c(wk_values, wk_hclust_single)
  methods <- c(methods, paste("Single, k=", x, sep=""))
}

# Plot the WK_R values for different clustering solutions
colours <- rep(c("red", "blue", "green", "purple"), length.out = length(wk_values))
plot(wk_values, col = colours, pch = 19, xaxt = "n",
     xlab = "", ylab = "WK_R Values", main = "WK_R Values for Different Clustering Methods")
axis(1, at = 1:length(methods), labels = methods, las = 2, cex.axis = 0.7)




# Add legend to the plot
legend("topright", legend = c("K-means", "Hierarchical: Average", "Hierarchical: Complete", "Hierarchical: Single"), 
       col = c("red", "blue", "green", "purple"), pch = 19, cex = 0.8)

