# Bayesian Estimation
**EEE 554 Lecture #15**

In Bayesian estimation, the parameter $\theta$ is taken to be a random variable (RV) $\Theta$ with a known PDF $f_{\Theta}(\theta)$, often called the "prior" PDF.

The Bayesian estimator for $\theta$ is the RV $\hat{\Theta}_{B}$ with the posterior PDF:
$$f_{\Theta}(\theta|\underline{x}) = \frac{f_{\underline{X}}(\underline{x}|\theta)f_{\Theta}(\theta)}{f_{\underline{X}}(\underline{x})}$$

Both factors in the numerator (i.e., the likelihood function and the prior PDF of $\theta$) are assumed known; the denominator is obtained by marginalization:
$$f_{\underline{X}}(\underline{x}) = \int_{-\infty}^{\infty} f_{\underline{X},\Theta}(\underline{x}, \theta) d\theta$$
where:
$$f_{\underline{X},\Theta}(\underline{x}, \theta) = f_{\underline{X}}(\underline{x}|\theta)f_{\Theta}(\theta)$$

---

## Example 1: Coin Toss

The probability of a coin toss yielding Heads (H) is $p$.
* **Data:** $E = \{n \text{ out of } n \text{ independent tosses yield H}\}$
* **Prior:** Take $p \sim U[0,1]$.

Using Bayes rule:
$$f_{P}(p|E) = \frac{P(E|p)f_{P}(p)}{P(E)}$$
with $P(E|p) = p^n$ and $f_{P}(p) = 1$ for $0 \le p \le 1$ ($0$ otherwise).

So,
$$f_{P}(p|E) = \frac{p^n}{P(E)} \quad \text{for } 0 \le p \le 1$$

For proper normalization:
$$1 = \int_{0}^{1} f_{P}(p|E) dp = \frac{1}{P(E)} \int_{0}^{1} p^n dp = \frac{1}{(n+1)P(E)}$$
and hence $P(E) = \frac{1}{n+1}$ and $f_{P}(p|E) = (n+1)p^n$ for $0 \le p \le 1$.

The Bayesian estimator thus has mean:
$$E[\hat{P}_B] = E[P|E] = \int_{0}^{1} p f_{P}(p|E) dp = \int_{0}^{1} p(n+1)p^n dp = \frac{n+1}{n+2}$$

Note that $E[\hat{P}_B] \rightarrow 1$ as $n \rightarrow \infty$, as expected. Also, it is possible to compute $P(E)$ directly if desired:
$$P(E) = \int_{0}^{1} P(E|p)f_{P}(p) dp = \int_{0}^{1} p^n \cdot 1 dp = \frac{1}{n+1}$$

---

## Example 2: Normal Distribution

Let $X_1, \dots, X_n$ be iid $\mathcal{N}[\theta, 1]$ RVs. The parameter to be estimated is $\theta = \mu$. Take the prior PDF of $\theta$ to be $\mathcal{N}[0, \rho^2]$.

Then:
$$f_{\underline{X}}(\underline{x}|\theta) = \frac{1}{(2\pi)^{n/2}} \exp\left\{-\frac{1}{2}\sum_{k=1}^{n}(x_k-\theta)^2\right\}$$
and
$$f_{\Theta}(\theta) = \frac{1}{\sqrt{2\pi\rho^2}} \exp\left\{-\frac{1}{2}\frac{\theta^2}{\rho^2}\right\}$$

Denoting $C = \frac{1}{(2\pi)^{n/2}} \cdot \frac{1}{\sqrt{2\pi\rho^2}} \cdot \frac{1}{f_{\underline{X}}(\underline{x})}$:
$$f_{\Theta}(\theta|\underline{x}) = C \exp\left\{-\frac{1}{2}\sum_{k=1}^{n}(x_k-\theta)^2\right\} \exp\left\{-\frac{1}{2}\frac{\theta^2}{\rho^2}\right\}$$
$$= C \exp\left\{-\frac{1}{2}\left[\sum_{k=1}^{n} x_k^2 - 2\theta\sum_{k=1}^{n} x_k + n\theta^2 + \frac{\theta^2}{\rho^2}\right]\right\}$$
$$= C \exp\left\{-\frac{1}{2}\sum_{k=1}^{n} x_k^2\right\} \exp\left\{-\frac{1}{2}\left[\left(n+\frac{1}{\rho^2}\right)\theta^2 - 2\theta\sum_{k=1}^{n} x_k\right]\right\}$$
$$= C \exp\left\{-\frac{1}{2}\sum_{k=1}^{n} x_k^2\right\} \exp\left\{-\frac{1}{2}\left(n+\frac{1}{\rho^2}\right)\left[\theta^2 - 2\frac{\sum_{k=1}^{n} x_k}{n+\frac{1}{\rho^2}}\theta\right]\right\}$$

Completing the square in $\theta$:
$$f_{\Theta}(\theta|\underline{x}) = C \exp\left\{-\frac{1}{2}\sum_{k=1}^{n} x_k^2\right\} \exp\left\{\frac{1}{2}\frac{(\sum_{k=1}^{n} x_k)^2}{n+\frac{1}{\rho^2}}\right\} \times \exp\left\{-\frac{1}{2}\left(n+\frac{1}{\rho^2}\right)\left[\theta - \frac{\sum_{k=1}^{n} x_k}{n+\frac{1}{\rho^2}}\right]^2\right\}$$

This represents a normal PDF with mean $\frac{\sum x_k}{n+1/\rho^2}$, hence:
$$E[\hat{\Theta}_B] = \frac{1}{n+\frac{1}{\rho^2}}\sum_{k=1}^{n} x_k$$

Note that as $\rho^2 \rightarrow \infty$, the prior becomes uninformative and:
$$E[\hat{\Theta}_B] \rightarrow \frac{1}{n}\sum_{k=1}^{n} x_k$$
(i.e., the sample mean). 

As $\rho^2 \rightarrow 0$, the prior dominates the data and $E[\hat{\Theta}_B] \rightarrow 0$ regardless of $\underline{x}$.

It is helpful to observe that $f_{\underline{X}}(\underline{x})$ and several other normalizing values never had to be calculated. Because $f_{\Theta}(\theta|\underline{x})$ was known to be a PDF in this example, only the exponential containing $\theta$ was needed to deduce the mean.