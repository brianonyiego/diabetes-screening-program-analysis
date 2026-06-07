# Diabetes Screening Programme Analysis

## Overview

This project presents a comprehensive statistical analysis of a diabetes screening programme dataset using R. The analysis explores demographic, behavioural, and clinical characteristics of participants and compares key findings with results from a previous screening programme.

The project was completed as part of a Statistics for Health Data Science assessment and demonstrates the application of descriptive statistics, data visualization, and hypothesis testing in a public health context.

---

## Research Objectives

The analysis aims to:

1. Describe the characteristics of individuals participating in the diabetes screening programme.
2. Examine the distributions of important health indicators such as BMI and Age.
3. Investigate differences between diabetic and non-diabetic participants.
4. Compare current screening results with findings from a previous screening programme.
5. Assess whether smoking status is associated with diabetes prevalence.

---

## Dataset Description

The dataset contains information collected during a month-long diabetes screening programme.

### Variables

| Variable | Description |
|-----------|-------------|
| Diabetes_012 | Diabetes diagnosis (0 = No, 1 = Yes) |
| HighChol | High cholesterol status |
| CholCheck | Whether cholesterol was checked |
| BMI | Body Mass Index (kg/m²) |
| Smoker | Smoking status |
| Stroke | History of stroke |
| Sex | Biological sex (0 = Female, 1 = Male) |
| Age | Age in years |
| MentHlth | Number of poor mental health days |
| Other Variables | Additional screening information |

---

## Software and Packages

The analysis was conducted using:

- R (Version 4.x)
- tidyverse
- knitr

### Required Libraries

```r
library(tidyverse)
library(knitr)
```

---

## Analysis Workflow

### 1. Data Import and Inspection

The dataset is imported into R and checked for:

- Number of observations
- Number of variables
- Data structure
- Summary statistics

Functions used:

```r
read.csv()
str()
summary()
```

---

### 2. Descriptive Analysis

Descriptive statistics were calculated to summarize the population.

#### Continuous Variables

- BMI
- Age

Measures calculated:

- Mean
- Standard Deviation

#### Categorical Variables

- Diabetes status
- Smoking status
- High cholesterol status

Measures calculated:

- Frequencies
- Proportions

Functions used:

```r
summarise()
table()
mean()
sd()
```

---

### 3. Data Visualisation

Several graphical summaries were created.

#### BMI Distribution

Histogram displaying the distribution of BMI values.

#### Age Distribution

Histogram showing participant age distribution.

#### Diabetes Frequency

Bar chart illustrating diabetes prevalence.

#### BMI by Diabetes Status

Boxplot comparing BMI among diabetic and non-diabetic participants.

#### Smoking and Diabetes

Proportional bar chart comparing diabetes prevalence among smokers and non-smokers.

Functions used:

```r
ggplot()
geom_histogram()
geom_bar()
geom_boxplot()
```

---

## Hypothesis Testing

The analysis compares current screening outcomes with previous screening results.

### Reference Values from Previous Screening Programme

| Measure | Previous Value |
|----------|---------------|
| Diabetes Prevalence | 14% |
| Mean BMI | 28 kg/m² |
| Mean Age | 55 years |

---

### Test 1: Diabetes Prevalence

#### Hypotheses

**Null Hypothesis (H₀):**

```text
p = 0.14
```

**Alternative Hypothesis (H₁):**

```text
p ≠ 0.14
```

#### Statistical Test

One-sample proportion test:

```r
prop.test()
```

---

### Test 2: Mean BMI

#### Hypotheses

**Null Hypothesis (H₀):**

```text
μBMI = 28
```

**Alternative Hypothesis (H₁):**

```text
μBMI ≠ 28
```

#### Statistical Test

One-sample t-test:

```r
t.test()
```

---

### Test 3: Mean Age

#### Hypotheses

**Null Hypothesis (H₀):**

```text
μAge = 55
```

**Alternative Hypothesis (H₁):**

```text
μAge ≠ 55
```

#### Statistical Test

One-sample t-test:

```r
t.test()
```

---

### Test 4: Smoking and Diabetes Association

#### Hypotheses

**Null Hypothesis (H₀):**

There is no association between smoking status and diabetes.

**Alternative Hypothesis (H₁):**

There is an association between smoking status and diabetes.

#### Statistical Test

Pearson Chi-Square Test:

```r
chisq.test()
```

Assumption checks were performed using expected cell counts.

---

## Key Findings

### Population Characteristics

- Mean BMI ≈ 28.22 kg/m²
- Mean Age ≈ 63.19 years
- Diabetes prevalence ≈ 15.76%
- Smoking prevalence ≈ 44.32%
- High cholesterol prevalence ≈ 42.41%

### BMI and Diabetes

Participants with diabetes had substantially higher BMI values than those without diabetes.

### Smoking and Diabetes

Diabetes prevalence was higher among smokers than non-smokers.

### Comparison with Previous Screening Programme

- Diabetes prevalence was significantly higher than 14%.
- Mean BMI was slightly higher than 28 kg/m².
- Mean Age was substantially higher than 55 years.
- Smoking remained significantly associated with diabetes.

---

## Assumptions

The statistical analyses assume:

- Independent observations
- Accurate data recording
- Adequate sample size
- Approximate normality of sampling distributions
- Expected frequencies greater than five for Chi-Square testing

---

## Limitations

- Cross-sectional design prevents causal inference.
- Potential selection bias among screening participants.
- Smoking status and other variables may be self-reported.
- Some confounding variables may not be included in the dataset.

---

## Recommendations

### Future Analysis

- Logistic Regression:
  
```r
glm(Diabetes ~ BMI + Age + Smoker + HighChol,
    family = binomial)
```

- Age-stratified analyses
- Risk-adjusted modelling
- Additional data quality checks

### Public Health Recommendations

- Targeted screening for older adults
- Smoking cessation interventions
- Enhanced diabetes prevention programmes
- Continued cardiovascular risk monitoring

---

## Project Structure

```text
Diabetes-Screening-Programme-Analysis/
│
├── data/
│   └── filedata.csv
│
├── scripts/
│   └── diabetes_analysis.R
│
├── outputs/
│   ├── figures/
│   └── tables/
│
├── README.md
│
└── LICENSE
```

---

## How to Run

### Clone the Repository

```bash
git clone https://github.com/yourusername/diabetes-screening-program-analysis.git
```

### Open R or RStudio

### Install Required Packages

```r
install.packages(c("tidyverse", "knitr"))
```

### Run the Script

```r
source("diabetes_analysis.R")
```

---

## Author

**Brian Onyiego**

Mathematics and Computer Science Student

University of Liverpool

---

## License

This project is licensed under the MIT License.
