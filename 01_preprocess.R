############################################################
# Project: Erythrocyte Fatty Acids and Intracranial Aneurysm
# Script: 01_preprocess.R
# Purpose: Data loading, cleaning, normalization
# Author: [Removed for blind review]
# Date: 2026-01-XX
############################################################

set.seed(202501)

# ---- Load required packages ----
required_pkgs <- c("openxlsx","dplyr")
invisible(lapply(required_pkgs, require, character.only = TRUE))

# ---- Load example dataset ----
data <- read.xlsx("data/raw/example_data.xlsx", sheet = 1)

# ---- Define variable types ----
cat_vars  <- c("group","sex","diab","hyper","chd","stroke","lipid","smoke","alco","SAH")
cont_vars <- c("age","height","weight","BMI", colnames(data)[20:50])

# ---- Convert categorical variables ----
data[cat_vars] <- lapply(data[cat_vars], as.factor)

# ---- Standardize continuous variables (ignore NA) ----
data_scaled <- data
data_scaled[cont_vars] <- scale(data[cont_vars])

# ---- Save processed dataset ----
write.csv(data_scaled, "data/processed/data_scaled.csv", row.names = FALSE)
