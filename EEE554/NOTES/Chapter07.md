# Chapter 7 — Sequences of Random Variables

## 7-1 General Concepts

### Random Vectors, Joint Distribution, and Density
A random vector $X = [x_1, \dots, x_n]$ is a vector whose components $x_i$ are random variables.
* **Joint Distribution (CDF):** $F(X) = P\{x_1 \le x_1, \dots, x_n \le x_n\}$.
* **Joint Density (PDF):** $f(X) = \frac{\partial^n F(x_1, \dots, x_n)}{\partial x_1 \dots \partial x_n}$. The probability that $X$ is in a region $D$ is $P\{X \in D\} = \int_D f(X) dX$.
* **Marginals:** The joint density of a subset of variables is obtained by integrating out the remaining variables from the full joint density.
* **Transformations:** For a system of functions $y_i = g_i(X)$, the joint density of $Y = [y_1, \dots, y_n]$ is:

$$
f_y(y_1, \dots, y_n) = \frac{f_x(x_1, \dots, x_n)}{|J(x_1, \dots, x_n)|}
$$

where $J$ is the Jacobian determinant of the transformation.

**Example 7-1 (Sum of Variables):** Given $n$ independent random variables $x_i$ with densities $f_i(x_i)$, form $y_k = x_1 + \dots + x_k$ for $k=1,\dots,n$.
To find the joint density of $y_k$, we solve the system $x_1 = y_1, x_1+x_2 = y_2, \dots, x_1+\dots+x_n = y_n$. The unique solution is $x_k = y_k - y_{k-1}$. The Jacobian equals 1, yielding:

$$
f_y(y_1, \dots, y_n) = f_1(y_1)f_2(y_2-y_1) \cdots f_n(y_n-y_{n-1})
$$

### Independence and Repeated Trials
* **Independence:** Random variables are mutually independent if their joint distribution/density factors into the product of their marginals: $f(x_1, \dots, x_n) = f(x_1) \cdots f(x_n)$.
* **Repeated Trials:** Repeating an experiment $n$ times generates $n$ independent, identically distributed (i.i.d.) random variables.

**Example 7-2 (Order Statistics):** Let $x_i$ be $n$ i.i.d. variables. Ordering their values $x_i$ yields $y_1 \le y_2 \le \dots \le y_n$. The density of the $k$-th order statistic $y_k$ is:

$$
f_k(y) = \frac{n!}{(k-1)!(n-k)!} F_x^{k-1}(y) [1-F_x(y)]^{n-k} f_x(y)
$$

*Special Case:* If $x_i$ are exponential with parameter $\lambda$ ($f_x(x) = \lambda e^{-\lambda x} U(x)$), their minimum $y_1$ has the density $f_1(y) = n\lambda e^{-n\lambda y} U(y)$, which is also exponential with parameter $n\lambda$. 

**Example 7-3 (Failure Rate):** A system consists of $m$ components. Let $x_i$ be the time to failure of the $i$-th component, with common distribution $F(t)$. Let $n(t)$ be the number of components good at time $t$.
The expected number of good components is $\eta(t) = E\{n(t)\} = m[1-F(t)]$.
The relative expected failure rate is defined as:

$$
\beta(t) = -\frac{\eta^{\prime}(t)}{\eta(t)} = \frac{f(t)}{1-F(t)}
$$

**Example 7-4 (Measurement Errors):** An object of length $\eta$ is measured $n$ times, yielding $x_i = \eta + v_i$. The noise terms $v_i$ are independent with zero mean and variance $\sigma_i^2$.
We seek an unbiased linear estimate $\hat{\eta} = \sum_{i=1}^n \alpha_i x_i$ that minimizes variance $V = \sum_{i=1}^n \alpha_i^2 \sigma_i^2$, subject to $\sum \alpha_i = 1$. Using Lagrange multipliers, the optimal estimate is:

$$
\hat{\eta} = \frac{\sum_{i=1}^n x_i / \sigma_i^2}{\sum_{i=1}^n 1 / \sigma_i^2}
$$

