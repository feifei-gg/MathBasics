# Moments
**EEE 554 — Lecture #3**

## Mean

The first moment (mean) of a RV $x$:
$$
\mu_x = E[x] = \int_{-\infty}^{\infty} x f_x(x) dx
$$
may be interpreted physically as the center of mass of the PDF $f_x$. In other words, if one had a long bar of material whose density as a function of position $x$ along the bar is given by $f_x(x)$, then $\mu_x$ is the point at which the bar would balance on a fulcrum.

---

## Variance

The second central moment (variance) of $x$:
$$
\sigma_x^2 = \text{var}(x) = E[(x - \mu_x)^2] = E[x^2] - \mu_x^2
$$
can be interpreted as the moment of inertia around the mean.

---

## Skewness

The skewness of a RV $x$ with variance $\sigma_x^2$ and mean $\mu_x$ is:
$$
r_x = \frac{E[(x - \mu_x)^3]}{\sigma_x^3}
$$
Because $(x - \mu_x)^3 = x^3 - 3x^2\mu_x + 3x\mu_x^2 - \mu_x^3$, this can be expanded as:
$$
r_x = \frac{E[x^3] - 3\mu_x E[x^2] + 2\mu_x^3}{\sigma_x^3}
$$
Roughly speaking, skewness measures the asymmetry of the PDF around its mean $\mu_x$.
* **Positive skew:** Tail extends to the right.
* **Negative skew:** Tail extends to the left.

---

## Kurtosis

The (excess) kurtosis of a RV $x$ with mean $\mu_x$ and variance $\sigma_x^2$ is:
$$
K_x = \frac{E[(x - \mu_x)^4]}{\sigma_x^4} - 3
$$
Expanding the expectation yields:
$$
K_x = \frac{E[x^4] - 4\mu_x E[x^3] + 6\mu_x^2 E[x^2] - 3\mu_x^4}{\sigma_x^4} - 3
$$

---

## Markov and Chebyshev Inequalities

**(Markov Inequality):** Suppose a RV $x$ is non-negative. Then for any $a > 0$:
$$
P(x \ge a) \le \frac{E[x]}{a}
$$
*Proof:*
$$
\begin{aligned}
E[x] &= \int_{0}^{\infty} x f_x(x) dx \\
&= \int_{0}^{a} x f_x(x) dx + \int_{a}^{\infty} x f_x(x) dx \\
&\ge \int_{a}^{\infty} a f_x(x) dx \\
&= a P(x \ge a)
\end{aligned}
$$

**(Chebyshev Inequality):** If a RV $x$ has mean $\mu_x$ and variance $\sigma_x^2$:
$$
P(|x - \mu_x| > \epsilon) \le \frac{\sigma_x^2}{\epsilon^2}
$$
*Proof:*
$$
\begin{aligned}
\sigma_x^2 &= \int_{-\infty}^{\infty} (x - \mu_x)^2 f_x(x) dx \\
&\ge \int_{|x - \mu_x| > \epsilon} (x - \mu_x)^2 f_x(x) dx \\
&\ge \int_{|x - \mu_x| > \epsilon} \epsilon^2 f_x(x) dx \\
&= \epsilon^2 P(|x - \mu_x| > \epsilon)
\end{aligned}
$$

---

# Examples of Common PDFs

## Uniform RV: $x \sim U[a,b]$

**Parameters:** $a < b$
$$
f_x(x) = \begin{cases} \frac{1}{b-a} & x \in [a,b] \\ 0 & \text{otherwise} \end{cases}
$$

**Moments:**
$$
E[x] = \int_{a}^{b} x \left(\frac{1}{b-a}\right) dx = \frac{b^2 - a^2}{2(b-a)} = \frac{a+b}{2}
$$
$$
E[x^2] = \int_{a}^{b} x^2 \left(\frac{1}{b-a}\right) dx = \frac{b^3 - a^3}{3(b-a)} = \frac{b^2 + ab + a^2}{3}
$$
$$
\therefore \text{var}(x) = E[x^2] - (E[x])^2 = \frac{(b-a)^2}{12}
$$

---

## Normal (Gaussian) RV: $x \sim N(\mu, \sigma^2)$

**Parameters:** $\mu \in \mathbb{R}$, $\sigma^2 > 0$
$$
f_x(x) = \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
$$

*Note:* Define $I = \int_{-\infty}^{\infty} e^{-ax^2} dx$. Then with $a > 0$:
$$
\begin{aligned}
\frac{I^2}{4} &= \int_{0}^{\infty} \int_{0}^{\infty} e^{-ax^2} e^{-ay^2} dx dy \\
&= \int_{0}^{\pi/2} \int_{0}^{\infty} e^{-ar^2} r \, dr \, d\theta \\
&= \frac{\pi}{2} \left( -\frac{e^{-ar^2}}{2a} \right) \Bigg|_{0}^{\infty} = \frac{\pi}{4a}
\end{aligned}
$$
Thus, $I = \sqrt{\frac{\pi}{a}}$. In particular, substituting $a = \frac{1}{2\sigma^2}$, we get $\int_{-\infty}^{\infty} \exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) dx = \sqrt{2\pi\sigma^2}$, so that $\int_{-\infty}^{\infty} f_x(x) dx = 1$.

* **Mean:** Direct integration gives $E[x] = \mu$.
* **Variance:** Integration by parts gives $\text{var}(x) = \sigma^2$.

---

## Exponential RV

**Parameter:** $\lambda > 0$
$$
f_x(x) = \begin{cases} \lambda e^{-\lambda x} & x > 0 \\ 0 & x < 0 \end{cases}
$$

**Characteristic Function:**
$$
\begin{aligned}
\Phi_x(\omega) &= \int_{-\infty}^{\infty} f_x(x) e^{-i\omega x} dx \\
&= \int_{0}^{\infty} \lambda e^{-(\lambda+i\omega)x} dx \\
&= \frac{\lambda}{\lambda + i\omega}
\end{aligned}
$$
Notice that $\Phi_x(0) = 1 = \int_{-\infty}^{\infty} f_x(x) dx$.

**Mean:**
$$
\Phi_x'(\omega) = \frac{-i\lambda}{(\lambda + i\omega)^2} \implies E[x] = \frac{\Phi_x'(0)}{-i} = \frac{1}{\lambda}
$$

**Variance:**
$$
\Phi_x''(\omega) = \frac{2(-i)^2\lambda}{(\lambda + i\omega)^3} \implies E[x^2] = \frac{\Phi_x''(0)}{(-i)^2} = \frac{2}{\lambda^2}
$$
$$
\therefore \text{var}(x) = E[x^2] - (E[x])^2 = \frac{2}{\lambda^2} - \left(\frac{1}{\lambda}\right)^2 = \frac{1}{\lambda^2}
$$

**Higher Moments:**
$$
\Phi_x^{(n)}(\omega) = \frac{n!(-i)^n\lambda}{(\lambda + i\omega)^{n+1}} \implies E[x^n] = \frac{n!}{\lambda^n}
$$

Using these moments to find skewness and kurtosis:
$$
r_x = \lambda^3 \left[ \frac{3!}{\lambda^3} - \frac{3}{\lambda} \cdot \frac{2}{\lambda^2} + \frac{2}{\lambda^3} \right] = 2
$$
$$
K_x = 6
$$
