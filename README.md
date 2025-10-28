# Bayesian Logistic Regression for Diabetes Risk (NHANES 2013–2014)

## Overview

This project models doctor-diagnosed diabetes in **NHANES 2013–2014 adults (≥20y)** using:

-   **Survey-weighted logistic regression (MLE)** with NHANES strata, PSU, and exam weights

-   **Multiple imputation (MICE) + logistic regression**

-   **Bayesian logistic regression** (`brms`) with weakly informative priors

Predictors include standardized **age** and **BMI**, **sex**, and a coarsened race/ethnicity factor **race3** (White, Black, Hispanic; rare levels lumped as *Other* to avoid sparsity).

We compare estimates across frameworks and report diagnostics such as convergence metrics, posterior predictive checks, and prevalence comparisons between design-based and model-based inference.

------------------------------------------------------------------------

## Methods

-   **Survey-weighted MLE:** `svyglm()` with NHANES design variables (`WTMEC2YR`, `SDMVPSU`, `SDMVSTRA`).

-   **MICE + logistic regression:** `mice()` with predictive mean matching for continuous variables and categorical models for factors; pooled via Rubin’s rules.

-   **Bayesian logistic regression:** `brms::brm()` using

    -   Coefficients: `Normal(0, 2.5)`

    -   Intercept: `student_t(3, 0, 10)` *(R. V. D. Schoot et al., 2013)*

    -   4 chains × 2000 iterations, `adapt_delta = 0.95`

    -   Normalized NHANES exam weights used as **importance weights** (approximating, not fully replicating, design-based variance).

> **Note:** Firth penalized logistic regression was previously tested but excluded from the final build to maintain consistency with the Quarto report (`index.qmd`).

------------------------------------------------------------------------

## Model Equation

$$
\operatorname{logit}\{\Pr(Y=1)\}
= \beta_0 + \beta_1\,\mathrm{BMI}_c + \beta_2\,\mathrm{Age}_c
+ \beta_3\,\mathrm{Sex} + \sum_g \beta_{3+g}\,\mathrm{Race3}_g
$$

Age and BMI are standardized (z-scores); reference groups: **Male** and **White**.

------------------------------------------------------------------------

## Results summary

The report tabulates odds ratios (per 1 SD) for Age and BMI across models and includes posterior checks, Bayesian ( R\^2 ), and prevalence comparison plots.

*(Avoid hardcoding numeric results here; they are dynamically rendered in `index.qmd`.)*

------------------------------------------------------------------------

## Repository Structure

``` bash
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

``` bash
# 1. Clone this repository
git clone https://github.com/<username>/<repo-name>.git
cd <repo-name>
```

```{r}
# 2. Install required R packages
install.packages(c(
  "tidyverse", "survey", "mice", "brms", "viridis",
  "knitr", "bayesplot"
))

# 3. Preprocess NHANES data
source("R/data_prep.R")
```

``` bash
# 4. Render the report and slides
quarto render index.qmd
quarto render slides.qmd
```

------------------------------------------------------------------------

## Authors

-   Namita Mishra
-   Autumn Wilcox
-   **Advisor:** Dr. Ashraf Cohen
