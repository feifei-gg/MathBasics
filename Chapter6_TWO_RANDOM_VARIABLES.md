# Chapter 6 — Two Random Variables

## 6-1 Bivariate Distributions

### 6-1.1 Joint Distribution and Density
The joint (bivariate) distribution $F_{xy}(x,y)$ of two random variables $x$ and $y$ is defined as the probability of the event $\{x \le x, y \le y\}$:
$$
F(x,y) = P\{x \le x, y \le y\}
$$

**Properties of $F(x,y)$:**
1. Boundary conditions: $F(-\infty, y) = 0$, $F(x, -\infty) = 0$, and $F(\infty, \infty) = 1$.
2. Strip probabilities: The probability in a vertical or horizontal half-strip is evaluated as:
   $$
   P\{x_1 < x \le x_2, y \le y\} = F(x_2, y) - F(x_1, y)
   $$
   $$
   P\{x \le x, y_1 < y \le y_2\} = F(x, y_2) - F(x, y_1)
   $$
3. Rectangle probability (Inclusion-Exclusion): 
   $$
   P\{x_1 < x \le x_2, y_1 < y \le y_2\} = F(x_2, y_2) - F(x_1, y_2) - F(x_2, y_1) + F(x_1, y_1) \ge 0
   $$

**Joint Density:**
The joint density function is defined via partial differentiation:
$$
f(x,y) = \frac{\partial^2 F(x,y)}{\partial x \partial y}
$$
The probability mass in any region $D$ is the integral of the joint density over that region:
$$
P\{(x,y) \in D\} = \iint_D f(x,y) \, dx \, dy
$$

### 6-1.2 Marginal Statistics
The marginal distributions and densities are obtained by integrating out the other variable:
$$
F_x(x) = F(x, \infty), \quad F_y(y) = F(\infty, y)
$$
$$
f_x(x) = \int_{-\infty}^{\infty} f(x,y) \, dy, \quad f_y(y) = \int_{-\infty}^{\infty} f(x,y) \, dx
$$

> **Example 6-1 (Probability Mass in a Circle)**
> Suppose $f(x,y) = \frac{1}{2\pi\sigma^2} e^{-(x^2+y^2)/2\sigma^2}$. Find the probability mass $m$ in the circle $x^2 + y^2 \le a^2$.
> **Solution:** Convert to polar coordinates ($x = r \cos\theta, y = r \sin\theta$). 
> $$
> m = \frac{1}{2\pi\sigma^2} \int_0^a \int_{-\pi}^{\pi} e^{-r^2/2\sigma^2} r \, dr \, d\theta = 1 - e^{-a^2/2\sigma^2}
> $$

### 6-1.3 Independence
Random variables $x$ and $y$ are independent if $P\{x \in A, y \in B\} = P\{x \in A\}P\{y \in B\}$. Equivalently:
$$
F(x,y) = F_x(x)F_y(y) \quad \text{and} \quad f(x,y) = f_x(x)f_y(y)
$$

> **Example 6-2: Buffon's Needle**
> A fine needle of length $2a$ is dropped on a board with parallel lines distance $2b$ apart ($b > a$). Determine the probability $p$ that the needle intersects a line.
> 
> **Solution:** Let $x$ be the distance from the center to the nearest line, $x \sim U(0, b)$. Let $\theta$ be the angle, $\theta \sim U(0, \pi/2)$. 
> Assuming independence: $f(x,\theta) = \frac{1}{b}\frac{2}{\pi} = \frac{2}{\pi b}$.
> Intersection occurs if $x < a \cos\theta$. Integrating the joint density over this region:
> $$
> p = P\{x < a \cos\theta\} = \frac{2}{\pi b} \int_0^{\pi/2} a \cos\theta \, d\theta = \frac{2a}{\pi b}
> $$

