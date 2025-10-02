
All 6 summaries and references & citation 

## Namita's Literature

## Introduction

1.  **Bayesian Hierarchical Model (**Disease reclassification and
    prediction)

**What is the goal of the paper?**

The authors develop a Bayesian hierarchical model for multivariate
longitudinal data to predict health status, trajectories, and
intervention effects at the individual level in the PCORI mission to
address questions about health status from patients and clinicians.

**Why is it important?**

Healthcare data (DNA sequences, functional images of the brain,
patient-reported outcomes, and electronic health records with patients’
sequences of health measurements, diagnoses, and treatments) are
complex, and the standard approaches are not adequate for clinical data
analysis. Electronic health records (EHRs) could improve diagnostic
accuracy and predict treatment effects. Visualizations of
characteristics of posterior distributions can be immediately understood
by clinicians and patients as relevant to their decision. Combining
prior knowledge and patient data with evidence could predict the
patient’s health status, trajectory, and/or likely benefits of
interventions.

**How is it solved?**

Method: The authors applied Bayesian hierarchical regression for
multivariate longitudinal patient data using open-source R-packages and
developed 2 levels—time within person and persons within a population

The model combined exogenous (eg, age, clinical history) factors and
endogenous (eg, current treatment) variables on the individual’s
multivariate health measurements and the effects of health measurements
at one time on subsequent interventions.

The model produced an estimate of the posterior distribution for each
value of the predictor variable and an estimate of the marginal
distribution of the regression coefficients for each coefficient that
measures the outcome (health status) associated with its predictor
variables. In a larger sample, the likelihood dominates the prior
distribution for regression coefficients and Bayesian hierarchical model
used a likelihood-based approach, used priors (prior laboratory and
clinical trials data) that provided the assay sensitivities, which
through the prior assumptions, made the model identifiable and the
integration of Markov chain Monte Carlo (MCMC) estimates the posterior
distributions, avoided missing data and complex outcome measurements.

**Results/limitations**

Three case studies: pneumonia etiology in children, prostate cancer, and
mental disorders chosen for model development, identified low-risk
patient population, reduced the risk of overtreatment, complications,
adverse effects, and financial burden for patients (Disease
Reclassification). Prostate cancer software was then implemented within
the JHM HER.

**Limitation**:

Models were entirely parametric, and extensions to nonparametric or more
flexible parametric models were recommended to improve approaches for
neuroimage or genomic data.

Applications:

-   to scale a tool that addresses a particular unmet need across a
    larger, more diverse population of patients and clinicians

-   use in autoimmune diseases, sudden cardiac arrest, and diabetes.

-   embed a collection of tools to acquire and use the most relevant
    information, agnostic to its level of measurement, to improve
    population and individual health decisions that cause better
    outcomes at more affordable costs. @Zeger2020

2.  **Bayesian Inference (parametric vs non-parametric)**

**What is the goal of the paper?**

The authors calculated the posterior probability of disease diagnosis
and applied Bayesian inference to develop three modules comparing
parametric (with a fixed set of parameters) and nonparametric
distributions (which do not make a priori assumptions) by analyzing the
National Health and Nutrition Examination Survey dataset from two
separate diagnostic tests on both diseased and non-diseased populations.

**Why is it important?**

Medical diagnosis, treatment, and management decisions are crucial, and
conventional methods for diagnosis using clinical criteria and fixed
numerical thresholds limit the capture of other information related to
the intricate relationship between diagnostic tests and the varying
prevalence of diseases. The probability distributions associated with
quantitative diagnostic test outcomes often demonstrate some overlap
between the diseased and nondiseased groups. The dichotomous method
fails to capture the complexity and heterogeneity of disease
presentations across diverse populations. The applicability of the
normal distribution (conventional method) is critiqued, especially in
dealing with clinical measurands having skewness, bimodality, or
multimodality.

**How is it solved?**

Methods: The Authors developed models employing Bayesian inference
(Bayesian diagnostic approach) to calculate the posterior probability of
 @Liu2013
