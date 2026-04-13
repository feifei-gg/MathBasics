# EEE 554 Lecture #11

## Covariance Matrix
The covariance matrix of a random vector is the $n \times n$ matrix where
$$\underline{C_{X}}=E[(\underline{X}-M_{\underline{X}})(\underline{X}-M_{\underline{X}})^{T}]$$
$$= \begin{bmatrix} var(X_{1}) & cov(X_{1},X_{2}) & \dots & cov(X_{1},X_{n}) \\ \vdots & \vdots & & \vdots \\ cov(X_{n},X_{1}) & cov(X_{n},X_{1}) & \dots & var(X_{n}) \end{bmatrix}$$
$$M_{X} = \begin{pmatrix} \mu_{X_{1}} \\ \vdots \\ \mu_{X_{n}} \end{pmatrix} = E \begin{bmatrix} X \\ \vdots \end{bmatrix}$$

Note that $cov(\underline{x}_{i},\underline{x}_{j})=cov(\underline{x}_{j},\underline{x}_{i})$ implies $C_{x}$ is symmetric. Because $C_{x}$ has the form $\underline{AA}^{T}$, it is non-negative definite.

**Example:** Suppose
$$C_{X} = \begin{bmatrix} 3 & -1 \\ -1 & 3 \end{bmatrix}, M_{X} = \begin{bmatrix} -1 \\ 1 \end{bmatrix}$$
which has eigenvalues $\lambda_{1}=4$ and $\lambda_{2}=2$ and corresponding eigenvectors:
$$E_{1}=\frac{\sqrt{2}}{2} \begin{bmatrix} 1 \\ -1 \end{bmatrix}, E_{2}=\frac{\sqrt{2}}{2} \begin{bmatrix} 1 \\ 1 \end{bmatrix}$$

Plotting these eigenvectors weighted by their corresponding eigenvalues, centered at $M_x$, gives the axes of the covariance Ellipse. Note the angle of the ellipse of these negatively correlated variables.

Note that $C_{\underline{X}}=E[\underline{XX}^{T}]-M_{X}M_{X}^{T}$

### Linear Transformations
If $A$ is a (deterministic) $m \times n$ matrix and $\underline{X}$ a random $n$-vector, then $\underline{Y}=\underline{AX}$ is a random $m$-vector. Recall that
$$E[Y]=E[AX]=AE[X]$$

The covariance matrix of $Y$ is
$$C_{Y}=E[(Y-M_{Y})(Y-M_{Y})^{T}]$$
$$=E[(\underline{AX}-AM_{\underline{X}})(A\underline{X}-AM_{\underline{X}})^{T}]$$
$$=AE[(\underline{X}-M\underline{X})(\underline{X}-M_{\underline{X}})^{T}]A^{T}$$
$$=AC_{x}A^{T}$$

### Multivariate Normal Distribution
A random vector is multivariate normal (Gaussian) if its PDF
$$f_{x}(x)=\frac{1}{(2\pi)^{n/2} \det(C)^{1/2}} \exp \left\{ -\frac{1}{2}(\underline{X}-m)^{T} C^{-1} (X-m) \right\}$$
for a positive definite matrix $C$ and a deterministic vector $M$.

**Notes:**
* Direct integration confirms $\int_{\mathbb{R}^{n}}f_{\underline{X}}(\underline{X})dX=1$.
* Application of the expectation rule shows $C$:
    * $E[\underline{X}] = \int_{\mathbb{R}^{n}} \underline{X} f_{X}(\underline{X}) dX = M$
    * $C_{x} = \int_{\mathbb{R}^{n}} (X-M)(X-M)^{T} f_{\underline{X}}(\underline{X}) dX = C$

With parameters $M$ and $C$, one denotes $\underline{X} \sim N[M,C]$.


### Uncorrelated Normal Random Vectors
A random vector $\underline{X}$ is uncorrelated if $C_x$ is a diagonal matrix. If $\underline{X}$ is Gaussian and uncorrelated, then
$$C_{X} = \begin{bmatrix} \sigma_{1}^{2} & & 0 \\ 0 & \ddots & \sigma_{n}^{2} \end{bmatrix}$$
and $\det C_{X} = \sigma_{1}^{2} \dots \sigma_{n}^{2}$.

So
$$f_{\underline{x}}(\underline{X}) = \frac{1}{\sqrt{(2\pi)^{n} \sigma_{1}^{2} \dots \sigma_{n}^{2}}} \exp \left\{ -\frac{1}{2} \sum_{k=1}^{n} (x_{k}-\mu_{k})^{2} \sigma_{k}^{-2} \right\}$$
$$= \frac{1}{\sqrt{2\pi\sigma_{1}^{2}}} \exp \left\{ \frac{-(X_{1}-\mu_{1})^{2}}{2\sigma_{1}^{2}} \right\} \dots \frac{1}{\sqrt{2\pi\sigma_{n}^{2}}} \exp \left\{ \frac{-(X_{n}-\mu_{n})^{2}}{2\sigma_{n}^{2}} \right\}$$
$$= f_{x_{1}}(x_{1}) \dots f_{x_{n}}(x_{n})$$
i.e., the components of an uncorrelated Gaussian random vector are independent Gaussian RVs.


### Decorrelation and Whitening
Suppose $u_{1}, \dots, u_{n}$ are orthonormal eigenvectors of $C_x$. Then the matrix
$$u^{T} = [u_{1} \dots u_{n}]$$
is unitary and the random vector $y=ux$ has covariance matrix
$$C_{y} = u C_{x} u^{T} = u [\lambda_{1} u_{1} \dots \lambda_{n} u_{n}]$$
$$= \begin{bmatrix} \lambda_{1} & & 0 \\ & \ddots & \\ 0 & & \lambda_{n} \end{bmatrix}$$
where $\lambda_{1}, \dots, \lambda_{n}$ are the (non-negative) eigenvalues corresponding to $u_{1}, \dots, u_{n}$ respectively.

Note that $Y$ is an uncorrelated random vector.
A random vector is white if $C_y$ is a diagonal matrix; under some circumstances one also requires $721, M$.
With the notation above, define
$$V^{T} = \left[ \frac{1}{\sqrt{\lambda_{1}}} u_{1} \dots \frac{1}{\sqrt{\lambda_{n}}} u_{n} \right]$$
If $\underline{y}=\underline{VX}$, then
$$C_{y} = V C_{x} V^{T} = \begin{bmatrix} 1 & & 0 \\ & \ddots & \\ 0 & & 1 \end{bmatrix} = I$$
so $Y$ is white.