### Mean, Covariance, and Correlation Matrices
* **Linearity:** The expected value operator is linear: $E\{\sum a_i g_i(X)\} = \sum a_i E\{g_i(X)\}$.
* **Covariance:** $C_{ij} = E\{(x_i - \eta_i)(x_j^* - \eta_j^*)\} = E\{x_i x_j^*\} - E\{x_i\}E\{x_j^*\}$.
* **Uncorrelated Variables:** If $C_{ij} = 0$ for $i \ne j$, variables are uncorrelated. For uncorrelated variables, the variance of the sum is the sum of the variances: $\sigma_x^2 = \sigma_1^2 + \dots + \sigma_n^2$.

**Example 7-5 (Sample Mean and Variance):** For uncorrelated RVs with identical mean $\eta$ and variance $\sigma^2$:
* Sample mean: $\overline{x} = \frac{1}{n} \sum_{i=1}^n x_i \implies E\{\overline{x}\} = \eta$, $\sigma_{\overline{x}}^2 = \frac{\sigma^2}{n}$.
* Sample variance: $\overline{v} = \frac{1}{n-1} \sum_{i=1}^n (x_i - \overline{x})^2$. It is an unbiased estimator: $E\{\overline{v}\} = \sigma^2$.

* **Correlation Matrix ($R_n$):** The matrix with elements $R_{ij} = E\{x_i x_j^*\}$. 
  * **Theorem 7-1:** $R_n$ is a nonnegative definite matrix ($A R_n A^\dagger \ge 0$).
  * Its determinant $\Delta_n \ge 0$, with $\Delta_n = 0$ if and only if the variables are linearly dependent.

---

## 7-2 Conditional Densities, Characteristic Functions, and Normality

### Conditional Densities and Expectations
* **Conditional Density:** $f(x_n, \dots, x_{k+1} | x_k, \dots, x_1) = \frac{f(x_1, \dots, x_n)}{f(x_1, \dots, x_k)}$.
* **Chain Rule:** $f(x_1, \dots, x_n) = f(x_n | x_{n-1}, \dots, x_1) \cdots f(x_2 | x_1) f(x_1)$.
* **Chapman-Kolmogoroff Equation:** $$
  f(x_1|x_3) = \int_{-\infty}^{\infty} f(x_1|x_2, x_3) f(x_2|x_3) dx_2
  $$

* **Law of Total Expectation:** $E\{ E\{x_1 | x_2, \dots, x_n\} \} = E\{x_1\}$.

**Example 7-6 (Transforming to Uniforms):** Given $n$ arbitrary random variables $x_i$, we construct $y_1 = F(x_1)$, $y_2 = F(x_2|x_1), \dots, y_n = F(x_n|x_{n-1},\dots,x_1)$.
The Jacobian determinant is triangular with diagonals $\frac{\partial y_k}{\partial x_k} = f(x_k|x_{k-1},\dots,x_1)$. Applying the transformation rule and chain rule yields:

$$
f(y_1, \dots, y_n) = \frac{f(x_1, \dots, x_n)}{f(x_1)f(x_2|x_1)\cdots f(x_n|x_{n-1},\dots,x_1)} = 1
$$

in the cube $0 \le y_i \le 1$, meaning the $y_i$ are independent uniform variables.

**Random Sums Example (Eq 7-46 to 7-49):** Let $s = \sum_{k=1}^n x_k$, where $n$ is a discrete random variable independent of the i.i.d sequence $x_k$. 
* $E\{s\} = E\{E\{s|n\}\} = E\{\eta n\} = \eta E\{n\}$.
* $E\{s^2\} = E\{E\{s^2|n\}\}$. Since $E\{s^2|n\} = \eta^2 n^2 + \sigma^2 n$, we get $E\{s^2\} = \eta^2 E\{n^2\} + \sigma^2 E\{n\}$.
* *Special Case:* If $n$ is a Poisson variable with parameter $\lambda t$ (emitted particles) and $x_k$ is particle energy (Maxwell distribution with mean $3kT/2$), total energy $s$ has mean $E\{s\} = \frac{3kT\lambda t}{2}$.

### Characteristic Functions
* **Definition:** $\Phi(\Omega) = E\{\exp(j \Omega X^t)\} = E\{\exp(j(\omega_1 x_1 + \dots + \omega_n x_n))\}$.
* **Sum of Independent RVs:** For $z = x_1 + \dots + x_n$, the PDF is the convolution of the individual PDFs: $f_z(z) = f_1(z) \ast \dots \ast f_n(z)$. Thus, the characteristic function factors:

  $$
  \Phi_z(\omega) = \Phi_1(\omega) \cdots \Phi_n(\omega)
  $$

