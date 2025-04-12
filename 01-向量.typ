#import "@preview/qooklet:0.2.0": *
#show: qooklet.with(
  title: "向量",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
)

= 向量的定义
<向量的定义>

在我们开始前，先对本书中的符号书写进行一下约定

- 向量：斜体，加粗，小写
- 矩阵：斜体，加粗，大写

== 向量

#definition[
  $n$个有序的数$a_1, a_2, …, a_n$组成的数组称为$n$维向量（vector），用$𝒗$表示。其中，第$i$个数$a_i$称为$𝒗$的第$i$个分量。$n$称为$𝒗$的维度。
]

向量可以写成一列，也可以写成一行，分别称为列向量和行向量，行向量和列向量可以通过转置（transpose）相互转化，转置运算符为向量的上标$⊤$，如

$ vecrow(delim: "[", a_1, a_2, …, a_n)^(⊤) = vec(a_1, a_2, ⋮, a_n) $

== 特殊向量

#definition[
  若$n$维向量的所有分量都是$0$，则称为零向量，记作$𝟎$。
]

#definition[
  若$n$维向量的所有分量都是$1$，则称为全一向量，记作$𝟏$。
]

#tip[
  若将向量看作空间的点，则零向量可以被看作空间中的原点。
]

= 向量的长度
<向量的长度>

#definition[
  给定向量$𝒂$
  $ 𝒂 = vecrow(delim: "[", a_1, a_2, …, a_n)^(⊤) $

  则
  $ norm(𝒂) = sqrt(∑_(i=1)^n a_i^2) $

  称为向量的长度，或向量的模（norm），也可以认为是点$(a_1, a_2, …, a_n)$到原点的距离。
]

#tip[
  向量的模又称向量的范数，这里采用的是$ℓ_2$范数的定义，即 Euclidean 距离。
]

向量的模有如下性质

- $norm(𝒂) ≥ 0$
- $norm(k 𝒂) = norm(k)norm(𝒂)$

== 单位向量

#definition[
  长度为$1$的向量称为单位向量（unit vector），可由非零向量除以自身的模得到，即

  $ macron(𝒂) = frac(𝒂, norm(𝒂)) $
]

= 向量的运算
<向量的运算>

== 向量初等运算

$
  𝒗 = mat(delim: "[", v_1; v_2) "and" 𝒘 = mat(delim: "[", w_1; w_2) ⇒ 𝒗 + 𝒘 = mat(delim: "[", v_1 + w_1; v_2 + w_2)
$

#tip[
  注意，$-𝒗$与$𝒗$之和是零向量$𝟎$，这和数字$0$不一样，$𝟎$有分量$0$和$0$。
]

#figure(
  image("images/vec-add.png", width: 40%),
  caption: "向量加法",
  supplement: "图",
)

标量乘法是加法的推广，令$c$为常数，则有

$ c 𝒗 = vec(c v_1, c v_2) $

#figure(
  xlsx-parser(
    read("data/matrix.xlsx", encoding: none),
    parse-table-style: false,
    parse-stroke: false,
    stroke: three-line(rgb("000")),
  ),
  caption: "向量的和",
  supplement: "表",
  kind: table,
)

#tip[
  标量乘法的几何意义即缩放。
]

== 向量的积

=== 内积

向量内积（inner product）为行向量 × 列向量，由于结果是标量，故又称标量积

$
  𝒂^(⊤) 𝒃 = 𝒂⋅𝒃 = ⟨𝒂, 𝒃⟩ &= a_1b_1 + a_2b_2 \
  &= frac(𝒂, norm(𝒂)) frac(𝒃, norm(𝒃)) cos θ
$

其中，$⟨⟩$为内积符号，$θ$为$𝒂$和$𝒃$的夹角。

广义的向量内积还有以下性质

- 正定性：$⟨𝒗, 𝒗⟩ ≥ 0$，当且仅当$𝒗 = 𝟎$时，等号成立
- 交换律：$⟨𝒖, 𝒗⟩ = ⟨𝒗, 𝒖⟩$
- 偏齐次可加性：$⟨𝒖 + 𝒗, 𝒘⟩ = ⟨𝒖, 𝒘⟩ + ⟨𝒗, 𝒘⟩$
- 共轭对称：$⟨𝒖, 𝒗⟩ = overline(⟨𝒗, 𝒖⟩)$

