# Review of One RV
**EEE 554 — Lecture #2**

## Random Variable

A (real) random variable (RV) is a function $\underline{x}: S \rightarrow \mathbb{R}$ where $S$ is an outcome set with probability measure $P$. A RV must satisfy the "measurability condition": $\underline{x}^{-1}(A)$ must be an event in $\mathcal{F}$ for every Borel set $A$ in $\mathbb{R}$.

*Note: The measurability condition is satisfied by all RVs typically encountered in engineering.*

---

## Cumulative Distribution

The cumulative distribution function (CDF) of a RV $x$ is defined by:
$$
F_x(x) = P(\{s \in S \mid x(s) \le x\})
$$

The CDF obviously satisfies:
1. **(Monotonicity)** If $x' > x$, $F_x(x') \ge F_x(x)$
2. **(Lower bound)** $F_x(x) \ge 0$ and $\lim_{x \to -\infty} F_x(x) = 0$
3. **(Upper bound)** $F_x(x) \le 1$ and $\lim_{x \to \infty} F_x(x) = 1$

---

## Probability Density

The probability density function (PDF) of a RV $x$ is defined by:
$$
f_x(x) = \frac{d}{dx}F_x(x)
$$

Existence of the PDF requires that the CDF is differentiable in some sense. Formally, the probability measure $P$ on $S$ must have a Radon-Nikodym derivative with respect to Lebesgue measure on $\mathbb{R}$. Typically in engineering, $\frac{d}{dx}$ is an ordinary derivative or a derivative that accommodates jump discontinuities in $F_x$ by allowing $f_x$ to contain Dirac delta symbols.

The PDF satisfies:
1. **(Positivity)** $f_x(x) \ge 0$
2. **(Unit integral)** $\int_{-\infty}^{\infty} f_x(x) dx = 1$

Further, the CDF is recovered from the PDF by:
$$
F_x(x) = \int_{-\infty}^{x} f_x(u) du
$$

---

## Probability x Takes a Value in a Set

From the definition of CDF,
$$
P(\{s \mid a < x(s) \le b\}) = F_x(b) - F_x(a) = \int_{a}^{b} f_x(x) dx
$$

More generally, for a Borel set $A$ in $\mathbb{R}$:
$$
P(\{x \in A\}) = \int_{A} f_x(x) dx
$$

---

## Mean

The mean or expected value of $x$ is:
$$
\mu_x = E[x] = \int_{-\infty}^{\infty} x f_x(x) dx
$$
*Note that the mean of $x$ may not exist.*

---

## Expectation Rule

If $y = g(x)$, then:
$$
\mu_y = E[g(x)] = \int_{-\infty}^{\infty} g(x) f_x(x) dx
$$
This important theorem will be proven later in this class for well-behaved transformations $g$.

In particular, it implies that $E[\cdot]$ is linear in the sense that:
$$
\begin{aligned}
E[ax + b] &= \int_{-\infty}^{\infty} (ax + b) f_x(x) dx \\
&= a \int_{-\infty}^{\infty} x f_x(x) dx + b \int_{-\infty}^{\infty} f_x(x) dx \\
&= a E[x] + b
\end{aligned}
$$

---

## Variance

The variance of $x$ is $\text{var}(x) = E[(x - \mu_x)^2]$.
The expectation rule gives:
$$
\begin{aligned}
\text{var}(x) &= E[x^2 - 2\mu_x x + \mu_x^2] \\
&= E[x^2] - 2\mu_x E[x] + \mu_x^2 \\
&= E[x^2] - \mu_x^2
\end{aligned}
$$

---

## Moments

For $k = 1, 2, \dots$, the $k^{\text{th}}$ moment of $x$ is $E[x^k]$.

The $k^{\text{th}}$ central moment of $x$ is $E[(x - \mu_x)^k]$. Note that the first moment of $x$ is its mean and the second central moment of $x$ is its variance.

---

## Characteristic Function

The characteristic function of $x$ is:
$$
\Phi_x(\omega) = E[e^{-i\omega x}] = \int_{-\infty}^{\infty} e^{-i\omega x} f_x(x) dx
$$
i.e., it is the Fourier transform of the PDF.

Note that:
$$
\Phi_x(0) = \int_{-\infty}^{\infty} f_x(x) dx = 1
$$
and, by inverse Fourier transform:
$$
f_x(x) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \Phi_x(\omega) e^{i\omega x} d\omega
$$

Further, taking the derivative:
$$
\frac{d}{d\omega} \Phi_x(\omega) = \frac{d}{d\omega} \int_{-\infty}^{\infty} e^{i\omega x} f_x(x) dx = -i \int_{-\infty}^{\infty} x e^{i\omega x} f_x(x) dx
$$
Evaluating at $\omega = 0$:
$$
\frac{d}{d\omega} \Phi_x(0) = -i E[x]
$$
Similarly, higher moments can be generated:
$$
E[x^k] = \frac{1}{(-i)^k} \frac{d^k}{d\omega^k} \Phi_x(0), \quad k = 1, 2, \dots
$$
