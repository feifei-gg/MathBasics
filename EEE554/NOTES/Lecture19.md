# Filtering of WSS Processes
**EEE 554 Lecture #19**

Consider the situation in which a discrete-time Wide-Sense Stationary (WSS) process $x(k)$ is input to a linear time-invariant (LTI) system with impulse response $h(k)$.

The output process $y(k)$ has values:
$$y(k) = [x * h](k) = \sum_{n=-\infty}^{\infty} h(n)x(k-n)$$
i.e., the convolution of $x(\cdot)$ and $h(\cdot)$.

Pictorially:
$x(k) \longrightarrow \boxed{\text{LTI: } h(k)} \longrightarrow y(k) = [x * h](k)$

---

## Mean
In general,
$$\mu_y(k) = E[y(k)] = E\left[\sum_{n} h(n)x(k-n)\right]$$
$$= \sum_{n} h(n)E[x(k-n)]$$
$$= \sum_{n} h(n)\mu_x(k-n) = [\mu_x * h](k)$$

When $x(\cdot)$ is WSS, $\mu_x(k) = \mu_x$ is constant, so:
$$\mu_y(k) = \mu_x \sum_{n} h(n)$$
and $\mu_y$ is also constant.

---

## Autocovariance
The autocovariance function of $y(\cdot)$ is given by:
$$C_y(k_1, k_2) = \text{cov}(y(k_1), y(k_2))$$
$$= E[(y(k_1) - \mu_y(k_1))(y(k_2) - \mu_y(k_2))]$$
$$= E\left[ \sum_{n} h(n)(x(k_1-n) - \mu_x) \sum_{m} h(m)(x(k_2-m) - \mu_x) \right]$$
$$= \sum_{n}\sum_{m} h(n)h(m) C_x(k_1-n, k_2-m)$$

If $x(\cdot)$ is WSS, $C_x(k_1-n, k_2-m) = C_x(K - n + m)$ with $K = k_2 - k_1$. 
So, in this case, $C_y(k_1, k_2)$ depends only on $K$; thus $y(\cdot)$ is WSS with:
$$C_y(k) = \sum_{n}\sum_{m} h(n)h(m) C_x(k - n + m)$$

---

## Spectral Density
With $x(\cdot)$ being WSS, $y(\cdot) = [x * h](\cdot)$ is also WSS with spectral density:
$$S_y(\omega) = \sum_{k=-\infty}^{\infty} C_y(k)e^{-i\omega k}$$
$$= \sum_{k}\sum_{n}\sum_{m} h(n)h(m) C_x(k - n + m) e^{-i\omega k}$$

Let $l = k - n + m \implies k = l + n - m$:
$$= \sum_{n}\sum_{m} h(n)h(m) \left( \sum_{l} C_x(l)e^{-i\omega(l+n-m)} \right)$$
$$= \sum_{n}\sum_{m} h(n)h(m) e^{-i\omega n} e^{i\omega m} \sum_{l} C_x(l)e^{-i\omega l}$$
$$= \left(\sum_{n} h(n)e^{-i\omega n}\right) \left(\sum_{m} h(m)e^{i\omega m}\right) S_x(\omega)$$
$$= H(\omega)H^*(\omega)S_x(\omega) = |H(\omega)|^2 S_x(\omega)$$

where $H(\omega) = \sum_{k=-\infty}^{\infty} h(k)e^{-i\omega k}$ is the frequency response of the LTI system.

---

**Example:** The RVs $x(k)$ are iid $\sim \mathcal{N}[0, \sigma^2]$ for $k \in \mathbb{Z}$. 
Then $E[x(k)] = 0$ for all $k$ and:
$$C_x(k) = \begin{cases} \sigma^2 & k = 0 \\ 0 & k \neq 0 \end{cases} = \sigma^2 \delta(k)$$

Thus, for all $\omega$:
$$S_x(\omega) = \sum_{k} \sigma^2 \delta(k)e^{-i\omega k} = \sigma^2$$
(i.e., $x(\cdot)$ is a white process). 

If an LTI system has impulse response:
$$h(k) = \begin{cases} 1 & k = 0, 1 \\ 0 & \text{otherwise} \end{cases}$$
then:
$$H(\omega) = \sum_{k} h(k)e^{-i\omega k} = 1 + e^{-i\omega} = (1 + \cos\omega) - i\sin\omega$$
$$|H(\omega)|^2 = (1 + \cos\omega)^2 + \sin^2\omega = 2 + 2\cos\omega$$

If $x(\cdot)$ is passed through this system, the output process $y(\cdot)$ will have spectral density:
$$S_y(\omega) = |H(\omega)|^2 S_x(\omega) = \sigma^2(2 + 2\cos\omega) = 2\sigma^2(1 + \cos\omega)$$
Hence, $y(\cdot)$ is a lowpass process.

---

## Moving Average (MA) Processes

Consider a causal FIR system. The corresponding system difference equation is:
$$y(k) = b_0 x(k) + b_1 x(k-1) + \dots + b_m x(k-m)$$

And the transfer function is thus:
$$H(z) = \frac{Y(z)}{X(z)} = b_0 + b_1 z^{-1} + \dots + b_m z^{-m}$$
i.e., a polynomial of degree $m$ in $z^{-1}$.

**Definition:** An $m^{\text{th}}$-order moving average (MA) process is the output of a causal FIR filter (as above) when the driving signal $x(k)$ is a zero-mean, finite-variance white process.

**Notes:**
1. If $x(\cdot)$ has variance $\sigma^2$, then $S_y(\omega) = |b_0 + b_1 e^{-i\omega} + \dots + b_m e^{-im\omega}|^2 \sigma^2$.
2. The filter weights $b_0, \dots, b_m$ are called the "MA coefficients" of $y(\cdot)$.

---

## Autoregressive (AR) Processes

Consider a recursive linear system. The corresponding system difference equation is:
$$y(k) + a_1 y(k-1) + \dots + a_n y(k-n) = x(k)$$

And the transfer function is thus:
$$H(z) = \frac{Y(z)}{X(z)} = \frac{1}{1 + a_1 z^{-1} + \dots + a_n z^{-n}}$$

Recall that the filter is stable if all poles of $H(z)$ lie strictly within the unit disc in the $z$-plane.

**Definition:** An $n^{\text{th}}$-order autoregressive (AR) process is the output of a stable recursive filter (as above) when the driving signal $x(k)$ is a zero-mean, finite-variance white process.

**Notes:**
1. If $x(\cdot)$ has variance $\sigma^2$, 
   $$S_y(\omega) = |H(\omega)|^2 S_x(\omega) = \sigma^2 |H(e^{i\omega})|^2 = \frac{\sigma^2}{|1 + a_1 e^{-i\omega} + \dots + a_n e^{-in\omega}|^2}$$
2. The filter weights $a_1, \dots, a_n$ are called the "AR coefficients" of $y(\cdot)$.