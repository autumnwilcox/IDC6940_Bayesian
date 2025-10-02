# Bayesian Logistic Regression for Diabetes Risk (NHANES 2013–2014)

## Overview
This project applies **Bayesian logistic regression** to the 2013–2014 National 
Health and Nutrition Examination Survey (NHANES) to examine the relationship 
between body mass index (BMI), age, sex, and race/ethnicity with a 
diabetes-related outcome (`DIQ240`).

We compare Bayesian and frequentist approaches to evaluate whether Bayesian 
methods provide **more stable and transparent inference**, particularly in the 
presence of missing data and quasi-separation.

## Methods
- **Classical Logistic Regression (MLE):** baseline, but unstable under 
  missingness/separation.  
- **Firth Penalized Regression:** finite estimates with small complete-case 
  sample.  
- **Multiple Imputation (MICE) + Logistic Regression (MLR):** retained ~9,813 
  observations; improved stability but misfit remained.  
- **Bayesian Logistic Regression:** weakly-informative and literature-based 
  priors regularized estimates, yielding interpretable posterior distributions 
  with full uncertainty quantification.  

Diagnostics included convergence checks (Rhat, ESS), trace plots, and posterior 
predictive checks.

## Repository Structure
```bash
.
├── index.qmd          # Full project report
├── slides.qmd         # Presentation slides
├── references.bib     # Bibliography
├── R/                 # Scripts (e.g., data_prep.R)
└── data/              # Processed data files
```

## Reproducibility
To reproduce this project locally:
```bash
# 1. Clone this repository
git clone https://github.com/<username>/<repo-name>.git
cd <repo-name>
```
```{r}
# 2. Install required R packages
install.packages(c(
  "tidyverse", "survey", "mice", "brms", "logistf", 
  "viridis", "knitr"
))

# 3. Preprocess NHANES data
source("R/data_prep.R")
```
```bash
# 4. Render the report and slides
quarto render index.qmd
quarto render slides.qmd
```

## Results (Summary)
- **MLE:** collapsed due to missingness.
- **Firth Regression:** finite coefficients but based on only 14 complete cases.
- **MICE + MLR:** stable results across ~9,813 observations; misfit detected.
- **Bayesian Regression:** most robust approach, providing stable estimates, 
interpretable odds ratios, and transparent uncertainty intervals.

## Authors
- Namita Mishra
- Autumn Wilcox
- **Advisor:** Dr. Ashraf Cohen