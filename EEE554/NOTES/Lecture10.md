# EEE 554 — Lecture #10

## Linear Algebra on $\mathbb{C}^n$ (Review)

### Notation

* **$m \times n$ matrix:** $A = [a_{ij}]$, where $a_{ij} \in \mathbb{C}$.
* **$n$-vector:** $X = \begin{bmatrix} x_1 \\ \vdots \\ x_n \end{bmatrix}$, where $x_i \in \mathbb{C}$.
* **Hermitian Transpose:** $A^\dagger$ (or $A^H$) denotes the complex conjugate transpose of $A$. If $A = [a_{ij}]$, then $A^\dagger = [a_{ji}^*]$, where $a_{ji}^*$ is the complex conjugate of $a_{ji}$.
* **Norm of $X$:** $||X|| = \sqrt{X^\dagger X} \ge 0$. It is zero if and only if $X$ is the zero vector.

---

## Positive Definite Matrices

An $n \times n$ matrix $S$ is **positive definite** if:
$$
X^\dagger S X > 0
$$
for every non-zero vector $X$.

**Note:**
* $S$ is **non-negative definite** (or positive semi-definite) if $X^\dagger S X \ge 0$ for every vector $X$.
* If $A$ is an $m \times n$ matrix and $S = A^\dagger A$, then $S$ is non-negative definite because:
    $$
    X^\dagger S X = X^\dagger A^\dagger A X = (AX)^\dagger (AX) = ||AX||^2 \ge 0
    $$

---

## Eigenvalues and Eigenvectors

If $S$ is an $n \times n$ matrix and $E$ is an $n$-vector such that:
$$
S E = \lambda E
$$
for some scalar $\lambda$, then $E$ is an **eigenvector** of $S$ and $\lambda$ is its associated **eigenvalue**.

**Theorem:** If $S$ is positive definite (or non-negative definite), every eigenvalue of $S$ is positive (or non-negative).

*Proof:*
Assume $SE = \lambda E$. Left-multiplying by $E^\dagger$ gives:
$$
E^\dagger S E = E^\dagger (\lambda E) = \lambda (E^\dagger E) = \lambda ||E||^2
$$
Solving for $\lambda$, we get:
$$
\lambda = \frac{E^\dagger S E}{||E||^2} > 0
$$
(The inequality holds because $S$ is positive definite. A similar argument holds for non-negative definite matrices where $\lambda \ge 0$.)

---

### Remarks about Eigenvalues and Eigenvectors

If $\lambda_1, \dots, \lambda_n$ are the eigenvalues of an $n \times n$ matrix $S$:

**(a)** Determinant and Trace:
$$
\det(S) = \lambda_1 \lambda_2 \cdots \lambda_n
$$
$$
\text{tr}(S) = \lambda_1 + \lambda_2 + \cdots + \lambda_n
$$

**(b)** Orthogonality:
If $E_1$ and $E_2$ are eigenvectors of a Hermitian matrix $S$ corresponding to distinct eigenvalues, then $E_1^\dagger E_2 = 0$ (i.e., $E_1$ and $E_2$ are orthogonal).

**(c)** Invertibility:
A positive definite matrix has a positive determinant (since all $\lambda_i > 0$) and is thus invertible.

**(d)** Spectral Decomposition:
If $S$ is a Hermitian matrix with eigenvalues $\lambda_1, \dots, \lambda_n$ and corresponding **orthonormal** eigenvectors $E_1, \dots, E_n$, then $S$ can be factored as:
$$
S = \lambda_1 E_1 E_1^\dagger + \lambda_2 E_2 E_2^\dagger + \dots + \lambda_n E_n E_n^\dagger
$$

**(e)** Rank:
If $S$ has $l$ non-zero eigenvalues, then $l$ is the **rank** of $S$.

---

### Example

Let $S = \begin{bmatrix} 3 & 1 \\ 1 & 3 \end{bmatrix}$.

