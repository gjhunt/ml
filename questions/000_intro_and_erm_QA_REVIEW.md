# QA Review: `000_intro_and_erm_questions.ipynb`

## Source content map

Source lecture: `lectures/000_intro_and_erm.ipynb`.

Main topic of the lecture:

- The lecture introduces statistical machine learning as probabilistic, data-driven construction and evaluation of methods, then develops empirical risk minimization (ERM) as the first organizing paradigm.

Main definitions and mathematical objects:

- **Supervised learning data:** observed pairs $(x_1,y_1),\ldots,(x_N,y_N)$, with $x_n$ an input or feature vector and $y_n$ an observed outcome.
- **Unsupervised learning data:** observed inputs $x_1,\ldots,x_N$ without labels or outcomes.
- **Regression:** continuous output, typically $y\in\mathbb R$ and $\hat f$ real-valued.
- **Classification:** categorical output $y\in\mathcal C=\{c_1,\ldots,c_K\}$ and predictions in $\mathcal C$.
- **Statistical setup:** $(x_1,y_1),\ldots,(x_N,y_N)\overset{\mathrm{i.i.d.}}\sim P=P_{X,Y}$, with $x_n=(X_{n1},\ldots,X_{nD})\in\mathbb R^D$.
- **Score/action decomposition:** $\hat f(x)=a(\hat s(x))$, where $\hat s$ is a score function and $a$ is a fixed action function. Regression often uses identity action; classification often uses an argmax action on $\mathbb R^K$ scores.
- **Loss function:** $\ell(y,s(x))$, with examples including squared error, absolute error, zero-one loss, and cross-entropy loss based on softmax probabilities.
- **Population risk:** $R(s)=\mathbb E_{(X,Y)\sim P}[\ell(Y,s(X))]$.
- **Empirical risk:** $\hat R_N(s)=N^{-1}\sum_{n=1}^N\ell(y_n,s(x_n))$.
- **ERM:** $\hat s\in\arg\min_{s\in\mathcal S}\hat R_N(s)$ over a chosen candidate class $\mathcal S$.
- **Algorithmic view:** $\hat s=\mathrm{Algorithm}(\mathcal D,\ell,\mathcal S,\mathrm{Optimizer})$.

Main formulas and claims:

- Supervised learning seeks a function $\hat f$ such that $y\approx\hat f(x)$ and, crucially, generalizes to new inputs.
- Population risk is the ideal performance criterion but cannot be computed directly because $P$ is unknown.
- Empirical risk is the sample-average approximation to population risk.
- ERM depends not only on data, but also on the loss, model class, and optimizer.
- Enlarging a candidate class can reduce empirical risk but raises generalization questions.
- The score/action split is especially useful in classification, where numerical scores are mapped to labels.

Main derivations or compressed reasoning in the lecture:

- Why empirical risk is a sample-average approximation to population risk under the i.i.d. assumption.
- Why an unrestricted candidate class can fit training data without guaranteeing generalization.
- How zero-one risk becomes a probability of misclassification.
- How softmax scores define valid class probabilities for cross-entropy.
- Why score/action separation can change decisions without changing scores.
- Why the argmax action needs a tie-breaking convention to be a function.
- How method construction and evaluation are distinct mathematical tasks.

Important examples:

- Regression examples: stock-market performance and adult height.
- Classification examples: borrower default and plant-species classification.
- Unsupervised objectives: clustering, discovering relationships among variables, and summarizing patterns.
- Loss examples: squared error, absolute error, zero-one loss, and cross-entropy.

Assumptions made in the lecture:

- Training samples are i.i.d. from a common data-generating distribution $P_{X,Y}$.
- Feature vectors lie in $\mathbb R^D$.
- For classification, labels lie in a finite class set $\mathcal C$.
- The action function is typically fixed before learning the score.
- Losses are typically nonnegative, with larger loss worse.
- ERM is performed over a chosen class $\mathcal S$ rather than all functions.

Concepts suited to conceptual, example-based, or counterexample-style questions:

- Training fit versus generalization.
- Supervised versus unsupervised information.
- Regression versus classification codomains.
- Score values versus final actions.
- Population risk versus empirical risk.
- The role of the i.i.d. assumption.
- Candidate-class choice and overfitting.
- Tie-breaking for argmax and argmin.
- Loss transformations that do or do not preserve minimizers.
- Why pointwise convergence of empirical risk is not enough for unrestricted ERM.

## Question type distribution

The 30-question notebook uses the following problem forms:

- Concrete examples and counterexamples: Questions 1, 11, 12, 15, 18, 22, 25, 26.
- Classification or precise conceptual distinctions: Questions 2, 3, 13, 19, 21, 27, 30.
- Direct computations: Questions 4, 6, 7, 23, 24, 29.
- Short proofs or derivations: Questions 5, 8, 9, 10, 14, 16, 17, 28.
- Gap-filling arguments from compressed lecture reasoning: Questions 6, 7, 9, 10, 12, 14, 15, 23, 28, 29.
- False-claim diagnosis: Questions 22 and 28.

## Gap-filling questions

Questions 6, 7, 9, 10, 12, 14, 15, 23, 28, and 29 fill in proof or algebraic details that are implicit in the lecture. They cover softmax normalization, zero-one risk as an event probability, unbiasedness of empirical risk for a fixed score, the role of identical distributions, the need to restrict $\mathcal S$, the monotonic effect of enlarging $\mathcal S$ on empirical risk, tie-breaking for argmax, conditional-mean minimization under squared error, and the pointwise-versus-uniform generalization gap.

## Conceptual questions

Questions 2, 3, 4, 5, 13, 18, 19, 20, 21, 22, 25, 26, 27, and 30 are conceptual but have definite mathematical answers. They distinguish supervised and unsupervised objectives, regression and classification codomains, scores and actions, population and empirical risks, model class and optimizer roles, labels versus marginal input structure, and methods versus evaluation.

## Classic textbook-style patterns used

- Memorization counterexample for training error versus generalization.
- Sample-average unbiasedness proof under i.i.d. sampling.
- Counterexample showing identical empirical behavior but different population behavior.
- Finite-class ERM as comparison of finitely many risks with tie-breaking.
- Softmax normalization and invariance to common score shifts.
- Conditional-expectation calculation for squared-error risk.
- Loss comparison using mean versus median for squared and absolute error.
- False-proof diagnosis for pointwise empirical-risk convergence.

## Repetitive-style audit

The 30 questions were checked for varied openings and problem forms. No first-two-word opening occurs more than five times, and the set mixes examples, computations, derivations, comparisons, classifications, counterexamples, false-claim diagnoses, and conceptual interpretation questions. The notebook does not preserve the previous generated question sequence.

## Structural validation confirmation

The output notebook `questions/000_intro_and_erm_questions.ipynb` was validated with `nbformat`. It contains exactly 30 Markdown question cells, no code cells, exactly one hidden source note per question, and exactly one collapsible `<details>` answer block per question.

## Limitations

The source lecture is introductory and intentionally does not develop full generalization theory, uniform convergence, regularization, or formal model-complexity bounds. The question notebook therefore uses a few naturally motivated gap-filling questions to clarify why those later topics are needed, but it avoids introducing major results not present in the lecture.
