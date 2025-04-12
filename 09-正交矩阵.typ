#import "@preview/qooklet:0.2.0": *
#show: qooklet.with(
  title: "正交阵",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
)

= 向量的内积
<向量的内积>

首先，回顾一下向量的内积。

#definition[
  对向量$𝒙, 𝒚 ∈ ℝ^n$，$x$和$y$的点积，定义为其对应坐标乘积之和，即
  $ 𝒙⋅𝒚 = ∑_(i=1)^n x_i y_i $
]

- $𝒙⋅𝒙 ≥ 0, ∀𝒙 ∈ ℝ^n$，当且仅当$𝒙 = 𝟎$时，$𝒙⋅𝒙 = 0$
- $∀𝒙, 𝒚 ∈ ℝ^n$，$𝒙⋅𝒚 = 𝒚⋅𝒙$

== 几何性质

#theorem("Cauchy-Schwarz 不等式")[
  设$𝒖, 𝒗 ∈ 𝒱$，则
  $ |⟨𝒖, 𝒗⟩| ⩽ norm(𝒖) norm(𝒗) $

  当且仅当$𝒖, 𝒗$中的一个是另一个的标量倍数时，等号成立。
]

#theorem("三角不等式")[
  设$𝒖, 𝒗 ∈ 𝒱$，则
  $ norm(𝒖 + 𝒗) ⩽ norm(𝒖) + norm(𝒗) $

  当且仅当$𝒖, 𝒗$中的一个是另一个的非负数倍时，等号成立。
]

#theorem("平行四边形")[
  设$𝒖, 𝒗 ∈ 𝒱$，则
  $ norm(𝒖 + 𝒗)^2 + norm(𝒖 - 𝒗)^2 = 2((norm(𝒖)^2 + norm(𝒗)^2)) $
]

#theorem("余弦定理")[
  设$𝒖, 𝒗 ∈ 𝒱$，则
  $ cos θ = frac(𝒖⋅𝒗, norm(𝒖) norm(𝒗)) $
]

#tip[
  不难看出，向量点积的实质是，两个向量之间的相似度
]

== 正交

#definition[
  对向量空间$𝒱$，若两个向量$𝒖, 𝒗 ∈ 𝒱$且$⟨𝒖, 𝒗⟩ = 0$，则称为正交（orthogonal）。
]

- $𝟎$与$𝒱$中的每个向量均是正交的。
- $𝟎$是$𝒱$中唯一与自己正交的向量。

由余弦定理

$ 𝒙⋅𝒚 = 0 ⇔ 𝒙 ⊥ 𝒚 $

#tip[
  正交是垂直的推广。
]

#theorem[
  设$𝒖$和$𝒗$是$𝒱$中的正交向量，则
  $ norm(𝒖 + 𝒗)^2 = norm(𝒖)^2 + norm(𝒗)^2 $
]

#theorem[
  设$𝒖, 𝒗 ∈ 𝒱$，且$𝒗 ≠ 𝟎$。设$𝒄 = frac(⟨𝒖, 𝒗⟩, norm(𝒗)^2)$，$𝒘 = 𝒖 - frac(⟨𝒖, 𝒗⟩, norm(𝒗)^2) 𝒗$，则
  $ ⟨𝒘, 𝒗⟩ = 0, 𝒖 = 𝒄 𝒗 + 𝒘 $
]

= 正交向量
<正交向量>

== 正交基
<正交基>

#definition[
  已知$𝒑_1, 𝒑_2, …, 𝒑_r$为向量空间$𝒱$的一个基，若两两正交，即满足
  $ 𝒑_i⋅𝒑_j = 0, med i ≠ j $

  则称其为正交基（orthogonal basis）。若其还满足长度均为$1$，即
  $ 𝒑_i⋅𝒑_i = 1, med i = 1, 2, …, r $

  则称其为标准正交基（orthonormal basis）。
]

