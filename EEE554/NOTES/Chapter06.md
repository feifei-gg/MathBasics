# Chapter 6 — Two Random Variables

## 6-1 Bivariate Distributions

### 6-1.1 Joint Distribution and Density
The joint (bivariate) distribution $F_{XY}(x,y)$ of two random variables $X$ and $Y$ is defined as the probability of the event $\{X \le x, Y \le y\}$:
$$
F(x,y) = P\{X \le x, Y \le y\}
$$

**Properties of $F(x,y)$:**
1. Boundary conditions: $F(-\infty, y) = 0$, $F(x, -\infty) = 0$, and $F(\infty, \infty) = 1$.
2. Strip probabilities: The probability in a vertical or horizontal half-strip is evaluated as:
   $$
   P\{x_1 < X \le x_2, Y \le y\} = F(x_2, y) - F(x_1, y)
   $$
   $$
   P\{X \le x, y_1 < Y \le y_2\} = F(x, y_2) - F(x, y_1)
   $$
3. Rectangle probability (Inclusion-Exclusion): 
   $$
   P\{x_1 < X \le x_2, y_1 < Y \le y_2\} = F(x_2, y_2) - F(x_1, y_2) - F(x_2, y_1) + F(x_1, y_1) \ge 0
   $$

**Joint Density:**
The joint density function is defined via partial differentiation:
$$
f(x,y) = \frac{\partial^2 F(x,y)}{\partial x \partial y}
$$
The probability mass in any region $D$ is the integral of the joint density over that region:
$$
P\{(X,Y) \in D\} = \iint_D f(x,y) \, dx \, dy
$$

### 6-1.2 Marginal Statistics
The marginal distributions and densities are obtained by integrating out the other variable:
$$
F_X(x) = F(x, \infty), \quad F_Y(y) = F(\infty, y)
$$
$$
f_X(x) = \int_{-\infty}^{\infty} f(x,y) \, dy, \quad f_Y(y) = \int_{-\infty}^{\infty} f(x,y) \, dx
$$

> **Example 6-1 (Probability Mass in a Circle)**
> Suppose $f(x,y) = \frac{1}{2\pi\sigma^2} e^{-(x^2+y^2)/2\sigma^2}$. Find the probability mass $m$ in the circle $x^2 + y^2 \le a^2$.
> **Solution:** Convert to polar coordinates ($x = r \cos\theta, y = r \sin\theta$). 
> $$
> m = \frac{1}{2\pi\sigma^2} \int_0^a \int_{-\pi}^{\pi} e^{-r^2/2\sigma^2} r \, dr \, d\theta = 1 - e^{-a^2/2\sigma^2}
> $$

### 6-1.3 Independence
Random variables $X$ and $Y$ are independent if $P\{X \in A, Y \in B\} = P\{X \in A\}P\{Y \in B\}$. Equivalently:
$$
F(x,y) = F_X(x)F_Y(y) \quad \text{and} \quad f(x,y) = f_X(x)f_Y(y)
$$

> **Example 6-2: Buffon's Needle**
> A fine needle of length $2a$ is dropped on a board with parallel lines distance $2b$ apart ($b > a$). Determine the probability $p$ that the needle intersects a line.
> 
> 
> **Solution:** Let $X$ be the distance from the center to the nearest line, $X \sim U(0, b)$. Let $\Theta$ be the angle with the perpendicular, $\Theta \sim U(0, \pi/2)$. 
> Assuming independence: $f(x,\theta) = \frac{1}{b}\frac{2}{\pi} = \frac{2}{\pi b}$.
> Intersection occurs if $X < a \cos\Theta$. Integrating the joint density over this region:
> $$
> p = P\{X < a \cos\Theta\} = \frac{2}{\pi b} \int_0^{\pi/2} a \cos\theta \, d\theta = \frac{2a}{\pi b}
> $$

**Theorems on Independence:**
* **Theorem 6-1:** If $X$ and $Y$ are independent, then the random variables $Z = g(X)$ and $W = h(Y)$ are also independent.
* **Theorem 6-2:** If experiments $S_1$ and $S_2$ are independent, random variables defined on them are independent.

