# Paper 5 Summary

**Abdullah, Hassan, & Mustafa (2022).** *“A Review on Bayesian Deep Learning in Healthcare: Applications and Challenges.”* IEEE Access, 10, 36538–62.  

---

### Goal  
To systematically review how Bayesian Deep Learning (BDL) methods are applied in healthcare, highlighting applications, methodological approaches, challenges, and opportunities for future research.  

### Importance  
Healthcare data is often uncertain, heterogeneous, and high-stakes. While deep learning offers strong predictive capabilities, it lacks mechanisms to quantify uncertainty. Bayesian approaches combine probabilistic reasoning with deep learning, enabling uncertainty estimation, prior knowledge integration, and potentially more interpretable and safer clinical models.  

### Methods  
- Conducted a structured literature review of BDL methods in healthcare domains such as diagnosis, prognosis, and treatment planning.  
- Categorized approaches: variational inference, Monte Carlo dropout, ensemble methods, Gaussian processes, and Bayesian neural networks.  
- Compared models based on scalability, interpretability, uncertainty calibration, data demands, and privacy/security considerations.  

### Results & Limitations  
- **Results**: BDL has been applied to disease classification, medical image segmentation, survival analysis, and predictive modeling. It improves uncertainty quantification, sometimes enhances generalization, and provides confidence information useful for clinicians.  
- **Limitations**: BDL methods are computationally expensive, face scalability issues with large/high-dimensional datasets, and require careful prior specification. Interpretability remains limited despite probabilistic framing. Many studies are proofs of concept rather than validated in real-world clinical practice. Regulatory, privacy, and workflow integration issues also hinder deployment.  
