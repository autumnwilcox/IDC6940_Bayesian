# A Dynamic Bayesian Model for Identifying High-Mortality Risk in Hospitalized COVID-19 Patients
Amir Momeni-Boroujeni, Rachelle Mendoza, Isaac J. Stopard, Ben Lambert, and Alejandro Zuretti

Infect. Dis. Rep. 2021, 13, 239–250. https://doi.org/10.3390/idr13010027

## Summary
THis paper describes a study that used a Bayesian Markov model to better predict mortality risk for hospitalized COVID-19 patients by incorporating dynamic changes in laboratory values over time, rather than relying solely on admission data. The researchers collected demographic, comorbidity, and lab data for 553 PCR-positive patients and found that factors like age over 80 and certain comorbidities increased risk, but including dynamic changes in biomarkers significantly improved the predictive accuracy of the model. The study concludes by presenting a clinical decision tool that uses the most important factors for patient risk stratification based on available information at different stages of hospitalization.

## Problem

The central problem this research aims to solve is how to accurately and quickly predict which hospitalized COVID-19 patients face the highest risk of death. Because hospitalization rates remained high and the disease caused millions of deaths globally, there was an urgent need to identify factors that predict severe disease and mortality to improve patient care and outcomes. The developed model is intended to allow for prioritization at the systems level and the individualization of care for each patient.

A major shortcoming of previous prognostic tools was that they were static. Existing models generally looked at patient data and biomarkers only at the time of hospital admission to predict a single outcome, like death, at a single future time point. However, the sources note that a patient's risk changes constantly during hospitalization, as biomarkers show outcome-specific dynamic changes. Existing models struggled to incorporate these dynamic changes and had difficulty handling the competing risks a patient faces, like remaining in the hospital, being discharged, or dying. Failing to account for these ongoing changes meant that risk predictions were often inaccurate in real-time clinical settings.

Therefore, the authors developed a "Dynamic Bayesian Model" to overcome these limitations. This new model combines a patient's initial information (demographics and comorbidities) with daily dynamic changes in laboratory test values throughout their hospital stay. By incorporating these time-dependent measurements, the model achieved dramatic improvements in predictive accuracy compared to models that relied only on admission data. This allows the model to provide daily adjustments to the patient’s in-hospital mortality risk, making it a more effective tool for clinicians deciding on appropriate care and resource allocation.

## Methodology

- Case selection
  - Patients admitted to SUNY Downstate Medical Center, with COVID-19 related symptoms, between February 2020 and March 2020.
- Sample
  - 553 PCR-positive patients included in the study.
  - Stratified into two groups: 200 patients who were discharged and 200 patients who died.
  - Data collected: demographic information, comorbidities, and laboratory test values.
- Statistical modeling approaches
  - The researchers conducted two main sets of analyses, both estimated using a Bayesian framework:
    1. Dynamic Bayesian Markov Model
       - The primary goal was to develop a prognostic Markiv model that incorporates dynamic laboratory values with patients' admission profiles.
       - Markov model accounts for competing risks (discharge vs. death) and allows for daily updates to mortality risk based on changing lab values.
       - Predictor sets included:
         - Demographics, comorbidities, admission, and lab values.
       - The model structure included:
    2. Secondary methodology: Logistic Regression Analysis
         - This analysis was conducted to determine factors most predictive of patient mortality but was specifically not intended to assess dynamic changes in mortality risk. This approach considered only patients’ outcomes, without factoring in the time taken for the outcome to occur.
    3. Univariate Analysis (Baseline Comparison)
        - Before the multivariate analyses, univariate Cox survival analyses were used to illustrate the baseline patient characteristics and lab values upon admission that, individually, were the strongest determinants of risk.
- Model Validation 
  - Internal Validation: To assess the internal validity of the Markov model, the researchers performed k-fold cross-validation for each of the four regressions. The predictive accuracy increased significantly when dynamic test values were included, boosting accuracy from around 64–67% (for static models) to 83% (for the dynamic model). 
  - Parameter Interpretation: Since the models were estimated in a Bayesian framework, the results are presented as probabilities representing the posterior probability that a given variable had an odds ratio exceeding one, removing the need for an arbitrary significance cutoff.

## Results and performance

The performance results demonstrate that relying solely on static admission data (demographics, comorbidities, and initial lab values) yielded a mean predictive accuracy of only 64% to 67% across the initial regression sets. In contrast, incorporating dynamic changes in laboratory values (percentage changes relative to admission values) throughout hospitalization significantly boosted the model's predictive power to an accuracy of 83%. 

## Conclusion

The article details a Dynamic Bayesian Markov Model that uses time-dependent changes in biomarkers to achieve 83% accuracy in identifying high-mortality risk in hospitalized COVID-19 patients, significantly outperforming static admission-only models (64–67% accuracy).