#theorem[
  互相正交的单位向量一定是线性无关的。
]

== 正交阵
<正交阵>

#definition[
  设$𝒑_1, 𝒑_2, …, 𝒑_n$是向量空间$ℝ^n$的一个标准正交基，则由其构造的$n$阶方阵$𝑷$称为正交阵（orthogonal matrix）
  $ 𝑷 = (𝒑_1, 𝒑_2, …, 𝒑_n) $

  该方阵$𝑷$必然满足
  $ 𝑷^(⊤) 𝑷 = 𝑷^(-1) 𝑷 = 𝑰 $
]

#definition[
  由标准正交向量构成的矩阵，即$𝑸 = [𝒒_1 𝒒_2 … 𝒒_n]$。根据定义

  $
    𝑸^(⊤) 𝑸 = dmat(delim: "[", 1, 1, ⋱, 1) = 𝑰
  $

  称为标准正交阵（orthonormal matrix）。
]

#theorem[
  标准正交阵相似于单位矩阵。
]

#theorem[
  当$𝑸$恰好是方阵时，由于正交性，易得$𝑸$是可逆的，又$𝑸^(⊤) 𝑸 = 𝑰$，故$𝑸^(⊤) = 𝑸^(-1)$。
]

== Gram-Schmidt 正交化
<Gram-Schmidt-正交化>

由上，正交阵的逆阵很容易求出，若对角化中用到的矩阵$𝑷$可以构造为正交阵，即有$𝑷^(-1) = 𝑷^(⊤)$，则可大大降低对角化的求解难度，使得

$ 𝑨 = 𝑷 𝜦 𝑷^(-1) = 𝑷 𝜦 𝑷^(⊤) $

设$𝒒_1, …, 𝒒_m$是$𝒱$的标准正交基，且$𝒗 ∈ 𝒱$，则

$ 𝒗 = 𝒗, 𝒒_1 𝒒_1 + … + 𝒗, 𝒒_n 𝒒_n $

$ norm(𝒗)^2 = |𝒗, 𝒒_1^2 + … + 𝒗, 𝒒_n^2 $

#theorem("Gram-Schmidt 正交化")[

  设向量空间$𝒱$中，$𝒗_1, …, 𝒗_m$是一组基，可通过下述方法找到$𝒱$中的一组正交基

  $
    𝒒_1 &= 𝒗_1\
    𝒒_2 &= 𝒗_2 - frac(𝒗_2⋅𝒒_1, 𝒒_1⋅𝒒_1) 𝒒_1\
    𝒒_3 &= 𝒗_3 - frac(𝒗_3⋅𝒒_1, 𝒒_1⋅𝒒_1) 𝒒_1 - frac(𝒗_3⋅𝒒_2, 𝒒_2⋅𝒒_2) 𝒒_2\
    & ⋮\
    𝒒_n &= 𝒗_n - frac(𝒗_n⋅𝒒_1, 𝒒_1⋅𝒒_1) 𝒒_1 - … - frac(𝒗_n⋅𝒒_(n -1), 𝒒_(n -1)⋅𝒒_(n -1)) 𝒒_(n -1)
  $

  其中，$𝒒_1, …, 𝒒_n$是$𝒱$中的一组标准正交基
]

#tip[
  正交化是去除多余分量的过程。
]

= Gram 矩阵
<Gram-矩阵>

== 实对称阵
<实对称阵>

#definition[
  若$𝑨^(⊤) = 𝑨$，则称矩阵$𝑨$为对称阵。若$𝑨^(⊤) = -𝑨$，则称矩阵$𝑨$为反对称阵。
]

常见对称阵有

- 单位阵
- 对角阵

#definition[
  若矩阵$𝑨$为对称，且其中每个元素都是实数，则称之为实对称阵。
]

实对称阵的特性：

- 特征值为实数
- 特征向量相互正交

#tip[
  约定：特征值为实数、特征向量相互正交的矩阵为"好矩阵"。
]

