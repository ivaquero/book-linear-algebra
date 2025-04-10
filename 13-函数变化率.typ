#import "@preview/qooklet:0.1.1": *
#show: doc => conf(
  title: "函数变化率",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
  doc,
)

= 一元函数的变化
<一元函数的变化>

- 一元函数：$f: ℝ → ℝ$
- 多元函数：$f: ℝ^n → ℝ$
- 向量函数：$arrow(f): ℝ^n → ℝ^m$
微积分需要连续，连续需要无穷小。

== 导数
<导数>

当函数$f(x)$满足以下条件时，其在$x = x_0$有导数$f^′(x_0)$

- $f(x)$连续
- $lim_(x → x_0^-) f(x) = lim_(x → x_0^+) f(x)$

系统中，采用导数来表达速率，这里涉及两种表达方式。

$
  "Leibniz": dv(X, t) = lim_(Δ t → 0) lr(frac(Δ X, Δ t)|)_(t_0)\
  "Newton": X^′ = lim_(Δ t → 0) lr(frac(Δ X, Δ t)|)_(t_0)
$

这里，$dd(X)$和$dd(t)$本身并没有什么含义，$X^′$通常表示$dv(X, t)$。

#tip[
  灵敏度：$Y$相对于$X$的瞬时变化率。
]

#figure(
  image("images/func-deriv.png", width: 80%),
  caption: "导数",
  supplement: "图",
)

$
  "as" Δ x & ⇒ & 0\
  "secant lines" & ⇒ & "tangent line"\
  "slope of secant lines" & ⇒ & "slope of tangent line"\
  "average rates of change" & ⇒ & "instantaneous rate of change"
$

#pagebreak()

=== 非指数型导数
推导可使用矩形面积变化，即给边长赋予相应的值，如$x sin(x)$

+ 令边长分别为$x$和$sin(x)$，则面积$A = x sin(x)$
+ 令两边分别增长$dd(x)$和$dd(s)in(x)$，可得新面积$A^′$
+ $Δ A = x^2 d(sin(x)) + d(x^2) sin(x)$
+ $f^′(x) = frac(Δ A, dd(x))$

#tip[
  反比例函数$1/x$可令两边分别为$x$和$1/x$
]

=== 指数型导数
对$M = 2^t$，有

$
  dv(M, t) = frac(2^(t + dd(t)) - 2^t, dd(t)) = 2^t (frac(2^(dd(t)) - 1, dd(t)))
$

其中，$frac(2^(dd(t)) -1, dd(t))$收敛。当常数$2$被替换成$e$时，这个比例收敛于$1$。即，$e^t$的导数为自身。

由此，令$2 = e^(ln(2))$，即可得到$frac(2^(dd(t)) - 1, dd(t))$的收敛值。

== l'Hôpital 法则
若两条曲线，$f(x)$和$g(x)$在$x = a$处相交，则其在$x = a$的比值的极限等于其导数在$x = a$的比值。

== 中值定理
求曲线在区间$[a, b]$内到横轴的平均长度，即求曲线面积（矩形法求积分）与$[a, b]$内点的个数。其中，点的个数约等于$(b - a)\/dd(x)$。由此可得

$ f(ξ) = frac(∫_a^b f(x), (b - a) \/ dd(x)) = frac(∫_a^b f(x) dd(x), b - a) $

即

$ ctext("平均高度") = frac(ctext("面积"), ctext("宽度")) $

= 向量函数的变化
场的表示通常有 2 种方法

- 图法（graph）：在三维空间作图
- 等值面法（level set）：在二维空间中，将数值相等的点相连成线，用不同颜色来表示每条曲线的值大小

== 梯度
<梯度>

首先介绍一下 Nabla 算子，其最初由 Hamilton 引进，故又称 Hamilton 算子，其用于将数量场转化为向量场

$ grad = mat(delim: "[", pdv(, x_1), pdv(, x_2), ..., pdv(, x_n))^(⊤) $
梯度为多元函数的变化率，其表达式为一个偏导数组成的向量，可以看作是 Nabla 算子与向量函数的内积

