############################################################
# Script: 02_descriptive.R
# Purpose: Summary statistics and table generation
############################################################

library(tableone)

# Load processed data
data <- read.csv("data/processed/data_scaled.csv")

# ---- Create table for baseline characteristics ----
Tab1.stas <- CreateTableOne(vars = colnames(data), strata = "group", data = data, factorVars = c("group", "sex", "diab", "hyper"), test = TRUE, smd = TRUE, addOverall = TRUE)
Tab1 <- print(Tab1.stas, catDigits = 1, contDigits = 2, pDigits = 3, test = TRUE, smd = TRUE, noSpaces = TRUE)
write.csv(Tab1, file = "results/Table1.csv")
