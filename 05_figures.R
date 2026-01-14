############################################################
# Script: 05_figures.R
# Purpose: Generate figures and plots
############################################################

library(ggplot2)

# Example plot for ROC curve
roc_data <- readRDS("results/roc_data.rds")

# Plot ROC curve
ggplot(roc_data, aes(x = 1 - specificity, y = sensitivity)) +
  geom_line(color = "#5294f7") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  labs(x = "1 - Specificity", y = "Sensitivity") +
  theme_minimal()

ggsave("results/figures/roc_curve.png")