$ div arrow(𝒇) = mat(delim: "[", pdv(f, x_1); pdv(f, x_2); ⋮; pdv(f, x_n)) $
原函数的近似为

$ f(𝒙) ≈ f(𝒙_0) + grad f(𝒙_0) ⋅(𝒙 - 𝒙_0) $

== Jacobian 矩阵
<Jacobian-矩阵>

对向量函数$f$，其表达式为

$ f(𝒙) = mat(delim: "[", f_1(x_1, …, x_n); ⋮; f_m(x_1, …, x_n)) $

其中，$f_i: D → ℝ, D ⊆ ℝ^n$是$f$的定义域。对于单变量函数$f(x)$，在$x_0$附近可用直线$y = a x + b$，近似$f(x)$。

由于在$𝒙 = 𝒙_0$，有$T(𝒙_0) = f(𝒙_0)$，则可得

$ T(𝒙) = 𝑨(𝒙 - 𝒙_0) + f(𝒙_0) $
当$𝒙 → 𝒙_0$，若存在$m × n$阶实矩阵$𝑨$，使得

$ lim_(𝒙 → 𝒙_0) frac(f(𝒙) - f(𝒙_0) - 𝑨(𝒙 - 𝒙_0), norm(𝒙 - 𝒙_0)) = 𝟎 $
则称$f$在$𝒙 = 𝒙_0$可导。为了让$𝒙$从任意方向逼近$𝒙_0$，另要求$𝒙_0$是定义域$D$的一个内点（interior point），意思是$𝒙_0$的附近点都属于$D$。

此时，$f$的变化率为

$
  𝑱 = mat(delim: "[", pdv(𝑱, x_1), …, pdv(𝑱, x_n)) =
  mat(delim: "[",
  pdv(f_1, x_1), …, pdv(f_1, x_n);
  ⋮, ⋱, ⋮;
  pdv(f_m, x_1), …, pdv(f_m, x_n))
$

此矩阵即 Jacobian 矩阵。原函数的近似为

$
  f(𝒙) & ≈ f(𝒙_k) + grad f(𝒙_k) ⋅(𝒙 - 𝒙_k)\
  & ≡ f(𝒙_k) + 𝑱_(𝒙_k) ⋅(𝒙 - 𝒙_k)
$

== Hessian 矩阵
<Hessian-矩阵>

对于多元函数$f$，其二阶导数为$n$阶方阵

$
  𝑯 = grad grad^(⊤) = mat(delim: "[",
  pdv(f, x_1, 2), pdv(f, x_1 x_2), …, pdv(f, x_1 x_n);
  pdv(f, x_2 x_1), pdv(f, x_2, 2), …, pdv(f, x_2 x_n);
  ⋮, ⋮, ⋱, ⋮;
  pdv(f, x_n x_1), pdv(f, x_n x_2), …, pdv(f, x_n, 2))
$

此为 Hessian 矩阵。

原函数的近似为

$ f(𝒙) ≈ f(𝒙_0) + grad f(𝒙_0) ⋅(𝒙 - 𝒙_0) + 1 / 2(𝒙 - 𝒙_0)^(⊤) 𝑯(𝒙_0)(𝒙 - 𝒙_0) $

#tip[
  可以看出，Hessian 矩阵是 Nabla 算子的外积。Hessian 矩阵还可以表示为

  $ 𝑯_f = 𝑱(grad f^(⊤)) $
]

当一元函数$f$在$x = x_0$点处具有二阶导数，且$f^′(x_0), f^″(x_0) ≠ 0$，则

- $f^″(x_0) < 0$，$x_0$为极大值点- $f^″(x_0) > 0$，$x_0$为极小值点- $f^″(x_0) = 0$，$x_0$为鞍点
- $∄f^″(x_0)$，无法判断

当多元函数$f$在$𝒙 = 𝒙_0$处，$grad f(𝒙_0) = 𝟎$，则

