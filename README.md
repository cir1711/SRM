# Square root measurement

When tasked with distinguishing among more than two quantum states, there is no universal formula for the optimal Positive Operator-Valued Measure (POVM) and success probability. Nevertheless, the optimal success probability for discriminating between elements of a specified ensemble $\{(p_i,\sigma_i)\}^N_{i=1}$ can always be expressed as follows:

$P_{success}=\max \sum p_i tr(E_i\sigma_i)$

This is derived by observing that $p_i$ represents the a priori probability of obtaining the i-th state, and $tr(E_i\sigma_i)$ denotes the probability of correctly identifying the input as $\sigma _{i}$, given that the state $\sigma _{i}$ has indeed been received. While this expression may not have an explicit form in the general case, it can be numerically solved using Semidefinite Programming.

An alternative method for discriminating between a given ensemble of states is to employ the **square root measurement**. While this approach is not universally optimal, it has been demonstrated to perform quite well.

The goal is to implement in MATLAB a method to calculate the Square Root Measurement using the results from [1], [2] and [link](https://www.egormaximenko.com/plots/KMS_eig.html) on the eigenvalues and eigenvectors of KMS matrices. Additionally, the calculation is performed for the case of circular matrices with values c (0 < c < 1), demonstrating that, as N tends to infinity, the solutions of the SRM of KMS coincide with the SRM of circular matrices.
[1] Grenander, U., Szegő, G., & Kac, M. (1958). Toeplitz Forms And Their Applications.
[2] Trench, W.F. (2010). Spectral decomposition of Kac-Murdock-Szego matrices.

# KMS

The Kac–Murdock–Szegö matrix (KMS) is defined as follows: 
$$
\begin{bmatrix}
1       & p       & p^2    & \cdots & p^{n-1} \\ 
p       & 1       & p      & \cdots & p^{n-2} \\ 
p^2     & p       & 1      & \ddots & \vdots  \\ 
\vdots  & \vdots  & \ddots & \ddots & p       \\ 
p^{n-1} & p^{n-2} & \cdots & p      & 1
\end{bmatrix}
$$
When $0 < p < 1$, the KMS matrix is a real symmetric and positive definite Toepliz correlation matrix with many applications and very well known spectral properties. 

# Circulant Matrix

In the realm of linear algebra, a circulant matrix stands as a square matrix where each row is constructed using identical elements, and every successive row is shifted one element to the right compared to the previous one. This type of matrix is a specific instance of a Toeplitz matrix.

The full specification of a circulant matrix is encapsulated in a single vector, denoted as "c," which serves as the initial column (or row) of the matrix C. Subsequent columns (or rows) in C are formed by cyclically permuting the vector c, with the offset determined by the respective column (or row) index, when indices are ranged from 0 to n-1. Notably, the cyclic permutation of rows yields the same outcome as the cyclic permutation of columns. The concluding row of C mirrors the vector c, but shifted by one position in reverse.

Consequently, a circulant matrix C of size $n \times n$ can be expressed as follows:

$$
\begin{bmatrix}
1       & p       & p^2    & \cdots & p^{n-1} \\ 
p       & 1       & p      & \cdots & p^{n-2} \\ 
p^2     & p       & 1      & \ddots & \vdots  \\ 
\vdots  & \vdots  & \ddots & \ddots & p       \\ 
p^{n-1} & p^{n-2} & \cdots & p      & 1
\end{bmatrix}
$$

