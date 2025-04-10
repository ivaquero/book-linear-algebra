#import "@preview/qooklet:0.1.1": *
#show: doc => conf(
  title: "二次型与正定",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
  doc,
)

= 正定阵
<正定阵>

== 二次型
<二次型>

#definition[
  关于一些变量的二次齐次多项式被称为二次型（quadratic form）。
]

如

$ cases(delim: "{", 3 x_1^2 + 2 x_1 x_2 + x_2^2, x_1^2 - 2 x_2^2) $ <qua-form>

由上，根据矩阵乘法，二次型式 @qua-form 中的 (2) 式可以写成

$
  x_1^2 - 2 x_2^2 &= 3 x_1⋅x_1 - 2 x_2⋅x_2\
  &= mat(delim: "[", 3 x_1 - 7 x_2) mat(delim: "[", x_1; x_2)\
  &= mat(delim: "[", x_1, x_2) mat(delim: "[", 3, 0; 0, - 7) mat(delim: "[", x_1; x_2)
$

令$𝒙 = mat(delim: "[", x_1; x_2)$且$𝑨 = mat(delim: "[", 3, 0; 0, - 7)$，则

$ x_1^2 - 2 x_2^2 = 𝒙^(⊤) 𝑨 𝒙 $

#theorem[
  设$f$是定义在$ℝ^n$上的二次型，则其可写作
  $ f = 𝒙^(⊤) 𝑨 𝒙 $

  其中，$𝑨$为$n$阶对称阵，矩阵$𝑨$称为$f$的二次型矩阵。
]

== 正定与负定
<正定与负定>

#definition[
  设二次型$f(x) = 𝒙^(⊤) 𝑨 𝒙$，则$𝑨$是
  - 正定的：若$∀𝒙 ≠ 𝟎, med f(𝒙) > 0$
  - 半正定的：若$f(𝒙) ≥ 0$
  - 负定的：若$∀𝒙 ≠ 𝟎, med f(𝒙) < 0$
  - 半负定的：若$f(𝒙) ⩽ 0$
  - 不定的：若$f(𝒙)$有正有负
]

对二次型$f(x) = 1/2 𝒙^(⊤) 𝑨 𝒙 + 𝒃^(⊤) 𝒙 + c$，有

- $∇ f(x) = 𝑨 𝒙 + 𝒃$
- $laplacian f(x) = 𝑨$

若$𝑨$正定，则$f(x)$有全局唯一最小值；若$𝑨$半正定，则$f(x)$有全局最小值。

此外，向量的内积也可以写成正定形式，即

$ ⟨x, y⟩ := 𝒙^(⊤) 𝑨 𝒚 $

== 正定的性质
<正定的性质>

#theorem[
  矩阵正定 ⇔ 矩阵的特征值均 > 0
]

#theorem("Hurwitz 定理")[
  已知二次型$f(x) = 𝒙^(⊤) 𝑨 𝒙$，其为正定的充要条件为，$𝑨$的各阶主子式均为正，即

  $
    a_11 > 0, mdet( a_11, a_12; a_21, a_22) > 0, mdet( a_11, …, a_(1 n); ⋮, ⋱, ⋮; a_(n 1), …, a_(n n)) > 0
  $

  为负定的充要条件是
  $(-1)^r mdet( a_11, …, a_(1 n); ⋮, ⋱, ⋮; a_(n 1), …, a_(n n)) > 0, med r ∈ [1, n]$
]

#theorem[
  - 正定阵的逆阵也是正定的
  - 正定阵之和也是正定的
]

== 合同矩阵
<合同矩阵>

#definition[
  设矩阵$𝑨$和$𝑩$为$n$阶方阵，若存在可逆阵$𝑷$，使得
  $ 𝑩 = 𝑷^(⊤) 𝑨 𝑷 $

  则称矩阵$𝑨$和$𝑩$合同（congruence）。合同矩阵就是二次型的坐标变换矩阵。合同变换会保持正定性质。
]

#theorem[
  若$𝑨$为对称阵，则其合同矩阵$𝑩$也是对称阵，记作

  $ 𝑨 ≃ 𝑩 $

]

#theorem("传递性")[
  若$𝑨 ≃ 𝑩$，且$𝑩 ≃ 𝑪$，则
  $ 𝑨 ≃ 𝑪 $

]

#theorem[
  合同矩阵的秩相同。
]

由合同的性质，可证明 Sylvester's 惯性定理。

#theorem("Sylvester's 惯性定理")[

  对于某二次型$f$，可化为多个标准型。其以下指标都相同

  - 正惯性指数（正系数的数目）
  - 负惯性指数（负系数的数目）
  - 0 系数
]

#pagebreak()

= 二维应用
<二维应用>

== Lagrange 配方法
<Lagrange-配方法>

#theorem("Lagrange 配方法")[
  + 遇到平方项$x_i^2$，先对其进行配方
  + 遇到交叉项$x_i x_j$，且没有对应平方项，进行换元

  $
    cases(delim: "{", x_i = y_i + y_j,
  x_j = y_i - y_j,
  x_k = y_k \, med k ∈ [1, n] \, med k ≠ i\, med j)
  $

  得到平方项后回到步骤 1

  #set enum(numbering: "1.", start: 3)

  + 不断重复直至消除所有交叉项
]

== 双曲线
<双曲线>

判断以下二次型的曲线类型

$ x_1 x_2 = 1 $

通过 Lagrange 配方法换元，有

