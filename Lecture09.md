# EEE 554 — Lecture #9

## Beta Distribution

For $a>0$ and $b>0$, the beta function is defined by:
$$
B(a,b) = \int_{0}^{1} x^{a-1}(1-x)^{b-1} \, dx = \frac{\Gamma(a)\Gamma(b)}{\Gamma(a+b)}
$$

A random variable (RV) $X$ is beta distributed with parameters $a>0$ and $b>0$ if:
$$
f_X(x) = \frac{1}{B(a,b)} x^{a-1}(1-x)^{b-1}
$$
for $0 \le x \le 1$ and zero otherwise. This is expressed by the notation $X \sim \beta(a,b)$.

Note that, for $X \sim \beta(a,b)$:
$$
\int_{-\infty}^{\infty} f_X(x) \, dx = \frac{1}{B(a,b)} \int_{0}^{1} x^{a-1}(1-x)^{b-1} \, dx = \frac{B(a,b)}{B(a,b)} = 1
$$
and
$$
\begin{aligned}
E[X] &= \frac{1}{B(a,b)} \int_{0}^{1} x^{a}(1-x)^{b-1} \, dx = \frac{B(a+1,b)}{B(a,b)} \\
&= \frac{\Gamma(a+1)\Gamma(b)/\Gamma(a+b+1)}{\Gamma(a)\Gamma(b)/\Gamma(a+b)} = \frac{a}{a+b}
\end{aligned}
$$

---

## Covariance of Two RVs

The covariance of $X_1$ and $X_2$ is:
$$
\text{Cov}(X_1,X_2) = E[(X_1-\mu_1)(X_2-\mu_2)]
$$
where $\mu_1=E[X_1]$ and $\mu_2=E[X_2]$. 

Note that:
$$
\begin{aligned}
\text{Cov}(X_1,X_2) &= E[X_1 X_2 - X_1 \mu_2 - \mu_1 X_2 + \mu_1 \mu_2] \\
&= E[X_1 X_2] - \mu_1 \mu_2
\end{aligned}
$$

RVs $X_1$ and $X_2$ are uncorrelated if $\text{Cov}(X_1,X_2) = 0$; i.e., if $E[X_1 X_2] = \mu_1 \mu_2$.

**Theorem:** Independent RVs are uncorrelated.

*Proof:*
$$
\begin{aligned}
E[XY] &= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} xy \, f_{X,Y}(x,y) \, dx \, dy \quad &\text{(Expectation)} \\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} xy \, f_X(x)f_Y(y) \, dx \, dy \quad &\text{(Independence)} \\
&= \int_{-\infty}^{\infty} x f_X(x) \, dx \int_{-\infty}^{\infty} y f_Y(y) \, dy \\
&= E[X]E[Y]
\end{aligned}
$$

---

## PDF of the Sum of Independent RVs

Suppose $X_1$ and $X_2$ are independent and $Z = X_1 + X_2$. Then:
$$
\begin{aligned}
F_Z(z) &= P(\{Z \le z\}) = P(\{X_1 + X_2 \le z\}) \\
&= \int_{-\infty}^{\infty} \int_{-\infty}^{z-x_1} f_{X_1,X_2}(x_1,x_2) \, dx_2 \, dx_1
\end{aligned}
$$
Since $X_1$ and $X_2$ are independent:
$$
F_Z(z) = \int_{-\infty}^{\infty} f_{X_1}(x_1) \left[ \int_{-\infty}^{z-x_1} f_{X_2}(x_2) \, dx_2 \right] dx_1
$$

Using the fundamental theorem of calculus:
$$
\begin{aligned}
f_Z(z) &= \frac{d}{dz}F_Z(z) = \int_{-\infty}^{\infty} f_{X_1}(x_1) \left[ \frac{d}{dz} \int_{-\infty}^{z-x_1} f_{X_2}(x_2) \, dx_2 \right] dx_1 \\
&= \int_{-\infty}^{\infty} f_{X_1}(x_1) f_{X_2}(z-x_1) \, dx_1 \\
&= [f_{X_1} * f_{X_2}](z)
\end{aligned}
$$
i.e., the convolution of $f_{X_1}$ and $f_{X_2}$.

