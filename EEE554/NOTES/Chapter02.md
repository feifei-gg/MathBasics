# Chapter 2 — The Axioms of Probability

## 2-1 Set Theory

### Sets and Subsets
* **Set**: A collection of objects called elements. A set $A$ consisting of elements $\zeta_1, \dots, \zeta_n$ is denoted $A = \{\zeta_1, \dots, \zeta_n\}$.
* **Subset**: $B \subset A$ means every element of $B$ is also an element of $A$. All sets under consideration are subsets of a universal space $S$.
* **Empty Set**: Denoted by $\{\emptyset\}$, it contains no elements.
* **Partitions**: A partition $U$ of a set $S$ is a collection of mutually exclusive subsets $A_i$ whose union equals $S$.



### Set Operations
* **Union (Sum)**: $A \cup B$ (or $A+B$) is the set of all elements in $A$ or $B$ or both.
* **Intersection (Product)**: $A \cap B$ (or $AB$) consists of elements common to both $A$ and $B$.
* **Mutually Exclusive**: Sets $A$ and $B$ are mutually exclusive if they have no common elements, i.e., $AB = \{\emptyset\}$.
* **Complement**: $\overline{A}$ consists of all elements in $S$ not in $A$. Note that $A\overline{A} = \{\emptyset\}$ and $A \cup \overline{A} = S$.

### Important Laws
* **De Morgan's Law**: $\overline{A \cup B} = \overline{A} \cap \overline{B}$.
* **Duality Principle**: If in a set identity we replace all unions by intersections, all intersections by unions, and the sets $S$ and $\{\emptyset\}$ by $\{\emptyset\}$ and $S$, the identity is preserved.

---

## 2-2 Probability Space

In probability theory, $S$ is the **certain event**, its elements are **experimental outcomes**, its subsets are **events**, and $\{\emptyset\}$ is the **impossible event**.

### The Axioms of Probability
We assign to each event $A$ a number $P(A)$, called the probability of the event, satisfying three conditions:
1. **Non-negativity**: $P(A) \ge 0$.
2. **Certainty**: $P(S) = 1$.
3. **Additivity**: If $AB = \{\emptyset\}$, then $P(A \cup B) = P(A) + P(B)$.

### Corollaries and Properties
* **Impossible Event**: $P(\{\emptyset\}) = 0$.
* **Complement Probability**: For any $A$, $P(\overline{A}) = 1 - P(A) \le 1$.
* **General Union Rule**: For any $A$ and $B$,
$$
P(A \cup B) = P(A) + P(B) - P(AB) \le P(A) + P(B)
$$
.
* **Subset Probability**: If $B \subset A$, then $P(A) = P(B) + P(A\overline{B}) \ge P(B)$.

### Fields and Borel Fields
* **Field ($\mathcal{F}$)**: A nonempty class of sets where if $A \in \mathcal{F}$, then $\overline{A} \in \mathcal{F}$, and if $A \in \mathcal{F}$ and $B \in \mathcal{F}$, then $A \cup B \in \mathcal{F}$. A field always contains $S$ and $\{\emptyset\}$.
* **Borel Field**: If the union and intersection of an infinite sequence of sets $A_1, \dots, A_n, \dots$ in $\mathcal{F}$ also belongs to $\mathcal{F}$, then $\mathcal{F}$ is a Borel field.

---

## 2-3 Conditional Probability

### Definition and Properties
The conditional probability of an event $A$ assuming another event $M$ is defined as:
$$
P(A | M) = \frac{P(AM)}{P(M)}
$$
where $P(M) > 0$.



* **Subset Conditions**:
  * If $M \subset A$, then $P(A | M) = 1$.
  * If $A \subset M$, then $P(A | M) = \frac{P(A)}{P(M)} \ge P(A)$.
* **Axiom Compliance**: Conditional probabilities are valid probabilities; they satisfy the axioms. Specifically, $P(A \cup B | M) = P(A | M) + P(B | M)$ if $A$ and $B$ are mutually exclusive.

**Example 2-10 (Die Experiment):**
We want the conditional probability of rolling a 2, given that an even number was rolled.
Let $A = \{f_2\}$ and $M = \{\text{even}\} = \{f_2, f_4, f_6\}$.
$P(A) = 1/6$, $P(M) = 3/6$, and $AM = A$. Thus:
$$
P(f_2 | \text{even}) = \frac{P(\{f_2\})}{P(\text{even})} = \frac{1/6}{3/6} = \frac{1}{3}
$$
.

**Example 2-13 (Drawing Balls without Replacement):**
A box contains 3 white and 2 red balls. Two balls are drawn in succession. To find the probability that the first is white ($W_1$) and the second is red ($R_2$):
$P(W_1) = 3/5$.
If a white ball is removed, 2 white and 2 red balls remain, so $P(R_2 | W_1) = 2/4$.
Using the conditional probability definition:
$$
P(W_1 R_2) = P(R_2 | W_1)P(W_1) = \left(\frac{2}{4}\right)\left(\frac{3}{5}\right) = \frac{6}{20}
$$
.

### Independent Events
Two events $A$ and $B$ are said to be independent if their joint probability equals the product of their individual probabilities:
$$
P(AB) = P(A)P(B)
$$
.

Would you like me to extract any specific proofs or additional homework problems from this chapter?
