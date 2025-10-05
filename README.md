# Bayesian Logistic Regression for Diabetes Risk (NHANES 2013–2014)

## Overview
This project applies **Bayesian logistic regression** to the 2013–2014 National Health and Nutrition Examination Survey (NHANES) to examine the relationship between **body mass index (BMI)**, **age**, **sex**, and **race/ethnicity** with **doctor-diagnosed diabetes** (`DIQ010`).

The goal was to determine whether Bayesian inference provides **more stable and transparent estimates** than classical maximum likelihood estimation (MLE), particularly under missing data, small samples, or quasi-separation.

We compared Bayesian results to several frequentist models — including survey-weighted logistic regression, Firth penalized regression, and multiple imputation (MICE) + logistic regression — using diagnostic and posterior validation tools.

---

## Methods

### Models Compared
- **Survey-weighted Logistic Regression (MLE):**  
  Baseline frequentist model accounting for NHANES design weights, strata, and PSU.
  
- **Firth Penalized Logistic Regression:**  
  Adds a Jeffreys-prior penalty to reduce small-sample bias and produce finite estimates under separation.

- **Multiple Imputation (MICE) + Logistic Regression:**  
  Addresses missing predictor values using chained equations and combines imputed results via Rubin’s rules.

- **Bayesian Logistic Regression (`brms`):**  
  Applies weakly informative priors to regularize coefficients and provide full uncertainty quantification.  
  - Priors:  
    - Coefficients: `Normal(0, 2.5)`  
    - Intercept: `Student-t(3, 0, 10)`  
  - 4 chains × 2000 iterations, `adapt_delta = 0.95`  
  - Normalized NHANES weights used as importance weights  

Diagnostics included **R̂ < 1.01**, **Effective Sample Size (ESS)**, **trace plots**, and **posterior predictive checks (pp_check)**.

---

## Why Bayesian?
Classical MLE often produces unstable or infinite estimates when the outcome is rare or data are imbalanced.  
Bayesian inference:
- Incorporates **prior knowledge** for regularization.
- Provides **credible intervals** that directly express uncertainty.
- Performs robustly under **missingness or separation**.
- Produces **posterior distributions** rather than single point estimates.

---

## Model Equation
\[
\text{logit}(P(\text{Diabetes}=1)) =
\beta_0 + \beta_1(\text{Age}_c) + \beta_2(\text{BMI}_c)
+ \beta_3(\text{Sex}) + \sum_k \beta_k(\text{Race}_k)
\]

Where:
- **Outcome:** Doctor-diagnosed diabetes (`DIQ010`)  
- **Predictors:** Standardized age & BMI, sex, race/ethnicity  
- **Weights:** Normalized NHANES exam weights (`WTMEC2YR`)  

---

## Results Summary

| Model | BMI (per 1 SD) OR (95% CI) | Age (per 1 SD) OR (95% CI) |
|:------|:-----------------------------|:----------------------------|
| **Survey-weighted MLE** | 1.89 (1.65 – 2.15) | 3.03 (2.70 – 3.40) |
| **MICE pooled** | 1.73 (1.58 – 1.89) | 2.90 (2.60 – 3.24) |
| **Bayesian** | 1.87 (1.71 – 2.05) | 2.99 (2.64 – 3.37) |

**Interpretation:**
- Age and BMI were the strongest positive predictors of diabetes.  
- Females had **lower odds** than males.  
- **Mexican American**, **Non-Hispanic Black**, and **Multiracial** adults had **higher odds** than Non-Hispanic White participants.  
- Results were consistent across frequentist and Bayesian frameworks, with Bayesian credible intervals showing comparable precision but clearer uncertainty representation.

---

## Discussion

- All models identified age and BMI as significant independent predictors of diabetes.
- Bayesian modeling produced **stable, interpretable, and well-regularized estimates.**
- Results aligned with frequentist outcomes but offered improved transparency and resilience under missingness.
- The Bayesian approach successfully achieved the study aim — delivering **more stable and transparent inference** for population-based diabetes risk.

---

## Repository Structure
```bash
.
├── index.qmd          # Full project report (rendered as HTML/PDF)
├── slides.qmd         # Presentation slides (rendered to reveal.js)
├── references.bib     # Bibliography for report and slides
├── R/
│   └── data_prep.R    # NHANES preprocessing pipeline
└── data/              # Processed NHANES data files (.rds)
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
  "viridis", "knitr", "bayesplot"
))

# 3. Preprocess NHANES data
source("R/data_prep.R")
```
```bash
# 4. Render the report and slides
quarto render index.qmd
quarto render slides.qmd
```
---

## Authors
- Namita Mishra
- Autumn Wilcox
- **Advisor:** Dr. Ashraf Cohen