#theorem[
  对称阵的互异特征值对应的特征向量，相互正交。
]

== 好方程组
<好方程组>

$𝑨^(⊤) 𝑨$是一个$n$阶对称方阵，称为 Gram 矩阵。$𝑨^(⊤) 𝑨 𝒙 = 𝑨^(⊤) 𝒃$，这个变换可以将"坏方程组"变为"好方程组"。

对矩阵

$
  mat(delim: "[", 1, 1; 1, 2; 1, 5) mat(delim: "[", x_1; x_2) = mat(delim: "[", b_1; b_2; b_3)
$

只有当$mat(delim: "[", b_1; b_2; b_3)$在矩阵的列空间时，方程才有解。

做变换

$
  mat(delim: "[", 1, 1, 1; 1, 2, 5)
  mat(delim: "[", 1, 1; 1, 2; 1, 5) =
  mat(delim: "[", 3, 8; 8, 30)
$

- $rank(𝑨^(⊤) 𝑨) = rank(𝑨)$
- 当且仅当$N(𝑨)$为零向量，即$𝑨$的列向量线性无关，则$𝑨^(⊤) 𝑨$可逆

== 正交对角化
<正交对角化>

#theorem[
  $𝑨$是实对称阵 ⇔ $𝑨$可正交对角化
]

在可对角化情况下，一个矩阵可以化为

$ 𝑨 = 𝑺 𝜦 𝑺^(-1) $

在矩阵对称的情况下，由特征向量组成的矩阵$𝑺$中的列向量是相互正交的，此时若把特征向量的长度统一化为$1$，就可以得到一组标准正交的特征向量。

#theorem("谱定理")[
  对于标准正交阵，有$𝑸 = 𝑸^(⊤)$，故对称阵可以写为
  $ 𝑨 = 𝑸 𝜦 𝑸^(⊤) $
]

在矩阵为"好矩阵"的情况下，$n$阶矩阵将有$n$个不同的特征值，则它可以对角化，故其 Jordan 矩阵就是$λ$，共$n$个特征向量，有$n$个 Jordan 块。

#pagebreak()

= 复共轭阵

== Hermite 矩阵

#definition[
  自共轭阵，又称 Hermite 矩阵，以$𝑨$表示，其主对角元均为实数，矩阵中元素$𝑨_(i j)$与$𝑨_(j i)$共轭相等。即

  $ 𝑨_(i j) = overline(𝑨_(j i)) $

  记作

  $ 𝑨^H = 𝑨 $

  其中，$H$表示共轭转置，也称 Hermite 共轭。

  如矩阵

  $ mat(delim: "[", 1, 2 + i; 2 - i, 1) $
]

#theorem[
  Hermite 矩阵的特征值均为实数。
]

#theorem[
  若 Hermite 矩阵$𝑨$可逆，则$𝑨^(-1)$为 Hermite 矩阵。
]

#theorem[
  若$𝑨$为 Hermite 矩阵，则$𝑨^n$为 Hermite 矩阵
]

== 酉阵

#definition[
  若矩阵$𝑨$满足
  $ 𝑨^H 𝑨 = 𝑨 𝑨^H = 𝑰 $

  则称$𝑨$为酉阵。
]

#theorem[
  设$𝑨$为酉阵，则

  - $|det(𝑨)| = 1$
  - $𝑨^(-1) = 𝑨^H$
  - $norm(𝑨 𝒙)_2 = norm(𝒙)_2$
]

#theorem[
  若$𝑨$和$𝑩$为同阶酉阵，则$𝑨 𝑩$也是酉阵。
]
酉阵是实正交阵在复数域的推广。

= 矩阵范数
<矩阵范数>

矩阵范数是对向量范数进行推广，满足非负性、齐次性和相容性（三角不等式）。

矩阵范数主要有三种类型：诱导范数、元素形范数和 Schatten 范数。这里，我们先讨论诱导范数和元素形范数，在章节《矩阵分解》中，再来认识 Schatten 范数。

