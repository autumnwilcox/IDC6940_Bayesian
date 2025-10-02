Comparing conventional and Bayesian workflows for clinical outcome prediction modelling with an exemplar cohort study of severe COVID-19 infection incorporating clinical biomarker test results

Ref:
Sullivan, B., Barker, E., MacGregor, L. et al. Comparing conventional and Bayesian workflows for clinical outcome prediction modelling with an exemplar cohort study of severe COVID-19 infection incorporating clinical biomarker test results. BMC Med Inform Decis Mak 25, 123 (2025). https://doi.org/10.1186/s12911-025-02955-3


Problem:
Data curation is challenging as clinical data are heterogeneous in multiple ways. Biomarkers are recorded for different reasons.
If missing data imputation is performed, it raises another decision point on whether to impute the continuous or the transformed categorical data.


Aim:
Estimating predictive risk factors for disease outcomes with explainable statistical models is desirable for clinical use and decision making. The author provide a guide for modern Bayesian approaches for joint risk factor analysis and variable selection. 

Study design:
Retrospective observational cohort design, lab data linked to the patient data for laboratory markers and clinical outcomes from three hospitals in the Southwest region of England, UK on adults admitted between March to October 2020 and tested positive for SARS CoV-2 by PCR.

Method:
Analyze range of laboratory blood marker values, Develop cross-validated logistic regression prediction models using the candidate biomarkers, highlighting biomarkers worthy of future research.
Employed selection techniques, comparing LASSO frequentist method  and Projective Prediction approach on Bayesian logistic regression models with horseshoe priors to illustrate the process of creating a reduced model. They considered models deliver good prediction performance with a small amount of biomarker data. 

Vairables
(1) Predictors:
Includes a variety of clinical severity indices, lab biomarkers (microbiological, immunological, haematological and biochemistry) as parameters used as predictive variables in the regression models. 

(2) Outcome:
The primary prediction outcome was death or transfer to the ICU.

Data management:
Continuous biomarkers were trannsfromed into categorical variables (reference ranges for clinical use).

Staistical calcukation:
Analytics carried out using the R statistical language using- Standard logistic regression analyses used the R Stats GLM package (v4.4.1); LASSO analyses, GLMnet (v4.1.8); and for Bayesian analyses, BRMS (v2.22.0) and ProjPred (v2.8.0).

Before running full regression models, the independent contribution of individual biomarkers were examined in the training dataset predicting ICU entry or death via standard logistic regressions and Bayesian logistic regressions with either a flat (aka uniform) or horseshoe prior and calculated p-values and odds ratios for each biomarker.

Per biomarker, patients with and without the outcome were separated and then these groups were shuffled and split into 5 equal subgroups. These groups were then paired at random, to ensure training and test datasets have the same proportion of patients with a severe outcome as in full the sample for that biomarker. This was to improve the chance of convergence for biomarkers with high data missingness and only complete cases of training data available for each biomarker were considered for the study.

Each individual biomarker model including age and gender (except univariate age and gender models) were compared against a standard model including only age and gender. Regressions were fit using all associated dummy variables for a given biomarker (e.g. ‘Mild’, ‘Moderate’, ‘Severe’) using ‘Normal’ as the reference.

Analysis using all valid biomarker data:
After individual biomarker evaluation, logistic regression models considering all valid biomarkers (Prediction using individual variables section) and demographic variables were fit to the data and the predictions were tested via internal and external validation using the stratified cross-validation procedures.

Analysis using reduced variable models:
Considering that eben though a model using all biomarker data may have strong predictive power, but clinically a strong prediction with the least amount of biomarkers might save on time, money and other resources, they used LASSO and Bayesian Projective Prediction methodologies to choose reduced variable models to predict COVID-19 severe outcomes.

To estimate variability in model performance and allow comparison between models, we compute inter-quantile AUC difference ranges using 5-fold 20-repeat cross-validation of models

Reduced variable models:
LASSO and projective prediction performed for creation of reduced models with fewer biomarkers.

Model performance evaluation and dissemination
They chose to peform cross-validated estimates of AUC, sensitivity, and specificity and the Inter-quartile intervals over these measures. 

Recommendations: 
Categorization is worth critical consideration in model planning 
Reduced number of variables
Imputation
Bayesian approaches should include that coefficients estimated via Bayes should on average deliver better predictive performance than standard GLM




