=== 叉积

向量叉积（cross product）运算相对复杂，由于结果是向量，故又称向量积

$ 𝒂 × 𝒃 = norm(𝒂)norm(𝒃) sin θ $

其中，$θ$为$𝒂$和$𝒃$的夹角。叉积的结果为$𝒂$和$𝒃$所在平面的法线向量，与$𝒂$和$𝒃$均垂直。其意义为$𝒂$和$𝒃$围成的平行四边形面积。

叉积的应用广泛，性质也很多

- $𝒂 × 𝒃 = - 𝒃 × 𝒂$
- $(λ 𝒂) × 𝒃 = 𝒂 × (λ 𝒃)$
- $|𝒂 × 𝒃| = |𝒃 × 𝒂|$
- $𝒂⋅(𝒃 × 𝐜) = (𝒂 × 𝒃)⋅𝐜$

空间解析几何中，向量叉积又被称为外部积（exterior product），结果向量方向遵循右手法则

$
  𝒂 × 𝒃 &=
  mdet(
𝒊, 𝒋, 𝒌;
x_1, y_1, z_1;
x_2, y_2, z_2
) \ &=
  (y_1 z_2 - y_2 z_1)𝒊 -
  (x_1 z_2 - x_2 z_1)𝒋 +
  (x_1 y_2 - x_2 y_1)𝒌
$

=== 外积

向量外积（outer product）为列向量 × 行向量，由于结果是矩阵，故又称张量积

$ 𝒂 ⊗ 𝒃 = mat(delim: "[", a_1b_1, a_1b_2; a_2b_1, a_2b_2) $

由于向量的张量积满足$(𝒂 ⊗ 𝒃)^(⊤) = 𝒃 ⊗ 𝒂$，矩阵可以写成张量积形式。

== 运算律

#figure(
  xlsx-parser(
    read("data/matrix.xlsx", encoding: none),
    parse-table-style: false,
    parse-stroke: false,
    stroke: three-line(rgb("000")),
    sheet-index: 1,
  ),
  caption: "向量的积",
  supplement: "表",
  kind: table,
)

#pagebreak()

= 向量范数
<向量范数>

== _p_-范数

#definition[
  _p_-范数又称 Minkowski 是一组距离的定义，而非一种距离，其表述如下
  对向量$𝒙 = 𝒗_1, 𝒗_2, …, 𝒗_m$，则其 _p_-范数由下式定义
  $ norm(𝒙)_p = (∑|x_i|^p)^(1 / p) $
]

#theorem[
  设$𝒙 ∈ 𝒱$
  - 非负性：$norm(𝒙) ≥ 0$，当且仅当$𝒙 = 𝟎$时，$norm(𝒙) = 0$
  - 齐次性：$norm(λ 𝒙) = |λ| norm(𝒙), med ∀λ ∈ 𝔽$
]

当$p > 1$时，$norm(𝒙)_p$的等高线为凸函数，其满足次可加性（三角不等式），即

$ norm(𝒙 + 𝒚)_p ≤ norm(𝒙)_p + norm(𝒚)_p $
当$0 < p < 1$时，$norm(𝒙)_p$的等高线非凸非凹，不满足次可加性。

#figure(
  table(
    columns: 4,
    align: center + horizon,
    inset: 4pt,
    stroke: three-line(rgb("000")),
    [*范数*], [*又名*], [*数学含义*], [*公式*],
    [$ℓ_2$], [Euclidean 距离], [], [$sqrt(∑x_i^2)$],
    [$ℓ_1$], [Manhattan 距离], [向量元素绝对值之和], [$∑ |x_i|$],
    [$ℓ_∞$], [Chebyshev 距离], [向量元素绝对值的最大值], [$arg max |x_i|$],
  ),
  caption: "向量 _p_-范数",
  supplement: "表",
  kind: table,
)

对同一向量

$ norm(𝒙)_∞ ≤ norm(𝒙)_x ≤ norm(𝒙)_p $