**Theorems on Independence:**
* **Theorem 6-1:** If $x$ and $y$ are independent, then the random variables $z = g(x)$ and $w = h(y)$ are also independent.
* **Theorem 6-2:** If experiments $S_1$ and $S_2$ are independent, random variables defined on them are independent.

### 6-1.4 Joint Normality & Circular Symmetry
Two variables are **jointly normal** if their density is the exponential of a negative quadratic:
$$
f(x,y) = \frac{1}{2\pi\sigma_1\sigma_2\sqrt{1-r^2}} \exp\left\{ -\frac{1}{2(1-r^2)} \left[ \frac{(x-\eta_1)^2}{\sigma_1^2} - 2r\frac{(x-\eta_1)(y-\eta_2)}{\sigma_1\sigma_2} + \frac{(y-\eta_2)^2}{\sigma_2^2} \right] \right\}
$$

*Note: If two variables are jointly normal, their marginals are normal. However, the converse is not true.*

> **Example 6-3: Marginally Normal but NOT Jointly Normal**
> Consider the function:
> $$
> f(x,y) = f_x(x)f_y(y)[1 + \rho \{2F_x(x)-1\}\{2F_y(y)-1\}] \quad (|\rho| < 1)
> $$
> If $f_x(x)$ and $f_y(y)$ are standard normal densities, integrating this $f(x,y)$ over $y$ yields exactly $f_x(x)$ (since the integral of the odd term vanishes). Thus, the marginals are perfectly normal, but the joint PDF clearly isn't jointly normal.

* **Theorem 6-3 (Circular Symmetry):** If $x$ and $y$ are independent and have a circularly symmetrical joint density ($f(x,y) = g(\sqrt{x^2+y^2})$), then they *must* be normal with zero mean and equal variance.

### 6-1.5 Discrete Type and Line Masses
For discrete variables, $P\{x=x_i, y=y_k\} = p_{ik}$. Marginals are $p_i = \sum_k p_{ik}$ and $q_k = \sum_i p_{ik}$.

> **Example 6-4 & 6-5: Dice Tosses**
> * **(a)** Toss a fair die. $x$ is the dots shown, $y = 2x$. The masses exist only on 6 points $(i, 2i)$, each with probability $1/6$.
> * **(b/c)** Toss a die twice. If $x=|i-k|$ and $y=i+k$, the masses are distributed over 21 valid coordinate points out of the total $6 \times 11 = 66$ plane points. 
> * **(Example 6-5)** If $x$ is the first toss and $y$ is the second, they are independent, so $p_{ik} = p_i p_k$.

---

## 6-4 Joint Moments

### 6-4.1 Definitions and Linearity
**Theorem 6-4:** The expected value of a function $g(x,y)$ is evaluated directly using the joint density:
$$
E\{g(x,y)\} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} g(x,y)f(x,y) \, dx \, dy
$$
Due to linearity, $E\{x+y\} = E\{x\} + E\{y\}$, but generally $E\{xy\} \ne E\{x\}E\{y\}$.

### 6-4.2 Covariance, Correlation, and Orthogonality
* **Covariance:** $C_{xy} = E\{(x-\eta_x)(y-\eta_y)\} = E\{xy\} - E\{x\}E\{y\}$.
* **Correlation Coefficient:** $\rho_{xy} = \frac{C_{xy}}{\sigma_x\sigma_y}$, bounded by $|\rho_{xy}| \le 1$.
* **Uncorrelated:** If $C_{xy} = 0$ (implies $E\{xy\} = E\{x\}E\{y\}$).
* **Orthogonal:** If $E\{xy\} = 0$ (denoted as $x \perp y$).
* **Cosine Inequality:** Treating variables as vectors, $E^2\{xy\} \le E\{x^2\}E\{y^2\}$.

> **Example 6-30: Correlation of Jointly Normal RVs**
> For jointly normal variables, evaluating the integral $E\{xy\}$ directly using the joint normal PDF expansion yields exactly $r\sigma_1\sigma_2$. Therefore, the parameter $r$ in the joint normal formula is exactly the correlation coefficient $\rho_{xy}$.

