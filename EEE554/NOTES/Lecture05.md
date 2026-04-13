# Bernoulli Trials & Binary Hypothesis Testing
**EEE 554 — Lecture #5**

## Bernoulli Trials

A Bernoulli trial is a random experiment with exactly two possible outcomes, e.g.,
* $S = \{0, 1\}$
* $S = \{\text{head}, \text{tail}\}$
* $S = \{\text{success}, \text{failure}\}$

It is completely specified by the probability of one outcome, say $P(\text{success}) = p$. The other outcome then has probability $1 - p$.

An $n$-fold Bernoulli trial consists of a sequence of $n$ independent Bernoulli trials. The outcomes are ordered $n$-tuples of individual outcomes; e.g., with $n=3$:
$$
S = \{(000), (001), (010), (100), (011), (101), (110), (111)\}
$$

Note that $S$ contains $2^n$ outcomes. Of these:
* $\binom{n}{n} = \frac{n!}{n!0!} = 1$ outcome contains $n$ ones.
* $\binom{n}{n-1} = \frac{n!}{(n-1)!1!} = n$ outcomes contain $n-1$ ones.
* $\binom{n}{k} = \frac{n!}{(n-k)!k!}$ outcomes contain $k$ ones.

### Binomial Coefficient
The quantity
$$
\binom{n}{k} = \frac{n!}{(n-k)!k!}, \quad 0 \le k \le n
$$
is called a **binomial coefficient** because:
$$
(a+b)^n = \binom{n}{0}a^n b^0 + \binom{n}{1}a^{n-1}b^1 + \dots + \binom{n}{n}a^0 b^n
$$
Taking $a=b=1$ gives:
$$
2^n = \sum_{k=0}^{n} \binom{n}{k}
$$

These numbers also appear in Pascal's triangle:
* $n=1$: `1  1`
* $n=2$: `1  2  1`
* $n=3$: `1  3  3  1`

If the probability of obtaining a $1$ in a single trial is $p$, the probability of obtaining exactly $k$ ones in $n$ trials is:
$$
\binom{n}{k} p^k (1-p)^{n-k}
$$
The probability of obtaining at least $k$ ones in $n$ trials is thus:
$$
\sum_{m=k}^{n} \binom{n}{m} p^m (1-p)^{n-m}
$$

---

## Binary Hypothesis Testing

Consider two hypotheses $H_0$ and $H_1$ that are mutually exclusive and exhaustive:
$$
P(H_0) + P(H_1) = 1
$$
These typically represent alternative states:
* $H_1 = \{\text{signal present}\}, \quad H_0 = \{\text{signal absent}\}$
* $H_1 = \{\text{transmitted bit } = 1\}, \quad H_0 = \{\text{transmitted bit } = 0\}$

Let $M$ be an event representing an observed measurement or collected data. The decisions are:
* $\rightarrow H_1 = \{\text{decide in favor of } H_1\}$
* $\rightarrow H_0 = \{\text{decide in favor of } H_0\}$

### Bayesian Decision Rule

The Bayesian Decision Rule decides in favor of $H_1$ when its conditional probability given the data $M$ is greater than the conditional probability of $H_0$ given $M$; i.e.,
$$
\rightarrow H_1 = \{P(H_1 | M) > P(H_0 | M)\}
$$

Applying Bayes' rule:
$$
\rightarrow H_1 = \left\{ \frac{P(M | H_1)P(H_1)}{P(M)} > \frac{P(M | H_0)P(H_0)}{P(M)} \right\}
$$
This simplifies to the likelihood ratio test:
$$
\rightarrow H_1 = \left\{ \underbrace{\frac{P(M | H_1)}{P(M | H_0)}}_{\text{Likelihood ratio}} > \underbrace{\frac{P(H_0)}{P(H_1)}}_{\text{Priors}} \right\}
$$

### Hypothesis Testing with Continuous RVs

Consider the case where the data consists of a realization of one continuous random variable $X$:
$$
M = \{X \text{ takes on a value near } x\} = \{x \le X < x + \Delta\}
$$
Under $H_1$, $X$ has conditional PDF $f_X(x | H_1)$ and:
$$
P(M | H_1) = \int_{x}^{x+\Delta} f_X(u | H_1) du
$$
For small $\Delta$:
$$
P(M | H_1) \approx \Delta f_X(x | H_1)
$$
Similarly, $P(M | H_0) \approx \Delta f_X(x | H_0)$, and the Bayesian Decision Rule becomes:
$$
\rightarrow H_1 = \left\{ \frac{f_X(x | H_1)}{f_X(x | H_0)} > \frac{P(H_0)}{P(H_1)} \right\}
$$


**Example:**
Suppose we are given the following conditional PDFs:
$$
f_X(x | H_1) = \begin{cases} 4x^3 & 0 \le x \le 1 \\ 0 & \text{otherwise} \end{cases}
$$
$$
f_X(x | H_0) = \begin{cases} 1 & 0 \le x \le 1 \\ 0 & \text{otherwise} \end{cases}
$$

* **Case 1 (Equal Priors):** With $P(H_0) = P(H_1) = \frac{1}{2}$, the rule is:
  $$
  \rightarrow H_1 = \left\{ \frac{4x^3}{1} > 1 \right\} = \left\{ x > \sqrt[3]{\frac{1}{4}} \right\} \approx \{x > 0.63\}
  $$

* **Case 2 (Unequal Priors):** With $H_0$ more probable a priori, say $P(H_0) = \frac{3}{4}$ and $P(H_1) = \frac{1}{4}$:
  $$
  \rightarrow H_1 = \left\{ \frac{4x^3}{1} > \frac{3/4}{1/4} \right\} = \{4x^3 > 3\} \approx \{x > 0.91\}
  $$

---

## Metrics of Performance

* **Probability of correct detection ($P_d$):**
  $$
  P_d = P(\rightarrow H_1 \mid H_1) = \int_{\rightarrow H_1} f_X(x \mid H_1) dx
  $$
  It is desirable to have $P_d$ near 1.

* **Probability of false alarm ($P_f$):**
  $$
  P_f = P(\rightarrow H_1 \mid H_0) = \int_{\rightarrow H_1} f_X(x \mid H_0) dx
  $$
  It is desirable to have $P_f$ near 0.


There is usually some compromise necessary between these criteria. For example, one can increase $P_d$ by expanding the decision region for $H_1$, but this will inherently also increase $P_f$.

With priors given, one can calculate the overall **Probability of error ($P_e$)**:
$$
\begin{aligned}
P_e &= P(\rightarrow H_1 \mid H_0)P(H_0) + P(\rightarrow H_0 \mid H_1)P(H_1) \\
&= P_f \cdot P(H_0) + (1 - P_d) \cdot P(H_1)
\end{aligned}
$$
