#import "lib/lib.typ": *
#show: chapter-style.with(title: "矩阵", info: info)

= 线性方程组
<线性方程组>

== 线性系统
<线性系统>

符合如下形式的方程

$ a_1 x_1 + a_2 x_2 + ⋯ + a_n x_n = b $

称为含有$n$元线性方程（linear equation）。其中，$a_1, a_2, ⋯ a_n$称为系数（coefficient）且不全为$0$，$x_1, x_2, ⋯ x_n$称为变量（variable）。

由$n$个变量$x_1, x_2, …, x_n$中的$m$个线性方程组，被称为线性系统（linear system），可以写成以下形式

$
        a_11 x_1 + a_12 x_2 + & ⋯ + a_(1 n) x_n = b_1 \
        a_21 x_1 + a_22 x_2 + & ⋯ + a_(2 n) x_n = b_2 \
                              & ⋮                     \
  a_(m 1) x_1 + a_(m 2) x_2 + & ⋯ + a_(m n) x_n = b_m
$

其中，下标$i$指的是方程，下标$j$指的是变量。

#theorem(title: "叠加原理")[
  又称线性可加性，是线性系统的充要条件

  对系统
  $ dot(x) = f(x) $

  若$x_1$和$x_2$为该系统的解，则$x_3 = k_1 x_1 + k_2 x_2$必为该系统的解，其中$k_1$和$k_2$为常数。
]

== 系数矩阵
<系数矩阵>

矩阵（matrix）是由多个大小相同向量水平或垂直堆叠而成的矩形数组，其组成单元称为条目（entry）或元素（element），其大小或形状是由其行数和列数共同指定。

矩阵常被用于表达线性方程组。线性系统中，等式左边的未知数系数可以多维数组的形式提取出来，称为系数矩阵（coefficient matrix）

$
  𝑨 = mat(
    delim: "[",
    a_11, a_12, ⋯, a_(1 n);
    a_21, a_22, ⋯, a_(2 n);
    ⋮, ⋮, ⋱, ⋮;
    a_(m 1), a_(m 2), ⋯, a_(m n)
  )
$

上式中，矩阵$𝑨$的条目$a_(i j)$中，第一个下标$i$指定所在的$𝑨$的行，第二个下标$j$指定所在的$𝑨$的列。

#tip[
  简单说，向量可以看作是一维矩阵。
]

== 增广矩阵
<增广矩阵>

将系数矩阵中右边的常数列写成

$ 𝒃 = mat(delim: "[", b_1; b_2; ⋮; b_m) $

当将常数向量$𝒃$与系数矩阵$𝑨$纵向堆叠时，得到矩阵

$
  mat(delim: "[", 𝑨, 𝒃) =
  mat(
    delim: "[",
    a_11, a_12, ⋯, a_(1 n), b_1;
    a_21, a_22, ⋯, a_(2 n), b_2;
    ⋮, ⋮, ⋱, ⋮, ⋮;
    a_(m 1), a_(m 2), ⋯, a_(m n), b_m
  )
$

这个矩阵称为线性系统的增广系数矩阵（augmented coefficient matrix），或简称增广矩阵。

= 矩阵初等运算
<矩阵初等运算>

== 矩阵加法
<矩阵加法>

#definition[
  当两个矩阵的行数、列数均分别相等时，称其为同型矩阵。
]

#definition[
  若$𝑨 = a_(i j)$和$𝑩 = b_(i j)$是同型矩阵，则其和$𝑨 + 𝑩$就是将矩阵$𝑨$和$𝑩$的相应元素相加得到的矩阵，此即为矩阵的加法

  $ 𝑨 + 𝑩 =[a_(i j) + b_(i j)] $

  其中，右边的符号表示矩阵$𝑨 + 𝑩$的第$i$行和第$j$列中的元素是$a_(i j) + b_(i j)$。
]

== 标量乘法
<标量乘法>

#definition[
  若$𝑨 = a_(i j)$是一个矩阵，$c$是一个常数，则$c 𝑨$是$𝑨$的每个元素乘以$c$得到的矩阵，此即为矩阵的标量乘法

  $ c 𝑨 =[c a_(i j)] $
]

利用标量乘法，可以定义矩阵$𝑨$的负数$-𝑨$和两个矩阵$𝑨$和$𝑩$的差值$𝑨-𝑩$，写法是