- $𝑯$负定，$𝒙_0$为极大值点
- $𝑯$正定，$𝒙_0$为极小值点
- $𝑯$不定，$𝒙_0$为鞍点
- $∄𝑯^(-1)$，无法判断

= 线性化
<线性化>

== Taylor 公式
<Taylor-公式>

Taylor 公式是将一个在$x = x_0$处具有$n$阶导数的函数$f(x)$利用关于$(x - x_0)$的$n$次多项式来逼近函数的方法。

若函数$f(x)$在包含$x_0$的某个闭区间$[a, b]$上具有$n$阶导数，且在开区间$(a, b)$上具有$(n+1)$阶导数，则对闭区间$[a, b]$上任意一点$x$，成立下式：

$
  f(x) = taylorterm(f, x, x_0, 0) + taylorterm(f, x, x_0, 1) + … + taylorterm(f, x, x_0, n) + R_n(x)
$

其中，$f^((n))$表示$f(x)$的$n$阶导数，等号后的多项式称为$f(x)$在$x_0$处的 Taylor 展开式，$R_n(x)$是 Taylor 公式的余项，是$(x - x_0)^n$的高阶无穷小；

- Peano 余项

$ R_n(x) = order((x - x_0)^n) $

- Lagrange 余项

$ R_n(x) = f^((n+1))[x_0 + θ(x - x_0)] frac((x - x_0)^(n+1), (n+1))! $
当$x - x_0 → 0$，则有

$ f(x) = f(x_0) + f^′(x_0)(x - x_0) $

== MacLaurin 公式
<MacLaurin-公式>

即$x_0 = 0$时的 Taylor 公式，即

$ f(x) = ∑_(i = 0)^n frac(f^((i))(0), i!)x^i + R_n(x) $

== 几何意义

线下的面积$f(x)$约等于区间$[0, a]$内曲线下的面积$f(a)$ + 加新增面积的矩形部分 + 新增面积的矩形上方的三角形部分。其中，高$h(x) = dv(f, x)(x)$，则有

$ f(x) ≈ f(a) + dv(f, x)(a) ⋅ (x - a) + 1 / 2 ⋅ dv(f, x, 2)(a)(x - a)^2 $

#tip[
  线性化永远是局部的线性化
]

= 矩阵导数
<矩阵导数>

== 标量对向量
<标量对向量>

#definition[
  对向量
  $ 𝒚 = mat(delim: "[", y_1; y_2; ⋮; y_m)_(m × 1) $

  若其函数$f(𝒚)$为标量，则该函数的导数为
  $
    pdv(f(𝒚), 𝒚) = mat(delim: "[", pdv(f(𝒚), y_1); pdv(f(𝒚), y_2); ⋮; pdv((𝒚), y_m)_(m × 1))
  $

  由于此导数形式与其分母部分相同，故称此形式为分母布局（denominator layout）。类似地，若导数的行向量形式，称分子布局（nominator layout）。
]

== 向量对向量
<向量对向量>

#definition[
  对向量$𝒚_(m × 1)$，若其函数$𝒇(𝒚)$为向量，即

  $ 𝒇(𝒚) = mat(delim: "[", f_1(𝒚)); f_2(𝒚); ⋮; f_n(𝒚)_(n × 1) $

  则该函数的导数为

  $
    mat(delim: "[", pdv(f(𝒚), y_1); pdv(f(𝒚), y_2); ⋮; pdv(f(𝒚), y_m)) =
    mat(delim: "[",
   pdv(f_1(𝒚), y_1), pdv(f_2(𝒚), y_1), …, pdv(f_n(𝒚), y_1);
   ⋮, , , ⋮;
   ⋮, , ⋱, ⋮;
   pdv(f_1(𝒚), y_m), …, …, pdv(f_n(𝒚), y_m))_(m × n)
  $
]

若$m = 3$，$n = 2$时，令$𝑱 = 𝒇(𝒚)$，则有

$
  pdv(𝑱, y_1) = pdv(𝑱, f_1(𝒚)) pdv(f_1(𝒚), y_1) + pdv(𝑱, f_2(𝒚)) pdv(f_2(𝒚), y_1)
