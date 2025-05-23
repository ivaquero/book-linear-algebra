#import "lib/lib.typ": *
#show: chapter-style.with(title: "线性系统的解", info: info)

= 有解的条件
<有解的条件>

求解线性系统$𝑨 𝒙 = 𝒃$，需要讨论以下 3 个层次的问题

+ 解的存在性：是否存在$𝒙$与$𝒃$对应
+ 解的个数：有多少个$𝒙$与$𝒃$对应
+ 解集：哪些$𝒙$与$𝒃$对应

#tip[
  若一个线性系统有解，则说它是一致的（consistent）；反之，则说它是不一致的（inconsistent）。
]

线性系统$𝑨 𝒙 = 𝒃$是否有解，取决于$𝒃$是否在矩阵函数$𝑨 𝒙 = 𝒚$的值域中。

== 空间观点
<空间观点>

考虑齐次线性系统

$
  cases(
    delim: "{",
    a_11 x_1 + a_12 x_2 + … + a_(1 n) x_n & = 0,
    a_21 x_1 + a_22 x_2 + … + a_(2 n) x_n & = 0, & ⋮,
    a_(m 1) x_1 + a_(m 2) x_2 + … + a_(m n) x_n & = 0
  )
$

其中，$𝑨$为$m × n$矩阵，故系统由$n$个变量$x_1, x_2, …, x_n$中的$m$个方程组成。其解空间是$ℝ^n$的子空间。

#theorem[
  当且仅当$𝒃 ∈ "colsp"(𝑨)$，方程$𝑨 𝒙 = 𝒃$有解。
]

== 秩观点
<秩观点>

#theorem[
  线性系统$𝑨 𝒙 = 𝒃$有解的充要条件是，系数矩阵$𝑨$的秩等于其增广矩阵的秩，即
  $ rank(𝑨) = rank(𝑨|𝒃) $

]

#theorem[
  $𝑨$是行满秩矩阵，则矩阵函数$𝑨 𝒙 = 𝒚$满射，线性系统$𝑨 𝒙 = 𝒃$一定有解。
]

= 解的数量
<解的数量>

== 值域
<值域>

在自然定义域下，当矩阵函数$𝑨 𝒙 = 𝒚$为

- 单射，值域中的任意向量有且只有 1 个定义域中的向量与之对应
- 非单射，值域中每个向量都有无数个定义域中的向量与之对应
即，若$𝑨 𝒙 = 𝒃$有解，则$𝑨 𝒙 = 𝒚$

- 单射，有唯一解
- 非单射，有无数解

#theorem[
  对线性系统$𝑨 𝒙 = 𝒃$，其增广矩阵为$𝑩 = (𝑨|𝒃)$，$𝑨$为$m × n$矩阵，则线性系统

  - 有唯一解 ⇔ $rank(𝑨) = rank(𝑩) = n$
  - 有无数解 ⇔ $rank(𝑨) = rank(𝑩) < n$
]

#theorem[
  若$n$阶方阵$𝑨$是可逆的，则对于任何$n$个向量$𝒃$，该系统
  $ 𝑨 𝒙 = 𝒃 $

  有唯一解
  $ 𝒙 = 𝑨^(-1) 𝒃 $
]

== 平凡解
<平凡解>

考虑$n$个变量的$m$个方程的齐次系统

$ 𝑨 𝒙 = 𝟎 $

显然，每个齐次系统至少有一个平凡解（trivial solution），即零解。

$ x_1 = 0, x_2 = 0, …, x_n = 0 $

不难知道，每个齐次系统的解的个数只存在 3 种情况，即

$⋆$ 只有零解
$⋆$ 有无数解
$⋆$ 有有限解（至少有一个非零解）

== 变量个数
<变量个数>

=== 变量个数多于方程个数

考虑 RREF，右手边的常数均是零（因为原系统是齐次的）。主元的数量$r$最多是方程的数量$m$（因为每个方程最多有 1 个主元）。

当$m < n$，则可得出$r < n$，故至少有一个自由变量可以被设置为等于一个任意参数，从而产生无数解。

#theorem[
  变量个数多于方程个数的齐次系统必有无数解。
]

=== 变量个数等于方程个数

即$m = n$。

此时，系数矩阵$𝑨$是一个$n$阶方阵（square matrix）。

#theorem[
  方程个数多于变量个数的非齐次系统，在某常数项的选择上没有解。
]

= 解集
<解集>

#theorem[
  若两个线性系统的增广矩阵是行等价的，则这两个系统的解集是相同的。
]

== 齐次系统的解
<齐次系统的解>

#definition[
  对线性系统$𝑨 𝒙 = 𝒃$，当$𝒃 = 0$时，该线性系统称为齐次系统（homogeneous system）。
]

#definition[
  齐次系统的解集，称为$𝑨$的零空间，记作$"null"(𝑨)$。
]

对矩阵

$ 𝑨 = mat(delim: "[", 1, 2, 2, 2; 2, 4, 6, 8; 3, 6, 8, 10) $

求$𝑨 𝒙 = 𝟎$的特解。

找出主元，个数为 2，即矩阵$𝑨$的秩为 2，即$r = 2$。

$
  𝑨 = mat(
    delim: "[", 1, 2, 2, 2;
    2, 4, 6, 8;
    3, 6, 8, 10
  ) limits(⟶)^("eliminate")
  mat(
    delim: "[", underline(1), 2, 2, 2;
    0, 0, underline(2), 4;
    0, 0, 0, 0
  ) = 𝑼
