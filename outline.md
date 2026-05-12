# Statistical Machine Learning

## Foundations
- Supervised learning setup  
- Empirical Risk Minimization (ERM)  
  - Joint vs conditional perspectives  

## Linear Models for Regression
- Linear regression  
- Parameter estimation
- Feature engineering
  - Intercepts  
  - Feature construction  
  - Categorical variables

## Linear Models for Classification
- Logistic regression  
    - Linear classifiers
    - NLL connection to ERM

## Model Evaluation
- Training vs test performance  
- Performance vs model flexibility  
- Data splitting (train/validation/test)  
- Resampling methods (cross-validation)  
- Nested cross-validation

## Bias-variance tradeoff

## Local and Nonparametric Methods
- k-Nearest Neighbors (KNN) regression and classification
- kernel regression

## Regularization and Penalization
- Penalized risk minimization  
    - Ridge regression  
    - LASSO  
    - penalized logistic regression

## Representation Learning with Neural Networks
- Motivation: fixed features vs learned representations  
- Feedforward neural networks  
- Optimization  
  - Stochastic gradient descent (SGD)  
  - Backpropagation  

## Unsupervised Learning
- Dimensionality reduction  
  - PCA  
  - t-SNE (intuition and visualization)  
  - Autoencoders (optional)
- Clustering  
  - k-means  
  - Hierarchical clustering (optional)  

## Tree-Based Models
- CARTs

## Ensemble Methods
- Bagging and Random forests  
- Boosting and AdaBoost 

# --- EXTRAS ----
Extras, if we have time: 

## Convolutional Neural Networks
- Motivation: structured inputs (images)  
- Basic CNN architecture  

## Sequence Modeling

- Sequence Modeling Problem
    - Modeling ordered data  
    - Examples: text, time series  
- Recurrent Neural Networks (RNNs)
    - Hidden state and recurrence  
    - Limitations (long-range dependencies)  
- LSTMs
- Attention Mechanisms
    - Motivation: direct access to all inputs  
    - Weighted representations  
    - Interpreting attention  
- Transformers
    - Attention as the core building block  
    - Parallel computation vs recurrence  
    - High-level architecture  
    - Why transformers dominate modern ML  