$
    -𝑨 & = (-1) 𝑨   \
  𝑨 -𝑩 & = 𝑨 + (-𝑩)
$

#let data = csv("data/vec-add.csv")
#figure(tableq(data, 4), caption: "矩阵初等运算", kind: table)

== 初等行运算
<初等行运算>

#definition[
  以下是矩阵$𝑨$的三种基本行操作\
  + 将$𝑨$的任意行做标量乘法\
  + 将$𝑨$的任意两行相加\
  + 将$𝑨$的两行互换
]

#definition[
  若一个矩阵可以通过有限次初等行运算从另一个矩阵中得到，则称为行等价（row equivalent）。
]

= 矩阵化简
<矩阵化简>

== 行梯队型
<行梯队型>

矩阵$𝑬$称为行梯队型（row echelon form，REF），只要它具有以下两个性质

+ 若$𝑬$有任何全零的行，则它们被分组在矩阵的底部。其他每行中的第一个（从左起）非零元素称为其前导条目（leading entry）或主元（pivot）
+ 主元（红色）形成了一个从左上到右下的"下楼梯"模式，如下所示

$
  𝑬 = mat(
    delim: "[",
    #emph(text(red)[2]), -1, 0, 4, \|, 7;
    0, #emph(text(red)[1]), 2, 0, \|, -5;
    0, 0, 0, #emph(text(red)[3]), \|, 0;
    0, 0, 0, 0, \|, 0
  )
$ <echelon>

设一个线性系统的增广矩阵是 REF，则那些对应于含有主元的列的变量称为前导变量（leading
variables），其他变量都称为自由变量（free variables）。

== Gaussian 消元
<Gaussian-消元>

对 Gaussian 消元适用于任何给定矩阵$𝑨$的方程组求解。

#note(title: "Gaussian 消元")[
  + 找到主元系数的绝对值最大的一行，通过初等行变换，将这一行变成第$1$行
  + 把第$1$行中的主元系数，通过初等行变换变为$1$
  + 通过第$1$行的系数为$1$的主元，把其他行的主元系数消除为$0$
  + 对下面的行不断重复上述步骤，直到每一行都至多有一个$1$，如@echelon 所示。此时就可以得到这个方程组的解，当然，也可能无解或有无数组解
]

简言之，从左到右逐列对矩阵$𝑨$进行处理。在每一列包含一个主元，"清除"它下面的非零元素，然后转到下一列。

== Gaussian-Jordan 消元
<Gaussian-Jordan-消元>

#definition[
  行最简梯队型（reduced row echelon form，RREF）$𝑬$是一个具有以下属性的梯队型

  + $𝑬$的每个主元均是$1$
  + $𝑬$的每个主元均是其列中唯一的非零元素
]

将矩阵$𝑨$转化为 RREF 的过程称为 Gaussian-Jordan 消元。

#note(title: "Gaussian-Jordan 消元")[
  + 首先用Gaussian 消除法将$𝑨$转化为梯队形式。
  + 然后将每行非零的元素除以其主元。
  + 最后，用每个主元 1 来”清除”其列中剩余的非零元素。
]

#theorem[
  每个矩阵都行等价于一个且仅有一个的 RREF。
]

= 矩阵的积
<矩阵的积>

== 向量积
<向量积>

矩阵的向量积，又称矩阵乘法（matrix multiplication），是向量乘法的叠加，代表线性映射（linear mapping）。如在$𝑨 𝒙 = 𝒃$中，矩阵$𝑨$扮演的角色就是完成$𝒙 → 𝒃$线性映射。

设$𝑨$是一个$m×n$矩阵，$𝑩$是一个$n×p$矩阵，则$𝑨 𝑩$被定义为$m×p$矩阵，其第$i$行，第$j$列的项由下式给出

$ 𝑪_(i j) = (𝑨 𝑩)_(i j) = sum_(k=1)^n a_(i k) b_(k j) $

如

$
  𝑪 & = 𝑨 𝑩                             \
    & = mat(delim: "[", 1, 2, 3; 4, 5, 6)
      mat(delim: "[", 1, 4; 2, 5; 3, 6) \
    & = mat(
        delim: "[",
        1×1 + 2×2 + 3×3, 1×4 + 2×5 + 3×6;
        4×1 + 5×2 + 6×3, 4×4 + 5×5 + 6×6
      )                                 \
    & = mat(delim: "[", 14, 32; 32, 77)