$

于是，有

$
  pdv(𝑱, 𝒚) &= mat(delim: "[",
  pdv(𝑱, f_1(𝒚)) pdv(f_1(𝒚), y_1) + pdv(𝑱, f_2(𝒚)) pdv(f_2(𝒚), y_1);
  pdv(𝑱, f_1(𝒚)) pdv(f_1(𝒚), y_2) + pdv(𝑱, f_2(𝒚)) pdv(f_2(𝒚), y_2);
  pdv(𝑱, f_1(𝒚)) pdv(f_1(𝒚), y_3) + pdv(𝑱, f_2(𝒚)) pdv(f_2(𝒚), y_3))\
  &= mat(delim: "[",
  pdv(f_1(𝒚), y_1), pdv(f_2(𝒚), y_1);
  pdv(f_1(𝒚), y_2), pdv(f_2(𝒚), y_2);
  pdv(f_1(𝒚), y_3), pdv(f_2(𝒚), y_3))
  mat(delim: "[", pdv(𝑱, f_1(𝒚)); pdv(𝑱, f_2(𝒚))) = pdv(𝒇, 𝒚) pdv(𝑱, 𝒇)
$

== 方程化简
<方程化简>

对向量$𝒚_(m × 1)$和方阵$𝑨_(m × m)$，有

$ pdv(𝑨 𝒚, 𝒚) = 𝑨^(⊤) $

#tip[
  注意，此处采用分母布局。
]

$ pdv(𝒚^(⊤) 𝑨 𝒚, 𝒚) = 𝑨 𝒚 + A^(⊤) 𝒚 $

#tip[
  注意，分子为二次型！
]

当$𝑨$为对称阵

$ pdv(𝒚^(⊤) 𝑨 𝒚, 𝒚) = 2 𝑨 𝒚 $

对离散系统

$ 𝒙[k + 1] = 𝑨 𝒙[k] + 𝑩 𝒖[k] $

其代价函数为

$ 𝑱 = 𝒙[k + 1]^(⊤) 𝒙[k + 1] $

则有

$ pdv(𝑱, 𝒖) = pdv(𝒙[k + 1], 𝒖[k]) pdv(𝑱, 𝒙[k + 1]) = 2 𝑩^(⊤) 𝒙[k + 1] $

= 一点扩展

== 散度

将梯度中的一元向量函数，替换为多元向量函数，如对二元向量函数则有

$ div arrow(𝒇) = pdv(𝒙, 𝒙) + pdv(𝒚, 𝒚) $

得到的标量称为散度，表示发散的程度，是物理中通量的局部描述，是通量的体密度。

#theorem("Gauss 公式")[
  $
    underbrace(∯_(a V) arrow(𝒇)⋅arrow(𝒏) dd(S), ctext("流过边界的通量")) = underbrace(∭_V div arrow(𝒇) dd(V), ctext("内部所有散度的贡献"))
  $
]

== 旋度

对三元向量函数，其与 Nabla 算子的叉乘

$
  curl arrow(𝒇) = mat(delim: "|",
  𝒊, 𝒋, 𝒌;
  pdv(, 𝒙), pdv(, 𝒚), pdv(, 𝒛);
  f_1, f_2, f_3)
$
得到的向量称为旋度（curl），其方向服从右手法则，是物理中环量的局部描述，是环量的面密度。

#theorem("Stokes 公式")[
  $
    underbrace(∮_(a S) arrow(𝒇)⋅dd(𝒓), ctext("环绕边界的环量")) = underbrace(∬_S curl arrow(𝒇)⋅dd(S), ctext("曲目上旋度的贡献"))
  $
]

由于叉乘的定义，旋度往往只存在于三维空间中。

== Laplace 算子

梯度的散度可以表示为 Nabla 算子的内积

$ grad ⋅ grad = grad^(⊤)grad = ∑ pdv(arrow(𝒇), x_i^2) $

为了区别 Nabla 算子的外积，通常采用 $laplace = grad ⋅ grad $，称$laplace$为 Laplace 算子。
