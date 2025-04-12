#import "@preview/qooklet:0.2.0": *
#show: qooklet.with(
  title: "附录A：空间解析几何",
  author: "Yāng Xīnbīn",
  footer-cap: "Yāng Xīnbīn",
  header-cap: "极简线性代数",
  lang: "zh",
  outline-on: true,
)

= 空间关系
<空间关系>

== 空间平面
<空间平面>

已知

$ 𝒗_1(X_1, Y_1, Z_1), 𝒗_2(X_2, Y_2, Z_2), M(x, y, z), M_0(x_0, y_0, z_0) $

则

$
  𝒓_0 &= (x_0, y_0, z_0)\
  𝒓 &= (x, y, z)
$

则向量$𝐌_0 𝐌$与基向量$𝒗_1, 𝒗_2$共面的充要条件为：

$
  (𝒓 - 𝒓_0, 𝒗_1, 𝒗_2) = 0 ⇔
  mat(delim: "[",
  x - x_0, X_1, X_2;
  y - y_0, Y_1, Y_2;
  z - z_0, Z_1, Z_2) = 0
$

可得，平面的普通方程

$ A x + B y + C z + D = 0 $

其中，

$
  A = mat(delim: "[", Y_1, Z_1; Y_2, Z_2),
  B = mat(delim: "[", Z_1, X_1; Z_2, X_2),
  C = mat(delim: "[", X_1, Y_1; X_2, Y_2)
$

$ D = -(A x_0 + B y_0 + C z_0) $

- 平行条件

$
  𝒗(X, Y, Z) \/\/ A x + B y + C z + D = 0\
  ⇕\
  A X + B Y + C Z = 0
$

== 空间直线
<空间直线>

- 参数方程

过点$(x_0, y_0, z_0)$，方向向量为$(X, Y, Z)$

$ cases(delim: "{", x = x_0 + t X, y = y_0 + t Y, z = z_0 + t Z) $

- 标准方程

$ frac(x - x_0, x) = frac(y - y_0, y) = frac(z - z_0, Z) $

#pagebreak()

- 两点方程

$
  frac(x - x_1, x_2 - x_1) = frac(y - y_1, y_2 - y_1) = frac(z - z_1, z_2 - z_1)
$

矩阵形式为

$
  mat(delim: "[",
  x_2 - x_1, y_2 - y_1, z_2 - z;
  X_1, Y_1, Z_1;
  X_2, Y_2, Z_2) = 0
$

- 平行：方向向量成比例，但不等于点连线比例
- 重合：方向向量成比例，等于点连线比例- 相交：方向向量不成比例
- 异面：等号不成立

== 距离
<距离>

- 点到线

$ d = frac(| M_0 M × 𝒗 |, |𝒗|) $

- 点到面

$ d = frac(|A x_0 + B y_0 + C z_0 + D|, sqrt(A^2 + B^2 + C^2)) $

- 线到线