$

#tip[
  矩阵向量积，是向量向量积的加和。
]

== 张量积
<张量积>

张量积是两个任意大小的矩阵间的运算，是外积从向量到矩阵的推广。

$ 𝑪_(i j) = a_(i j) 𝑩 $

如

$
  𝑪 & = 𝑨 ⊗ 𝑩                         \
    & = mat(delim: "[", 1, 2; 3, 1) ⊗
      mat(delim: "[", 0, 3; 2, 1) & = mat(
                                      delim: "[",
                                      𝒂_1 ⊙ 𝒃_1;
                                      𝒂_1 ⊙ 𝒃_2;
                                      𝒂_2 ⊙ 𝒃_1;
                                      𝒂_2 ⊙ 𝒃_2
                                    ) \
    & = mat(
        delim: "[",
        1⋅0, 1⋅3, 2⋅0, 0⋅3;
        1⋅2, 1⋅1, 2⋅2, 2⋅1;
        0⋅0, 3⋅3, 1⋅0, 1⋅3;
        3⋅2, 3⋅1, 1⋅2, 1⋅1
      )                           & = mat(
                                      delim: "[",
                                      0, 3, 0, 6;
                                      2, 1, 4, 2;
                                      0, 9, 0, 3;
                                      6, 3, 2, 1
                                    )
$

张量积满足分配律和结合律，但不满足交换律，此外还有如下性质

- $(𝑨 ⊗ 𝑩)(𝑪 ⊗ 𝑫) = 𝑨 𝑪 ⊗ 𝑩 𝑫$
- $(𝑨 ⊗ 𝑩)^(-1) = 𝑨^(-1) ⊗ 𝑩^(-1)$
- $(𝑨 ⊗ 𝑩)^⊤ = 𝑨^⊤ ⊗ 𝑩^⊤$
- $𝑨 ⊗ 𝟎 = 𝟎 ⊗ 𝑨$

== 元素积
<元素积>

若矩阵$𝑨$和$𝑩$为同型矩阵，$a_(i j)$和$b_(i j)$分别为矩阵$𝑨$和$𝑩$的项，则乘积矩阵的第$i$行，第$j$列的项由下式给出

$ c_(i j) = a_(i j) b_(i j) $

== Frobenius 内积

Frobenius 内积是一种基于两个矩阵的二元运算，结果是一个数值。这个运算是一个将矩阵视为向量的逐元素内积。参与运算的两个矩阵必须有相同的维度、行数和列数，但不局限于方阵。可以看作是向量内积的推广。

$
  𝑨:𝑩 = ⟨𝑨, 𝑩⟩_F & = sum_j sum_j A_(i j)B_(i j)                                             \
                 & = mat(delim: "[", 2, 0, 6; 1, -1, 2):mat(delim: "[", 8, -3, 2; 4, 1, -5) \
                 & = 2⋅8 + 0⋅(-3) + 6⋅2 + 1⋅4 + (-1)⋅1 + 2⋅(-5)                             \
                 & = 21
$

Frobenius 内积是半双线性形式，其具有以下性质

- $⟨𝑨 + 𝑪, 𝑩 + 𝑫⟩_F = ⟨𝑨, 𝑩⟩_F + ⟨𝑨, 𝑫⟩_F + ⟨𝑪, 𝑩⟩_F + ⟨𝑪, 𝑫⟩_F$
- $⟨𝑨, 𝑨⟩_F ≥ 0$

#figure(
  table(
    columns: 3,
    align: center + horizon,
    inset: 4pt,
    stroke: table-three-line(rgb("000")),
    [*积*], [*又名*], [*表示*],
    [向量积], [叉积], [$𝑪_(m×n) = 𝑨_(m×p)⋅𝑩_(p×n)$],
    [张量积], [Kronecker 积], [$𝑪_(m p×n q) = 𝑨_(m×n) ⊗ 𝑩_(p×q)$],
    [元素积], [Hadamard 积], [$𝑪_(m×n) = 𝑨_(m×n) ⊙ 𝑩_(m×n)$],
    [内积], [Frobenius 内积], [$"Const" = 𝑨_(m×n) : 𝑩_(m×n)$],
  ),
  caption: "矩阵的积",
  kind: table,
)

= 矩阵的逆

== 初等矩阵
<初等矩阵>

