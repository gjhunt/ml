# QA Review: `010_linear_regression_questions.ipynb`

## Source content map

Source lecture: `lectures/010_linear_regression.ipynb`.

Main mathematical and statistical content extracted from the lecture:

- **Model class and notation:** continuous response $y\in\mathbb R$, input $x\in\mathbb R^D$, linear score class $\mathcal S=\{s_w(x)=w^\top x:w\in\mathbb R^D\}$, and identity action $a(s)=s$ so $\hat f(x)=\hat s(x)$.
- **Loss and empirical risk:** squared loss $\ell(y,s(x))=(y-s(x))^2$ and empirical risk $\hat R(w)=N^{-1}\sum_{n=1}^N(y_n-w^\top x_n)^2$.
- **Design matrix notation:** $X\in\mathbb R^{N\times D}$ with row $n$ equal to $x_n^\top$, response vector $y\in\mathbb R^N$, and compact objective $\|y-Xw\|^2$.
- **Least-squares derivation:** expansion $\|y-Xw\|^2=y^\top y-2w^\top X^\top y+w^\top X^\top Xw$, gradient $2X^\top Xw-2X^\top y$, normal equations $X^\top Xw=X^\top y$, and full-rank solution $\hat w=(X^\top X)^{-1}X^\top y$.
- **Prediction formulas:** fitted score $\hat f(x)=\hat w^\top x$, training fitted vector $\hat y=X\hat w=X(X^\top X)^{-1}X^\top y$.
- **Geometry:** least squares as projection of $y$ onto $\operatorname{col}(X)$, projection matrix $P_X=X(X^\top X)^{-1}X^\top$, and residual orthogonality.
- **Design matrix construction:** intercept column, categorical variables, one-hot encoding, the Hogwarts house example, why one category is dropped when an intercept is present, and baseline-category interpretation.
- **Feature engineering:** transformed features, polynomial regression, basis functions $\phi_d(x)$, interaction terms, and the distinction between linearity in parameters and nonlinearity in raw inputs.
- **Limitations and examples:** sensitivity to outliers under squared loss, rank deficiency, near-collinearity, unstable inverse-based estimates, duplicated variables, exact collinearity, polynomial regression by hand, and real-data categorical encoding with `drop_first=True`.
- **Implicit or compressed steps used for gap-filling questions:** residual orthogonality, projection-matrix properties, Pythagorean decomposition, Hessian positive definiteness, residual sums with an intercept, equivalence/non-equivalence of parameterizations, and Vandermonde rank conditions for polynomial features.

## Question type distribution

The 30-question notebook uses the following problem forms:

- Derivations and omitted-algebra exercises: Questions 2, 3, 4, 8, 18, 23, 27.
- Direct computations with small matrices or vectors: Questions 5, 15, 20.
- Short proofs: Questions 6, 7, 9, 22, 24, 30.
- Counterexamples and false-claim diagnosis: Questions 11, 12, 21, 29.
- Conceptual distinctions with precise mathematical criteria: Questions 1, 10, 16, 17, 19, 25, 26, 28.
- Statistical/geometric interpretation questions: Questions 13, 14, 20, 30.
- Design-matrix construction and encoding questions: Questions 14, 15, 16, 17, 18, 19, 26.

## Gap-filling questions

Questions 2, 3, 6, 7, 8, 9, 13, 18, 22, 23, 24, 27, and 30 fill in algebra or reasoning that is stated quickly or implicitly in the lecture. These include the matrix expansion of the least-squares objective, the normal-equation derivation, residual orthogonality, projection-matrix properties, Pythagorean geometry, Hessian definiteness, and centered-predictor slope algebra.

## Conceptual questions

Questions 1, 10, 13, 16, 17, 19, 21, 25, 26, 28, 29, and 30 are conceptual but mathematically precise. They distinguish scores from parameters, coefficients from fitted values, full one-hot from baseline coding, model-class changes from parameterization changes, new-input predictions from training fitted vectors, coefficient non-identifiability from fitted-value uniqueness, and raw-feature linearity from engineered-feature linearity.

## Repetitive-style audit

The 30 questions were checked for repeated openings and repeated prompt structure. No first-two-word opening occurs more than five times, and the set mixes computations, derivations, proofs, counterexamples, diagnoses of false claims, classifications, comparisons, and interpretations. The questions do not follow the previous generated template sequence.

## Structural validation confirmation

The output notebook `questions/010_linear_regression_questions.ipynb` was validated with `nbformat`. It contains exactly 30 Markdown question cells, no code cells, exactly one hidden source note per question, and exactly one collapsible `<details>` answer block per question.