### 6-4.3 Theorem 6-5: Independence vs. Uncorrelatedness
If two random variables are independent, they are uncorrelated ($E\{xy\} = E\{x\}E\{y\}$). **The converse is generally false**, except for jointly normal random variables.

> **Example 6-31: Uncorrelated but NOT Independent**
> Let $x \sim U(0,1)$ and $y \sim U(0,1)$ be independent. Define $z = x+y$ and $w = x-y$.
> 1. Check Correlation: $E\{zw\} = E\{(x+y)(x-y)\} = E\{x^2\} - E\{y^2\} = 0$. Since means are $0$, covariance $C_{zw} = 0$. Thus, $z$ and $w$ are **uncorrelated**.
> 2. Check Independence: Using transformation limits, $f_{zw}(z,w) = 1/2$ inside a diamond region and $0$ elsewhere. The marginals are $f_z(z)$ (a triangle) and $f_w(w) = 1-|w|$. Since $f_{zw}(z,w) \ne f_z(z)f_w(w)$, they are **not independent**.

### 6-4.4 Variance of a Sum and Moments
$$
\sigma_{x+y}^2 = \sigma_x^2 + \sigma_y^2 + 2\rho_{xy}\sigma_x\sigma_y
$$
If uncorrelated, the variance of the sum is the sum of the variances. 

> **Example 6-32: Linear Combination of Normal RVs**
> If $x$ and $y$ are jointly normal with $\eta_x=10, \eta_y=0, \sigma_x^2=4, \sigma_y^2=1, \rho_{xy}=0.5$.
> Find the joint density of $z = x+y$ and $w = x-y$.
> **Solution:** Linear combinations of normal RVs are jointly normal. 
> $\eta_z = 10+0=10$, $\eta_w = 10-0=10$. 
> $\sigma_z^2 = 4 + 1 + 2(0.5)(2)(1) = 7$. $\sigma_w^2 = 4 + 1 - 2(0.5)(2)(1) = 3$.
> $E\{zw\} = E\{x^2-y^2\} = (100+4) - 1 = 103$. 
> $\rho_{zw} = \frac{103 - (10)(10)}{\sqrt{7 \times 3}} = \sqrt{3/7}$. 
> Thus, $z,w \sim N(10, 10, 7, 3, \sqrt{3/7})$.

---

## 6-6 Conditional Distributions

### 6-6.1 Conditional Density Definition
For a point condition $x=x$, the conditional density is defined via a limit and yields:
$$
f(y|x) = \frac{f(x,y)}{f_x(x)} \quad \text{and} \quad f(x|y) = \frac{f(x,y)}{f_y(y)}
$$

> **Example 6-40: Triangle Distribution**
> Given $f(x,y) = k$ for $0 < x < y < 1$. Find $f(x|y)$ and $f(y|x)$.
> **Solution:** First, find $k$: $\int_0^1 \int_0^y k \,dx\,dy = k/2 = 1 \implies k=2$.
> Marginals: $f_x(x) = \int_x^1 2 \,dy = 2(1-x)$. $f_y(y) = \int_0^y 2 \,dx = 2y$.
> Conditionals: 
> $$
> f(x|y) = \frac{2}{2y} = \frac{1}{y}, \quad 0 < x < y < 1
> $$
> $$
> f(y|x) = \frac{2}{2(1-x)} = \frac{1}{1-x}, \quad 0 < x < y < 1
> $$

> **Example 6-41: Conditional of Joint Normal**
> If $x$ and $y$ are jointly normal, factoring $f_x(x)$ out of the joint PDF reveals that $f(y|x)$ is also a normal density. Specifically, it has:
> $$
> \text{Mean: } \eta_{y|x} = \eta_2 + r\sigma_2\frac{x-\eta_1}{\sigma_1} \quad \text{Variance: } \sigma_{y|x}^2 = \sigma_2^2(1-r^2)
> $$