### 6-1.4 Joint Normality & Circular Symmetry
Two variables are **jointly normal** if their density is the exponential of a negative quadratic:
$$
f(x,y) = \frac{1}{2\pi\sigma_X\sigma_Y\sqrt{1-\rho^2}} \exp\left\{ -\frac{1}{2(1-\rho^2)} \left[ \frac{(x-\eta_X)^2}{\sigma_X^2} - 2\rho\frac{(x-\eta_X)(y-\eta_Y)}{\sigma_X\sigma_Y} + \frac{(y-\eta_Y)^2}{\sigma_Y^2} \right] \right\}
$$


*Note: If two variables are jointly normal, their marginals are normal. However, the converse is not true.*

> **Example 6-3: Marginally Normal but NOT Jointly Normal**
> Consider the function:
> $$
> f(x,y) = f_X(x)f_Y(y)[1 + \rho \{2F_X(x)-1\}\{2F_Y(y)-1\}] \quad (|\rho| < 1)
> $$
> If $f_X(x)$ and $f_Y(y)$ are standard normal densities, integrating this $f(x,y)$ over $y$ yields exactly $f_X(x)$ (since the integral of the odd term over the entire real line vanishes). Thus, the marginals are perfectly normal, but the joint PDF clearly isn't jointly normal.

* **Theorem 6-3 (Circular Symmetry):** If $X$ and $Y$ are independent and have a circularly symmetrical joint density ($f(x,y) = g(\sqrt{x^2+y^2})$), then they *must* be normal with zero mean and equal variance.

### 6-1.5 Discrete Type and Line Masses
For discrete variables, $P\{X=x_i, Y=y_k\} = p_{ik}$. Marginals are $p_i = \sum_k p_{ik}$ and $q_k = \sum_i p_{ik}$.

> **Example 6-4 & 6-5: Dice Tosses**
> * **(a)** Toss a fair die. $X$ is the dots shown, $Y = 2X$. The masses exist only on 6 points $(i, 2i)$, each with probability $1/6$.
> * **(b/c)** Toss a die twice. If $X=|i-k|$ and $Y=i+k$, the masses are distributed over 21 valid coordinate points out of the total $6 \times 11 = 66$ plane points. 
> * **(Example 6-5)** If $X$ is the first toss and $Y$ is the second, they are independent, so $p_{ik} = p_i p_k$.

---

## 6-4 Joint Moments

### 6-4.1 Definitions and Linearity
**Theorem 6-4:** The expected value of a function $g(X,Y)$ is evaluated directly using the joint density:
$$
E\{g(X,Y)\} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} g(x,y)f(x,y) \, dx \, dy
$$
Due to linearity, $E\{X+Y\} = E\{X\} + E\{Y\}$, but generally $E\{XY\} \ne E\{X\}E\{Y\}$.

### 6-4.2 Covariance, Correlation, and Orthogonality
* **Covariance:** $C_{XY} = E\{(X-\eta_X)(Y-\eta_Y)\} = E\{XY\} - E\{X\}E\{Y\}$.
* **Correlation Coefficient:** $\rho_{XY} = \frac{C_{XY}}{\sigma_X\sigma_Y}$, bounded by $|\rho_{XY}| \le 1$.
* **Uncorrelated:** If $C_{XY} = 0$ (implies $E\{XY\} = E\{X\}E\{Y\}$).
* **Orthogonal:** If $E\{XY\} = 0$ (denoted as $X \perp Y$).
* **Cosine Inequality:** Treating variables as vectors, $(E\{XY\})^2 \le E\{X^2\}E\{Y^2\}$.

> **Example 6-30: Correlation of Jointly Normal RVs**
> For jointly normal variables, evaluating the integral to find the covariance yields exactly $C_{XY} = \rho\sigma_X\sigma_Y$. Therefore, the parameter $\rho$ in the joint normal formula is exactly the correlation coefficient.

### 6-4.3 Theorem 6-5: Independence vs. Uncorrelatedness
If two random variables are independent, they are uncorrelated ($E\{XY\} = E\{X\}E\{Y\}$). **The converse is generally false**, except for jointly normal random variables.

