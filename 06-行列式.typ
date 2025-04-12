#import "@preview/qooklet:0.2.0": *
#show: qooklet.with(
  title: "行列式",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
)

= 定义
<定义>

== 全排列与逆序数
<全排列与逆序数>

#definition[
  将$n$个不同元素以任意方式排成一列，称此$n$个元素的全排列。
]

#definition[
  在一个排列中，逆序排列的总对数称为逆序数。逆序数为奇数的排列称为奇排列，逆序数为偶数的排列称为偶排列。
]

#theorem[
  互换排列中的两项，将排列的符号乘以$-1$。
]

#theorem[
  设$𝑨 = (𝑨_(⋅, 1), …, 𝑨_(⋅, n))$是一个$n$阶方阵，$(m_1, …, m_n)$是一个全排列，则

  $ |𝑨_(⋅, 1), …, 𝑨_(⋅, n)| = ("sign"(m_1, …, m_n)) |𝑨| $
]

== 行列式
<行列式>

#definition[
  设$𝑨$是一个$n$阶方阵，则$𝑨$的行列式$|𝑨|$，其定义如下

  $
    |𝑨| &= |a_(i j)|\
    &= mdet(
    a_11, a_12, …, a_(1 n); a_21, a_22, …, a_(2 n);
    ⋮, ⋮, ⋱, ⋮;
    a_(n 1), a_(n 2), …, a_(n n))\
    &= ∑(-1)^t a_(1 p_1) a_(2 p_2) … a_(n p_n)
  $

  其中，$t$为排列$p_1 p_2 … p_n$的逆序数，$sum$是$p_1 p_2 … p_n$的求和。
]

= 有向面积和体积
<有向面积和体积>

== 二阶行列式
<二阶行列式>

二阶行列式的几何意义是线性变换$𝑨$前后的有向面积比。

- $|𝑨| > 0$：面积缩放$|𝑨|$倍
- $|𝑨| = 0$：图形压缩为线段
- $|𝑨| < 0$：镜像旋转后，面积缩放$|𝑨|$倍

#theorem[
  当且仅当$|𝑨| ≠ 0$，则$n$阶方阵$𝑨$是可逆的。
]

= 子式与余子式
<子式与余子式>

== 子式
<子式>

#definition[
  在$m × n$矩阵$𝑨$中，任取其$k$行与$k$列中的$k^2$元素，不改变其在$𝑨$中的顺序而组成的$k$阶行列式，称为矩阵$𝑨$的$k$阶子式（minor）。
]

#definition[
  设矩阵$𝑨$是$m × n$矩阵，$I$是集合${ 1, …, m }$的一个$k$元子集，$J$是集合${ 1, …, n }$的一个$k$元子集，$|𝑨|_(I, J)$为矩阵$𝑨$的$k$阶子式，则

  - 若$I = J$，称$|𝑨|_(I, J)$为$𝑨$的$k$阶主子式（principle minor）
  - 若$I = J = { 1, …, k }$，称$|𝑨|_(I, J)$为$𝑨$的$k$阶顺序主子式（leading principle minor）

  即$|𝑨|_(I, J)$所取的行列号相同时，称主子式；$|𝑨|_(I, J)$所取的行列号均为$1 med k$时，称顺序主子式
]

如矩阵

$
  mat(delim: "[", a_11, a_12, a_13, a_14; a_21, a_22, a_23, a_24; a_31, a_32, a_33, a_34)
$

则其一个主子式为

$ mdet( a_22, a_24; a_42, a_44) $

其一个顺序主子式为

$ mdet( a_11, a_12, a_13; a_21, a_22, a_23; a_31, a_32, a_33) $

#theorem[
  设矩阵$𝑨$中有不为$0$的子式的最高阶为$r$，则$r$是$𝑨$的秩。
]

== 余子式
<余子式>

#definition[
  令$𝑨 = |a_(i j)|$是一个$n$阶方阵。删除$𝑨$的第$i$行和第$j$列后剩下的$(n-1)$阶行列式，称为$𝑨$的第$i j$个余子式（minor），记作$M_(i j)$。
]

#definition[
  $𝑨$的第$i j$个代数余子式（cofactor）$𝑨_(i j)$被定义为

  $ 𝑨_(i j) = (-1)^(i + j) M_(i j) $
]

#definition[
  一个$n$阶方阵$𝑨 = |a_(i j)|$的行列式$|𝑨| = |a_(i j)|$定义为

  $ |𝑨| = ∑ a_(1 i) 𝑨_(1 i) $
]

= 行列式的计算
<行列式的计算>

== 基本性质
<基本性质>

#theorem[
  设$𝑨$是一个方阵，$𝑩$是由$𝑨$通过互换两列得到的矩阵。然后

  $ |𝑨| = -|𝑩| $

]

