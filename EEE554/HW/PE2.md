## problem1
To calculate the probability and properties of the random variables $X$ and $Y$, we first define the region $S$ where the joint PDF is non-zero. The region $|x| + |y| \le 2$ describes a diamond shape with vertices at $(2, 0)$, $(0, 2)$, $(-2, 0)$, and $(0, -2)$. 

The area of this region is $1/2 \times 4 \times 4 = 8$. Since the PDF $f_{XY}(x, y) = 1/8$ for $(x, y) \in S$ and $\int_S (1/8) dA = (1/8) \times 8 = 1$, the PDF is properly normalized.

### a) Calculate $P(A)$
The event $A$ is defined by $y \ge x^2$. Since $x^2 \ge 0$, we only consider the portion of the diamond in the upper half-plane ($y \ge 0$). In the upper half-plane, the diamond boundary is $y \le 2 - |x|$.

The region of interest is the intersection of $y \ge x^2$ and $y \le 2 - |x|$. To find the integration limits for $x$, we set $x^2 = 2 - |x|$:
$$x^2 + |x| - 2 = 0 \implies (|x| + 2)(|x| - 1) = 0 \implies |x| = 1 \implies x = \pm 1$$

The area of region $A$ is:
$$\text{Area}(A) = \int_{-1}^1 \int_{x^2}^{2-|x|} dy dx = 2 \int_0^1 (2 - x - x^2) dx$$
$$\text{Area}(A) = 2 \left[ 2x - \frac{x^2}{2} - \frac{x^3}{3} \right]_0^1 = 2 \left( 2 - \frac{1}{2} - \frac{1}{3} \right) = 2 \left( \frac{12 - 3 - 2}{6} \right) = \frac{7}{3}$$

The probability is the area of $A$ scaled by the constant PDF value:
$$P(A) = \text{Area}(A) \cdot \frac{1}{8} = \frac{7}{3} \cdot \frac{1}{8} = \frac{7}{24}$$

### b) Find $f_Y(y|A)$
The conditional PDF is $f_Y(y|A) = \frac{f_Y(y, A)}{P(A)}$, where $f_Y(y, A) = \int f_{XY}(x, y) \mathbb{I}((x,y) \in A) dx$. 
For a fixed $y$, $x$ is constrained by $|x| \le \sqrt{y}$ (from $y \ge x^2$) and $|x| \le 2 - y$ (from the diamond).

1.  **If $0 \le y \le 1$:** $\sqrt{y} \le 2 - y$, so $|x| \le \sqrt{y}$.
    $$f_Y(y, A) = \int_{-\sqrt{y}}^{\sqrt{y}} \frac{1}{8} dx = \frac{2\sqrt{y}}{8} = \frac{\sqrt{y}}{4}$$
2.  **If $1 < y \le 2$:** $2 - y < \sqrt{y}$, so $|x| \le 2 - y$.
    $$f_Y(y, A) = \int_{-(2-y)}^{2-y} \frac{1}{8} dx = \frac{2(2-y)}{8} = \frac{2-y}{4}$$

Dividing by $P(A) = 7/24$:
$$f_Y(y|A) = 
\begin{cases} 
\frac{6}{7}\sqrt{y} & 0 \le y \le 1 \\
\frac{6}{7}(2-y) & 1 < y \le 2
\end{cases}$$

### c) Compute $\text{var}(X|A)$
Due to the symmetry of region $A$ and the PDF across the $y$-axis, the conditional mean $E[X|A] = 0$. Thus, $\text{var}(X|A) = E[X^2|A]$.
$$E[X^2, A] = \iint_A x^2 \frac{1}{8} dA = \frac{2}{8} \int_0^1 x^2 (2 - x - x^2) dx$$
$$E[X^2, A] = \frac{1}{4} \left[ \frac{2x^3}{3} - \frac{x^4}{4} - \frac{x^5}{5} \right]_0^1 = \frac{1}{4} \left( \frac{2}{3} - \frac{1}{4} - \frac{1}{5} \right) = \frac{1}{4} \left( \frac{40 - 15 - 12}{60} \right) = \frac{13}{240}$$

Normalizing by $P(A)$:
$$\text{var}(X|A) = \frac{E[X^2, A]}{P(A)} = \frac{13/240}{7/24} = \frac{13}{240} \cdot \frac{24}{7} = \frac{13}{70}$$

