# Parameter Estimation
**EEE 554 Lecture #13**

Consider a family of PDFs indexed by a parameter $\theta \in \mathbb{R}^{m}$ and denoted $\{f_{X}(x|\theta)\}$. For the moment, $X$ will be assumed to be a (scalar) RV.

**Example:**
The family is unit-variance normal PDFs indexed by their means $\theta = \mu_{X} \in \mathbb{R}$:
$$f_{X}(x|\theta) = \frac{1}{\sqrt{2\pi}} \exp\left\{-\frac{1}{2}(x-\theta)^{2}\right\}$$

Suppose $X_1, \dots, X_n$ are iid RVs drawn from $f_{X}(x|\theta)$ for a fixed value of $\theta$. An estimator for the parameter $\theta$ from data $\underline{x} = (x_1, \dots, x_n)$ is a function: 
$$g:\mathbb{R}^{n} \rightarrow \mathbb{R}^{m}$$
$$\hat{\theta} = g(X_1, \dots, X_n) = g(\underline{X})$$

Note that the estimate $\hat{\theta}$ is a RV because it is a function of the RVs $X_1, \dots, X_n$. Each realization of $\underline{X}$ gives a realization of $\hat{\theta}$.

---

## Bias

The bias of an estimator $\hat{\theta}$ of $\theta$ is:
$$\beta(\hat{\theta}) = E[\hat{\theta}] - \theta$$

An estimator is unbiased if $\beta(\hat{\theta}) = 0$; i.e., if $E[\hat{\theta}] = \theta$.

**Example (Sample mean estimator):**
Suppose $X_1, \dots, X_n$ are iid with mean $\theta = \mu_X$. Define an estimator for $\theta$ by:
$$\hat{\theta} = g(X_1, \dots, X_n) = \frac{1}{n}(X_1 + \dots + X_n)$$

Then:
$$E[\hat{\theta}] = \frac{1}{n}E[X_1 + \dots + X_n] = \frac{1}{n}(n\mu_X) = \mu_X = \theta$$

So $\hat{\theta}$ is an unbiased estimator of the mean.

---

## Estimator Variance

A second measure of estimator quality is its variance. For an unbiased estimator, small variance ensures that the probability that a realization of $\hat{\theta}$ will be near $\theta$ is high. *(Note: The original notes contained a sketch comparing the PDFs of two unbiased estimators, illustrating "large variance" vs "small variance" around $\theta$.)*

**Example (cont'd):** For the sample mean estimator $\hat{\theta} = \frac{1}{n}(X_1 + \dots + X_n)$:
$$var(\hat{\theta}) = \frac{1}{n^2}var(X_1 + \dots + X_n) = \frac{1}{n}var(X)$$

Note that the variance of this unbiased estimator of $\mu_X$ decreases as the number $n$ of independent data points increases. An estimator with this property is called **consistent**.

---

## Standard Estimators

* **1. Sample Mean**
    * $$\hat{\mu}_X = \frac{1}{n}\sum_{k=1}^{n}X_k$$
    * Unbiased estimator for $\mu_X = E[X]$.
    * $$var(\hat{\mu}_X) = \frac{1}{n}var(X)$$

* **2. Sample Variance Estimator**
    * $$\hat{v} = \frac{1}{n-1}\sum_{k=1}^{n}(X_k - \hat{\mu}_X)^2$$
    * **Bias:** $$E[\hat{v}] = \frac{1}{n-1} E\left[ \sum_{k=1}^{n}(X_k^2 - 2X_k\hat{\mu}_X + \hat{\mu}_X^2) \right]$$
      $$= \frac{1}{n-1} \left\{ \sum_{k=1}^{n}E[X_k^2] - 2E\left[\hat{\mu}_X \sum_{k=1}^{n}X_k\right] + nE[\hat{\mu}_X^2] \right\}$$
      $$= \frac{1}{n-1} \left\{ nE[X^2] - 2nE[\hat{\mu}_X^2] + nE[\hat{\mu}_X^2] \right\}$$
      $$= \frac{n}{n-1} \left( E[X^2] - E[\hat{\mu}_X^2] \right)$$
      $$= \frac{n}{n-1} \left( (var(X) + \mu_X^2) - (var(\hat{\mu}_X) + \mu_X^2) \right)$$
      $$= \frac{n}{n-1} \left( var(X) - \frac{1}{n}var(X) \right)$$
      $$= \frac{n}{n-1} \left( \frac{n-1}{n}var(X) \right) = var(X)$$
      Therefore, $\hat{v}$ is an unbiased estimator of $var(X)$.
    * **Variance:** In general, $var(\hat{v})$ is not possible to calculate without additional assumptions on $f_X$. If $X$ is Gaussian:
      $$var(\hat{v}) = \frac{2(var(X))^2}{n-1}$$
      and $\hat{v}$ is a consistent estimator of $var(X)$.

* **3. Sample Covariance Estimator**
    * With data $\{(X_1, Y_1), \dots, (X_n, Y_n)\}$ independently drawn from a joint PDF $f_{XY}$, the sample covariance is:
    * $$\hat{C}_{XY} = \frac{1}{n-1}\sum_{k=1}^{n}(X_k - \hat{\mu}_X)(Y_k - \hat{\mu}_Y)$$
    * This is an unbiased estimator of $cov(X, Y)$.