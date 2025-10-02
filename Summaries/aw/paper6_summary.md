# Paper 6 Summary

**Baldwin & Larson (2017).** *“An Introduction to Using Bayesian Linear Regression with Clinical Data.”* Behaviour Research and Therapy, 98, 58–75.  

---

### Goal  
To introduce Bayesian linear regression as a practical tool for clinical researchers, demonstrating its mechanics, advantages over frequentist regression, and application with real clinical datasets.  

### Importance  
Clinical studies often face small samples, noise, and prior knowledge that could refine inference. Frequentist regression provides point estimates and confidence intervals but does not naturally incorporate prior beliefs or fully express parameter uncertainty. Bayesian regression estimates posterior distributions, allowing richer probabilistic interpretations and incorporation of prior evidence.  

### Methods  
- Provided a tutorial explanation of Bayesian linear regression: priors, likelihood, posterior distributions, and inference mechanics.  
- Applied Bayesian regression to real clinical psychology datasets, showing model specification, prior selection, fitting via Markov Chain Monte Carlo (MCMC), diagnostic checks, and interpretation.  
- Compared Bayesian results with frequentist regression outcomes to highlight differences.  

### Results & Limitations  
- **Results**: Bayesian regression enabled probabilistic statements (e.g., probability that a parameter exceeds a threshold), incorporated prior evidence, and generated posterior predictive distributions. Estimates were often similar to frequentist regression but yielded more realistic uncertainty intervals.  
- **Limitations**: Computational costs are higher, especially with complex models or large data. Priors may introduce subjectivity and bias if poorly chosen. Many clinical researchers lack formal Bayesian training, which may limit adoption or correct interpretation.  
