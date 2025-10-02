Namita's Literature

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

**Results**

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
disease diagnosis in the Wolfram Language and integrated prior
probabilities of disease with distributions of diagnostic measurands in
both diseased and nondiseased populations. The approach enabled the
evaluation of combined data from multiple diagnostic tests and improved
the diagnostic accuracy, precision and adaptability, The model showed
flexibility, adaptability, and versatility in the diagnostic.

Results

Nonparametric Bayesian models tend to fit data distributions better,
especially given limited existing literature, and are more robust in
capturing complex data patterns.

These models produce multimodal probability patterns for disease, unlike
the bimodal, double-sigmoidal curves seen with parametric models.

Limitations

-   Reliance on parametric models: A need to extend to nonparametric or
    more flexible parametric models for medical data.

-   Limited scholarly publications and over-dependence on prior
    probabilities increase uncertainties, resulting in broader
    confidence intervals for posterior probabilities. Systemic bias
    (unrepresentative datasets) compromises the accuracy of Bayesian
    calculations. For Incomplete datasets, Bayesian methods combined
    with other statistical and computational techniques could enhance
    diagnostic capabilities.

-   The foundational data is crucial to compare new diagnostic
    measurements. Absence of normative data compromises the reliability
    and validity of Bayesian diagnostic methods. @Chatzimichail2023

3.  **Bayesian model stages, development and advantages, and temporal
    models**

    **What is the goal of the paper?**

The study describes the stages of Bayesian analysis, specifying the
importance of the priors, data modeling, inferences, model checking and
refinement, selecting a proper sampling technique from a posterior
distribution, variational inferences, variable selection and its
application across various research fields. The study proposes
strategies for reproducibility and reporting standards, outlining an
updated WAMBS (when to Worry and how to Avoid the Misuse of Bayesian
Statistics) checklist and outlining the impact of Bayesian analysis on
artificial intelligence in the future.

**Why is it important?**

Bayesian statistics is suitable for quantitative researchers accross
different fields who have at least some knowledge of regression
modelling.

**How is it solved?**

Examples of successful applications of Bayesian analysis across various
research fields (social sciences, ecology, genetics, medicine) and the
advantages and disadvantages of the Bayesian model are provided here,
and overview of the current and future use of Bayesian statistics.

The study mention priors into three categories (informative, weakly
informative and diffuse) based on the degree of (un)certainty
(hyperparameters) surrounding the population parameter. The prior
distribution is as - N( μ0 , σ\^ 20) where a larger variance represents
a greater amount of uncertainty surrounding.

Prior elicitation (experts, generic expert, data-based, sample data
using maximum likelihood or sample statistics, etc) construct a prior
distribution.

Prior sensitivity analysis of the likelihood helps examine different
forms of the model, assesses how the priors and the likelihood align and
have an impact on posterior estimates, reflecting variations not
captured by the prior or the likelihood alone.

Prior estimation allows data-informed shrinkage, enacts regularization
or influence algorithms towards a likely high-density region, and
improves estimation efficiency.

Knowing the exact probabilistic specification of the priors for a
complex model with smaller sample sizes is important. A small sample
conveys less information compared to the priors that quantify the
strength of support the observed data lends to possible value(s) for the
unknown parameter(s).

Frequentists do not consider the probability of the unknown parameters
as useful, and they are considered to be fixed; the likelihood is the
conditional probability distribution p(y\|θ) of the data (y), given
fixed parameters (θ). In Bayesian inference, unknown parameters (random
variables) have varied values, while the (observed) data have fixed
values, and the likelihood is a function of θ for the fixed data y.

Therefore, the likelihood function summarizes a statistical model that
stochastically generates a range of possible values for θ and the
observed data y. With priors and the likelihood of the observed data,
the resulting posterior distribution provides an estimate of the unknown
parameters, capturing the primary factors and improving our
understanding. Monte Carlo technique provides integrals of sampled
values from a given distribution through computer simulations. The
packages BRMS and Blavaan in R are used for the probabilistic
programming language Stan.

Variable selection after checking correlations among the variables in
the model (Eg: gene-to-gene interaction) aids in the prediction of genes
in biomedical research (genome-wide association studies).

Spatial and temporal variability are factored in Bayesian general linear
models. A posterior distribution can simulate new data conditional on
this distribution, assess, and provide valid predictions to be used for
extrapolating to future events.

**Results**

The Bayesian approach analyzes large-scale cancer genomic data,
identifies novel molecular changes in cancer initiation and progression,
the interactions between mutated genes and captured mutational
signatures, highlighting key genetic interactions components, allowing
genomic-based patient stratification both in clinical trials, in the
personalized use of therapeutics, and in understanding cancer and its
evolutionary processes.