**1. Check Positive Definiteness:**
$$
\begin{aligned}
X^\dagger S X &= \begin{bmatrix} x_1^* & x_2^* \end{bmatrix} \begin{bmatrix} 3 & 1 \\ 1 & 3 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} \\
&= \begin{bmatrix} x_1^* & x_2^* \end{bmatrix} \begin{bmatrix} 3x_1 + x_2 \\ x_1 + 3x_2 \end{bmatrix} \\
&= 3|x_1|^2 + x_1^* x_2 + x_2^* x_1 + 3|x_2|^2 \\
&= 3|x_1|^2 + 2\text{Re}(x_1^* x_2) + 3|x_2|^2 > 0 \quad \text{(for $X \ne 0$)}
\end{aligned}
$$

**2. Find Eigenvalues:**
The eigenvalues are the roots of the characteristic polynomial:
$$
\begin{aligned}
0 = \det(\lambda I - S) &= \det \begin{bmatrix} \lambda - 3 & -1 \\ -1 & \lambda - 3 \end{bmatrix} \\
&= (\lambda - 3)^2 - 1 \\
&= \lambda^2 - 6\lambda + 8 = (\lambda - 4)(\lambda - 2)
\end{aligned}
$$
So, $\lambda_1 = 4$ and $\lambda_2 = 2$.
*(Verification: $\text{tr}(S) = 4+2=6$, and $\det(S) = 4 \times 2 = 8$.)*

**3. Find Eigenvectors:**
For $\lambda_1 = 4$, $SE_1 = 4E_1$. Let $E_1 = \begin{bmatrix} a \\ b \end{bmatrix}$.
$$
3a + b = 4a \implies a = b
$$
Normalizing so that $||E_1|| = 1$ gives $E_1 = \frac{\sqrt{2}}{2} \begin{bmatrix} 1 \\ 1 \end{bmatrix}$.

For $\lambda_2 = 2$, by orthogonality ($E_1^\dagger E_2 = 0$), it is easily determined that:
$$
E_2 = \frac{\sqrt{2}}{2} \begin{bmatrix} 1 \\ -1 \end{bmatrix}
$$

**4. Spectral Decomposition:**
$$
\begin{aligned}
\lambda_1 E_1 E_1^\dagger + \lambda_2 E_2 E_2^\dagger &= 4 \left( \frac{1}{2} \begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix} \right) + 2 \left( \frac{1}{2} \begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} \right) \\
&= \begin{bmatrix} 2 & 2 \\ 2 & 2 \end{bmatrix} + \begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} \\
&= \begin{bmatrix} 3 & 1 \\ 1 & 3 \end{bmatrix} = S
\end{aligned}
$$

---

## Unitary Matrices

An $n \times n$ matrix $U$ is **unitary** if:
$$
U^\dagger U = I
$$
where $I$ is the $n \times n$ identity matrix. Note that this implies $U^\dagger = U^{-1}$, so $U U^\dagger = I$ as well.

**Orthonormal Columns:**
Writing $U$ in terms of its column vectors $u_1, \dots, u_n$:
$$
U = \begin{bmatrix} | & & | \\ u_1 & \dots & u_n \\ | & & | \end{bmatrix}
$$
Evaluating $U^\dagger U$ gives:
$$
U^\dagger U = \begin{bmatrix} - & u_1^\dagger & - \\ & \vdots & \\ - & u_n^\dagger & - \end{bmatrix} \begin{bmatrix} | & & | \\ u_1 & \dots & u_n \\ | & & | \end{bmatrix} = \begin{bmatrix} 1 & 0 & \dots & 0 \\ 0 & 1 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & \dots & 1 \end{bmatrix}
$$
This demonstrates that $u_i^\dagger u_j = 1$ if $i=j$, and $u_i^\dagger u_j = 0$ if $i \ne j$. That is, the columns (and rows) of $U$ are **orthonormal vectors**.

**Eigenvalues of Unitary Matrices:**
If $\lambda$ is an eigenvalue of $U$ with corresponding eigenvector $E$:
$$
UE = \lambda E
$$
Left-multiplying by $U^\dagger$:
$$
U^\dagger U E = U^\dagger (\lambda E)
$$
Since $U^\dagger U = I$:
$$
E = \lambda U^\dagger E \implies U^\dagger E = \frac{1}{\lambda} E
$$
This establishes that $E$ is also an eigenvector of $U^\dagger$, with eigenvalue $\frac{1}{\lambda}$.