#definition[
  若对$n$阶单位阵$𝑰$行运算就可以得到$n$阶方阵$𝑬$，则称为初等矩阵（elementary matrix）。
]

== 逆阵

#definition[
  若通过一系列初等行矩阵$𝑬_i$，可将矩阵$𝑨$变成单位阵$𝑰$，则这些初等行矩阵的乘积即$𝑨$的逆阵，即
  $ underbrace(𝑬_1 𝑬_2 … 𝑬_n, 𝑨^(-1) 𝑨) = 𝑰 $
]

#definition[
  对方阵$𝑨$，若存在如下矩阵$𝑩$，使得

  $ 𝑨 𝑩 = 𝑩 𝑨 = 𝑰 $

  则称$𝑨$可逆（invertible）或非奇异（non-singular）。
]

#theorem[
  当且仅当$n$阶方阵$𝑨$与$n$阶单位阵$𝑰$行等价时，$n$阶方阵$𝑨$可逆。
]

对矩阵

$ 𝑨 = mat(delim: "[", 1, 3; 2, 7) $
构造矩阵

$ mat(delim: "[", 1, 3, 1, 0; 2, 7, 0, 1) $
使用 Gaussian-Jordan 方法，将$[𝑨 𝑰]$变为$[𝑰 𝑨^(-1)]$

$
  mat(delim: "[", 1, 3, 1, 0; 2, 7, 0, 1) & ⇒
                                            mat(delim: "[", 1, 3, 1, 0; 0, 1, -2, 1)  \
                                          & ⇒
                                            mat(delim: "[", 1, 0, 7, -3; 0, 1, -2, 1)
$

#theorem[
  若矩阵$𝑨$是可逆的，则只存在一个矩阵$𝑩$，使$𝑨 𝑩 = 𝑩 𝑨 = 𝑰$。
]

== 逆的性质
<逆的性质>

#theorem[
  若矩阵$𝑨$可逆，则

  - $𝑨^(-1)$可逆，且$(𝑨^(-1))^(-1) = 𝑨$
  - $𝑨^⊤$可逆，且$(𝑨^⊤)^(-1) = (𝑨^(-1))^⊤$
  - $λ 𝑨$可逆（λ ≠ 0），且$(λ 𝑨)^(-1) = 1 / λ 𝑨$
  - 若$n$为非负整数，则$𝑨^n$可逆，且$(𝑨^n)^(-1) = (𝑨^(-1))^n$
]

#theorem[
  若同型矩阵$𝑨$和$𝑩$可逆，则乘积$𝑨 𝑩$可逆，且$(𝑨 𝑩)^(-1) = 𝑩^(-1) 𝑨^(-1)$。
]

#theorem[
  对二阶方阵
  $ 𝑨 = mat(delim: "[", a, b; c, d) $

  当且仅当$a d = b c ≠ 0$，则是可逆的，在这种情况下
  $ 𝑨^(-1) = frac(1, a d - b c) mat(delim: "[", d, - b; - c, a) $
]

= 矩阵的转置
<矩阵的转置>

此前的《向量》一章已经提到向量转置，本章的矩阵转置可以看作是向量转置的一种推广。

#definition[
  矩阵$𝑨$的转置，是由$𝑨$通过交换行和列得到的矩阵。其项由以下公式给出

  $ (𝑨^⊤)_(i j) = 𝑨_(j i) $
]

矩阵的转置有以下性质

- 对偶率：$(𝑨 𝑩)^⊤ = 𝑩^⊤ 𝑨^⊤$ ⇒ $(𝑨^⊤)^n = (𝑨^n)^⊤$,
- 加法：$(𝑨 + 𝑩)^⊤ = 𝑨^⊤ + 𝑩^⊤$,
- 标量乘法：$(c 𝑨)^⊤ = c 𝑨^⊤$

= 分块矩阵
<分块矩阵>

== 运算规则
<运算规则>

设分块矩阵$𝑨$为

$
  𝑨 = mat(
    delim: "[",
    𝑨_11, …, 𝑨_(1 r);
    ⋮, ⋮, ⋮;
    𝑨_(s 1), …, 𝑨_(s r)
  )
$

则

$
  𝑨^⊤ = mat(
    delim: "[",
    𝑨_11^⊤, …, 𝑨_(s 1)^⊤;
    ⋮, ⋮, ⋮;
    𝑨_(1 r)^⊤, …, 𝑨_(s r)^⊤
  )
