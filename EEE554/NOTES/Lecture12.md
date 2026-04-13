# EEE 554 Lecture #12
## Complex Random Vectors

A complex $n$-vector $Z \in \mathbb{C}^n$ is composed of a real part $X$ and an imaginary part $Y$, both of which are real $n$-vectors:
$$Z = X + iY = \begin{bmatrix} x_1 + iy_1 \\ \vdots \\ x_n + iy_n \end{bmatrix}$$

The **Hermitian transpose** $Z^\dagger$ (also denoted as $Z^H$) is the transpose of the vector with its elements replaced by their complex conjugates:
$$Z^\dagger = [x_1 - iy_1, \dots, x_n - iy_n]$$



The **Euclidean norm** of a complex vector is defined using this Hermitian transpose:
$$||Z|| = (Z^\dagger Z)^{1/2} = \sqrt{\sum_{k=1}^n (x_k^2 + y_k^2)} \ge 0$$

---

### Mean and Expectations

The **mean** of a complex random vector is the sum of the expectations of its real and imaginary components:
$$M_Z = E[Z] = E[X] + iE[Y]$$

Expectation remains a **linear operator** for complex vectors:
* $E[AZ + B] = AE[Z] + B$ for deterministic matrices $A$ and vectors $B$
* $E[Z_1 + Z_2] = E[Z_1] + E[Z_2]$

---

### Complex Covariance Matrix

The **covariance matrix** of a complex random vector $Z$ is the $n \times n$ matrix defined as:
$$C_Z = E[(Z - M_Z)(Z - M_Z)^\dagger]$$

Expanding this into real and imaginary covariance and cross-covariance matrices yields:
$$C_Z = C_X + C_Y + i(C_{YX} - C_{XY})$$

Note that $C_Z$ is **Hermitian** ($C_Z = C_Z^\dagger$) and **positive semi-definite**.

---

### Proper Complex Random Vectors

A complex random vector is called **Proper** if the following two conditions are met:
1.  The real and imaginary parts have equal covariance: $C_X = C_Y$
2.  The cross-covariance matrix is skew-symmetric: $C_{YX} = -C_{XY}$

For proper vectors, the covariance matrix simplifies to:
$$C_Z = 2(C_X + iC_{YX})$$

Furthermore, for a proper vector, the **pseudo-covariance** (or complementary covariance) is zero:
$$E[(Z - M_Z)(Z - M_Z)^T] = 0$$

---

### Multivariate Complex Normal Distribution

A proper complex random vector follows a **Multivariate Complex Normal (Gaussian) Distribution** if its probability density function (PDF) is:
$$f_Z(z) = \frac{1}{\pi^n \det(C_Z)} \exp\left\{ -(z - M_Z)^\dagger C_Z^{-1} (z - M_Z) \right\}$$

This distribution is often denoted as $Z \sim \mathcal{CN}[M_Z, C_Z]$.