# problem2
To solve for the properties of the jointly normal random variables $X$ and $Y$, we first summarize the given parameters in vector and matrix form.

The mean vector is:
$$M_X = \begin{bmatrix} E[X] \\ E[Y] \end{bmatrix} = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$$

The covariance matrix $C_X$ is composed of the variances on the diagonal and the covariance on the off-diagonals:
$$C_X = \begin{bmatrix} var(X) & cov(X, Y) \\ cov(X, Y) & var(Y) \end{bmatrix} = \begin{bmatrix} 2 & -1 \\ -1 & 2 \end{bmatrix}$$

### a) Explicit Expression for $f_{XY}(x, y)$
The probability density function (PDF) for a bivariate normal distribution is given by:
$$f_{XY}(x, y) = \frac{1}{2\pi \sqrt{\det(C_X)}} \exp \left( -\frac{1}{2} (X - M_X)^T C_X^{-1} (X - M_X) \right)$$

1.  **Calculate the determinant**: $\det(C_X) = (2)(2) - (-1)(-1) = 3$.
2.  **Find the inverse matrix**: $C_X^{-1} = \frac{1}{3} \begin{bmatrix} 2 & 1 \\ 1 & 2 \end{bmatrix}$.
3.  **Expand the exponent**:
    $$(X - M_X)^T C_X^{-1} (X - M_X) = \frac{1}{3} \begin{bmatrix} x-1 & y-1 \end{bmatrix} \begin{bmatrix} 2 & 1 \\ 1 & 2 \end{bmatrix} \begin{bmatrix} x-1 \\ y-1 \end{bmatrix}$$
    $$= \frac{1}{3} \left[ 2(x-1)^2 + 2(x-1)(y-1) + 2(y-1)^2 \right]$$

Substituting these into the PDF formula:
$$f_{XY}(x, y) = \frac{1}{2\pi \sqrt{3}} \exp \left( -\frac{1}{3} \left[ (x-1)^2 + (x-1)(y-1) + (y-1)^2 \right] \right)$$



### b) Covariance Ellipse Sketch
The covariance ellipse is centered at $(1, 1)$. Its orientation and shape are determined by the eigenvalues and eigenvectors of $C_X$.

1.  **Eigenvalues**: Solving $\det(C_X - \lambda I) = 0 \implies (2-\lambda)^2 - 1 = 0$ gives $\lambda_1 = 3$ and $\lambda_2 = 1$.
2.  **Eigenvectors**:
    * For $\lambda_1 = 3$, the eigenvector is $E_1 = \frac{1}{\sqrt{2}} \begin{bmatrix} 1 \\ -1 \end{bmatrix}$ (slope = $-1$).
    * For $\lambda_2 = 1$, the eigenvector is $E_2 = \frac{1}{\sqrt{2}} \begin{bmatrix} 1 \\ 1 \end{bmatrix}$ (slope = $1$).

**Sketch Description:**
* **Center**: $(1, 1)$.
* **Major Axis**: Along the line $y - 1 = -(x - 1)$ (or $y = -x + 2$). The ellipse is elongated in this direction because $\lambda_1 = 3$ is the larger eigenvalue.
* **Minor Axis**: Along the line $y - 1 = (x - 1)$ (or $y = x$).
* **Orientation**: The negative covariance causes the ellipse to tilt downward from top-left to bottom-right.



### c) Orthogonal Matrix $U$ for Decorrelation
To make the random vector $W = U [X, Y]^T$ uncorrelated, the rows of the orthogonal matrix $U$ must be the normalized eigenvectors of $C_X$.
$$U = \begin{bmatrix} E_2^T \\ E_1^T \end{bmatrix} = \begin{bmatrix} \frac{1}{\sqrt{2}} & \frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} & -\frac{1}{\sqrt{2}} \end{bmatrix}$$

Using this transformation, the new covariance matrix $C_W$ will be diagonal:
$$C_W = U C_X U^T = \begin{bmatrix} 1 & 0 \\ 0 & 3 \end{bmatrix}$$