$

若矩阵$𝑩$为矩阵$𝑨$的同型矩阵，且采用相同的分块方法，则

$
  𝑨 + 𝑩 = mat(
    delim: "[",
    𝑨_11 + 𝑩_11, …, 𝑨_(1 r) + 𝑩_(1 r);
    ⋮, ⋮, ⋮;
    𝑨_(s 1) + 𝑩_(s 1), …, 𝑨_(s r) + 𝑩_(s r)
  )
$

易知

$
  λ 𝑨 = mat(
    delim: "[",
    λ 𝑨_11, …, λ 𝑨_(1 r);
    ⋮, ⋮, ⋮;
    λ 𝑨_(s 1), …, λ 𝑨_(s r)
  )
$

#theorem[
  设分块矩阵$𝑨 = mat(delim: "[", 𝑩, 𝑶; 𝑪, 𝑫)$，则有
  $ |𝑨| = |𝑩| |𝑫| $
]

== 分块对角阵
<分块对角阵>

#definition[
  设$𝑨$是方阵，若$𝑨$的分块矩阵在对角线上的子块$𝑨_i$均为方阵，其余子块均为零矩阵，则称$𝑨$为分块对角阵，即

  $
    𝑨 = mat(
      delim: "[",
      𝑨_1, med, med, 𝑶;
      med, 𝑨_2, med, med;
      med, med, ⋱, ;
      𝑶, med, med, 𝑨_s
    )
  $
]

#theorem[
  分块对角阵的秩 = 其对角线上子块的秩之和，即

  $ rank(𝑨) = sum_(i=1)^s rank(𝑨_i) $
]

若矩阵$𝑩$为矩阵$𝑨$的同型矩阵，且采用相同的分块方法，则

$
  𝑨 𝑩 = mat(
    delim: "[",
    𝑨_1 𝑩_1, med, med, 𝑶;
    med, 𝑨_2 𝑩_2, med, med;
    med, med, ⋱, ;
    𝑶, med, med, 𝑨_s 𝑩_s
  )
$

当$𝑨$可逆，且当且仅当$𝑨_i$均可逆时，有

$
  𝑨^(-1) = mat(
    delim: "[",
    𝑨_1^(-1), med, med, 𝑶;
    med, 𝑨_2^(-1), , ;
    med, med, ⋱, med;
    𝑶, med, med, 𝑨_s^(-1)
  )
$

= 常用恒等式
<常用恒等式>

== 逆阵相关

#theorem[
  $ (𝑰 + 𝑷)^(-1) = 𝑰 - 𝑷(𝑰 + 𝑷)^(-1) $
]

#lemma(title: "矩阵求逆引理")[
  设方阵$𝑨$可逆，若$𝑨 + 𝑼 𝑪 𝑽$可逆，则
  $ (𝑨 + 𝑼 𝑪 𝑽)^(-1) = 𝑨^(-1) - 𝑨^(-1)𝑼 (𝑪 + 𝑽 𝑨^(-1)𝑼)𝑽 𝑨^(-1) $
]

#corollary(title: "Push-Through 等式")[
  $ (𝑰 + 𝑼 𝑽)^(-1)𝑼 = 𝑼(𝑰 + 𝑽 𝑼)^(-1) $
  这里，$𝑼 = 𝑨^(-1)𝑿, 𝑽 = 𝑪 𝒀$
]

#corollary[
  当$𝑨 = 𝑪 = 𝑰$，有
  $ (𝑰 + 𝑼 𝑽)^(-1) = 𝑰 - 𝑼(𝑰 + 𝑽 𝑼)^(-1)𝑽 $
]

#corollary(title: "秩 1 校正")[
  当$𝑪 = 𝑰$，有
  $ (𝑨 + 𝑼 𝑽^(H))^(-1) = 𝑨^(-1) - frac(𝑨^(-1) 𝑼 𝑽^(H)𝑨^(-1), 1 + 𝑽^(H)𝑨^(-1)𝑼) $
]

秩 1 校正的思想来源于下式，借助了$β^H α$为常数的性质

$
  (𝑰 + α β^H)^(-1) = 𝑰 + sum_(i=1)^n (-1)^i α (β^H α)^(i-1) = 𝑰 - frac(α β^H, 1 + β^H α)
$