== 诱导范数
常用的诱导范数为之前提到的 _p_-范数。

$
  norm(𝑨)_p = max frac(𝑨 𝒙, norm(𝒙)_p), 𝒙 ≠ 𝟎
$

#tip[
  矩阵$𝑨$的 _p_-范数可理解为$𝑨$产生的最大放大倍数。
]

对$ℓ_2$范数

$
  norm(𝑨)_2
  &= max_(𝒙≠𝟎) frac(norm(𝑨 𝒙)_2, norm(𝒙)_2)
  = max_(𝒙≠𝟎) frac(sqrt(𝒙^(H)𝑨^(H)𝑨 𝒙), norm(𝒙)_2) \
  &= max_(𝒙≠𝟎) frac(sqrt(𝒙^(H)𝑸^(H) 𝜦 𝑸 𝒙), norm(𝒙)_2)
  = max_(𝒙≠𝟎) frac(sqrt((𝑸 𝒙)^(H) 𝜦 (𝑸 𝒙)), norm(𝑸 𝒙)_2) \
  &= max_(𝒚≠𝟎) frac(sqrt(𝒚^(H) 𝜦 𝒚), norm(𝒚)_2)
  = max_(𝒚≠𝟎) sqrt(frac(∑ λ_i y_i^2, ∑ y_i^2)) ≤ sqrt(λ_(max))
$

#figure(
  table(
    columns: 4,
    align: center + horizon,
    inset: 4pt,
    stroke: three-line(rgb("000")),
    [范数], [别名], [数学含义], [值],
    [$ℓ_2$], [谱范数], [$𝑨^(⊤) 𝑨$的最大特征值], [$σ_(max) = sqrt(λ_(max)(𝑨^(H)𝑨))$],
    [$ℓ_1$], [列和范数], [矩阵的最大列和], [$arg max_(1 ⩽ j ⩽ n) med ∑_(i=1)^m norm(a_(i j))$],
    [$ℓ_∞$], [行和范数], [矩阵的最大行和], [$arg max_(1 ⩽ i ⩽ n) ∑_(j=1)^m norm(a_(i j))$],
  ),
  caption: "矩阵 _p_-范数",
  supplement: "表",
  kind: table,
)

#tip[
  对于 _p_-范数，若数据某一维度的值远远大于另一个维度的值，这个测度会过度放大幅值较大维度的作用。所以，在实际应用前，通常需要对数据进行标准化。
]

== 元素范数
元素形范数的典型代表为，Frobenius 范数，其是矩阵元素的均方根。

$
  norm(𝑨)_F = sqrt(∑_(i, j) |a_(i j)|^2) = sqrt(⟨𝑨, 𝑨⟩)
  = sqrt(∑ σ_i^2)
  = sqrt(tr(𝑨^H 𝑨))
$

当我们有一张图像，但需要缩小它的尺寸。由公式，可用两个矩阵相减得出它们之间的距离。$0$表示完全相似，而随着相似度的增加，距离会越来越大。现在，若计算原始图像和调整后图像之间的距离，就可以知道损失有多大。通过将距离最小化，我们可以将损失最小化。即

$ norm(𝑨 - 𝑩)_F = sqrt(∑_(i, j) (a_(i j) - b_(i j))^2) $

#theorem[
  Frobenius 范数在酉变换下保持不变。即若矩阵$𝑷$和$𝑸$均为酉阵，则

  $ norm(𝑷 𝑨 𝑸)_(𝑭) = norm(𝑨)_(𝑭) $

  该结论同样适用于$ℓ_2$范数。
]

#theorem[
  Frobenius 范数和所有的诱导范数都满足相容性。
]

#definition[
  矩阵的谱半径为矩阵特征值的模的最大值，即

  $ ρ := max|λ| $
]

相容的范数可以控制矩阵的谱半径。
