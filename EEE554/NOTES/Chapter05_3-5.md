# Chapter 5 — Functions of One Random Variable

## 5-3 Mean and Variance

### Expected Value (Mean)
* **Definition**: The expected value or mean of a continuous random variable $x$ is defined as the integral $\eta_x = E\{x\} = \int_{-\infty}^{\infty} x f(x) dx$.
* **Physical Interpretation**: If the probability density function (PDF) $f(x)$ is interpreted as a mass density on the x-axis, the expected value $E\{x\}$ corresponds to its center of gravity.

* **Discrete Type**: For a discrete random variable taking values $x_i$ with probabilities $P_i$, the mean is the sum $E\{x\} = \sum_i P_i x_i$.
* **Conditional Mean**: The conditional mean assuming an event $M$ replaces $f(x)$ with the conditional density $f(x|M)$, yielding $E\{x|M\} = \int_{-\infty}^{\infty} x f(x|M) dx$.

### Mean of a Function $g(x)$
* **Fundamental Theorem**: To find the mean of a new random variable $y = g(x)$, one does not need the density of $y$. Instead, it can be computed directly using the density of $x$:
  $$
  E\{g(x)\} = \int_{-\infty}^{\infty} g(x)f(x) dx
  $$
 .
* **Linearity**: The expected value is a linear operator. For constants $a_i$ and functions $g_i(x)$, it holds true even if $g(x)$ is complex:
  $$
  E\{a_1 g_1(x) + \dots + a_n g_n(x)\} = a_1 E\{g_1(x)\} + \dots + a_n E\{g_n(x)\}
  $$
 .

### Variance
* **Definition**: The variance $\sigma^2$ measures the concentration or spread of a random variable around its mean $\eta$. It is defined as the expected value of the squared deviation:
  $$
  \sigma^2 = \text{var}(x) = E\{(x - \eta)^2\} = E\{x^2\} - (E\{x\})^2
  $$
 .
* **Standard Deviation**: The positive square root of the variance, $\sigma$, is the standard deviation, representing the root-mean-square (RMS) value of the random variable $x$ around its mean $\eta$.


---

## 5-4 Moments

### Types of Moments
* **General Moments**: The $n$-th moment is $m_n = E\{x^n\} = \int_{-\infty}^{\infty} x^n f(x) dx$.
* **Central Moments**: The $n$-th central moment measures deviation from the mean: $\mu_n = E\{(x - \eta)^n\}$. Note that $\mu_0 = m_0 = 1$, $\mu_1 = 0$, and $\mu_2 = \sigma^2$.
* **Absolute Moments**: Defined as $E\{|x|^n\}$.

### Estimates of Mean and Variance of $g(x)$
When $x$ is highly concentrated near its mean $\eta$, we can estimate the moments of $y = g(x)$ using a Taylor series expansion of $g(x)$ around $\eta$:
* **Mean Estimate**: $\eta_y = E\{g(x)\} \approx g(\eta) + g''(\eta)\frac{\sigma^2}{2}$.
* **Variance Estimate**: $\sigma_y^2 \approx |g'(\eta)|^2 \sigma^2$.

### Fundamental Inequalities
* **Markov Inequality**: If $x \ge 0$ (a non-negative random variable) and $a > 0$:
  $$
  P\{x \ge a\} \le \frac{E\{x\}}{a}
  $$
 .
* **Chebyshev (Tchebycheff) Inequality**: Bounds the probability that $x$ deviates from its mean $\eta$ by more than $\epsilon$:
  $$
  P\{|x - \eta| \ge \epsilon\} \le \frac{\sigma^2}{\epsilon^2}
  $$
 . This fundamental result holds for *any* density $f(x)$ and is used when the exact density is unknown.

* **Bienaymé Inequality**: For an arbitrary number $a$ and integer $n$: $P\{|x - a| \ge \epsilon\} \le \frac{E\{|x - a|^n\}}{\epsilon^n}$.
* **Lyapunov Inequality**: Relates absolute moments $P_k = E\{|x|^k\}$, demonstrating that $(P_{k-1})^{1/(k-1)} \le (P_k)^{1/k}$.

---

## 5-5 Characteristic Functions

### Definition and Properties
* **Characteristic Function**: Defined as the expectation of the complex exponential $e^{j\omega x}$, which is equivalent to the Fourier transform of the probability density function $f(x)$ (with a positive sign in the exponent):
  $$
  \Phi_x(\omega) = E\{e^{j\omega x}\} = \int_{-\infty}^{\infty} f(x) e^{j\omega x} dx
  $$
 .
* **Maximum at Origin**: The magnitude is bounded by its value at the origin: $|\Phi_x(\omega)| \le \Phi_x(0) = 1$.
* **Inversion Formula**: The density $f(x)$ can be uniquely recovered via the inverse Fourier transform:
  $$
  f(x) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \Phi_x(\omega) e^{-j\omega x} d\omega
  $$
 .

### Moment Generating Function
* **Definition**: By replacing $j\omega$ with a real variable $s$, we obtain the moment generating function: $\Phi(s) = E\{e^{sx}\} = \int_{-\infty}^{\infty} f(x) e^{sx} dx$.
* **Moment Theorem**: The $n$-th derivative of the moment function evaluated at $s = 0$ yields the $n$-th general moment of $x$:
  $$
  \Phi^{(n)}(0) = E\{x^n\} = m_n
  $$
 .
* **Series Expansion**: If all moments are finite, the moment function can be expanded as $\Phi(s) = \sum_{n=0}^{\infty} \frac{m_n}{n!} s^n$. Thus, a random variable's density is uniquely determined if all its moments are known.

### Cumulants
* **Definition**: The cumulants $\lambda_n$ of a random variable are the derivatives of the *second* moment function (the natural logarithm of the moment generating function, $\Psi(s) = \ln \Phi(s)$) evaluated at the origin:
  $$
  \lambda_n = \frac{d^n \Psi(s)}{ds^n} \Bigg|_{s=0}
  $$
 .

### Discrete-Type Random Variables
* **Z-Transform Method**: For a discrete random variable taking integer values $n$ with probabilities $P_n$, the moment generating function is defined using the z-transform:
  $$
  \Gamma(z) = E\{z^x\} = \sum_{n=-\infty}^{\infty} P_n z^n
  $$
 .
* **Factorial Moments**: Differentiating the z-transform $k$ times and evaluating at $z=1$ yields factorial moments:
  $$
  \Gamma^{(k)}(1) = E\{x(x - 1) \cdots (x - k + 1)\}
  $$
 .