$ cases(delim: "{", x_1 = y_1 + y_2, x_2 = y_1 - y_2) $

从而有

$ x_1 x_2 = 1 ⟶ y_1^2 - y^2 = 1 $

上述过程可改写为

$
  cases(delim: "{",
x_1 = y_1 + y_2,
x_2 = y_1 - y_2) ⟹
  mat(delim: "[", x_1; x_2) =
  mat(delim: "[", 1, 1; 1, -1) mat(delim: "[", y_1; y_2)
$

令三个部分分别为$[𝒙]_ɛ$、$𝐌$和$[𝒙]_ℳ$，可得坐标变换公式

$ [𝒙]_ɛ = 𝐌 [𝒙]_ℳ $

即

$
  x_1 x_2 = [𝒙]_ɛ^(⊤) mat(delim: "[", 0, 1/2; 1/2, 0)[𝒙]_ɛ
  &= (𝐌 [𝒙]_ℳ^(⊤)) mat(delim: "[", 0, 1/2; 1/2, 0) 𝐌 [𝒙]_ℳ \
  &= [𝒙]_ℳ^(⊤) 𝐌^(⊤) mat(delim: "[", 0, 1/2; 1/2, 0) 𝐌_ℳ [𝒙]_ℳ\
  &= [𝒙]_ℳ^(⊤) mat(delim: "[", 1, 1; 1, -1) mat(delim: "[", 0, 1/2; 1/2, 0) mat(delim: "[", 1, 1; 1, -1)[𝒙]_ℳ \
  &= [𝒙]_ℳ^(⊤) mat(delim: "[", 1, 0; 0, -1)[𝒙]_ℳ
$

#pagebreak()

令

$ 𝑨 = mat(delim: "[", 0, 1/2; 1/2, 0), λ = mat(delim: "[", 1, 0; 0, -1) $

不难得出

$ 𝑨 ≃ λ $

== 圆

对圆心为$(x_0, x_1)$，半径为$r$的圆，有方程

$ (x_0 - α_0)^2 + (x_1 - α_1)^2 = r^2 $

其可被重写为

$
  vecrow(delim: "[", (x_0 - α_0), (x_1 - α_1)) mat(delim: "[", 1, 0; 0, 1) mat(delim: "[", (x_0 - α_0);(x_1 - α_1)) = r^2
$

记位置向量$mat(delim: "[", x_0; x_1)$为$𝒙$，圆心为$𝛂$，则有

$ (𝒙 - 𝛂)^(⊤) 𝑰(𝒙 - 𝛂) = r^2 $

以这种矩阵格式表述，它不再局限于二维。事实上，它是一个超球体。

== 椭圆

对椭圆

$ (x_0 - α_0)^2 / β_0^2 + (x_1 - α_1)^2 / β_1^2 = 1 $

记位置向量为$𝒙 = mat(delim: "[", (x_0 - α_0));(x_1 - α_1)$，则

$ 𝒙^(⊤) 𝜦 𝒙 = 1 $

其中，对角阵为

$ λ = mat(delim: "[", 1/a^2, 0; 0, 1/b^2) $

椭圆在新的（旋转的）坐标系中的方程是

$ (𝑹 𝒙)^(⊤) 𝜦(𝑹 𝒙) = 1 ⇔ 𝒙^(⊤)(𝑹^(⊤) 𝜦 𝑹) 𝒙 = 1 $

椭圆的广义方程为

$ 𝒙^(⊤) 𝑨 𝒙 = 1 $

其中，$𝑨 = (𝑹^(⊤) 𝜦 𝑹)$为对称阵。

等价地，可以使用，$𝑸 = frac(𝒙^(⊤) 𝑨 𝒙, 𝒙^(⊤) 𝒙)$。在所有可能的方向$hat(𝒙)$上搜索，检查哪个方向上$𝑸 = hat(𝒙)^(⊤) 𝑨 hat(𝒙)$最小。对角化，可得

$ 𝑸 &= 𝒙^(⊤)𝑨 𝒙 = 𝒙^(⊤)𝑺 𝜦 𝑺^(⊤)𝒙 $

其中，$𝑺 = (𝒆_1 med 𝒆_2 med … med 𝒆_n)$为$𝑨$的特征向量。$λ$为由$𝑨$的特征值构成的对角阵。

令$hat(𝐲) = 𝑺^(⊤) 𝒙$，则有

$ 𝑸 = hat(𝐲)^(⊤) 𝜦 hat(𝐲) $

注意，由于$𝑨$是对称的，其特征向量是正交的。这意味着$𝑺$是一个正交阵，即$𝑺 𝑺^(⊤) = 𝑰$。且$norm(hat(𝐲))^2 = 1$。于是

$
  𝑸 &= mat(delim: "[", y_1, y_2, …, y_n) mat(delim: "[", λ_1, 0, …, 0; 0, λ_2, …, 0; ⋮, ⋮, ⋮, ⋮; 0, 0, …, λ_n) mat(delim: "[", y_1; y_2; ⋮; y_n)
  = ∑_(i=1)^n λ_i y_i^2
$

#tip[
  可以假设，特征值按大小顺序递减排序。
]

因此

- 当$hat(𝒙)$沿着$𝑨$的最大特征值对应的特征向量时，二次型$𝑸 = hat(𝒙)^(⊤) 𝑨 hat(𝒙)$最大
- 当$hat(𝒙)$沿着$𝑨$的最小特征值对应的特征向量时，二次型取得最小值