**Limitations**:

-   In temporal models, posterior inference challenges are inherent in
    the spatial and/or temporal dependencies (autocorrelation of
    parameters over time). @VandeSchoot2021

4.  **Bayesian Normal linear regression**

**What is the goal of the paper?**

The author provides guidance on Bayesian inference by performing
Bayesian Normal linear regression in metrology to calibrate instruments
and to evaluate inter-laboratory comparisons in determining fundamental
constants.

**Why is it important?**

The measurement errors are assumed to be additive, independent, and
identically distributed according to a Gaussian distribution with mean
zero and variance σ2, which is usually unknown.

Regression is used to calibrate instruments, evaluate inter-laboratory
comparisons, or determine fundamental constants, but the regression
model cannot be uniquely formulated as a measurement function. Guide to
the Expression of Uncertainty in Measurement (GUM) and its supplements
are not applicable directly.

**How is it solved?**

Methods: Bayesian inference has the advantage of accounting for
additional a priori information, which robustifies the analyses.

Three steps (prior elicitation, posterior calculation, and robustness to
prior uncertainty and model adequacy) and model assumptions are critical
to Bayesian inference.

In Bayesian inference, all unknowns—observables (data) as well as
unobservables (parameters and auxiliary variables) are considered to be
random, are assigned probability distributions to summarize the
available information, and to update prior knowledge about the
unobservables with information about them contained in the data. The
prior distribution and likelihood function provided by simple graphical
displays, sensitivity analyses, or model checking enhance the
elicitation and interpretation process.

For Normal linear regression problems

