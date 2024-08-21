# Clustering Analysis Project

## Overview
This project explores unsupervised learning techniques, specifically clustering methods, to analyze and classify a seeds dataset. The project applies k-means and hierarchical clustering algorithms and evaluates their performance using a custom metric called WK_R. The results are visualized to compare the effectiveness of different clustering approaches.

## Files
- **Unsupervised.R**: The main R script that performs clustering on the seeds dataset, calculates the WK_R values, and generates plots for visualization.
- **WK_R.R**: A custom R script containing the function `WK_R` used to evaluate the agreement between different clustering solutions and the real classifications.
- **seeds_dataset.csv**: The dataset containing the features of various seeds.
- **seeds_real.csv**: The file containing the real classifications of the seeds, used for comparison.

## How to Run
1. **Set Up the Working Directory**:
   Ensure that all the files (`Unsupervised.R`, `WK_R.R`, `seeds_dataset.csv`, `seeds_real.csv`) are in the same directory. Set this directory as your working directory in R. -> setwd("C:\\Path\\To\\Your\\Directory")  

3. Run the Scripts:
   Run the Unsupervised.R script to perform clustering and evaluate the results.

WK_R Function
The WK_R function calculates a custom metric that compares the clustering results with the real classifications. It provides a score (WK_R) that helps evaluate the effectiveness of different clustering methods.

Output
Clustering Results: The script will display the WK_R values for each clustering method, helping to determine the best clustering approach.
Plots: Visual representations of the clustering methods and their respective WK_R values.