$

主变量所在的列为主列（pivot column），其余列为自由列（free column）。自由列中的变量为自由变量（free
variable），自由变量的个数为$n - r = 4 - 2 = 2$。

通常，给自由列变量赋值，去求主列变量的值。如，令$x_2 = 1, x_4 = 0$，求得特解

$ x = c_1 mat(delim: "[", - 2; 1; 0; 0) $

再令$x_2 = 0, x_4 = 1$，求得特解

$ x = c_2 mat(delim: "[", 2; 0; - 2; 1) $

进一步简化，得 RREF，主元上下的元素均是$0$，即

$
  𝑼 = mat(
    delim: "[", underline(1), 2, 2, 2;
    0, 0, underline(2), 4;
    0, 0, 0, 0
  ) limits(⟶)^("reduce")
  mat(
    delim: "[", underline(1), 2, 0, - 2;
    0, 0, underline(1), 2;
    0, 0, 0, 0
  ) = 𝑹
$

将$𝑹$中的主变量放在一起，自由变量放在一起（列交换），得

$
  𝑹 = mat(
    delim: "[",
    underline(1), 2, 0, - 2;
    0, 0, underline(1), 2;
    0, 0, 0, 0
  ) limits(⟶)^("colswap")
  mat(delim: "[", 1, 0, 2, - 2; 0, 1, 0, 2; 0, 0, 0, 0) =
  mat(delim: "[", 𝑰, 𝑭; 0, 0)
$

其中，$𝑰$为单位阵，$𝑭$为自由变量组成的矩阵。

计算零空间矩阵$𝑵$，其列为特解，有$𝑹 𝑵 = 𝟎$。

$ 𝒙_("pivot") = -𝑭 𝒙_("free") $

$ mat(delim: "[", 𝑰, 𝑭) mat(delim: "[", 𝒙_("pivot"); 𝒙_("free")) = 𝟎 $

$ 𝑵 = mat(delim: "[", - 𝑭; 𝑰) $

得

$ 𝑵 = mat(delim: "[", - 2, 2; 0, - 2; 1, 0; 0, 1) $

与上面求得的两个$𝒙$特解一致。

== 非齐次系统的解
<非齐次系统的解>

#theorem[
  已知矩阵$𝑨$及其零空间$"null"(𝑨)$，则非齐次系统$𝑨 𝒙 = 𝒃$的解集为$𝒙 = p + "null"(𝑨)$，其中$p$为该非齐次系统的特解。
]

对原齐次系统，令$𝒃 = mat(delim: "[", 1; 5; 6)$，为求$𝑨 𝒙 = 𝒃$的特解，先写出其增广矩阵$[𝑨 med|med 𝒃]$

$
  mat(
    delim: "[", 1, 2, 2, 2, b_1;
    2, 4, 6, 8, b_2;
    3, 6, 8, 10, b_3
  ) limits(⟶)^("eliminate")
  mat(
    delim: "[", 1, 2, 2, 2, b_1;
    0, 0, 2, 4, b_2 - 2 b_1;
    0, 0, 0, 0, b_3 - b_2 - b_1
  )
$

显然，有解的必要条件为$b_3 - b_2 - b_1 = 0$。

令所有自由变量取$0$，则有

$
  cases(delim: "{", x_1 + 2 x_3 = 1, 2 x_3 = 3) ⇒ cases(delim: "{", x_1 = -2, x_3 = 3 / 2)
$

代入$𝑨 𝒙 = 𝒃$求得特解

$ 𝒙_p = mat(delim: "[", - 2; 0; 3 / 2; 0) $

令$𝑨 𝒙 = 𝒃$成立的所有解

$ cases(delim: "{", 𝑨 𝒙_p = 𝒃, 𝑨 𝒙_n = 𝟎) ⇒ 𝑨(𝒙_p + 𝒙_n) = 𝒃 $

即$𝑨 𝒙 = 𝒃$的解集为其特解加上零空间，对本例有：

$
  𝒙 = mat(delim: "[", - 2; 0; 3 / 2; 0) + c_1 mat(delim: "[", - 2; 1; 0; 0) + c_2 mat(delim: "[", 2; 0; - 2; 1)
$

= 秩与解集
<秩与解集>

== 秩零定理
<秩零定理>

#theorem[
  对$m × n$矩阵$𝑨$有
  $ rank(𝑨) + rank("null"(𝑨)) = n $
]

#tip[
  即定义域的维度 = 值域的维度 + 零空间的维度
]

== 伪逆
<伪逆>

设$𝑨$为$m × n$（$m > n$）矩阵，则$𝑨^⊤ 𝑨$为$m × m$方阵。则

$
  𝑨 𝒙 = 𝒃 & ⇔ 𝑨^⊤ 𝑨 𝒙 = 𝑨^⊤ 𝒃        \
          & ⇔ 𝒙 = (𝑨^⊤ 𝑨)^(-1) 𝑨^⊤ 𝒃
$

记$𝑨^+ = (𝑨^⊤ 𝑨)^(-1) 𝑨^⊤$，可知

$ 𝑨 𝒙 = 𝒃 ⇔ 𝒙 = 𝑨^+ 𝒃 $

伪逆实际上是对 $norm(𝑨 𝒙 - 𝒃)$最小化。
