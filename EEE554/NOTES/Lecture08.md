# EEE 554 — Lecture #8

## Multiple RVs, cont’d

### Abbreviated notation

**(a)** Let $\tilde{\mathbf X}$ denote the $n$-tuple $(X_1,\ldots,X_n)$ of random variables, and also the **random vector**:

$$
\tilde{\mathbf X}=
\begin{bmatrix}
X_1 \\
\vdots \\
X_n
\end{bmatrix}
$$

**(b)** Let $\mathbf x$ denote the corresponding $n$-tuple (vector) of **deterministic variables**:

$$
\mathbf x=(x_1,\ldots,x_n)
$$

**(c)** Abbreviated multiple-integral notation:

$$
\int_A g(\mathbf x)\,d\mathbf x
=\int\cdots\int_{\,(x_1,\ldots,x_n)\in A} g(x_1,\ldots,x_n)\,dx_1\cdots dx_n
$$

With this notation:

- the **joint CDF** of $X_1,\ldots,X_n$ is $F_{\tilde{\mathbf X}}(\mathbf x)$
- the **joint PDF** is $f_{\tilde{\mathbf X}}(\mathbf x)$

---

## Probability of an event in $\tilde{\mathbf X}$

For an event $A\subseteq \mathbb R^n$,

$$
P(A)=P\{(x_1,\ldots,x_n)\in A\}
=\int_A f_{\tilde{\mathbf X}}(\mathbf x)\,d\mathbf x
$$

---

# Conditioning on an event

The conditional PDF of $\tilde{\mathbf X}$ given $\tilde{\mathbf X}\in A$ is

$$
f_{\tilde{\mathbf X}}(\mathbf x\mid A)=
\begin{cases}
\dfrac{f_{\tilde{\mathbf X}}(\mathbf x)}{P(A)}, & \mathbf x\in A,\\[6pt]
0, & \mathbf x\notin A.
\end{cases}
$$

### Example

$$
f_{\tilde{\mathbf X}}(x_1,x_2)=
\begin{cases}
6x_1^2x_2, & 0<x_1<1,\;0<x_2<1,\\
0, & \text{otherwise}.
\end{cases}
$$

Let

$$
A=\{x_2>x_1^2\}
$$

Then

$$
P(A)=\int_0^1\int_{x_1^2}^{1}6x_1^2x_2\,dx_2\,dx_1
=6\int_0^1 x_1^2\left[\frac{x_2^2}{2}\right]_{x_1^2}^{1}dx_1
=3\int_0^1(x_1^2-x_1^6)\,dx_1
=\frac{4}{5}
$$

Thus,

$$
f_{\tilde{\mathbf X}}(x_1,x_2\mid A)=
\begin{cases}
\dfrac{6x_1^2x_2}{4/5}=\dfrac{15}{2}x_1^2x_2, & (x_1,x_2)\in A,\\
0, & \text{otherwise}.
\end{cases}
$$

---

# Independent RVs

Random variables $X_1,\ldots,X_n$ are **statistically independent** if

$$
f_{\tilde{\mathbf X}}(x_1,\ldots,x_n)=f_{X_1}(x_1)\cdots f_{X_n}(x_n)
$$

---

## Example: independence via marginalization of the joint PDF

### (a)

$$
f_{\tilde{\mathbf X}}(x_1,x_2)=
\begin{cases}
\dfrac{3}{2}x_1^2x_2, & 0<x_1<1,\;0<x_2<2,\\
0, & \text{otherwise}.
\end{cases}
$$

Marginals:

$$
f_{X_1}(x_1)=\int_0^2 \frac{3}{2}x_1^2x_2\,dx_2
=\frac{3}{2}x_1^2\left[\frac{x_2^2}{2}\right]_0^2
=3x_1^2,\quad 0<x_1<1
$$

$$
f_{X_2}(x_2)=\int_0^1 \frac{3}{2}x_1^2x_2\,dx_1
=\frac{3}{2}x_2\left[\frac{x_1^3}{3}\right]_0^1
=\frac{1}{2}x_2,\quad 0<x_2<2
$$

Since $f_{X_1}(x_1)f_{X_2}(x_2)=f_{\tilde{\mathbf X}}(x_1,x_2)$, $X_1$ and $X_2$ are independent.

### (b)

$$
f_{\tilde{\mathbf X}}(x_1,x_2)=
\begin{cases}
15x_1^2x_2, & 0<x_1<1,\;0<x_2<2-2x_1,\;x_1+x_2\le 2,\\
0, & \text{otherwise}.
\end{cases}
$$

Marginals (as written in the notes):

$$
f_{X_1}(x_1)=\int_{0}^{\,2-2x_1}15x_1^2x_2\,dx_2
=\frac{15}{2}x_1^2(2-2x_1)^2
=30x_1^2(1-x_1)^2,\quad 0<x_1<1
$$

$$
f_{X_2}(x_2)=\int_{0}^{\,1-x_2/2}15x_1^2x_2\,dx_1
=5\left(1-\frac{x_2}{2}\right)^3x_2,\quad 0<x_2<2
$$

Because $f_{X_1}(x_1)f_{X_2}(x_2)\ne f_{\tilde{\mathbf X}}(x_1,x_2)$, $X_1$ and $X_2$ are **not** independent.

---

# Expectation rule

If $Z=g(X_1,\ldots,X_n)$, then

$$
\mathbb E[Z]=\int_{\mathbb R^n} g(\mathbf x)\, f_{\tilde{\mathbf X}}(\mathbf x)\,d\mathbf x
$$

In particular:

**(a)** Moments of $X_k$:

$$
\mathbb E[X_k^{\,a}]=\int_{\mathbb R^n} x_k^{\,a}\,f_{\tilde{\mathbf X}}(\mathbf x)\,d\mathbf x
$$

**(b)** Linearity for linear combinations:

$$
\begin{aligned}
\mathbb E[a_1X_1+\cdots+a_nX_n]
&=\int_{\mathbb R^n}(a_1x_1+\cdots+a_nx_n)\,f_{\tilde{\mathbf X}}(\mathbf x)\,d\mathbf x \\
&= a_1\mathbb E[X_1]+\cdots+a_n\mathbb E[X_n]
\end{aligned}
$$

**(c)** Vector form:

Define the expectation vector $\boldsymbol{\mu} = \mathbb E[\tilde{\mathbf X}]$:

$$
\mathbb E[\tilde{\mathbf X}]
=
\begin{bmatrix}
\mathbb E[X_1]\\
\vdots\\
\mathbb E[X_n]
\end{bmatrix}
=
\begin{bmatrix}
\mu_1\\
\vdots\\
\mu_n
\end{bmatrix}
$$

If $A$ is an $m\times n$ matrix with entries $a_{ij}$, then the $i$-th component of the vector $A\tilde{\mathbf X}$ is $\sum_{j=1}^n a_{ij}X_j$. Taking the expectation:

$$
\mathbb E[A\tilde{\mathbf X}]
=
\begin{bmatrix}
\mathbb E[\sum_{j=1}^n a_{1j}X_j]\\
\vdots\\
\mathbb E[\sum_{j=1}^n a_{mj}X_j]
\end{bmatrix}
=
\begin{bmatrix}
a_{11}\mu_1+\cdots+a_{1n}\mu_n\\
\vdots\\
a_{m1}\mu_1+\cdots+a_{mn}\mu_n
\end{bmatrix}
= A\mathbb E[\tilde{\mathbf X}]
$$

Similarly, for the transpose (row vector form):

$$
\mathbb E[\tilde{\mathbf X}^T A^T] = \mathbb E[\tilde{\mathbf X}^T]A^{T}
$$