> **Example 6-31: Uncorrelated but NOT Independent**
> Let $X \sim U(0,1)$ and $Y \sim U(0,1)$ be independent. Define $Z = X+Y$ and $W = X-Y$.
> 1. Check Correlation: $E\{ZW\} = E\{(X+Y)(X-Y)\} = E\{X^2 - Y^2\} = E\{X^2\} - E\{Y^2\} = 0$.
>    Since $E\{Z\} = 0.5 + 0.5 = 1$ and $E\{W\} = 0.5 - 0.5 = 0$, the covariance $C_{ZW} = E\{ZW\} - E\{Z\}E\{W\} = 0 - (1)(0) = 0$. Thus, $Z$ and $W$ are **uncorrelated**.
> 2. Check Independence: Using transformation limits, $f_{ZW}(z,w) = 1/2$ inside a diamond-shaped region and $0$ elsewhere. The marginals are $f_Z(z)$ (a triangle) and $f_W(w) = 1-|w|$. Since $f_{ZW}(z,w) \ne f_Z(z)f_W(w)$, they are **not independent**.

### 6-4.4 Variance of a Sum and Moments
$$
\sigma_{X+Y}^2 = \sigma_X^2 + \sigma_Y^2 + 2\rho_{XY}\sigma_X\sigma_Y
$$
If uncorrelated, the variance of the sum is the sum of the variances. 

> **Example 6-32: Linear Combination of Normal RVs**
> If $X$ and $Y$ are jointly normal with $\eta_X=10, \eta_Y=0, \sigma_X^2=4, \sigma_Y^2=1, \rho_{XY}=0.5$.
> Find the joint density of $Z = X+Y$ and $W = X-Y$.
> **Solution:** Linear combinations of normal RVs are jointly normal. 
> Means: $\eta_Z = 10+0=10$, $\eta_W = 10-0=10$. 
> Variances: 
> $\sigma_Z^2 = 4 + 1 + 2(0.5)(2)(1) = 7$.
> $\sigma_W^2 = 4 + 1 - 2(0.5)(2)(1) = 3$.
> To find correlation, use $E\{ZW\} = E\{X^2-Y^2\}$. We know $E\{X^2\} = \sigma_X^2 + \eta_X^2 = 4 + 100 = 104$ and $E\{Y^2\} = 1 + 0 = 1$. Thus, $E\{ZW\} = 104 - 1 = 103$. 
> Covariance $C_{ZW} = E\{ZW\} - \eta_Z\eta_W = 103 - 100 = 3$.
> $\rho_{ZW} = \frac{3}{\sqrt{7 \times 3}} = \sqrt{3/7}$. 
> Thus, $Z,W \sim N(10, 10, 7, 3, \sqrt{3/7})$.

---

## 6-6 Conditional Distributions

### 6-6.1 Conditional Density Definition
For a point condition $X=x$, the conditional density is defined via a limit and yields:
$$
f(y|x) = \frac{f(x,y)}{f_X(x)} \quad \text{and} \quad f(x|y) = \frac{f(x,y)}{f_Y(y)}
$$

> **Example 6-40: Triangle Distribution**
> Given $f(x,y) = k$ for $0 < x < y < 1$. Find $f(x|y)$ and $f(y|x)$.
> **Solution:** First, find $k$: $\int_0^1 \int_0^y k \,dx\,dy = \int_0^1 ky \, dy = k/2 = 1 \implies k=2$.
> Marginals: $f_X(x) = \int_x^1 2 \,dy = 2(1-x)$. $f_Y(y) = \int_0^y 2 \,dx = 2y$.
> Conditionals: 
> $$
> f(x|y) = \frac{2}{2y} = \frac{1}{y}, \quad 0 < x < y < 1
> $$
> $$
> f(y|x) = \frac{2}{2(1-x)} = \frac{1}{1-x}, \quad 0 < x < y < 1
> $$