**Example 7-8 (Bernoulli & Poisson):** (a) Let $x_i=1$ with probability $p$, and $0$ with probability $q$. The characteristic function is $\Phi_i(\omega) = pe^{j\omega} + q$. The sum $z = \sum x_i$ counts successes in $n$ trials. $\Phi_z(\omega) = (pe^{j\omega} + q)^n$, verifying the Binomial distribution.
(b) If $p_i \ll 1$ and $p_1 + \dots + p_n \rightarrow a$, then $pe^{j\omega} + q \simeq e^{p_i(e^{j\omega}-1)}$. The product $\Phi_z(\omega) \simeq e^{a(e^{j\omega}-1)}$, which is the characteristic function of the Poisson distribution.

### Joint Normality 
* **Definition:** Random variables $x_1, \dots, x_n$ are jointly normal iff any linear combination $w = a_1 x_1 + \dots + a_n x_n$ is a normal random variable.
* **Characteristic Function:** For a zero-mean normal vector with covariance matrix $C$:

  $$
  \Phi(\Omega) = \exp\left\{-\frac{1}{2} \Omega C \Omega^t\right\}
  $$

* **Joint Density:**

  $$
  f(X) = \frac{1}{\sqrt{(2\pi)^n \Delta}} \exp\left\{-\frac{1}{2} X C^{-1} X^t\right\}
  $$

  where $\Delta = \det(C)$.
* **Important Property:** If jointly normal random variables are mutually uncorrelated (i.e., their covariance matrix is diagonal), they are also mutually independent.

**Example 7-9 (4th Moment of Joint Normals):** For jointly normal RVs with zero mean, expanding the characteristic function exponentials and equating coefficients yields:

$$
E\{x_1 x_2 x_3 x_4\} = C_{12}C_{34} + C_{13}C_{24} + C_{14}C_{23}
$$

### Complex Normal Vectors & Goodman's Theorem
* For a complex random vector $Z = X + jY$, the density generally requires specifying $2n^2 + n$ parameters for the real and imaginary parts.
* **Goodman's Theorem:** If $C_{XX} = C_{YY}$ and $C_{XY} = -C_{YX}$, the complex vector is statistically determined solely by its complex covariance matrix $C_{ZZ} = 2(C_{XX} - jC_{XY})$. The joint density is simply:

$$
f_Z(Z) = \frac{1}{\pi^n |C_{ZZ}|} \exp\{-Z C_{ZZ}^{-1} Z^\dagger\}
$$

### Normal Quadratic Forms and Chi-Square Distribution 



[Image of chi-square distribution]


* **Theorem:** Given $n$ independent $N(0,1)$ random variables $z_i$, the sum of their squares $x = z_1^2 + \dots + z_n^2$ follows a $\chi^2(n)$ distribution.
* If $x \sim \chi^2(m)$ and $y \sim \chi^2(n)$ are independent, then their sum $z = x+y \sim \chi^2(m+n)$.

**Example 7-10 (Sample Variance of Normal Variables):** Given $n$ i.i.d. $N(\eta, \sigma)$ variables $x_i$, we form the sample variance $s^2 = \frac{1}{n-1}\sum_{i=1}^n (x_i - \overline{x})^2$.
Summing the identity $(x_i - \eta)^2 = (x_i - \overline{x})^2 + (\overline{x} - \eta)^2 + 2(x_i - \overline{x})(\overline{x} - \eta)$ yields:

$$
\sum_{i=1}^n \left(\frac{x_i - \eta}{\sigma}\right)^2 = \sum_{i=1}^n \left(\frac{x_i - \overline{x}}{\sigma}\right)^2 + n\left(\frac{\overline{x} - \eta}{\sigma}\right)^2
$$

The left side is $\chi^2(n)$. The last term is $\chi^2(1)$ because $\overline{x}$ is $N(\eta, \sigma/\sqrt{n})$. Because $\overline{x}$ and $s^2$ are independent, it follows that $\frac{(n-1)s^2}{\sigma^2}$ is a $\chi^2(n-1)$ random variable.