### d) Compute $E[W]$
Using the linearity of expectation:
$$E[W] = U E \begin{bmatrix} X \\ Y \end{bmatrix} = U \begin{bmatrix} 1 \\ 1 \end{bmatrix}$$
$$E[W] = \begin{bmatrix} \frac{1}{\sqrt{2}} & \frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} & -\frac{1}{\sqrt{2}} \end{bmatrix} \begin{bmatrix} 1 \\ 1 \end{bmatrix} = \begin{bmatrix} \frac{2}{\sqrt{2}} \\ 0 \end{bmatrix} = \begin{bmatrix} \sqrt{2} \\ 0 \end{bmatrix}$$

# problem3
To solve the problem for the complex random 3-vector $Z$, we rely on the fundamental properties of complex covariance matrices and linear transformations.

### a) Find the values of $a, b,$ and $c$

A covariance matrix $C_Z$ of a complex random vector must be **Hermitian**. By definition, a Hermitian matrix satisfies $C_Z = C_Z^\dagger$, where $C_Z^\dagger$ is the conjugate transpose (the transpose of the matrix with each element replaced by its complex conjugate).



The given covariance matrix is:
$$C_Z = \begin{bmatrix} 4 & i & a \\ b & 3 & 0 \\ 1 & c & 3 \end{bmatrix}$$

Applying the Hermitian property $C_{jk} = C_{kj}^*$:
1.  **For $b$**: $C_{21}$ must be the conjugate of $C_{12}$.
    $$b = C_{21} = C_{12}^* = (i)^* = -i$$
2.  **For $a$**: $C_{13}$ must be the conjugate of $C_{31}$.
    $$a = C_{13} = C_{31}^* = (1)^* = 1$$
3.  **For $c$**: $C_{32}$ must be the conjugate of $C_{23}$.
    $$c = C_{32} = C_{23}^* = (0)^* = 0$$

Thus, the values are **$a = 1$**, **$b = -i$**, and **$c = 0$**. The resulting covariance matrix is:
$$C_Z = \begin{bmatrix} 4 & i & 1 \\ -i & 3 & 0 \\ 1 & 0 & 3 \end{bmatrix}$$

---

### b) Calculate $\text{var}(X)$

For a complex scalar random variable $X$ defined as a linear combination of the components of $Z$, $X = \mathbf{a}^T Z$, the variance is given by the quadratic form:
$$\text{var}(X) = \mathbf{a}^T C_Z \mathbf{a}^*$$
where $\mathbf{a}^*$ is the complex conjugate of the coefficients.

Given $X = 2z_1 - 3z_2 + (1 + 2i)z_3$, we define the coefficient vector:
$$\mathbf{a}^T = \begin{bmatrix} 2 & -3 & 1 + 2i \end{bmatrix}$$



We calculate the variance in two steps:

**Step 1: Calculate $\mathbf{a}^T C_Z$**
$$\mathbf{a}^T C_Z = \begin{bmatrix} 2 & -3 & 1+2i \end{bmatrix} \begin{bmatrix} 4 & i & 1 \\ -i & 3 & 0 \\ 1 & 0 & 3 \end{bmatrix}$$
$$= \begin{bmatrix} 2(4) + (-3)(-i) + (1+2i)(1) & 2(i) + (-3)(3) + (1+2i)(0) & 2(1) + (-3)(0) + (1+2i)(3) \end{bmatrix}$$
$$= \begin{bmatrix} 8 + 3i + 1 + 2i & 2i - 9 & 2 + 3 + 6i \end{bmatrix}$$
$$= \begin{bmatrix} 9 + 5i & -9 + 2i & 5 + 6i \end{bmatrix}$$

**Step 2: Multiply by $\mathbf{a}^*$**
$$\text{var}(X) = \begin{bmatrix} 9 + 5i & -9 + 2i & 5 + 6i \end{bmatrix} \begin{bmatrix} 2 \\ -3 \\ 1 - 2i \end{bmatrix}$$
$$\text{var}(X) = (9 + 5i)(2) + (-9 + 2i)(-3) + (5 + 6i)(1 - 2i)$$
$$= (18 + 10i) + (27 - 6i) + (5 - 10i + 6i - 12i^2)$$
$$= 18 + 10i + 27 - 6i + 5 - 4i + 12$$
$$= (18 + 27 + 5 + 12) + (10 - 6 - 4)i$$
$$\text{var}(X) = 62$$

The variance of $X$ is **62**.