> **Example 6-41: Conditional of Joint Normal**
> If $X$ and $Y$ are jointly normal, factoring $f_X(x)$ out of the joint PDF reveals that $f(y|x)$ is also a normal density. Specifically, it has:
> $$
> \text{Mean: } \eta_{y|x} = \eta_Y + \rho\sigma_Y\frac{x-\eta_X}{\sigma_X} \quad \text{Variance: } \sigma_{y|x}^2 = \sigma_Y^2(1-\rho^2)
> $$

### 6-6.2 Bayes' Theorem for Densities
Using the total probability expansion $f_Y(y) = \int f(y|x)f_X(x)dx$, we obtain Bayes' theorem:
$$
f(x|y) = \frac{f(y|x)f_X(x)}{\int_{-\infty}^{\infty} f(y|x)f_X(x) \, dx}
$$

> **Example 6-42: Phase in Noise (Bayes Application)**
> An unknown phase $\Theta \sim U(0, 2\pi)$ is transmitted. We observe $R = \Theta + N$, where $N \sim N(0, \sigma^2)$ is independent noise. Determine $f(\theta|r)$.
> **Solution:**
> 1. Prior: $f_\Theta(\theta) = 1/(2\pi)$. 
> 2. Likelihood given $\theta$: Since $R = \Theta+N$, $f(r|\theta) \sim N(\theta, \sigma^2)$.
> 3. Posterior via Bayes: 
> $$
> f(\theta|r) = \frac{e^{-(r-\theta)^2/2\sigma^2}}{\int_0^{2\pi} e^{-(r-\theta)^2/2\sigma^2} d\theta} \quad \text{for } 0 < \theta < 2\pi
> $$
> *Conclusion:* The flat prior $U(0, 2\pi)$ becomes a bell-shaped curve peaking exactly at the observation $r$.

### 6-6.3 Discrete Conditoning (Markov Matrices & Sums)
For discrete variables, the conditional probability $\pi_{ik} = P\{Y=y_k | X=x_i\} = \frac{p_{ik}}{p_i}$ forms a **Markov Matrix** (nonnegative elements, rows sum to 1).

> **Example 6-43: Sum of Binomials/Poissons**
> * **Binomials:** If $X \sim \text{Bin}(m,p)$ and $Y \sim \text{Bin}(n,p)$ are independent, then $X+Y \sim \text{Bin}(m+n, p)$. The conditional distribution $P\{X=x | X+Y = x+y\}$ is strictly **hypergeometric**: $\frac{\binom{m}{x}\binom{n}{y}}{\binom{m+n}{x+y}}$.
> * **Poissons:** If $X \sim P(\lambda)$ and $Y \sim P(\mu)$ are independent, the sum is $P(\lambda+\mu)$. The conditional distribution $P\{X=k | X+Y=n\}$ is strictly **binomial**: $\binom{n}{k}(\frac{\lambda}{\lambda+\mu})^k (\frac{\mu}{\lambda+\mu})^{n-k}$.

### 6-6.4 System Reliability and Failure Rates
Let $X$ be the time to failure. Reliability $R(t) = 1 - F(t)$.
The **conditional failure rate (hazard rate)** $\beta(t)$ is the probability density of failure exactly at $t$, given survival up to $t$:
$$
\beta(t) = f(t|X>t) = \frac{f(t)}{1-F(t)}
$$
This allows us to write $f(x) = \beta(x) \exp\{-\int_0^x \beta(t) dt\}$.

> **Example 6-44, 6-45, 6-46: Memoryless Systems**
> A system is **memoryless** if it is "as good as new" regardless of how long it ran: $f(x | X>t) = f(x-t)$. 
> Using $\beta(t)$, this implies $\beta(t)$ is a constant $c$. Integrating yields $f(x) = c e^{-cx}$. Thus, a system is memoryless **if and only if** its failure time is exponentially distributed.

> **Example 6-47: Weibull Density**
> A common hazard rate is $\beta(t) = c t^{b-1}$. Using the integral formula, this generates the Weibull density: $f(x) = c x^{b-1} \exp\{-cx^b/b\}$.

**Interconnection of Systems:**
* **Parallel** (Fails if BOTH fail): $Z = \max(X,Y)$.
* **Series** (Fails if EITHER fail): $W = \min(X,Y)$.
* **Standby** (Second starts when first fails): $S = X+Y$.

