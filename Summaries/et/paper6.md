# Variable Selection Using Bayesian Additive Regression Trees
Chuji Luo, Michael J. Daniels

Statistical Science, Vol.39, No. 2, 286-304, May 2024

https://arxiv.org/abs/2112.13998

## Summary

This paper introduces a novel method for variable selection in regression models using Bayesian Additive Regression Trees (BART). The authors propose a permutation-based approach to assess the importance of each predictor variable by comparing the model's performance with and without the variable. This method allows for the identification of relevant predictors while accounting for complex interactions and nonlinear relationships inherent in BART models. The authors demonstrate the effectiveness of their approach through simulations and real-world applications, showing that it outperforms traditional variable selection methods in terms of accuracy and interpretability.

## Problem

In regression analysis, identifying the most relevant predictor variables is crucial for building accurate and interpretable models. Traditional variable selection methods often struggle with complex data structures, such as nonlinear relationships and interactions among predictors. Bayesian Additive Regression Trees (BART) offer a flexible modeling framework that can capture these complexities, but they lack built-in mechanisms for variable selection. The challenge addressed in this paper is to develop a robust method for selecting important variables within the BART framework, enabling researchers to leverage BART's strengths while ensuring model interpretability.

## Methodology

The authors propose a permutation-based variable selection method within the BART framework. The key steps of the methodology are as follows:
1. Fit a BART model to the data using all predictor variables.
2. For each predictor variable, create a permuted version of the dataset by randomly shuffling the values of that variable while keeping the other variables unchanged.
3. Fit a BART model to the permuted dataset and evaluate its performance using a suitable metric (e.g., mean squared error).
4. Compare the performance of the original BART model with the permuted model. A significant drop in performance when a variable is permuted indicates that the variable is important for predicting the outcome.
5. Repeat the permutation process multiple times to obtain a distribution of performance metrics for each variable, allowing for statistical inference about variable importance.
6. Select variables based on their importance scores, using a threshold to determine which variables are considered relevant.
7. The authors validate their method through extensive simulations and applications to real-world datasets, demonstrating its effectiveness in identifying important predictors while accounting for complex interactions and nonlinearities.

## Results and performance

The proposed permutation-based variable selection method using BART was evaluated through simulations and real-world applications. The results showed that the method effectively identified important predictor variables, outperforming traditional variable selection techniques in terms of accuracy and interpretability. The authors reported that their approach was able to capture complex interactions and nonlinear relationships among predictors, leading to improved model performance. Additionally, the method provided a clear ranking of variable importance, facilitating the interpretation of results. Overall, the findings suggest that the proposed method is a valuable tool for variable selection in regression models, particularly when using BART.

## Conclusion

- The paper introduced three new variable selection approaches: (1) a permutation-based approach using within-type BART Variable Inclusion Proportion (VIP), (2) a permutation-based approach using BART Metropolis Importance (MI), and (3) a backward selection procedure with two filters.
- These new approaches were designed specifically to address issues with existing methods, such as being biased against categorical predictors and being conservative in including relevant predictors, particularly in data settings with mixed-type predictors (e.g., continuous and binary).
- Based on the simulation results, where success was defined as an excellent capability of including all relevant predictors (rmiss $\le 0.1$) and acceptable capability of excluding irrelevant predictors (precision $\ge 0.6$), the three proposed approaches consistently perform well in identifying all the relevant predictors and excluding irrelevant predictors.

Ranking of Successful Approaches (by Success Rate)

The backward selection approach with two filters achieves the highest success rate (70.8%) across the various simulation scenarios tested.
The two new permutation-based approaches followed closely in performance:
1. Backward selection with two filters: 70.8% success rate.
2. Permutation-based approach using BART MI: 66.7% success rate.
3. Permutation-based approach using BART Within-Type VIP: 62.5% success rate.

**Identified Drawbacks**

- A significant drawback of the three proposed approaches, similar to existing BART-based variable selection methods, is that they suffer from multicollinearity (correlated predictors). This challenge is particularly noticeable when the noise is high or when dealing with a binary response variable.
- The computational cost of the backward selection approach is a shortcoming because it requires running BART multiple times, although this cost can be reduced by fitting the models in parallel on multiple cores.
- While the permutation-based approach using BART within-type VIP improves upon the existing BART VIP approach for small numbers of mixed-type predictors, it also suffers from multicollinearity.