# problem4
To calculate the bias and variance of the estimator $\hat{\theta} = \frac{2}{n} \sum_{k=1}^n x_k$, we first identify the statistical properties of the individual random variables $x_k$ based on the uniform distribution $U[0, \theta]$.

### 1. Properties of the Uniform Distribution
For a random variable $x_k \sim U[0, \theta]$:
* **Mean ($E[x_k]$):** The expected value is the midpoint of the interval:
    $$E[x_k] = \frac{0 + \theta}{2} = \frac{\theta}{2}$$
* **Variance ($var(x_k)$):** The variance is given by $\frac{(b-a)^2}{12}$:
    $$var(x_k) = \frac{(\theta - 0)^2}{12} = \frac{\theta^2}{12}$$



### 2. Calculation of Bias $\beta(\hat{\theta})$
The bias of an estimator is defined as $\beta(\hat{\theta}) = E[\hat{\theta}] - \theta$. First, we find the expected value of the estimator:
$$E[\hat{\theta}] = E\left[ \frac{2}{n} \sum_{k=1}^n x_k \right]$$

By the linearity of expectation:
$$E[\hat{\theta}] = \frac{2}{n} \sum_{k=1}^n E[x_k] = \frac{2}{n} \left( n \cdot \frac{\theta}{2} \right)$$
$$E[\hat{\theta}] = \theta$$

Since $E[\hat{\theta}] = \theta$, the bias is:
$$\beta(\hat{\theta}) = \theta - \theta = 0$$
The estimator $\hat{\theta}$ is an **unbiased** estimator of $\theta$.

---

### 3. Calculation of Variance $var(\hat{\theta})$
The variance of the estimator is calculated using the property that for independent random variables, the variance of their sum is the sum of their variances:
$$var(\hat{\theta}) = var\left( \frac{2}{n} \sum_{k=1}^n x_k \right)$$

Applying the property $var(aX) = a^2 var(X)$:
$$var(\hat{\theta}) = \left( \frac{2}{n} \right)^2 var\left( \sum_{k=1}^n x_k \right)$$

Since $x_1, \dots, x_n$ are iid:
$$var(\hat{\theta}) = \frac{4}{n^2} \sum_{k=1}^n var(x_k)$$
$$var(\hat{\theta}) = \frac{4}{n^2} \left( n \cdot \frac{\theta^2}{12} \right)$$

Simplifying the expression:
$$var(\hat{\theta}) = \frac{4n\theta^2}{12n^2} = \frac{\theta^2}{3n}$$

### Summary of Results
* **Bias:** $\beta(\hat{\theta}) = 0$
* **Variance:** $var(\hat{\theta}) = \frac{\theta^2}{3n}$

# problem 5
To find the bias of the new estimator $\bar{\theta}_1$, we use the definition of bias and the linearity of expectation.

### 1. Definition of Bias
The bias of an estimator $\bar{\theta}$ for a parameter $\theta$ is defined as:
$$\text{Bias}(\bar{\theta}) = E[\bar{\theta}] - \theta$$

Given that the bias of $\bar{\theta}$ is $\beta$, we can write:
$$E[\bar{\theta}] - \theta = \beta \implies E[\bar{\theta}] = \theta + \beta$$

---

### 2. Calculate the Expected Value of $\bar{\theta}_1$
The new estimator is defined as $\bar{\theta}_1 = 2\bar{\theta}$. Using the linearity property of expectation ($E[aX] = aE[X]$), we find:
$$E[\bar{\theta}_1] = E[2\bar{\theta}] = 2E[\bar{\theta}]$$

Substituting the expression for $E[\bar{\theta}]$ from Step 1:
$$E[\bar{\theta}_1] = 2(\theta + \beta) = 2\theta + 2\beta$$

---

### 3. Calculate the Bias of $\bar{\theta}_1$
Now, we apply the definition of bias to the new estimator $\bar{\theta}_1$:
$$\text{Bias}(\bar{\theta}_1) = E[\bar{\theta}_1] - \theta$$

Substitute the result from Step 2:
$$\text{Bias}(\bar{\theta}_1) = (2\theta + 2\beta) - \theta$$
$$\text{Bias}(\bar{\theta}_1) = \theta + 2\beta$$

### Summary
The bias of the new estimator $\bar{\theta}_1$ is **$\theta + 2\beta$**.
