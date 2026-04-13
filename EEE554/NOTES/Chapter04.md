# Chapter 4 — The Concept of a Random Variable

## 4-1 Introduction

### Definitions
* **Random Variable**: A random variable $x(\zeta)$ is a process of assigning a real number to every outcome $\zeta$ of an experiment.
  * Its domain $S$ is the set of all experimental outcomes, and its range is a set of numbers on the real axis.
  * To qualify as a random variable, it must satisfy two mathematical conditions:
    1. The set $\{x \le x\}$ must be an event for every real number $x$.
    2. The probabilities of the events $\{x = \infty\}$ and $\{x = -\infty\}$ must equal 0: $P\{x = \infty\} = 0$ and $P\{x = -\infty\} = 0$.
* **Complex Random Variable**: Defined as $z = x + jy$, where $x$ and $y$ are real random variables.

---

## 4-2 Distribution and Density Functions

### Definitions
* **Cumulative Distribution Function (CDF)**: The distribution function of the random variable $x$ is defined as $F_x(x) = P\{x \le x\}$, for every $x$ from $-\infty$ to $\infty$.
* **Probability Density Function (PDF)**: The derivative of the probability distribution function: $f_x(x) = \frac{dF_x(x)}{dx}$.



[Image of cumulative distribution function]


### Corollaries and Properties
**Properties of the Distribution Function $F(x)$**:
1. Limits: $F(+\infty) = 1$ and $F(-\infty) = 0$.
2. Non-decreasing: If $x_1 < x_2$, then $F(x_1) \le F(x_2)$.
3. Complement probability: $P\{x > x\} = 1 - F(x)$.
4. Right-continuous: $F(x^+) = F(x)$.
5. Interval probability: $P\{x_1 < x \le x_2\} = F(x_2) - F(x_1)$.
6. Point probability: $P\{x = x\} = F(x) - F(x^-)$.

**Properties of the Density Function $f(x)$**:
* Non-negativity: $f_x(x) \ge 0$ for all $x$.
* Unit area: $\int_{-\infty}^{\infty} f_x(x)dx = 1$.
* For continuous-type random variables, the probability in a small interval is approximated by: $P\{x \le \mathbf{x} \le x + \Delta x\} \approx f(x)\Delta x$.

### Percentiles
* **$u$ Percentile**: The smallest number $x_u$ such that $u = P\{x \le x_u\} = F(x_u)$. The **median** is defined as the 0.5 percentile.

---

## 4-3 Specific Random Variables

### Existence Theorem
* Given a non-negative function $f(x)$ whose integral is 1, or a right-continuous, monotonically increasing function $F(x)$ from 0 to 1, we can construct an experiment and a random variable $x$ with distribution $F(x)$ or density $f(x)$.

### Examples
**Common Continuous-Type Random Variables**:
1. **Normal (Gaussian) Distribution**: $x \sim N(\mu, \sigma^2)$. The density function is $f_x(x) = \frac{1}{\sqrt{2\pi\sigma^2}}e^{-(x-\mu)^2/2\sigma^2}$.


[Image of normal distribution probability density function]

2. **Exponential Distribution**: $f_x(x) = \lambda e^{-\lambda x}$ for $x \ge 0$, and 0 otherwise. It exhibits the memoryless property.


[Image of exponential distribution probability density function]

3. **Uniform Distribution**: $x \sim U(a,b)$. $f_x(x) = \frac{1}{b-a}$ in the interval $(a,b)$, and 0 otherwise.
4. Other notable continuous distributions include Chi-square, Rayleigh, and Beta distributions.

**Common Discrete-Type Random Variables**:
1. **Bernoulli Distribution**: Takes the values 1 (with probability of success $p$) and 0 (with probability of failure $q = 1-p$).
2. **Binomial Distribution**: Represents the number of successes in $n$ independent Bernoulli trials. $P\{y=k\} = \binom{n}{k}p^k q^{n-k}$.
3. **Poisson Distribution**: $P\{x=k\} = \frac{e^{-\lambda}\lambda^k}{k!}$, often used to model the number of occurrences of a rare event in a large number of trials.
4. **Geometric Distribution**: Denotes the number of trials needed to realize the first success. It also possesses the memoryless property.

---

## 4-4 Conditional Distributions

### Definitions
* **Conditional Distribution Function**: Assuming an event $M$ where $P(M) \neq 0$, the conditional distribution function of $x$ is defined as:
  $$F(x | M) = P\{x \le x | M\} = \frac{P\{x \le x, M\}}{P(M)}$$
 .
* **Conditional Density Function**: The derivative of the conditional distribution function: $f(x | M) = \frac{dF(x | M)}{dx}$. This function is non-negative and its total area equals 1.

### Properties
* Similar to standard distributions, $F(\infty|M) = 1$ and $F(-\infty|M) = 0$.
* Conditional interval probability: $P\{x_1 < x \le x_2 | M\} = F(x_2 | M) - F(x_1 | M)$.

### Examples of Conditional Densities
* **Conditioned on a one-sided interval $M = \{x \le a\}$**:
  * $F(x|x \le a) = \frac{F(x)}{F(a)}$ for $x < a$, and equals 1 for $x \ge a$.
  * The corresponding conditional density is $\frac{f(x)}{F(a)}$ for $x < a$, and 0 otherwise.
* **Conditioned on a bounded interval $M = \{b < x \le a\}$**:
  * The conditional density is $\frac{f(x)}{F(a)-F(b)}$ for $b \le x < a$, and 0 otherwise. This is known as a truncated distribution.

### Theorems: Total Probability & Bayes'
* **Continuous Total Probability Theorem**:
  If the events $A_1, \dots, A_n$ form a partition of the space $S$, the marginal density is:
  $$f(x) = \sum_{i} f(x|A_i)P(A_i)$$
 .
  Its continuous integral form is $\int P(A|x=\mathbf{x})f(x)dx = P(A)$.
* **Continuous Bayes' Theorem**:
  $$f(x|A) = \frac{P(A|x=\mathbf{x})f(x)}{P(A)} = \frac{P(A|x=\mathbf{x})f(x)}{\int P(A|x=\mathbf{x})f(x)dx}$$
 .
