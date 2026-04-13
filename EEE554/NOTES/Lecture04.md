# Exponential RV (cont'd) & Gamma RV
**EEE 554 — Lecture #4**

## Exponential RV (continued)

Note that for an exponential random variable with parameter $\lambda$, the mean is $\mu_x = 1/\lambda$. The probability that the variable exceeds its mean is:
$$
P(x > \mu_x) = \int_{1/\lambda}^{\infty} \lambda e^{-\lambda x} dx = e^{-1} \approx 0.37
$$

**Example (Markov Inequality):** With $x$ being exponential with $\lambda = 1$ (so $E[x] = 1$):
$$
P\left(x \ge \frac{3}{2}\right) = \int_{3/2}^{\infty} e^{-x} dx = e^{-3/2} \approx 0.22
$$
Using Markov's inequality to bound this probability:
$$
P\left(x \ge \frac{3}{2}\right) \le \frac{E[x]}{(3/2)} = \frac{1}{3/2} = \frac{2}{3} \approx 0.67
$$

---

## Gamma RV: $X \sim \Gamma(\alpha, \beta)$

**Parameters:** $\alpha > 0$ ("shape"), $\beta > 0$ ("rate")

**PDF:**
$$
f_x(x) =
\begin{cases}
\frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha-1} e^{-\beta x} & x \ge 0 \\
0 & x < 0
\end{cases}
$$

In this expression, $\Gamma$ denotes the **gamma function**, defined for any complex number $t$ that is not a non-positive integer by:
$$
\Gamma(t) = \int_{0}^{\infty} x^{t-1} e^{-x} dx
$$

Note that:
$$
\Gamma(1) = \int_{0}^{\infty} x^0 e^{-x} dx = 1
$$
And for $k = 1, 2, 3, \dots$, using integration by parts:
$$
\begin{aligned}
\Gamma(k+1) &= \int_{0}^{\infty} x^k e^{-x} dx \\
&= -x^k e^{-x} \Big|_{0}^{\infty} + \int_{0}^{\infty} k x^{k-1} e^{-x} dx \\
&= k \Gamma(k)
\end{aligned}
$$
So, $\Gamma(2) = 1 \cdot \Gamma(1) = 1$, and $\Gamma(3) = 2 \cdot \Gamma(2) = 2$.
In general, for any positive integer $n$:
$$
\Gamma(n) = (n-1)!
$$

**Proof of Unit Integral for Gamma PDF:**
$$
\int_{-\infty}^{\infty} f_x(x) dx = \frac{1}{\Gamma(\alpha)} \int_{0}^{\infty} \beta^\alpha x^{\alpha-1} e^{-\beta x} dx
$$
Let $u = \beta x$, so $du = \beta dx$. Substituting these in:
$$
= \frac{1}{\Gamma(\alpha)} \int_{0}^{\infty} u^{\alpha-1} e^{-u} du = \frac{\Gamma(\alpha)}{\Gamma(\alpha)} = 1
$$

**Moments:**
Similar calculations yield the mean and variance:
$$
E[X] = \frac{\alpha}{\beta} \quad \text{and} \quad \text{var}(X) = \frac{\alpha}{\beta^2}
$$

---

## Gaussian CDF

Let $X \sim N(0,1)$. Then its Cumulative Distribution Function (CDF) is:
$$
F_x(u) = \int_{-\infty}^{u} f_x(x) dx = \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{u} e^{-x^2/2} dx = \Phi(u)
$$
No closed-form expression for $\Phi(u)$ exists, but it can be evaluated numerically and is tabulated in many references. One often sees the complementary CDF (Q-function) defined as:
$$
Q(u) \triangleq 1 - \Phi(u)
$$

If $X \sim N(\mu, \sigma^2)$, then:
$$
P(X \le u) = \frac{1}{\sqrt{2\pi\sigma^2}} \int_{-\infty}^{u} e^{-\frac{(x-\mu)^2}{2\sigma^2}} dx
$$
Using the substitution $v = \frac{x-\mu}{\sigma}$, which implies $dv = \frac{dx}{\sigma}$:
$$
= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\frac{u-\mu}{\sigma}} e^{-\frac{v^2}{2}} dv = \Phi\left(\frac{u-\mu}{\sigma}\right)
$$

**Example:**
Let $X \sim N(2, 9)$. Find $P(|X - 2| \ge 1)$.
Because the distribution is symmetric around the mean ($\mu = 2$) and $\sigma = 3$:
$$
\begin{aligned}
P(|X - 2| \ge 1) &= P(X \ge 3) + P(X \le 1) \\
&= 2 P(X \le 1) \\
&= 2 \Phi\left(\frac{1-2}{3}\right) = 2 \Phi\left(-\frac{1}{3}\right)
\end{aligned}
$$
