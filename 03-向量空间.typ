#import "@local/qooklet:0.1.0": *
#show: doc => conf(
  title: "向量空间",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
  doc,
)

= 向量空间
<向量空间>

== 定义

#definition[
  设集合$𝔽$的元素$a$，经过运算$f$后，结果$f(a)$仍在$𝔽$中，则称$𝔽$对运算$f$封闭。
]

#definition[
  设$𝒱$为一向量组（list），若$𝒱$非空，且$𝒱$对向量加法与向量标量乘法均封闭，则称$𝒱$向量空间。
]

由定义，对任意向量空间

- 必须包含原点（origin）
- 若$𝒂 ∈ V, 𝒃 ∈ V$，则$𝒂 ± 𝒃 ∈ V$
- 若$𝒂 ∈ V, k ∈ ℝ$，则$k 𝒂 ∈ V$

#definition[
  所有$n$维向量构成的集合是一个向量空间$ℝ^n$：
  $ ℝ^n = {(x_1, x_2, …, x_n)|n ∈ ℕ, x_n ∈ ℝ}, n ≥ 1 $
]

== 子空间

#definition[
  若$𝒱$的一个子集$𝒰$亦为一个向量空间，则称其为$𝒱$的子空间。
]

#definition[
  设$𝒰_1, …, 𝒰_m$是$𝒱$的子集，$𝒰_1, …, 𝒰_m$的和表示为$𝒰_1 + … + 𝒰_m$是$𝒰_1, …, 𝒰_m$所有可能的元素和的集合。即

  $ ∑_(i=1)^m 𝒰_i = {∑_(i=1)^m u_i: u_1 ∈ 𝒰_1, …, u_m ∈ 𝒰_m} $
]

== 向量组

#definition[
  设$n$是一个非负整数。一个长度为$n$的向量组（list）是一个由$n$个元素组成的有序集合，具有形式

  $ (x_1, …, x_n) $
]

当且仅当两个向量组具有相同的长度和相同的元素顺序时，它们是相等的。

#tip[
  向量组与集合有两点不同：

  - 在向量组中，顺序很重要，且允许重复；
  - 在集合中，顺序和重复无关紧要，因为集合立足于元素的唯一性。
]

#definition[
  $𝔽^n$是$𝔽$中元素长度为$n$的所有向量组的集合：

  $ 𝔽^n = {(x_1, …, x_n) : x_j ∈ F ∀j = 1, …, n} $
]

这里定义了由域中元素所组成的向量组，若是由数组成的域则称为数域，即当域是数域时这里定义了有序数组。

#definition[
  令$𝟎$表示长度为$n$的向量组，其坐标均是$0$：
  $ 𝟎 = (0, …, 0) $
]

#tip[
  0有时可表示一个数字，有时可表示一个向量组
]

== 向量组

#definition[
  若干同维度的向量$𝒂_1, 𝒂_2, …, 𝒂_m$所组成的集合$A$，被称为向量组，记作

  $ A = 𝒂_1, 𝒂_2, …, 𝒂_m $
]

= 线性相关性
<线性相关性>

== 线性组合

#definition[
  给定向量组$𝒜 = 𝒂_1, 𝒂_2, …, 𝒂_m$和向量$𝒃$，若存在一组实数
  $k_1, k_2, …, k_m$，使得

  $ 𝒃 = ∑_(i=1)^m k_i 𝒂_i $

  则称向量$𝒃$为向量组$𝒜$的线性组合，或称向量$𝒃$能由向量组$𝒜$线性表示。
]

== 线性相关

#definition[
  给定向量组$𝒜 = 𝒂_1, 𝒂_2, …, 𝒂_m$，若存在不全为零的实数$k_1, k_2, …, k_m$，使得

  $ ∑_(i=1)^m k_i 𝒂_i = 𝟎 $

  则称向量组$𝒜$是线性相关的，否则是线性无关的。
]

== 张成（跨度）