### 6-6.2 Bayes' Theorem for Densities
Using the total probability expansion $f(y) = \int f(y|x)f(x)dx$, we obtain Bayes' theorem:
$$
f(x|y) = \frac{f(y|x)f(x)}{\int_{-\infty}^{\infty} f(y|x)f(x) \, dx}
$$

> **Example 6-42: Phase in Noise (Bayes Application)**
> An unknown phase $\theta \sim U(0, 2\pi)$ is transmitted. We observe $r = \theta + n$, where $n \sim N(0, \sigma^2)$ is independent noise. Determine $f(\theta|r)$.
> **Solution:**
> 1. Prior: $f(\theta) = 1/(2\pi)$. 
> 2. Likelihood given $\theta$: Since $r = \theta+n$, $f(r|\theta) \sim N(\theta, \sigma^2)$.
> 3. Posterior via Bayes: 
> $$
> f(\theta|r) = \frac{e^{-(r-\theta)^2/2\sigma^2}}{\int_0^{2\pi} e^{-(r-\theta)^2/2\sigma^2} d\theta} \quad \text{for } 0 < \theta < 2\pi
> $$
> *Conclusion:* The flat prior $U(0, 2\pi)$ becomes a bell-shaped curve peaking exactly at the observation $r$.

### 6-6.3 Discrete Conditoning (Markov Matrices & Sums)
For discrete variables, the conditional probability $\pi_{ik} = P\{y=y_k | x=x_i\} = \frac{p_{ik}}{p_i}$ forms a **Markov Matrix** (nonnegative elements, rows sum to 1).

> **Example 6-43: Sum of Binomials/Poissons**
> * **Binomials:** If $x \sim \text{Bin}(m,p)$ and $y \sim \text{Bin}(n,p)$ are independent, then $x+y \sim \text{Bin}(m+n, p)$. The conditional distribution $P\{x=x | x+y = x+y\}$ is strictly **hypergeometric**: $\frac{\binom{m}{x}\binom{n}{y}}{\binom{m+n}{x+y}}$.
> * **Poissons:** If $x \sim P(\lambda)$ and $y \sim P(\mu)$ are independent, the sum is $P(\lambda+\mu)$. The conditional distribution $P\{x=k | x+y=n\}$ is strictly **binomial**: $\binom{n}{k}(\frac{\lambda}{\lambda+\mu})^k (\frac{\mu}{\lambda+\mu})^{n-k}$.

### 6-6.4 System Reliability and Failure Rates
Let $x$ be the time to failure. Reliability $R(t) = 1 - F(t)$.
The **conditional failure rate (hazard rate)** $\beta(t)$ is the probability density of failure exactly at $t$, given survival up to $t$:
$$
\beta(t) = f(t|x>t) = \frac{f(t)}{1-F(t)}
$$
This allows us to write $f(x) = \beta(x) \exp\{-\int_0^x \beta(t) dt\}$.

> **Example 6-44, 6-45, 6-46: Memoryless Systems**
> A system is **memoryless** if it is "as good as new" regardless of how long it ran: $f(x | x>t) = f(x-t)$. 
> Using $\beta(t)$, this implies $\beta(t)$ is a constant $c$. Integrating yields $f(x) = c e^{-cx}$. Thus, a system is memoryless **if and only if** its failure time is exponentially distributed.

> **Example 6-47: Weibull Density**
> A common hazard rate is $\beta(t) = c t^{b-1}$. Using the integral formula, this generates the Weibull density: $f(x) = c x^{b-1} \exp\{-cx^b/b\}$.

**Interconnection of Systems:**
* **Parallel** (Fails if BOTH fail): $z = \max(x,y)$.
* **Series** (Fails if EITHER fail): $w = \min(x,y)$.
* **Standby** (Second starts when first fails): $s = x+y$.

