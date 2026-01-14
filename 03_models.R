############################################################
# Script: 03_models.R
# Purpose: Logistic regression and trend tests
############################################################

library(epiDisplay)
library(DescTools)

# Load data
data <- read.csv("data/processed/data_scaled.csv")

run_logistic <- function(exp_var, data) {
  f <- as.formula(paste0("group ~ age + sex + BMI + diab + hyper + smoke + alco + ", exp_var))
  fit <- glm(f, data = data, family = binomial)
  return(summary(fit))
}

fatty_acids <- colnames(data)[15:45]

results <- lapply(fatty_acids, run_logistic, data = data)
saveRDS(results, "results/logistic_results.rds")