---

## 6-7 Conditional Expected Values

### 6-7.1 Conditional Mean and Regression
$$
E\{g(Y)|M\} = \int_{-\infty}^{\infty} g(y)f(y|M) \, dy
$$
The function $\varphi(x) = E\{Y|X=x\}$ is defined as the **regression line**.

> **Example 6-48: Finding Conditional Expected Values**
> Given $f(x,y) = 1$ for $0 < |y| < x < 1$. Find $E\{X|Y=y\}$ and $E\{Y|X=x\}$.
> **Solution:** Find marginals: $f_X(x) = \int_{-x}^x 1 \,dy = 2x$, $f_Y(y) = \int_{|y|}^1 1 \,dx = 1-|y|$. 
> Form conditionals: $f(x|y) = 1/(1-|y|)$ and $f(y|x) = 1/2x$.
> Integrate to find expected values:
> $$
> E\{X|y\} = \int_{|y|}^1 \frac{x}{1-|y|} \, dx = \frac{1+|y|}{2}
> $$
> $$
> E\{Y|x\} = \int_{-x}^x \frac{y}{2x} \, dy = 0
> $$

> **Example 6-49: Galton's Law (Regression toward the mean)**
> If $X$ (parent height) and $Y$ (child height) are identically distributed and positively correlated ($\rho > 0$), Galton noted that $E\{Y|X=x\}$ lies closer to the mean $\eta$ than the parent's value $x$. 
> 
> 
> For jointly normal RVs, $E\{Y|x\} = \eta + \rho(x-\eta)$. Since $\rho < 1$, the slope pulls extreme values of $X$ back toward the population mean $\eta$.

### 6-7.2 Nested Expectations (Law of Total Expectation)
Since $E\{Y|X\}$ is a function of the random variable $X$, it is itself a random variable. The mean of this conditional expectation equals the unconditional mean:
$$
E\{E\{Y|X\}\} = E\{Y\}
$$
More generally, knowns given $X$ can be factored out:
$$
E\{g_1(X)g_2(Y) | X\} = g_1(X)E\{g_2(Y) | X\}
$$

> **Example 6-50: Finding Joint Normal Moments using Nested Expectations**
> Let $X,Y \sim N(0,0,\sigma_1^2, \sigma_2^2, \rho)$. Prove that $E\{X^2Y^2\} = E\{X^2\}E\{Y^2\} + 2(E\{XY\})^2$.
> **Solution:**
> 1. Use nested expectations: $E\{XY\} = E\{X E\{Y|X\}\}$.
>    Since $E\{Y|X\} = \rho\sigma_2 X / \sigma_1$, we get $E\{XY\} = \rho(\sigma_2/\sigma_1)E\{X^2\} = \rho\sigma_1\sigma_2$.
> 2. For the 4th-order moment: $E\{X^2Y^2\} = E\{X^2 E\{Y^2|X\}\}$.
> 3. Recall $E\{Z^2\} = \text{Var}(Z) + (E\{Z\})^2$. Thus:
>    $E\{Y^2|X\} = \sigma_{y|x}^2 + (E\{Y|X\})^2 = \sigma_2^2(1-\rho^2) + \left(\frac{\rho\sigma_2 X}{\sigma_1}\right)^2$.
> 4. Substitute this back into the outer expectation:
>    $$
>    E\{X^2Y^2\} = E\left\{X^2 \left[ \sigma_2^2(1-\rho^2) + \rho^2\frac{\sigma_2^2}{\sigma_1^2} X^2 \right] \right\}
>    $$
> 5. Distribute $X^2$. Using the normal property $E\{X^4\} = 3\sigma_1^4$, this simplifies to:
>    $$
>    E\{X^2Y^2\} = \sigma_2^2(1-\rho^2)\sigma_1^2 + \rho^2\frac{\sigma_2^2}{\sigma_1^2}(3\sigma_1^4) = \sigma_1^2\sigma_2^2 + 2\rho^2\sigma_1^2\sigma_2^2
>    $$
>    Which is exactly $E\{X^2\}E\{Y^2\} + 2(E\{XY\})^2$.