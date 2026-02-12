# Chapter 5: Functions of Random Variables (Summary)

Based on *Probability, Random Variables, and Stochastic Processes* (Papoulis).

## Section 5-1: Functions of One Random Variable

This section deals with the problem: Given a random variable (RV) $\mathbf{x}$ with a known distribution, finding the distribution of a new RV $\mathbf{y}$ defined as $\mathbf{y} = g(\mathbf{x})$.

### 1. The Concept
Given $\mathbf{y} = g(\mathbf{x})$, for any specific value $y$, the event $\{\mathbf{y} \le y\}$ is equivalent to the event $\{\mathbf{x} \in R_y\}$, where $R_y$ is the set of $x$ values such that $g(x) \le y$.

**CDF Relation:**
$$F_y(y) = P\{\mathbf{y} \le y\} = P\{\mathbf{x} \in R_y\}$$

### 2. The Fundamental Theorem (PDF Transformation)

If we want to find the Probability Density Function (PDF) $f_y(y)$ directly from $f_x(x)$, we use the fundamental theorem.

> **Theorem:** To find $f_y(y)$ for a specific value $y$:
> 1. Solve the equation $y = g(x)$ for $x$.
> 2. Let $x_1, x_2, \dots, x_n, \dots$ be the real roots of this equation ($g(x_i) = y$).
> 3. Then:
>
> $$f_y(y) = \sum_{i} \frac{f_x(x_i)}{|g'(x_i)|}$$
>
> **Conditions:**
> * If $y = g(x)$ has no real roots, then $f_y(y) = 0$.
> * $g'(x)$ is the derivative of $g(x)$.



### 3. Special Cases

#### A. Linear Transformation
If $\mathbf{y} = a\mathbf{x} + b$ (where $a \neq 0$):
* There is only one root: $x = (y-b)/a$.
* The derivative is $g'(x) = a$.

**Formula:**
$$f_y(y) = \frac{1}{|a|} f_x\left(\frac{y-b}{a}\right)$$

#### B. Square Law Transformation
If $\mathbf{y} = \mathbf{x}^2$ (where $y > 0$):
* There are two roots: $x_1 = \sqrt{y}$ and $x_2 = -\sqrt{y}$.
* The derivative is $g'(x) = 2x$.
* $|g'(x_1)| = 2\sqrt{y}$ and $|g'(x_2)| = |-2\sqrt{y}| = 2\sqrt{y}$.

**Formula:**
$$f_y(y) = \frac{1}{2\sqrt{y}} \left[ f_x(\sqrt{y}) + f_x(-\sqrt{y}) \right] \quad \text{for } y > 0$$

### 4. Expectation of a Function
Instead of finding $f_y(y)$ first to calculate the mean, we can compute it directly using $f_x(x)$.

**Theorem:**
$$E[g(\mathbf{x})] = \int_{-\infty}^{\infty} g(x)f_x(x) \, dx$$

---

## Section 5-2: Functions of Two Random Variables

This section extends the concept to two RVs: Given $\mathbf{x}$ and $\mathbf{y}$ with joint density $f_{xy}(x,y)$, find the distribution of $\mathbf{z} = g(\mathbf{x}, \mathbf{y})$.

### 1. One Function of Two Variables
$\mathbf{z} = g(\mathbf{x}, \mathbf{y})$

**General Method (CDF):**
$$F_z(z) = P\{\mathbf{z} \le z\} = \iint_{D_z} f_{xy}(x, y) \, dx \, dy$$
* Where $D_z$ is the region in the $xy$-plane such that $g(x, y) \le z$.



#### Important Specific Functions:

**A. Sum of Two RVs (Convolution)**
If $\mathbf{z} = \mathbf{x} + \mathbf{y}$:
The density $f_z(z)$ is found by integrating along the line $x+y=z$.

$$f_z(z) = \int_{-\infty}^{\infty} f_{xy}(x, z-x) \, dx$$

* **Corollary:** If $\mathbf{x}$ and $\mathbf{y}$ are **independent**, $f_{xy}(x,y) = f_x(x)f_y(y)$. The formula becomes the **Convolution Integral**:
    $$f_z(z) = f_x(z) * f_y(z) = \int_{-\infty}^{\infty} f_x(x) f_y(z-x) \, dx$$

**B. Ratio of Two RVs**
If $\mathbf{z} = \mathbf{x} / \mathbf{y}$:

$$f_z(z) = \int_{-\infty}^{\infty} |y| f_{xy}(yz, y) \, dy$$

### 2. Two Functions of Two Variables (Transformation)

Given two new variables defined by:
$$\mathbf{z} = g(\mathbf{x}, \mathbf{y})$$
$$\mathbf{w} = h(\mathbf{x}, \mathbf{y})$$

To find the joint density $f_{zw}(z, w)$:

**The Fundamental Theorem (2D):**

1.  Solve the system for $x$ and $y$ in terms of $z$ and $w$.
2.  Let $(x_1, y_1), (x_2, y_2), \dots$ be the real roots.
3.  Calculate the **Jacobian** of the transformation $J(x, y)$:
$$
J(x, y) = \det \begin{vmatrix} 
\frac{\partial z}{\partial x} & \frac{\partial z}{\partial y} \\ 
\frac{\partial w}{\partial x} & \frac{\partial w}{\partial y} 
\end{vmatrix} = \frac{\partial z}{\partial x}\frac{\partial w}{\partial y} - \frac{\partial z}{\partial y}\frac{\partial w}{\partial x}
$$

**Formula:**
$$f_{zw}(z, w) = \sum_{i} \frac{f_{xy}(x_i, y_i)}{|J(x_i, y_i)|}$$

### 3. The Auxiliary Variable Method
If you are given only one function $\mathbf{z} = g(\mathbf{x}, \mathbf{y})$ but want to find $f_z(z)$ using the Jacobian method:
1.  Introduce an arbitrary auxiliary variable, usually $\mathbf{w} = \mathbf{x}$ (or $\mathbf{w} = \mathbf{y}$).
2.  Find the joint density $f_{zw}(z, w)$ using the Fundamental Theorem above.
3.  Integrate out $\mathbf{w}$ to get the marginal density of $\mathbf{z}$:
    $$f_z(z) = \int_{-\infty}^{\infty} f_{zw}(z, w) \, dw$$

---
## 5. Classic Textbook Examples (Must-Know)

These are the standard examples from Papoulis (Chapter 5) that illustrate the core theorems.

### Example 5-2: The Square Law Device (Transformation of One RV)

**Problem:**
Consider a device with input $\mathbf{x}$ and output $\mathbf{y}$ defined by the square-law characteristic:
$$\mathbf{y} = a\mathbf{x}^2 \quad (a > 0)$$
Find the PDF $f_y(y)$ given $f_x(x)$.

**Solution:**
1.  **Analyze the Roots:**
    * For $y < 0$: The equation $y = ax^2$ has no real solutions. Thus, $f_y(y) = 0$.
    * For $y > 0$: The equation has two solutions (roots):
        $$x_1 = \sqrt{\frac{y}{a}}, \quad x_2 = -\sqrt{\frac{y}{a}}$$
2.  **Compute Derivatives:**
    * $g'(x) = 2ax$.
    * At the roots: $|g'(x_1)| = |2a\sqrt{y/a}| = 2\sqrt{ay}$ and $|g'(x_2)| = |-2a\sqrt{y/a}| = 2\sqrt{ay}$.
3.  **Apply Fundamental Theorem:**
    $$f_y(y) = \frac{f_x(x_1)}{|g'(x_1)|} + \frac{f_x(x_2)}{|g'(x_2)|}$$
    $$f_y(y) = \frac{1}{2\sqrt{ay}} \left[ f_x\left(\sqrt{\frac{y}{a}}\right) + f_x\left(-\sqrt{\frac{y}{a}}\right) \right] u(y)$$

**Special Case (Chi-Square Degree 1):**
If $\mathbf{x} \sim N(0, 1)$ (Standard Normal) and $a=1$:
* $f_x(x)$ is even, so $f_x(\sqrt{y}) = f_x(-\sqrt{y})$.
* The formula simplifies to:
    $$f_y(y) = \frac{1}{\sqrt{y}} f_x(\sqrt{y}) = \frac{1}{\sqrt{2\pi y}} e^{-y/2} u(y)$$
* This is the **Chi-Square distribution with 1 degree of freedom**.

---

### Example 5-12: Sum of Independent Uniform RVs (Transformation of Two RVs)

**Problem:**
Let $\mathbf{z} = \mathbf{x} + \mathbf{y}$. Find the PDF $f_z(z)$ if $\mathbf{x}$ and $\mathbf{y}$ are independent and uniformly distributed in $(0, 1)$.

**Solution:**
1.  **Identify the Method:**
    Since $\mathbf{x}$ and $\mathbf{y}$ are independent, the PDF of their sum is the **convolution** of their individual PDFs:
    $$f_z(z) = f_x(z) * f_y(z) = \int_{-\infty}^{\infty} f_x(z-y)f_y(y) \, dy$$
2.  **Setup the Integral:**
    * $f_x(x) = 1$ for $0 < x < 1$, else 0.
    * $f_y(y) = 1$ for $0 < y < 1$, else 0.
    * The integrand $f_x(z-y)f_y(y)$ is non-zero only when both $0 < y < 1$ AND $0 < z-y < 1$ (which means $z-1 < y < z$).
3.  **Evaluate Ranges:**
    The intersection of intervals $(0, 1)$ and $(z-1, z)$ depends on $z$:
    * **Case 1 ($0 \le z < 1$):** Overlap is $(0, z)$.
        $$f_z(z) = \int_{0}^{z} 1 \cdot 1 \, dy = z$$
    * **Case 2 ($1 \le z < 2$):** Overlap is $(z-1, 1)$.
        $$f_z(z) = \int_{z-1}^{1} 1 \cdot 1 \, dy = 1 - (z-1) = 2 - z$$
    * **Case 3 (Otherwise):** No overlap, integral is 0.
4.  **Result (Triangular Distribution):**
    $$
    f_z(z) = \begin{cases} z & 0 \le z < 1 \\ 2-z & 1 \le z < 2 \\ 0 & \text{otherwise} \end{cases}
    $$
    * *(Tip: The convolution of two rectangular pulses is always a triangular pulse.)*

---

### Summary of Key "Tricks" for Solving Problems

1.  **Symmetry Trick:** If $f_x(x)$ is even and $y=x^2$, you can just compute for positive $x$ and multiply by 2 (as seen in Example 5-2).
2.  **Auxiliary Variable Trick:** When finding the distribution of $\mathbf{z} = g(\mathbf{x}, \mathbf{y})$, if the Jacobian method seems too complex, consider finding the CDF $F_z(z)$ by integrating over the region $D_z$ in the $xy$-plane directly. This is often geometric (calculating areas).
3.  **Independence Shortcut:** Always check if $\mathbf{x}$ and $\mathbf{y}$ are independent. If yes, $f_{xy} = f_x f_y$, which simplifies double integrals significantly.

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