#definition[
  $𝒱$中向量的向量组$𝒗_1, …, 𝒗_m$的所有线性组合的集合称为该向量组的张成（span），表示为$"span"(𝒗_1, …, 𝒗_m)$。即

  $ "span"(𝒗_1, …, 𝒗_m) = {∑_(i=1)^m a_i 𝒗_i : a_1, …, a_m ∈ F} $
]

#tip[
  空向量组的张成定义为${0}$。即，张成是最小的包含子空间。
]

#definition[
  若向量空间中的某个向量向量组张成了空间，则称为有限维向量空间。
]

== 等价向量组

#definition[
  设有两个向量组$𝒜 = 𝒂_1, 𝒂_2, …, 𝒂_m$和$B = 𝒃_1, 𝒃_2, …, 𝒃_m$，若向量组$B$中的每个向量都能由向量组$𝒜$线性表示，则称向量组$B$能由向量组$𝒜$线性表示。若两个向量组能相互线性表示，则称其等价。
]

#theorem[
  设有两个向量组$𝒜 = 𝒂_1, 𝒂_2, …, 𝒂_m$和$ℬ = 𝒃_1, 𝒃_2, …, 𝒃_m$，则$𝒜$和$ℬ$等价 ⇔ $"span"(𝒜) = "span"(ℬ)$
]

== 最大无关组

#definition[
  设有向量组$𝒜$，若其中存在$r$个向量$𝒂_1, 𝒂_2, …, 𝒂_r$满足]

- 向量组$𝒜_0 = { 𝒂_1, 𝒂_2, …, 𝒂_r }$线性无关
- 设有向量组$𝒜$中任意$r + 1$个向量均线性相关

则称向量组$𝒜_0$是向量组$𝒜$的一个最大线性无关组，简称最大无关组。

= 秩、基、维度
<秩-基-维度>

== 向量组的秩

#definition[
  假设向量组$𝒜$的最大无关组为
  $ 𝒜_0 = {𝒂_1, 𝒂_2, …, 𝒂_r} $

  $𝒜_0$的向量组个数$r$称为向量组$𝒜$的秩，记作$rank(𝒜)$，或$r(𝒜)$。
]

== 向量空间的基

#definition[
  向量空间$𝒱$中，任意最大无关组均称为$𝒱$的一个基（basis）。
]

#theorem[
  在$𝒱$中的向量向量组$𝒗_1, …, 𝒗_n$是$𝒱$的基，当且仅当每个$𝒗 ∈ V$中能被唯一地写成形式

  $ 𝒗 = ∑_(i=1)^n a_i 𝒗_i $

  其中，$a_i ∈ 𝔽$

  - 向量空间中的每个张成向量组都可化简成向量空间的基
  - 每个有限维向量空间都有一个基
  - 有限维向量空间中每个线性无关的向量向量组都可扩展为向量空间的基
  - 有限维向量空间的任何两个基都具有相同的长度
]

#theorem[
  设$𝒮 = { 𝒗_1, 𝒗_2, …, 𝒗_n }$是向量空间$𝒱$的基，则$𝒱$中的任何一组超过$n$个向量均是线性相关的。
]

== 向量空间的维度

#definition[
  向量空间的任意基的长度，称为有限维向量空间的维度。
]

#corollary[
  设$𝒱$是有限维的

  - $𝒱$中每个长度为$dim 𝒱$的线性无关向量向量组均是$𝒱$的基
  - $𝒱$中每个长度为$dim 𝒱$的向量张成向量组均是$𝒱$的基
  - 若$𝒰$是$𝒱$的一个子空间，则$𝒰 ⩽ dim 𝒱$
  - 若$𝒰_1$和$𝒰_2$是$𝒱$的两个子空间，则
    $ dim(𝒰_1 + 𝒰_2) = dim 𝒰_1 + dim 𝒰_2 - dim(𝒰_1 inter 𝒰_2) $
]
