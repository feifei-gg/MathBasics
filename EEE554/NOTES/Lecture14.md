# Maximum-Likelihood Estimation
**EEE 554 Lecture #14**

Given a family $\{f_X(x|\theta)\}$ of probability densities parameterized by $\theta \in \mathbb{R}^n$ and data $X_1, \dots, X_n$ drawn from one of these PDFs, the goal of estimation is to determine a value for $\theta$ that is most compatible with the data in some sense.

One such sense is **maximum likelihood**.

Suppose $\underline{X} = (X_1, \dots, X_n)^T$ with each $X_k$ having PDF $f_X(x|\theta)$. The likelihood function is:
$$l(\theta, \underline{x}) = f_{\underline{X}}(\underline{x}|\theta)$$

The log-likelihood function is:
$$L(\theta, \underline{x}) = \log l(\theta, \underline{x}) = \log(f_{\underline{X}}(\underline{x}|\theta))$$

Note that $\log$ is monotonic, so maximizing $L(\theta, \underline{x})$ is equivalent to maximizing $l(\theta, \underline{x})$.

---

A maximum-likelihood (ML) estimator for $\theta$ from data $\underline{x}$ has the form:
$$\hat{\theta}_{ML} = \arg\max_{\theta} l(\theta, \underline{x}) = \arg\max_{\theta} L(\theta, \underline{x})$$

Note that $\hat{\theta}_{ML}$ may not be unique because it is possible that more than one value of $\theta$ maximizes $l(\theta, \underline{x})$.

---

**Example:** Suppose $X_1, \dots, X_n$ are iid normal RVs with known variance $\sigma^2$ and unknown mean $\theta = \mu$.

So,
$$l(\mu, \underline{x}) = f_{\underline{X}}(\underline{x}|\mu) = f_X(x_1|\mu) \dots f_X(x_n|\mu)$$
$$= \left( \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left\{-\frac{(x_1-\mu)^2}{2\sigma^2}\right\} \right) \dots \left( \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left\{-\frac{(x_n-\mu)^2}{2\sigma^2}\right\} \right)$$
$$= \frac{1}{(2\pi\sigma^2)^{n/2}} \exp\left\{-\frac{1}{2\sigma^2}\sum_{k=1}^{n}(x_k-\mu)^2\right\}$$

Taking the log:
$$L(\mu, \underline{x}) = -\frac{n}{2}\log(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum_{k=1}^{n}(x_k^2 - 2\mu x_k + \mu^2)$$

Taking the derivative:
$$\frac{d}{d\mu}L(\mu, \underline{x}) = \frac{1}{2\sigma^2}\sum_{k=1}^{n}(2x_k - 2\mu)$$

Setting this to $0$:
$$n\mu - \sum_{k=1}^{n} x_k = 0$$
Thus, $\hat{\mu}_{ML} = \frac{1}{n}\sum_{k=1}^{n}x_k$

---

**Example:** Now suppose $X_1, \dots, X_n$ are iid normal RVs with known mean $\mu$ and unknown variance $\theta = \sigma^2$.

So,
$$L(\theta, \underline{x}) = L(\sigma^2, \underline{x}) = -\frac{n}{2}\log(2\pi\theta) - \frac{1}{2\theta}\sum_{k=1}^{n}(x_k-\mu)^2$$

Taking the derivative w.r.t $\theta$:
$$\frac{d}{d\theta}L(\theta, \underline{x}) = -\frac{n}{2}\frac{1}{2\pi\theta}(2\pi) + \frac{1}{2\theta^2}\sum_{k=1}^{n}(x_k-\mu)^2$$
$$= -\frac{n}{2\theta} + \frac{1}{2\theta^2}\sum_{k=1}^{n}(x_k-\mu)^2$$

Assuming $\theta \neq 0$, setting $\frac{d}{d\theta}L(\theta, \underline{x}) = 0 \Rightarrow \hat{\theta}_{ML} = \frac{1}{n}\sum_{k=1}^{n}(x_k-\mu)^2$

---

**Example (Tale of two estimators):** Take $X_1, \dots, X_n$ to be iid $\sim U[0, b]$. The parameter to be estimated is $\theta = b$.

$$l(b, \underline{x}) = f_{\underline{X}}(\underline{x}|b) = \begin{cases} \left(\frac{1}{b}\right)^n & 0 \le x_k \le b \text{ for all } k \\ 0 & \text{else} \end{cases}$$

This is maximized by taking $b$ to be as small as possible while still satisfying $x_k \le b$ for all $k = 1, \dots, n$; i.e.,
$$\hat{\theta}_{ML} = \max(x_1, \dots, x_n)$$

The CDF of $\hat{\theta}_{ML}$ is:
$$F_{\hat{\theta}}(v) = P(\{X_1 \le v\} \cap \dots \cap \{X_n \le v\}) = (F_X(v))^n$$

Thus,
$$f_{\hat{\theta}}(v) = n(F_X(v))^{n-1} f_X(v) = n\left(\frac{v}{b}\right)^{n-1} \left(\frac{1}{b}\right) = n\frac{v^{n-1}}{b^n}$$

And,
$$E[\hat{\theta}_{ML}] = \int_{0}^{b} v \left(n\frac{v^{n-1}}{b^n}\right) dv = \frac{n}{b^n}\int_{0}^{b} v^n dv = \frac{n}{n+1}b$$

So, $\hat{\theta}_{ML}$ is biased with:
$$\beta(\hat{\theta}_{ML}) = E[\hat{\theta}_{ML}] - b = \left(\frac{n}{n+1} - 1\right)b = -\frac{1}{n+1}b$$

Note that $\beta \rightarrow 0$ as $n \rightarrow \infty$, so it is asymptotically unbiased.

To get $var(\hat{\theta}_{ML})$, consider:
$$E[\hat{\theta}_{ML}^2] = \frac{n}{b^n}\int_{0}^{b} v^{n+1} dv = \frac{n}{n+2}b^2$$

$$var(\hat{\theta}_{ML}) = E[\hat{\theta}_{ML}^2] - (E[\hat{\theta}_{ML}])^2 = \frac{n}{n+2}b^2 - \left(\frac{n}{n+1}b\right)^2 = \frac{n}{(n+1)^2(n+2)}b^2$$

---

Compare this to the linear estimator $\tilde{\theta} = \frac{2}{n}\sum_{k=1}^{n}X_k$ for which:
$$E[\tilde{\theta}] = \frac{2}{n} \cdot n \left(\frac{b}{2}\right) = b$$

This estimator of $b$ is unbiased. Its variance is four times that of the sample mean estimator; i.e.,
$$var(\tilde{\theta}) = 4\frac{var(X)}{n} = 4\frac{b^2 / 12}{n} = \frac{1}{3n}b^2$$

While biased, $\hat{\theta}_{ML}$ has a variance that decreases quadratically with $n$ ($\sim 1/n^2$). The variance of the unbiased linear estimator $\tilde{\theta}$ decreases only linearly with $n$ ($\sim 1/n$).