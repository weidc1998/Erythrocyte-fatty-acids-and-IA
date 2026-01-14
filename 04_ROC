############################################################
# Script: 04_ROC.R
# Purpose: ROC curve and AUC analysis
############################################################

library(pROC)

# Load data
data <- read.csv("data/processed/data_imputed_scaled.csv")

# ---- Fit a logistic regression model ----
formu <- "group ~ C14_0 + C18_1n9c + C20_2 + C20_4n6 + C20_5n3 + C22_6n3 + PHASES"
fit <- glm(formu, family = "binomial", data = data)

# ---- Make predictions and calculate ROC ----
fitted.prob <- predict(fit, newdata = data, type = "response")
roc_obj <- roc(data$group, fitted.prob)

# ---- Plot ROC curve ----
pdf("results/figures/roc_curve.pdf")
plot(roc_obj)
dev.off()

# ---- Calculate AUC ----
auc(roc_obj)
