# Bayesian parametric models for survival prediction in medical applications

Iwan Paolucci, Yuan-Mao Lin, Jessica Albuquerque Marques Silva, Kristy K. Brock & Bruno C. Odisio  
*BMC Medical Research Methodology volume 23, Article number: 250 (2023)*

This research article, published in BMC Medical Research Methodology, introduces and evaluates Bayesian parametric survival models for predicting patient outcomes in medical applications. The authors, Paolucci et al., highlight the advantages of Bayesian models, such as their ability to provide uncertainty measures, require less hyperparameter tuning, and offer a natural mechanism for model updating using Bayes' rule without needing original training data due to privacy concerns. The study compares these Bayesian models against conventional survival prediction methods like Cox Proportional Hazards and Random Survival Forests, demonstrating comparable performance while exhibiting less overfitting. The article details the mathematical background of these models, their implementation, and presents results from experiments on various public medical datasets to support their utility in personalized medicine.

### Problem
Survival analysis is crucial in medical research for predicting patient outcomes, such as time until death or disease recurrence. Traditional models like Cox Proportional Hazards (CoxPH) and Random Survival Forests (RSF) have limitations, including assumptions about hazard ratios and challenges with interpretability. Bayesian parametric models offer a promising alternative by providing uncertainty measures, requiring less hyperparameter tuning, and allowing for model updates without needing original training data, which is beneficial for privacy concerns.

A major gap in current predictive models for medical applications is the lack of a measure of uncertainty associated with predictions, which is crucial for physicians making high-stakes clinical decisions, especially when treatments have differing side effect profiles or costs.

The study tackles practical and technical challenges inherent in medical machine learning. Medical datasets are often limited in size due to the subclassification of diseases, making models highly prone to overfitting. Many existing machine learning algorithms also require extensive hyperparameter tuning to implement regularization and prevent this overfitting.

### Methodology

The authors introduce Bayesian parametric survival models, which are based on the assumption that survival times follow a specific statistical distribution (e.g., Exponential, Weibull, Lognormal). These models use Bayesian inference to estimate the parameters of the chosen distribution, allowing for the incorporation of prior knowledge and the quantification of uncertainty in predictions.

- Bayesian Parametric Survival Models (BPS)
  - Implemented using the PyMC library in Python.
  - Models include Exponential and Weibull distributions.
  - Parameters are estimated using Linear combinations and neural networks to predict the parameters of the distributions.
- Training
  - PyMC framework
  - Bayes Rule for updating (posterior as prior)
- Evaluation
  - Public Datasets: AIDS Clinical Trials Group (ACTG), German Breast Cancer Study (GBCS), Veteran lung cancer (Veteran), Worcester Heart Attack Study (WHAS), and primary biliary cirrhosis (PBC)
  - Experiment 1: Comparison of Bayesian models with CoxPH, RSF, and DeepSurv
  - Experiment 2: Model updating vs retraining from scratch
  - Experiment 3: Impact of dataset size on model performance
  - Metrics: Concordance Index (C-index), Integrated Brier Score (IBS)
  - Comparison with Cox Proportional Hazards, Random Survival Forests, and DeepSurv

### Results

The results demonstrate that Bayesian parametric survival models perform comparably to traditional methods like CoxPH and RSF, with some advantages in terms of reduced overfitting and the ability to provide uncertainty estimates. The models also showed robustness when updating with new data, maintaining performance without needing to retrain from scratch.

- Performance comparison
  - BPS models performed well, no consistent best model
  - BPS Wb NN superior for PBC dataset
- Overfitting
  - BPS and CoxPH & Weibull based models overfit least
  - DeepSurv & RSF showed more overfitting
- Uncertainty estimation beneficial for clinical decision-making

### Conclusion

- BPS models are competitive, robust, and well-suited for medical applications.
- Key advantages: less overfitting, uncertainty quantification, reduced hyperparameter tuning.
- Efficient model updating without original data (preserves privacy).
- Limitations: datasets used in the study are relatively small, computation time not compared.
