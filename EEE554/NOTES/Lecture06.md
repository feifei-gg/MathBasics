# Conditioning & Transformations of a RV
**EEE 554 — Lecture #6**

## Conditioning a RV on an Event

Let $A$ be an event defined in terms of a random variable (RV) $x$; e.g., $A = \{0 < x < 1\}$ or $A = \{|x| < 5\}$. The conditional PDF of $x$ given $A$ is:

$$
f_x(x|A) = \begin{cases}
\frac{f_x(x)}{P(A)} & x \in A \\
0 & x \notin A
\end{cases}
$$

Note that $f_x(x|A) \ge 0$ for all $x$ and
$$
\int_{-\infty}^{\infty} f_x(x|A) dx = \frac{1}{P(A)} \int_{A} f_x(x) dx = 1,
$$
so $f_x(x|A)$ is a valid PDF.

---

## Conditional Moments

Moments are defined in the usual way with respect to the conditional PDF:
$$
E[x|A] = \int_{-\infty}^{\infty} x f_x(x|A) dx
$$

And the expectation rule applies:
$$
E[g(x)|A] = \int_{-\infty}^{\infty} g(x) f_x(x|A) dx
$$
So,
$$
E[x^n|A] = \int_{-\infty}^{\infty} x^n f_x(x|A) dx
$$
and
$$
\text{var}(x|A) = E[x^2|A] - (E[x|A])^2
$$

**Example:**
$$
f_x(x) = \begin{cases}
2x & 0 \le x \le 1 \\
0 & \text{else}
\end{cases}
$$
Let $A = \left\{ x > \frac{1}{2} \right\} \implies P(A) = \frac{3}{4}$.

The conditional PDF is:
$$
f_x(x|A) = \begin{cases}
\frac{8}{3}x & \frac{1}{2} < x \le 1 \\
0 & \text{else}
\end{cases}
$$

Calculating conditional moments:
$$
E[x|A] = \frac{8}{3} \int_{1/2}^{1} x^2 dx = \frac{8}{9}x^3 \Big|_{1/2}^{1} = \frac{8}{9} \left(1 - \frac{1}{8}\right) = \frac{7}{9}
$$
$$
E[x^2|A] = \frac{8}{3} \int_{1/2}^{1} x^3 dx = \frac{2}{3}x^4 \Big|_{1/2}^{1} = \frac{2}{3} \left(1 - \frac{1}{16}\right) = \frac{5}{8}
$$
$$
\text{var}(x|A) = \frac{5}{8} - \left(\frac{7}{9}\right)^2 = \frac{5}{8} - \frac{49}{81} = \frac{13}{648}
$$

---

## Transformation of One RV

Suppose $g(x)$ is a monotonically increasing function. Define a new RV $y = g(x)$. Then:
$$
\begin{aligned}
F_y(y) &= P(y \le y) = P(g(x) \le y) \\
&= P(x \le g^{-1}(y)) = F_x(g^{-1}(y))
\end{aligned}
$$
where $g^{-1}$ is defined so that $g(g^{-1}(y)) = y$.

Note that by the chain rule:
$$
\frac{d}{dy} g(g^{-1}(y)) = g'(g^{-1}(y)) \cdot (g^{-1})'(y) = 1
$$
So,
$$
(g^{-1})'(y) = \frac{1}{g'(g^{-1}(y))}
$$

Thus, the PDF of $y$ is:
$$
\begin{aligned}
f_y(y) &= \frac{d}{dy} F_y(y) = \frac{d}{dy} F_x(g^{-1}(y)) \\
&= f_x(g^{-1}(y)) \cdot (g^{-1})'(y) \\
&= \frac{f_x(x)}{g'(x)} \Bigg|_{x=g^{-1}(y)}
\end{aligned}
$$

**Example:**
$x \sim U[-1, 1]$ (Uniform), and $y = g(x) = x^3$.
We have $g^{-1}(y) = y^{1/3}$ and $g'(x) = 3x^2$.
$$
f_y(y) = \frac{(1/2)}{3x^2} \Bigg|_{x=y^{1/3}} = \frac{1}{6} y^{-2/3}
$$
for $-1 < y < 1$ and zero otherwise.

Note that it integrates to 1:
$$
\int_{-\infty}^{\infty} f_y(y) dy = \frac{1}{6} \int_{-1}^{1} y^{-2/3} dy = \frac{1}{2} y^{1/3} \Big|_{-1}^{1} = 1
$$

With this PDF for $y$, direct calculation yields:
$$
E[y^2] = \int_{-\infty}^{\infty} y^2 f_y(y) dy = \frac{1}{6} \int_{-1}^{1} y^{4/3} dy = \frac{1}{7}
$$
Using the expectation rule with $f_x$ gives the same result:
$$
E[y^2] = E[x^6] = \frac{1}{2} \int_{-1}^{1} x^6 dx = \frac{1}{7}
$$

If $g$ is monotonically **decreasing**, a similar calculation to the one above gives:
$$
f_y(y) = \frac{f_x(x)}{|g'(x)|} \Bigg|_{x=g^{-1}(y)}
$$

If $g$ is not strictly monotonic everywhere but is monotonic on a sequence of disjoint intervals $A_k = [a_k, b_k)$, then by total probability:
$$
f_y(y) = \sum_k f_y(y|A_k) P(A_k)
$$
where each $f_x(x|A_k)$ is monotonic. The expression may be applied to each of these conditional PDFs individually, which can be combined to obtain $f_y(y)$.

---

## Linear Transformation of a Normal RV

Let $x \sim N(\mu, \sigma^2)$ and set:
$$
y = g(x) = ax + b
$$
with $a \neq 0$. Then $g^{-1}(y) = \frac{y-b}{a}$ and $|g'(x)| = |a|$.

Using the transformation rule:
$$
f_y(y) = \frac{f_x(x)}{|a|} \Bigg|_{x=\frac{y-b}{a}}
$$
$$
\begin{aligned}
f_y(y) &= \frac{1}{|a|} \cdot \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left\{-\frac{1}{2\sigma^2}\left(\frac{y-b}{a} - \mu\right)^2\right\} \\
&= \frac{1}{\sqrt{2\pi(a^2\sigma^2)}} \exp\left\{-\frac{1}{2(a^2\sigma^2)}(y - (a\mu + b))^2\right\}
\end{aligned}
$$
So, $y \sim N(a\mu + b, a^2\sigma^2)$; i.e., a linear transformation on a normal RV produces another normal RV.

Even without calculating $f_y$ explicitly, it is obvious that:
$$
E[y] = a\mu + b \quad \text{and} \quad \text{var}(y) = a^2\sigma^2
$$
Hence, knowing $y$ is normal immediately gives its PDF.
