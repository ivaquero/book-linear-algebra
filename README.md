# 极简线性代数

![code size](https://img.shields.io/github/languages/code-size/ivaquero/book-linear-algebra.svg)
![repo size](https://img.shields.io/github/repo-size/ivaquero/book-linear-algebra.svg)

本仓库基于我一直在迭代的线性代数教案，目标是希望其具有如下特点

- 循序渐进
- 主线清晰
  - 一维（向量） -> 多维（矩阵、方程组）
  - 变化（线性变换） -> 不变（特征值）
  - 精准（高斯消元）-> 近似（奇异值分解）
- 对接应用
  - 深度学习
  - 机器学习

## 构建

### 依赖软件

- [Typst](https://github.com/typst/typst)

### 克隆官方仓库

为保证正常编译，请参考 [typst-packages](https://github.com/typst/packages) 上的说明，在如下路径下克隆 `typst-packages` 仓库

- Linux：
  - `$XDG_DATA_HOME`
  - `~/.local/share`
- macOS：`~/Library/Application Support`
- Windows：`%APPDATA%`

```shell
cd [above-path]
git clone --depth 1 --branch main https://github.com/typst/packages typst
```

### 编译

入口文件为 `book-linear-algebra.typ`（`#cover(info)` → `#contents` → 逐章 `#chapter("NN-*.typ")`）。装好 Typst 与上面克隆的 `typst-packages` 后，在仓库根目录执行：

```shell
typst compile book-linear-algebra.typ
```

即可生成 `book-linear-algebra.pdf`。章节样式来自 [qooklet](https://github.com/ivaquero/typst-qooklet)（`@preview/qooklet:0.7.2`），数学记号来自 `@preview/physica`。

### 文档信息

```toml
[key-you-like]
    author = "ivaquero"
    footer = "ivaquero"
    header = "Reinforcement Learning"
    lang = "en"
```

使用如下语句读取你的 TOML 文件

```typst
#let info = toml("your path").key-you-like
```

详情见 [qooklet](https://github.com/ivaquero/typst-qooklet)

### 章节与交叉引用

主文件用 `chapter()` 宏 `include` 每一章并重置标题计数（`counter(heading).update(0)`），因此各章小节各自从 1 开始编号。跨章引用一律使用 `@label`；由于 Qooklet 按章重置计数，重复的 label 不会报错但会让引用产生歧义，故 **label 命名须保持全书唯一**。

## 约定规范

### 公式

- 矩阵
  - `[]` 括号
  - 加粗斜体，大写
- 向量
  - `[]` 括号
  - 加粗斜体，小写

### 符号约定

全书矩阵为粗斜体**大写**、向量为粗斜体**小写**。主要记号统一如下，续写时请沿用、勿另起符号：

| 记号    | 含义                                        |
| ------- | ------------------------------------------- |
| 𝑨, 𝑩, 𝑪 | 一般矩阵 / 系数矩阵                         |
| 𝒙, 𝒃    | 列向量（未知量 / 右端项）                   |
| 𝑰, 𝑶    | 单位矩阵 / 零矩阵                           |
| 𝑹       | 旋转矩阵；亦作 Cholesky 的上三角因子        |
| 𝑷       | 投影矩阵                                    |
| 𝑸       | 正交矩阵                                    |
| 𝑽       | 特征向量矩阵（列向量为特征向量）            |
| 𝜦       | 特征值构成的对角阵                          |
| 𝑼       | SVD 的左奇异向量矩阵                        |
| 𝜮, 𝑺    | SVD：𝜮 为奇异值对角阵，𝑺 为其奇异值对角子块 |
| 𝑫       | 签名 / 单位根矩阵（对角 ±1，满足 𝑫² = 𝑰）   |
| 𝑳       | LU 分解的下三角因子                         |
| 𝑯       | Hessian 矩阵                                |
| 𝑱       | Jordan 标准型；第 13 章亦用作 Jacobian 矩阵 |

> 说明：`𝑹`（旋转 / 上三角）与 `𝑱`（Jordan / Jacobian）为**有意的按章复用**，具体含义以所在章节为准；其余字母保持"一符号一义"。
