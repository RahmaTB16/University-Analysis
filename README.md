#University Analysis Project

#Author: Rahma Touaibi
#Date: December 10, 2025

#Project Overview

This project analyzes global university rankings, exploring overall scores, citations, publications, and world ranks. The goal is to understand university performance patterns and provide insights for improvement.

#The analysis includes:

* Data cleaning and preparation

* Calculation of key metrics (KPIs)

* Visualizations to explore trends, comparisons, and relationships

#Dataset :
File: cwurData.csv
Content:
institution: University name
country: Country of the university
score: Overall score
citations: Number of citations
publications: Number of publications
world_rank: World rank
broad_impact: Research impact metric
Coverage: Current snapshot

#Key Steps
#1. Data Cleaning

Checked for missing values and duplicates
Corrected data types
Imputed missing broad_impact values with the mean
Removed duplicate universities

#2. Key Metrics (KPIs)

Average Score – Global average university score
Total Citations – Total number of citations

#3. Visualizations

Distribution of Overall Score – Histogram
Top 10 Universities Worldwide – Bar chart
Top 15 Countries by Number of Ranked Universities – Horizontal bar chart
Citations vs University Score – Scatter plot with trendline
Publications vs World Rank – Scatter plot with trendline

#Insights

Most universities score between 40–50; high scores are rare
The USA has the highest number of ranked universities
Citations alone are not a strong predictor of ranking; multiple factors matter
Top-ranked universities publish significantly more research
Average global university score is moderate

#Recommendations

Focus on research productivity and quality of publications
Improve teaching, innovation, and collaboration
Support smaller universities with funding and partnerships
Learn strategies from top-performing universities

#How to Run the Project

1-Open University Analysis.Rmd in RStudio
2-Install required packages if not already installed:
install.packages(c("dplyr", "tidyr", "tidyverse", "lubridate", "ggplot2", "Hmisc"))

3-Update the dataset path in the script:
rank <- read.csv("path/to/cwurData.csv")

4-Click Knit to generate HTML or PDF report

#Output :

Cleaned dataset (rank_clean)
KPIs summary
Visualizations for analysis
Insights and recommendations