#theorem[
  对下列行列式，有

  - 标量乘法

  $ mdet( t a, t b; c, d) = t mdet( a, b; c, d) $

  - 局部分配律

  $ mdet( a + a^′, b + b^′; c, d) = mdet( a, b; c, d) + mdet( a^′, b^′; c, d) $
]

#theorem[
  $ |𝑨^(⊤)| = |𝑨| $
]

== Laplace 展开
<Laplace-展开>

#theorem("Laplace 展开")[
  $n$阶方阵$𝑨 = (a_(i j))$的行列式，可表示成该方阵的某一行（列）各元素与其对应的代数余子式乘积之和，即

  $ |𝑨| = ∑_(j=1)^n a_(i j) 𝑨_(i j) $

  其中，$i ∈ [1, n]$
]

#theorem[
  对$n$阶方阵$𝑨 = (a_(i j))$，

  $ ∑_(k=1)^n a_(j k) 𝑨_(i k) = 0 med(i ≠ j) $
]

== 乘法
<乘法>

#theorem[
  设$𝑨$和$𝑩$是大小相同的方阵，则

  - $|𝑨 𝑩| = |𝑩 𝑨| = |𝑨||𝑩| = |𝑩||𝑨|$
  - $|𝑨^2| = |𝑨|^2$
]

= 行列式与解
<行列式与解>

== 伴随矩阵
<伴随矩阵>

#definition[
  矩阵$𝑨$的代数余子式的转置阵称为$𝑨$的伴随矩阵（adjoint matrix），表示为

  $ 𝑨^* = 𝑨_(i j)^(⊤) = 𝑨_(j i) $
]

#theorem[
  对矩阵$𝑨$，若$|𝑨| ≠ 0$，则矩阵可逆，此时

  $ 𝑨^(-1) = 1 / |𝑨| 𝑨^* $
]

== 秩、可逆
<秩-可逆>

#theorem[
  对方阵$𝑨$，有$|𝑨| ≠ 0$ ⇔ $𝑨$ 满秩 ⇔ $𝑨$ 可逆
]

#theorem[
  设$|𝑨|$为$n$阶方阵，则

  - $rank(𝑨) = n ⇔ rank(𝑨^*) = n$
  - $rank(𝑨) = n-1 ⇔ rank(𝑨^*) = 1$
  - $rank(𝑨) < n-1 ⇔ rank(𝑨^*) = 0$
]

= 常见行列式
<常见行列式>

== Cramer’s 法则
<Cramers-法则>

考虑$n × n$线性系统$𝑨 𝒙 = 𝒃$，有

$ 𝑨 = mat(delim: "[", 𝒂_1, 𝒂_2, …, 𝒂_n) $

若$|𝑨| ≠ 0$，则唯一解$𝒙 = (x_1, x_2, …, x_n)$的第$i$个条目由以下公式给出

$
  x_i &= |𝒂_1 … 𝒃 … 𝒂_n| / |𝑨|\
  &= 1 / |𝑨| mdet(
  a_11, …, b_1, …, a_(1 n);
  a_21, …, b_2, …, a_(2 n);
  ⋮, ⋱, ⋮, ⋱, ⋮;
  a_(n 1), …, b_n, …, a_(n n))
$

即$x_i$为用$b$取代$𝑨$中第$i$列构成的行列式与$|𝑨|$的比值。

== Vandermonde 行列式
<Vandermonde-行列式>

#definition[
  以下矩阵被称为 Vandermonde 矩阵（Vandermonde matrix）

  $
    𝑽 = mat(delim: "[", 1, 1, …, 1; x_1, x_2, …, x_n; ⋮, ⋮, …, ⋮; x_1^(n-1), x_2^(n-1), …, x_n^(n-1))
  $

  对应的矩阵即为 Vandermonde 行列式

  $
    |𝑽| = mdet(
    1, 1, …, 1;
    x_1, x_2, …, x_n;
    ⋮, ⋮, …, ⋮;
    x_1^(n-1), x_2^(n-1), …, x_n^(n-1))
  $
]

#theorem[
  设$|𝑽|$为 Vandermonde 行列式，则

  $ |𝑽| = ∏_(1 ⩽ i < j ⩽ n)(x_j - x_i) $

]
如行列式

$
  |𝑨| = mdet(1, 2, …, 4; 1, 3, …, 9; 1, 6, …, 36)
$

则

$
  |𝑨| = |𝑨^(⊤)|
  &= mdet(
  1, 1, 1;
  2^1, 3^1, 6^1;
  2^2, 3^2, 6^2)\
  &= (6 - 3)(6 - 2)(3 - 2)\
  &= 12
$
