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

```bash
cd [above-path]
git clone --depth 1 --branch main https://github.com/typst/packages typst
```

### 使用模版

```typst
#import "@preview/qooklet:0.2.0": *
```

## 约定规范

### 公式

- 矩阵
  - `[]` 括号
  - 加粗斜体，大写
- 向量
  - `[]` 括号
  - 加粗斜体，小写