---

## 6-7 Conditional Expected Values

### 6-7.1 Conditional Mean and Regression
$$
E\{g(y)|M\} = \int_{-\infty}^{\infty} g(y)f(y|M) \, dy
$$
The function $\varphi(x) = E\{y|x\}$ is defined as the **regression line**.

> **Example 6-48: Finding Conditional Expected Values**
> Given $f_{xy}(x,y) = 1$ for $0 < |y| < x < 1$. Find $E\{x|y\}$ and $E\{y|x\}$.
> **Solution:** Find marginals: $f_x(x) = 2x$, $f_y(y) = 1-|y|$. 
> Form conditionals: $f_{x|y}(x|y) = 1/(1-|y|)$ and $f_{y|x}(y|x) = 1/2x$.
> Integrate to find expected values:
> $$
> E\{x|y\} = \int_{|y|}^1 \frac{x}{1-|y|} \, dx = \frac{1+|y|}{2}
> $$
> $$
> E\{y|x\} = \int_{-x}^x \frac{y}{2x} \, dy = 0
> $$

> **Example 6-49: Galton's Law (Regression toward the mean)**
> If $x$ (parent height) and $y$ (child height) are identically distributed and positively correlated ($r > 0$), Galton noted that $E\{y|x\}$ lies closer to the mean $\eta$ than the parent's value $x$. 
> 
> For jointly normal RVs, $E\{y|x\} = \eta + r(x-\eta)$. Since $r < 1$, the slope pulls extreme values of $x$ back toward the population mean $\eta$.

### 6-7.2 Nested Expectations (Law of Total Expectation)
Since $E\{y|x\}$ is a function of the random variable $x$, it is itself a random variable. The mean of this conditional expectation equals the unconditional mean:
$$
E\{E\{y|x\}\} = E\{y\}
$$
More generally, knowns given $x$ can be factored out:
$$
E\{g_1(x)g_2(y) | x\} = g_1(x)E\{g_2(y) | x\}
$$

> **Example 6-50: Finding Joint Normal Moments using Nested Expectations**
> Let $x,y \sim N(0,0,\sigma_1^2, \sigma_2^2, r)$. Prove that $E\{x^2y^2\} = E\{x^2\}E\{y^2\} + 2E^2\{xy\}$.
> **Solution:**
> 1. Use nested expectations: $E\{xy\} = E\{x E\{y|x\}\}$.
>    Since $E\{y|x\} = r\sigma_2 x / \sigma_1$, we get $E\{xy\} = r(\sigma_2/\sigma_1)E\{x^2\} = r\sigma_1\sigma_2$.
> 2. For the 4th-order moment: $E\{x^2y^2\} = E\{x^2 E\{y^2|x\}\}$.
> 3. Recall $E\{Z^2\} = \text{Var}(Z) + (E\{Z\})^2$. Thus:
>    $E\{y^2|x\} = \sigma_{y|x}^2 + (E\{y|x\})^2 = \sigma_2^2(1-r^2) + \left(\frac{r\sigma_2 x}{\sigma_1}\right)^2$.
> 4. Substitute this back into the outer expectation:
>    $$
>    E\{x^2y^2\} = E\left\{x^2 \left[ \sigma_2^2(1-r^2) + r^2\sigma_2^2 \frac{x^2}{\sigma_1^2} \right] \right\}
>    $$
> 5. Distribute $x^2$. Using the normal property $E\{x^4\} = 3\sigma_1^4$, this simplifies to:
>    $$
>    E\{x^2y^2\} = \sigma_1^2\sigma_2^2(1-r^2) + 3r^2\sigma_1^2\sigma_2^2 = \sigma_1^2\sigma_2^2 + 2r^2\sigma_1^2\sigma_2^2
>    $$
>    Which is exactly $E\{x^2\}E\{y^2\} + 2(E\{xy\})^2$.