# Detecting a Known Signal in Additive Gaussian Noise
**EEE 554 Lecture #16**

Consider the detection problem:
$$H_0: \underline{X} = \underline{N}$$
$$H_1: \underline{X} = \underline{S} + \underline{N}$$
where $\underline{S} \in \mathbb{R}^n$ is known, and $\underline{N} \sim \mathcal{N}[\underline{0}, \sigma^2 I]$ with $\sigma^2$ known.

With $P(H_0)$ and $P(H_1)$ known, the Bayesian decision rule gives:
$$\rightarrow H_1 = \left\{ \underline{X} \Big| \frac{f_{\underline{X}}(\underline{X}|H_1)}{f_{\underline{X}}(\underline{X}|H_0)} > \frac{P(H_0)}{P(H_1)} \right\}$$

More generally, the Neyman-Pearson lemma holds that a decision rule of the form:
$$\rightarrow H_1 = \left\{ \underline{X} \Big| \frac{f_{\underline{X}}(\underline{X}|H_1)}{f_{\underline{X}}(\underline{X}|H_0)} > T \right\}$$
will maximize $P_d$ for any fixed $P_{fa}$. Thus, the likelihood ratio:
$$\Lambda(\underline{X}) = \frac{f_{\underline{X}}(\underline{X}|H_1)}{f_{\underline{X}}(\underline{X}|H_0)}$$
is a crucial quantity in signal detection.

---

For the problem under consideration:
$$f_{\underline{X}}(\underline{X}|H_0) = C \exp\left\{-\frac{1}{2\sigma^2}\underline{X}^T\underline{X}\right\}$$
$$f_{\underline{X}}(\underline{X}|H_1) = C \exp\left\{-\frac{1}{2\sigma^2}(\underline{X}-\underline{S})^T(\underline{X}-\underline{S})\right\}$$
with $C = (2\pi\sigma^2)^{-n/2}$. Thus,
$$\Lambda(\underline{X}) = \exp\left\{\frac{1}{2\sigma^2}(\underline{X}^T\underline{S} + \underline{S}^T\underline{X} - \underline{S}^T\underline{S})\right\}$$

Note that $\underline{X}^T\underline{S} = \underline{S}^T\underline{X}$ is the inner product of $\underline{X}$ with $\underline{S}$, and $\underline{S}^T\underline{S} = ||\underline{S}||^2$ is the energy of the signal $\underline{S}$. So,
$$\rightarrow H_1 = \{\Lambda(\underline{X}) > T\} = \left\{\exp\left\{\frac{1}{\sigma^2}\underline{X}^T\underline{S} - \frac{1}{2\sigma^2}||\underline{S}||^2\right\} > T\right\}$$
$$= \left\{\frac{1}{\sigma^2}\underline{X}^T\underline{S} - \frac{1}{2\sigma^2}||\underline{S}||^2 > \log T\right\}$$
$$= \left\{\underline{X}^T\underline{S} > \sigma^2 \log T + \frac{1}{2}||\underline{S}||^2\right\} = \{\underline{X}^T\underline{S} > T'\}$$
where $T' = \sigma^2 \log T + \frac{1}{2}||\underline{S}||^2$.

---

## Detector Performance

The detector for a known signal vector $\underline{S}$ in additive white gaussian noise of known variance $\sigma^2$ has the form:
$$\rightarrow H_1 = \{\underline{S}^T\underline{X} > T'\} = \{\rho > T'\}$$
with the detection statistic $\rho = \underline{S}^T\underline{X}$.

Under $H_0$, $\underline{X} = \underline{N}$ and hence:
$$\rho_N = \underline{S}^T\underline{N} = \sum_{k=1}^{n} s_k n_k \sim \mathcal{N}\left[0, \sigma^2 \sum_{k=1}^{n} s_k^2\right] = \mathcal{N}[0, \sigma^2 ||\underline{S}||^2]$$

Under $H_1$, $\underline{X} = \underline{S} + \underline{N}$ and:
$$\rho_{S+N} = \underline{S}^T(\underline{S} + \underline{N}) = ||\underline{S}||^2 + \underline{S}^T\underline{N} \sim \mathcal{N}\left[||\underline{S}||^2, \sigma^2 ||\underline{S}||^2\right]$$

So the probabilities of false alarm ($P_{fa}$) and detection ($P_d$) are:
$$P_{fa} = P(\rho > T' | H_0) = 1 - \Phi\left(\frac{T'}{\sigma ||\underline{S}||}\right)$$
and
$$P_d = P(\rho > T' | H_1) = 1 - \Phi\left(\frac{T' - ||\underline{S}||^2}{\sigma ||\underline{S}||}\right)$$

---

## Complex Signal and Colored Noise

Now consider a known complex signal vector $\underline{S} \in \mathbb{C}^n$ in additive complex gaussian noise $\underline{N} \sim \mathcal{CN}[\underline{0}, C_N]$ with a known covariance matrix $C_N$.

The detection problem is:
$$H_0: \underline{X} = \underline{N}$$
$$H_1: \underline{X} = \underline{S} + \underline{N}$$

for which the likelihood ratio is:
$$\Lambda(\underline{X}) = \frac{C \exp\left\{-(\underline{X}-\underline{S})^H C_N^{-1}(\underline{X}-\underline{S})\right\}}{C \exp\left\{-\underline{X}^H C_N^{-1}\underline{X}\right\}}$$
$$= \exp\left\{\underline{S}^H C_N^{-1}\underline{X} + \underline{X}^H C_N^{-1}\underline{S} - \underline{S}^H C_N^{-1}\underline{S}\right\}$$
$$= \exp\left\{2\text{Re}(\underline{S}^H C_N^{-1}\underline{X}) - \underline{S}^H C_N^{-1}\underline{S}\right\}$$

The detector thus has the form:
$$\rightarrow H_1 = \{\rho > T'\}$$
where the detection statistic is:
$$\rho = \text{Re}(\underline{S}^H C_N^{-1}\underline{X})$$

which is distributed as:
* $\mathcal{N}\left[0, \frac{\underline{S}^H C_N^{-1}\underline{S}}{2}\right]$ under $H_0$
* $\mathcal{N}\left[\underline{S}^H C_N^{-1}\underline{S}, \frac{\underline{S}^H C_N^{-1}\underline{S}}{2}\right]$ under $H_1$