---

### Example

Let the joint PDF be:
$$
f_{X_1,X_2}(x_1,x_2) = 
\begin{cases} 
3/4 & 0 \le x_1 \le 1, \; 0 \le x_2 \le x_1^2 \\ 
3/4 & 1 \le x_1 \le 2, \; 0 \le x_2 \le 1 \\ 
0 & \text{otherwise} 
\end{cases}
$$

**1. Marginal of $X_2$:**
$$
f_{X_2}(x_2) = \int_{\sqrt{x_2}}^{2} \frac{3}{4} \, dx_1 = \frac{3}{4}(2-x_2^{1/2}), \quad 0 \le x_2 \le 1
$$

**Expected value of $X_2$:**
$$
E[X_2] = \frac{3}{4} \int_{0}^{1} x_2(2-x_2^{1/2}) \, dx_2 = \frac{3}{4} \int_{0}^{1} (2x_2 - x_2^{3/2}) \, dx_2 = \frac{9}{20}
$$

**2. Marginal of $X_1$:**
$$
f_{X_1}(x_1) = 
\begin{cases} 
\int_0^{x_1^2} \frac{3}{4} \, dx_2 = \frac{3}{4}x_1^2 & 0 \le x_1 < 1 \\
\int_0^1 \frac{3}{4} \, dx_2 = \frac{3}{4} & 1 \le x_1 \le 2 
\end{cases}
$$

**Expected value of $X_1$:**
$$
\begin{aligned}
E[X_1] &= \int_{0}^{1} x_1 \left(\frac{3}{4}x_1^2\right) dx_1 + \int_{1}^{2} x_1 \left(\frac{3}{4}\right) dx_1 \\
&= \int_0^1 \frac{3}{4}x_1^3 \, dx_1 + \int_1^2 \frac{3}{4}x_1 \, dx_1 \\
&= \frac{3}{16} + \frac{9}{8} = \frac{21}{16} 
\end{aligned}
$$

**3. Expected value of $X_1 X_2$:**
$$
\begin{aligned}
E[X_1 X_2] &= \int_{0}^{1} \int_{\sqrt{x_2}}^{2} \frac{3}{4} x_1 x_2 \, dx_1 \, dx_2 \\
&= \frac{3}{4} \int_0^1 x_2 \left( \int_{\sqrt{x_2}}^2 x_1 \, dx_1 \right) dx_2 \\
&= \frac{3}{8} \int_0^1 x_2 (4-x_2) \, dx_2 = \frac{5}{8}
\end{aligned}
$$

**4. Covariance:**
$$
\text{Cov}(X_1, X_2) = \frac{5}{8} - \left(\frac{9}{20}\right)\left(\frac{21}{16}\right) = \frac{5}{8} - \frac{189}{320} = \frac{11}{320}
$$
Not surprisingly, these RVs are positively correlated.

---

### Conditional Independence Example

Now, define $A = \{X_1 > 1\}$. Then $P(A) = 3/4$.

The conditional joint PDF is:
$$
f_{X_1, X_2}(x_1, x_2 | A) = 
\begin{cases}
\frac{f_{X_1, X_2}(x_1, x_2)}{P(A)} & (x_1, x_2) \in A \\
0 & \text{otherwise}
\end{cases}
=
\begin{cases}
1 & 1 < x_1 \le 2, \; 0 \le x_2 \le 1 \\
0 & \text{otherwise}
\end{cases}
$$

Thus, the conditionals are independent uniform distributions:
$f_{X_1}(x_1 | A) \sim U[1,2]$ and $f_{X_2}(x_2 | A) \sim U[0,1]$.

And we have:
$$
f_{X_1, X_2}(x_1, x_2 | A) = f_{X_1}(x_1 | A) f_{X_2}(x_2 | A)
$$
i.e., $X_1$ and $X_2$ are **conditionally independent** given $A$.

Consequently:
$$
\text{Cov}(X_1, X_2 | A) = 0
$$
which implies $E[X_1 X_2 | A] = E[X_1 | A] E[X_2 | A]$.