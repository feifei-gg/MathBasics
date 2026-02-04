# Linear Algebra Review Notes

## 📖 Table of Contents
- [Chapter 1: Calculation of Determinants](#chapter-1-calculation-of-determinants)
- [Chapter 2: Matrices](#chapter-2-matrices)
- [Chapter 3: Linear Dependence of Vector Sets](#chapter-3-linear-dependence-of-vector-sets)
- [Chapter 4: Systems of Linear Equations](#chapter-4-systems-of-linear-equations)
- [Chapter 5: Eigenvalues and Eigenvectors](#chapter-5-eigenvalues-and-eigenvectors)
- [Chapter 6: Quadratic Forms](#chapter-6-quadratic-forms)

---

## Chapter 1: Calculation of Determinants

### 1. Calculation of Second-Order Determinants

**Formula:**

$$
\begin{vmatrix} a_{11} & a_{12} \\\\ a_{21} & a_{22} \end{vmatrix} = a_{11}a_{22} - a_{12}a_{21}
$$

> **Rule:** Product of the main diagonal minus the product of the secondary diagonal.

### 2. Calculation of Triangular Determinants

Whether it is an upper triangular or lower triangular determinant, its value is equal to the product of the elements on the main diagonal.

$$
D = \begin{vmatrix} a_{11} & \cdots & \cdots \\\\ 0 & a_{22} & \cdots \\\\ 0 & 0 & a_{nn} \end{vmatrix} = a_{11} \cdot a_{22} \cdots a_{nn}
$$

### 3. Properties of Determinants and Calculation Techniques

**Analysis:**
* **Row Addition (or Column Addition):** Adding $k$ times a row (or column) to another row (or column) does not change the value of the determinant.
* **Factoring:** A common factor of all elements in a row (or column) can be factored out of the determinant.
* **Swapping:** Interchanging two rows (or columns) of a determinant changes its sign.
* **Basic Idea:** Use these properties to convert the determinant into a triangular determinant for calculation.

### 4. Special Type: Vandermonde Determinant

**Characteristics:**
1.  The 1st row (or column) consists entirely of 1s.
2.  The 2nd row (or column) consists of elements $x_1, x_2, \dots, x_n$.
3.  The 3rd row and onwards are powers of the previous row (geometric progression).

**Formula:**

$$
D_n = \prod_{1 \le j < i \le n} (x_i - x_j)
$$

> **Rule:** Take the difference of the geometric ratio elements and multiply them; subtract the former from the latter.

**Example:**

$$
\begin{vmatrix} 1 & 1 & 1 \\\\ a & b & c \\\\ a^2 & b^2 & c^2 \end{vmatrix} = (b-a)(c-a)(c-b)
$$

### 5. Special Type: Claw-shaped Determinant

**Characteristics:** Non-zero elements exist only in the first row, first column, and the main diagonal (shaped like a claw).

**Calculation Method:**
1.  First, convert the elements on the main diagonal (excluding the claw tip) to 1 (by factoring).
2.  Use the 1s on the main diagonal to eliminate the non-zero elements in the first row (or first column) to 0, converting it into a triangular determinant.

**Formula:**
Given a claw shaped determinant:

$$
D = \begin{vmatrix}
a_{1} & 1 & 1 & \cdots \\\\
1 & a_{2} & 0 & \cdots \\\\
1 & 0 & a_{3} & \cdots \\\\
\vdots & \vdots & \vdots & \ddots
\end{vmatrix}
$$

The calculation formula is:

$$
D = \left( \prod_{i=2}^n a_i \right) \cdot \left( a_1 - \sum_{i=2}^n \frac{1}{a_i} \right)
$$

Or written out:

$$
D = (a_2 \cdot a_3 \cdots a_n) \cdot \left( a_1 - \frac{1}{a_2} - \frac{1}{a_3} - \cdots - \frac{1}{a_n} \right)
$$

### 6. Minors and Cofactors

* **Minor ($M_{ij}$):** The determinant remaining after removing the row and column containing $a_{ij}$.
* **Cofactor ($A_{ij}$):** $A_{ij} = (-1)^{i+j} M_{ij}$
* **Expansion Theorem:** The determinant is equal to the sum of the products of the elements of any row (or column) and their corresponding cofactors.

$$
D = \sum_{j=1}^{n} a_{ij} A_{ij}
$$

#### Example: Using the "Splitting Sums" Method
If:

$$
D = \begin{vmatrix} a_{11} & a_{12} & a_{13} \\\\ a_{21} & a_{22} & a_{23} \\\\ a_{31} & a_{32} & a_{33} \end{vmatrix} = 1
$$

then calculate:

$$
D_1 = \begin{vmatrix} -2a_{11} & 2a_{11}-a_{12} & a_{13} \\\\ -2a_{21} & 2a_{21}-a_{22} & a_{23} \\\\ -2a_{31} & 2a_{31}-a_{32} & a_{33} \end{vmatrix}
$$

**Solution:**

$$
\begin{aligned}
D_1 &= \begin{vmatrix} -2a_{11} & 2a_{11}-a_{12} & a_{13} \\\\ -2a_{21} & 2a_{21}-a_{22} & a_{23} \\\\ -2a_{31} & 2a_{31}-a_{32} & a_{33} \end{vmatrix} \\\\
&\xrightarrow{\text{Split Sum}} \begin{vmatrix} -2a_{11} & 2a_{11} & a_{13} \\\\ -2a_{21} & 2a_{21} & a_{23} \\\\ -2a_{31} & 2a_{31} & a_{33} \end{vmatrix} + \begin{vmatrix} -2a_{11} & -a_{12} & a_{13} \\\\ -2a_{21} & -a_{22} & a_{23} \\\\ -2a_{31} & -a_{32} & a_{33} \end{vmatrix} \\\\
&= 0 + (-2)(-1) \begin{vmatrix} a_{11} & a_{12} & a_{13} \\\\ a_{21} & a_{22} & a_{23} \\\\ a_{31} & a_{32} & a_{33} \end{vmatrix} \\\\
&= 2
\end{aligned}
$$

### 7. Using the Laplace Formula

A common formula:

$$
D = \begin{vmatrix} a_1 & a_2 & 0 & 0 \\\\ a_3 & a_4 & 0 & 0 \\\\ c_1 & c_2 & b_1 & b_2 \\\\ c_3 & c_4 & b_3 & b_4 \end{vmatrix} = \begin{vmatrix} a_1 & a_2 \\\\ a_3 & a_4 \end{vmatrix} \cdot \begin{vmatrix} b_1 & b_2 \\\\ b_3 & b_4 \end{vmatrix}
$$

#### Examples

**Calculate 1:**

$$
D_1 = \begin{vmatrix} 5 & 2 & 0 & 0 \\\\ 2 & 1 & 0 & 0 \\\\ 1 & 2 & 8 & 3 \\\\ 0 & 3 & 5 & 2 \end{vmatrix}
$$

$$
D_1 = \begin{vmatrix} 5 & 2 \\\\ 2 & 1 \end{vmatrix} \cdot \begin{vmatrix} 8 & 3 \\\\ 5 & 2 \end{vmatrix} = 1 \times 1 = 1
$$

**Calculate 2:**

$$
D_2 = \begin{vmatrix} 0 & 0 & 1 & 2 \\\\ 0 & 0 & 3 & 4 \\\\ 3 & 1 & 0 & 0 \\\\ -1 & 1 & 0 & 0 \end{vmatrix}
$$

$$
\begin{aligned}
D_2 &\xrightarrow[C_{2} \leftrightarrow C_{4}]{C_{1} \leftrightarrow C_{3}} (-1)^2 \begin{vmatrix} 1 & 2 & 0 & 0 \\\\ 3 & 4 & 0 & 0 \\\\ 0 & 0 & 3 & 1 \\\\ 0 & 0 & -1 & 1 \end{vmatrix} \\\\
&= \begin{vmatrix} 1 & 2 \\\\ 3 & 4 \end{vmatrix} \cdot \begin{vmatrix} 3 & 1 \\\\ -1 & 1 \end{vmatrix} \\\\
&= (-2) \times 4 = -8
\end{aligned}
$$

---

## Chapter 2: Matrices

### 1. Matrix Multiplication
* **Validity:** The number of columns in the left matrix = The number of rows in the right matrix ("Inner dimensions must match").
* **Result:** The resulting matrix has the same number of rows as the left matrix and the same number of columns as the right matrix ("Outer dimensions").
* **Operation:** Left Row multiplied by Right Column.
* **Note:**
    * Matrix multiplication is generally **not commutative** ($AB \neq BA$).
    * It satisfies the associative and distributive laws.

### 2. Matrix Inversion ($A^{-1}$)
* **Existence Condition:** $|A| \neq 0$ (Non-singular / Invertible matrix).
* **Common Methods:**
    * **Abstract Matrix (Using definition or polynomials):**
        * Definition Method: Construct $A \cdot (\dots) = E$ (Identity Matrix), then the expression inside the parenthesis is $A^{-1}$.
    * **Numerical Matrix:**
        * Adjugate Matrix Method: $A^{-1} = \frac{1}{|A|} A^*$
        * Elementary Row Operations: $(A | E) \xrightarrow{\text{Row Ops}} (E | A^{-1})$
    * **2x2 Matrix Shortcut:**

$$
A = \begin{pmatrix} a & b \\\\ c & d \end{pmatrix} \implies A^{-1} = \frac{1}{ad-bc} \begin{pmatrix} d & -b \\\\ -c & a \end{pmatrix}
$$

> **Rule:** Swap the main diagonal, change signs of the secondary diagonal, divide by the determinant.

### 3. Solving Matrix Equations
* If $AX = B$, then $X = A^{-1}B$.
* If $XA = B$, then $X = BA^{-1}$.
* If $AXB = C$, then $X = A^{-1}CB^{-1}$.
* *(Note: Pay attention to the direction of matrix multiplication; order cannot be swapped arbitrarily)*

### 4. Properties of the Adjugate Matrix ($A^*$)

$$
A^* = |A| A^{-1}
$$

$$
AA^* = A^*A = |A|E
$$

$$
|A^*| = |A|^{n-1}
$$

### 5. Rank of a Matrix ($r(A)$)
* **Definition:** The number of non-zero rows in the Row Echelon Form of the matrix.
* **Calculation:** Use elementary row operations to convert the matrix into Row Echelon Form.

---

## Chapter 3: Linear Dependence of Vector Sets

### 1. Determining Linear Dependence
* **Definition:** If there exist scalars $k_i$ (not all zero) such that $k_1\alpha_1 + \dots + k_m\alpha_m = 0$, then they are linearly dependent; otherwise, they are linearly independent.
* **Determination Methods (Numerical):**
    * **Two vectors:** Coordinates are proportional $\Rightarrow$ Dependent.
    * **$n$ vectors of dimension $n$:** Form a determinant.
        * $|D| = 0 \Rightarrow$ Linearly Dependent.
        * $|D| \neq 0 \Rightarrow$ Linearly Independent.
    * **Number of vectors > Dimension:** Must be Linearly Dependent.
    * **General Method:** Form a matrix and find the rank.
        * $r < m$ (number of vectors) $\Rightarrow$ Linearly Dependent.
        * $r = m \Rightarrow$ Linearly Independent.
* **Determination Methods (Abstract):**
    * Use definition or matrix transformation. Express vector set $\beta$ using vector set $\alpha$, and check if the determinant of the transition matrix is 0.

### 2. Maximal Linearly Independent Subset and Rank
* **Method:**
    1.  Form a matrix with the vectors.
    2.  Convert to Row Echelon Form.
    3.  The rank $r$ is the number of vectors in the maximal linearly independent subset.
    4.  The maximal linearly independent subset is usually chosen as the original column vectors corresponding to the "pivot columns" (corner positions) in the echelon form.

---

## Chapter 4: Systems of Linear Equations

### 1. Homogeneous Systems ($Ax = 0$)
* **Solution Criteria:**
    * $r(A) = n$ (number of variables) $\Rightarrow$ Only zero (trivial) solution.
    * $r(A) < n \Rightarrow$ Non-zero (nontrivial) solutions exist (Infinite solutions).
* **Finding the Fundamental System of Solutions:**
    1.  Convert to Reduced Row Echelon Form.
    2.  Identify free variables (variables corresponding to non-pivot columns).
    3.  Assign values to free variables, such as $(1, 0, \dots, 0), (0, 1, \dots, 0)$, etc., and back-substitute to find the main (pivot) variables.
    4.  The obtained $n - r(A)$ solution vectors form the fundamental system of solutions $\xi_1, \dots, \xi_{n-r}$.
* **General Solution:** $x = k_1\xi_1 + \dots + k_{n-r}\xi_{n-r}$.

### 2. Non-Homogeneous Systems ($Ax = b$)
* **Solution Criteria:**
    * $r(A) \neq r(A|b) \Rightarrow$ No solution.
    * $r(A) = r(A|b) = n \Rightarrow$ Unique solution.
    * $r(A) = r(A|b) < n \Rightarrow$ Infinite solutions.
* **Structure of General Solution:**

$$
\text{General Solution} = \text{Homogeneous General Sol.} + \text{Non-Homogeneous Particular Sol.}
$$

$$
x = k_1\xi_1 + \dots + \eta^*
$$

### 3. Parameterized Systems
Use row operations to convert to Echelon Form. Discuss the rank based on the values of the parameter $\lambda$ to determine the nature of the solutions.

---

## Chapter 5: Eigenvalues and Eigenvectors

### 1. Definition

$$
A\alpha = \lambda \alpha \quad (\alpha \neq 0)
$$

### 2. Calculation
* **Find Eigenvalues $\lambda$:** Solve the characteristic equation $|\lambda E - A| = 0$.
* **Find Eigenvectors:** For each $\lambda_i$, solve the homogeneous system $(\lambda_i E - A)x = 0$. The fundamental system of solutions found corresponds to the eigenvectors.

### 3. Properties
* $\sum \lambda_i = \text{tr}(A)$ (Trace, the sum of main diagonal elements).
* $\prod \lambda_i = |A|$.
* If $A \sim \Lambda$, then the eigenvalues of $A$ are the diagonal elements of $\Lambda$.

### 4. Diagonalization
* **Criterion:** An $n$-order matrix $A$ is diagonalizable $\iff A$ has $n$ linearly independent eigenvectors.
    * If $A$ has $n$ **distinct** eigenvalues $\Rightarrow$ It must be diagonalizable.
    * If $A$ has repeated eigenvalues, check if the number of eigenvectors corresponding to the repeated root equals its multiplicity ($n - r(\lambda E - A) = \text{Multiplicity}$).
* **Steps:**
    1.  Find eigenvalues.
    2.  Find eigenvectors.
    3.  Let $P = (\alpha_1, \alpha_2, \dots, \alpha_n)$, then $P^{-1}AP = \Lambda$.

### 5. Diagonalization of Real Symmetric Matrices
* **Property:** Real symmetric matrices ($A^T=A$) can always be orthogonally diagonalized. Eigenvectors corresponding to different eigenvalues are inherently orthogonal.
* **Steps:**
    1.  Find eigenvalues.
    2.  Find eigenvectors.
    3.  **Orthogonalization (Gram-Schmidt):** Orthogonalize the eigenvectors corresponding to repeated roots.
    4.  **Normalization:** Normalize the vectors to unit length.
    5.  Construct the orthogonal matrix $Q$ such that $Q^{-1}AQ = Q^TAQ = \Lambda$.

---

## Chapter 6: Quadratic Forms

### 1. Matrix Representation
* Quadratic form $f(x) = x^T A x$, where $A$ must be a **symmetric matrix**.
* $a_{ii}$ (Diagonal elements) = Coefficients of the squared terms.
* $a_{ij}$ (Off-diagonal elements) = Half the coefficient of the cross term $x_i x_j$.

### 2. Standardization
* **Goal:** Convert $f$ to $d_1y_1^2 + \dots + d_ny_n^2$.
* **Method 1: Completing the Square**
    * First complete the square for terms containing $x_1$, then for terms containing $x_2$, and so on.
    * This is a reversible linear transformation, but not necessarily an orthogonal transformation.
* **Method 2: Orthogonal Transformation**
    * Find the eigenvalues $\lambda_1, \dots, \lambda_n$ of matrix $A$.
    * The standard form is $\lambda_1 y_1^2 + \dots + \lambda_n y_n^2$.

### 3. Positive Definite Quadratic Forms
* **Determination Methods:**
    * **Definition:** For any $x \neq 0$, $f(x) > 0$.
    * **Eigenvalue Method:** All eigenvalues of $A$ are greater than 0 ($\lambda_i > 0$).
    * **Leading Principal Minors Method (Sylvester's Criterion):** All leading principal minors of $A$ are greater than 0.
        * $|A_1| > 0, |A_2| > 0, \dots, |A_n| > 0$.