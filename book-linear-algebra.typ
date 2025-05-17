#import "lib/lib.typ": *

#cover(info)
#contents(depth: 1, info: info)

#let chapter(filename) = {
  include filename
  counter(heading).update(0)
}

#chapter("01-向量.typ")
#chapter("02-矩阵.typ")
#chapter("03-向量空间.typ")
#chapter("04-矩阵的秩.typ")
#chapter("05-线性系统的解.typ")
#chapter("06-行列式.typ")
#chapter("07-相似与特征值.typ")
#chapter("08-特征值的应用.typ")
#chapter("09-正交矩阵.typ")
#chapter("10-几何变换.typ")
#chapter("11-二次型与正定.typ")
#chapter("12-矩阵分解.typ")
#chapter("13-函数变化率.typ")
#chapter("14-线性凸优化.typ")
#chapter("15-线性回归.typ")
#chapter("A-空间解析几何.typ")
