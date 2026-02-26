# EEE 554 — Lecture #7

## Discrete-Type Random Variables

Suppose $x$ is a random variable (RV) that takes values in a discrete set

$$
R=\{r_k,\; k\in \mathbb{Z}_+\}.
$$

Then the CDF $F_x$ of $x$ is a **piecewise-constant** function:

$$
F_x(x)=\sum_{r_k\le x}\Pr\{x=r_k\}.
$$

- $F_x$ has **jump discontinuities** at $x=r_k$.

### “Formal derivative” using Dirac delta

Such a CDF has a formal derivative in terms of Dirac delta symbols:

$$
f_x(x)=\sum_{r_k}\Pr\{x=r_k\}\,\delta(x-r_k).
$$

**Note:**

$$
\int_{-\infty}^{x} f_x(u)\,du
= \int_{-\infty}^{x}\sum_{r_k}\Pr\{x=r_k\}\delta(u-r_k)\,du
= \sum_{r_k\le x}\Pr\{x=r_k\}
=F_x(x).
$$

Also,

$$
\int_{-\infty}^{\infty} f_x(x)\,dx
=\sum_{r_k}\Pr\{x=r_k\}
=1.
$$

---

## Example: $x$ = outcome of a die roll

$$
R=\{1,2,3,4,5,6\},\qquad r_k=k,\; k=1,\dots,6
$$

$$
\Pr\{x=r_k\}=\frac{1}{6},\qquad k=1,\dots,6
$$

### Expected value via “delta-PDF”

$$
\mathbb{E}[x]
=\int_{-\infty}^{\infty} x f_x(x)\,dx
=\int_{-\infty}^{\infty} x\sum_{k=1}^{6}\frac{1}{6}\delta(x-k)\,dx
=\sum_{k=1}^{6}\frac{1}{6}k
=\frac{21}{6}
=\frac{7}{2}.
$$

### PMF (probability mass function)

If $x$ takes integer values, the discrete function

$$
p(k)=\Pr\{x=k\}
$$

is known as the **probability mass function (PMF)**, and it is equivalent to the “PDF with deltas” given above.

Using PMF:

$$
\mathbb{E}[x]=\sum_{k=-\infty}^{\infty} k\,p(k)=\frac{7}{2}.
$$

---

## Mixed-Type RVs

In certain situations, the “PDF” of an RV may contain **both delta symbols and ordinary (continuous) values**. Such an RV is said to be of **mixed type**.

### Example

Consider a random variable $x$ with a standard normal distribution, and a new random variable $y$ defined by a transformation using the unit step function $u(x)$:

$$
x \sim \mathcal{N}(0,1), \qquad y = x \, u(x)
$$

**Analysis of the Transformation:**

* **Case 1: $x < 0$**
    * The unit step function $u(x) = 0$.
    * Therefore, $y = x \cdot 0 = 0$.
    * **Result:** All negative values of $x$ are mapped to the single point $y=0$.

* **Case 2: $x \ge 0$**
    * The unit step function $u(x) = 1$.
    * Therefore, $y = x \cdot 1 = x$.
    * **Result:** All positive values of $x$ are mapped to $y$ identically ($y=x$).

**The Distribution of $y$:**

The resulting random variable $y$ is of **mixed type** because its distribution contains two distinct components:

1.  **Discrete Component (Point Mass):**
    * Since all $x < 0$ map to $y=0$, the probability of $y=0$ is equal to the total probability mass of $x$ in the negative region.
    * For a standard normal distribution, due to symmetry, $\Pr\{x < 0\} = 0.5$.
    * This creates a **Dirac delta function** (impulse) at $y=0$ with area (weight) $0.5$.
    * Mathematical Representation: $0.5 \, \delta(y)$.

2.  **Continuous Component:**
    * For $y > 0$, $y$ follows the same distribution as $x$ (the positive half of the Gaussian curve).
    * Mathematical Representation: $\frac{1}{\sqrt{2\pi}} e^{-y^2/2}$ for $y > 0$.

**Probability Density Function (PDF) of $y$:**

Combining these, the PDF of $y$ is:

$$
f_y(y) = \underbrace{0.5 \, \delta(y)}_{\text{Discrete Part}} + \underbrace{\frac{1}{\sqrt{2\pi}} e^{-y^2/2} \, u(y)}_{\text{Continuous Part}}
$$

> **Note:** The Dirac delta $\delta(y)$ captures the finite probability ($\Pr\{x<0\} = 0.5$) concentrated at the single point $y=0$.

---

## Multiple RVs

### Joint CDF

The joint CDF of RVs $x_1,\dots,x_n$ is

$$
F_{\mathbf{X}}(x_1,\dots,x_n)
=
\Pr\big(\{X_1\le x_1\}\cap\cdots\cap\{X_n\le x_n\}\big).
$$

The subscript $\mathbf{X}$ represents the vector containing the $X_k$ as components:

$$
\mathbf{X}=
\begin{bmatrix}
X_1\\
\vdots\\
X_n
\end{bmatrix}.
$$

**Properties:**

- $0\le F_{\mathbf{X}}(x_1,\dots,x_n)\le 1$.
- If $\Delta>0$, then increasing any coordinate cannot decrease the CDF:

  $$
  F_{\mathbf{X}}(x_1,\dots,x_{k-1},x_k+\Delta,x_{k+1},\dots,x_n)
  \ge
  F_{\mathbf{X}}(x_1,\dots,x_n).
  $$

- Limits:

  $$
  \lim_{\substack{x_1\to-\infty\\ \vdots\\ x_n\to-\infty}} F_{\mathbf{X}}(x_1,\dots,x_n)=0,
  \qquad
  \lim_{\substack{x_1\to+\infty\\ \vdots\\ x_n\to+\infty}} F_{\mathbf{X}}(x_1,\dots,x_n)=1.
  $$

### Joint PDF

If $F_{\mathbf{X}}$ is differentiable, the joint PDF is

$$
f_{\mathbf{X}}(x_1,\dots,x_n)
=
\frac{\partial^n}{\partial x_1\cdots \partial x_n}
F_{\mathbf{X}}(x_1,\dots,x_n).
$$

And

$$
F_{\mathbf{X}}(x_1,\dots,x_n)
=
\int_{-\infty}^{x_n}\cdots\int_{-\infty}^{x_1}
f_{\mathbf{X}}(u_1,\dots,u_n)\,du_1\cdots du_n.
$$

Normalization:

$$
\int_{-\infty}^{\infty}\cdots\int_{-\infty}^{\infty}
f_{\mathbf{X}}(x_1,\dots,x_n)\,dx_1\cdots dx_n
=1.
$$

---

## Marginal PDFs (Marginalization)

The CDF of $X_1$ can be obtained from the joint CDF by allowing $x_2,\dots,x_n$ to take on any possible value:

$$
F_{X_1}(x_1)
=
\lim_{x_2\to\infty,\dots,x_n\to\infty}
F_{\mathbf{X}}(x_1,\dots,x_n).
$$

The marginal PDF is obtained by integrating out (“marginalizing”) the undesired variables:

$$
f_{X_1}(x_1)
=
\int_{-\infty}^{\infty}\cdots\int_{-\infty}^{\infty}
f_{\mathbf{X}}(x_1,x_2,\dots,x_n)\,dx_2\cdots dx_n.
$$

Similarly, the joint PDF of any subset of the $X_k$ can be obtained by integrating the full joint PDF over the variables you don’t want. This process is called **marginalization**.

---

## Example (marginalization in 2D)

Given a joint PDF

$$
f_{X}(x_1,x_2)=
\begin{cases}
1, & 0\le x_1\le 2x_2,\; 0\le x_2\le 1\\
0, & \text{otherwise}
\end{cases}
$$

Compute the marginal $f_{X_2}(x_2)$:

$$
f_{X_2}(x_2)=\int_{-\infty}^{\infty} f_{X}(x_1,x_2)\,dx_1
=\int_{0}^{2x_2} 1\,dx_1
=2x_2,
$$

for $0\le x_2\le 1$, and $0$ otherwise.

From this, it is straightforward to calculate $\mathbb{E}[X_2]$, $\mathrm{Var}(X_2)$, etc.