\(1\) a family of prior distributions for θ and σ2 is (Normal inverse
Gamma (NIG) distribution to a posterior from the same family of (NIG)
distributions or

\(2\) alternative families of prior distributions (hierarchical priors)
assign an additional layer of distributions to uncertain prior
parameters or non-para- metric priors.

The NIG prior with known variance σ2 of observations is a conjugate
prior distribution. Vague or non-informative prior distributions can be
derived from the NIG prior.

Bayesian inference is influenced by

-   the uncertainty in the transformation of prior knowledge to prior
    distributions

-   the assumptions of the statistical model

-   the mistakes in data acquisition

**Results**

The knowledge from related previous experiments (Normal inverse Gamma
distributions) allow for analytic posterior calculations of many
quantities of interest. @Klauenberg2015

5.  **Bayesian linear regression** **and priors (exchangeable and
    unexchangeable)**

**What is the goal of the paper?**

The study developed a test of a formal method for augmenting data in
linear regression analyses, by incorporating both exchangeable and
unexchangeable information on regression coefficients (and standard
errors) of previous studies.

**Why is it important?**

The frequent combination of multiple testing has relatively low
statistical power, which is problematic in null-hypothesis significance
testing. Linear regression analyses do not account for the published
results and summary statistics from similar previous studies. Ignoring
information on parameters from previous studies (relevant and readily
available), affects the stability and precision of the parameter
estimates and results in lower values than they could have been,
resulting in conclusions that are less certain and are affected by
sampling variation.

Multiple linear regression with separate significance tests for all
regression coefficients, and with the modest sample sizes, different
studies find different sets of statistically significant predictors, and
addressing the issue on larger samples is practically unrealistic.

**How is it solved?**

Methods: Bayesian linear regression accommodates prior knowledge,
overcoming the absence of formal studies, handles the issues of
increasing the sample size, and augments the data of a new study with
previous results (regression coefficients and standard errors) from
similar studies.

The authors used Bayesian linear regression to solve the issue of the
univariate case analysis by combining evidence of specific predictors
from different linear regression analyses (as in meta-analysis) and
found it a better method to resolve the issue of simultaneously
combining multiple regression parameters per study, which ignored the
relationship between the regression coefficients. Includes summary
statistics from previous studies, Bayesian linear regression provided a
more acceptable solution when data from previous studies were not
(realistically) obtainable.

Models in the study as categorized the model into - (1) Exchangable -
when the current data and previous studies have the same set of
predictors. (2) Unexchangable – when the predictors were different in
the two.

To yield the posterior density that reflects the updated knowledge about
the model parameters after having observed the data, the steps to
Bayesian linear regression steps are mentioned -

\(1\) To calculate the probability density function for the data given
the unknown model parameters;

\(2\) Taken as a function of those model parameters, the likelihood
function is the second part of the prior density function of the model
parameters. It quantifies what is assumed to be known about the model
parameters before observing the data. The study applied the Standard
multiple linear regression model, and with the integration of the prior,
provided the joint posterior density using the Gibbs sampler. An
Ordinary Least Squares linear regression was then applied to each of
these samples to obtain the estimated regression coefficients B and the
corresponding standard errors.

\(3\) A hierarchical model version was developed in analyzing parameters
where studies are not exchangeable.

**Results**

Incorporating priors from previous studies in a linear regression on new
data yielded a significantly better parameter estimate with an adequate
approximation.

The gains in comparison to using just the new data, and the large
effects were obtained when the data from previous studies were
available, resulting in encouraging performance.

Performance of the two versions (exchangeable and unexchangeable) of the
replication model was consistently superior to using current data alone.

The model developed in the article offers the possibility of obtaining
significantly better parameter estimates in a linear regression setting
without needing to expend a prohibitive amount of time and energy to
obtain data from the previous studies.

Hierarchical version (unexchangeable) of the model offers the advantage
of being able to address questions about differences between studies and
thus allows for explicit testing of the exchangeability assumption.

**Limitations**:

-   All studies need to have the same set of predictors.

-   The issue of predictor variables that are correlated. @DeLeeuw2012a

6.  **Bayesian logistic regression (Sequential clinical reasoning
    approach)**

**What is the goal of the paper?**

The study aimed to develop models using a longitudinal prospective
cohort to predict the risk of incident cardiovascular disease by
incorporating demographic features (basic), six metabolic syndrome
components (metabolic score), and conventional risk factors (enhanced
model). The study participants free of CVD at baseline were followed up
over five years, and a Bayesian clinical reasoning model was applied to
diagnose new CVD cases.

**Why is it important?**

Early diagnosis, prevention, by identifying subjects under the high-risk
category for cardiovascular disease (CVD), impacts health interventions.

Limited availability of molecular information in clinical practice due
to being costly and unavailability affects efficient disease diagnosis.
To efficiently identify a high-risk population based on the routinely
checked biological markers before doing these expensive molecular
testsThe requires an alternative approach to analyze data.

The Tailored Framingham Risk Score method, for the purpose, is not
sufficient because of the differences present in ethnic groups,
location, and socio-economic status, as they require the construction of
their own models. Heterogeneity (geographic, ethnic group, variations,
and different characteristics of social contextual network) often is
unobservable and unmeasurable.

**How is it solved?**

Methods: The study evaluated subjects enrolled in a Keelung
Community-based Integrated Screening (KCIS) Program, for mass screening
(20–79 years) in the Keelung city of Taiwan, who were followed for 5
years to identify incident cancers and chronic diseases (cardiovascular
disease).

The study classified the risk of having incident CVD cases or death from
CVD by dint of available calculated standardized risk score of the MetS
components (fasting glucose, blood pressure, HDL-C, triglyceride and
waist circumference) together with conventional risk factors (gender,
heredity, smoking, alcohol drinking, family history of parent's CVD and
betel quid and other relevant factors).

Emulating a clinician's evaluation process, the Bayesian clinical
reasoning approach in a sequential manner was applied and three models
were developed. The approach considered the normal distribution of
regression coefficients of all predictors, allowing for uncertainty of
clinical weights. The credible intervals of predicted risk estimates
were obtained by averaging out. In the model, the individual risk is
elicited by prior speculation (first impression) that is updated by
objective observed data (patient's history and laboratory findings), the
regression coefficients for computing risk score were treated as random
variable with a certain statistical distribution (e.g. normal
distribution) rather than a fixed value (traditional risk prediction
model by frequentist). The updated prior distribution with the
likelihood of the current data provided a posterior distribution to
predict the risk for a specific disease. The sequential approach
included -

1.  The (basic) basic model developed via logistic regression used prior
    information constructed on gender, age, age2, and time period.

2.  The second (classical) model (metabolic score model: MS model) was
    based on six MetS components.

3.  The third (enhanced model) incorporated information on smoking,
    drinking, betel-quid, and family history of CVD.

**Results**

Compared to the basic model and classical model, the enhanced model had
better performance. The proposed models predicted CVD incidence at the
individual level by incorporating routine information with a sequential
Bayesian clinical reasoning approach. Patients’ background significantly
contributes to baseline risk. Even with ecological heterogeneity, the
regression model adopts individual characteristics and makes individual
risk prediction for the CVD incidence.

**Limitations**:

-   Whether the interactions between age, gender, metabolic score, and
    other risk factors should be included.

-   The use of an enhanced model should be validated through external
    validation by applying the proposed models to new subjects not
    included in the training of the model parameters. @Liu2013
