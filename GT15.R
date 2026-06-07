############################################################
# Statistics for Health Data Science - Assessment 1
############################################################

# --- 0. SETUP ENVIRONMENT ---
# Install packages if not in the system on runing code
# install.packages(c("tidyverse", "knitr"))

library(tidyverse)
library(knitr)

# --- 1. IMPORT DATA ---
data <- read.csv("C:/Users/brian/Downloads/filedata.csv")

cat("✅ Data successfully loaded.\n")
cat("Number of rows:", nrow(data), "\n")
cat("Number of columns:", ncol(data), "\n\n")

str(data)
summary(data)

############################################################
# PART 1: DESCRIPTIVE ANALYSIS
############################################################

cat("------------------------------------------------------------\n")
cat("PART 1: DESCRIPTIVE ANALYSIS\n")
cat("------------------------------------------------------------\n")

# --- 1.1 Summary statistics ---
desc_stats <- data %>%
  summarise(
    Mean_BMI = mean(BMI, na.rm = TRUE),
    SD_BMI = sd(BMI, na.rm = TRUE),
    Mean_Age = mean(Age, na.rm = TRUE),
    SD_Age = sd(Age, na.rm = TRUE),
    Prop_Diabetes = mean(Diabetes_012 == 1, na.rm = TRUE),
    Prop_Smoker = mean(Smoker == 1, na.rm = TRUE),
    Prop_HighChol = mean(HighChol == 1, na.rm = TRUE)
  )

cat("Descriptive Statistics:\n")
print(round(desc_stats, 3))
cat("\n")

# --- 1.2 Frequency tables ---
cat("Frequency of Diabetes:\n")
print(table(data$Diabetes_012))
cat("\n")

cat("Frequency of Smoker:\n")
print(table(data$Smoker))
cat("\n")

cat("Frequency of HighChol:\n")
print(table(data$HighChol))
cat("\n")

# --- 1.3 Graphical summaries ---
cat("✅ Generating descriptive plots...\n\n")

# BMI distribution
ggplot(data, aes(x = BMI)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "black") +
  labs(title = "Distribution of BMI", x = "BMI (kg/m2)", y = "Count")
cat("Mean BMI:", round(mean(data$BMI, na.rm = TRUE), 2),
    "| SD:", round(sd(data$BMI, na.rm = TRUE), 2), "\n\n")

# Age distribution
ggplot(data, aes(x = Age)) +
  geom_histogram(bins = 20, fill = "darkgreen", color = "black") +
  labs(title = "Distribution of Age", x = "Age (years)", y = "Count")

cat("Mean Age:", round(mean(data$Age, na.rm = TRUE), 2),
    "| SD:", round(sd(data$Age, na.rm = TRUE), 2), "\n\n")
# Diabetes bar chart
ggplot(data, aes(x = factor(Diabetes_012))) +
  geom_bar(fill = "tomato") +
  labs(title = "Diabetes Diagnosis Frequency", x = "Diabetes (0=No, 1=Yes)", y = "Count")

cat("Proportion with Diabetes:", round(mean(data$Diabetes_012 == 1), 3), "\n\n")




# BMI by Diabetes
ggplot(data, aes(x = factor(Diabetes_012), y = BMI, fill = factor(Diabetes_012))) +
  geom_boxplot() +
  labs(title = "BMI by Diabetes Status", x = "Diabetes (0=No, 1=Yes)", y = "BMI (kg/m2)") +
  scale_fill_manual(values = c("lightblue", "orange"))

cat("Mean BMI (No Diabetes):", round(mean(data$BMI[data$Diabetes_012 == 0]), 2),
    "| Mean BMI (With Diabetes):", round(mean(data$BMI[data$Diabetes_012 == 1]), 2), "\n\n")



############################################################
# PART 2: HYPOTHESIS TESTING
############################################################
cat("------------------------------------------------------------\n")
cat("PART 2: HYPOTHESIS TESTING\n")
cat("------------------------------------------------------------\n")

# Last year's findings
p_prev <- 0.14
mu_BMI_prev <- 28
mu_Age_prev <- 55

# --- 2.1 Test 1: Diabetes prevalence ---
cat("\nTest 1: Diabetes prevalence vs 14%\n")
n <- nrow(data)
p_hat <- mean(data$Diabetes_012 == 1)
prop_test <- prop.test(x = sum(data$Diabetes_012 == 1), n = n, p = p_prev, alternative = "two.sided")
print(prop_test)
cat("Observed prevalence:", round(p_hat * 100, 2), "%\n")
cat("p-value:", round(prop_test$p.value, 4), "\n\n")



# --- 2.2 Test 2: Mean BMI vs 28 ---
cat("Test 2: Mean BMI vs 28 kg/m2\n")
t_BMI <- t.test(data$BMI, mu = mu_BMI_prev, alternative = "two.sided")
print(t_BMI)
cat("Observed mean BMI:", round(mean(data$BMI, na.rm = TRUE), 2), "\n")
cat("p-value:", round(t_BMI$p.value, 4), "\n\n")

# --- 2.3 Test 3: Mean Age vs 55 ---
cat("Test 3: Mean Age vs 55 years\n")
t_Age <- t.test(data$Age, mu = mu_Age_prev, alternative = "two.sided")
print(t_Age)
cat("Observed mean Age:", round(mean(data$Age, na.rm = TRUE), 2), "\n")
cat("p-value:", round(t_Age$p.value, 4), "\n\n")

# --- 2.4 Test 4: Association between Smoking and Diabetes ---
cat("Test 4: Association between Smoking and Diabetes (Chi-squared test)\n")
smoke_table <- table(Smoker = data$Smoker, Diabetes = data$Diabetes_012)
print(smoke_table)
chisq_test <- chisq.test(smoke_table)
print(chisq_test)
cat("p-value:", round(chisq_test$p.value, 4), "\n\n")

# Expected counts (assumption check)
cat("Expected counts (Chi-square assumption check):\n")
print(round(chisq_test$expected, 2))
cat("\n")

# Visualization: Smoking vs Diabetes
ggplot(data, aes(x = factor(Smoker), fill = factor(Diabetes_012))) +
  geom_bar(position = "fill") +
  labs(
    title = "Proportion of Diabetes among Smokers vs Non-Smokers",
    x = "Smoking status (0=Non-smoker, 1=Smoker)",
    y = "Proportion"
  ) +
  scale_fill_manual(values = c("skyblue", "tomato"), name = "Diabetes")

cat("Proportion with Diabetes (Non-smokers):",
    round(mean(data$Diabetes_012[data$Smoker == 0]), 3),
    "| Proportion with Diabetes (Smokers):",
    round(mean(data$Diabetes_012[data$Smoker == 1]), 3), "\n\n")



############################################################
# END OF SCRIPT
############################################################
cat("✅ Analysis complete. Review printed statistics and plots above.\n")

