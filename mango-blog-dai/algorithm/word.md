### 线性查找

> 线性查找又称顺序查找，是一种最简单的查找方法，它的基本思想是从第一个记录开始，逐个比较记录的关键字，直到和给定的K值相等，则查找成功；若比较结果与文件中n个记录的关键字都不等，则查找失败。

###   循环不变式

> 循环不变式是一种证明程序(循环)正确性的写法，包含有三个特性。如果在循环的每一步这个式子都正确，那么循环结束后，这个式子也正确。
>
> 初始化：在循环的第一轮迭代前是正确的
>
> 保持：如果在循环的某一次迭代开始之前是正确的，那么在下一次迭代开始之前，也是正确的
>
> 终止：当循环结束，不变式给了我们一个有用的性质。

### 分治法：

#### 思想

> 将原问题分解为几个规模较小但类似于原问题的子问题，递归的求解这些子问题，然后合并这些子问题的解来建立原问题的解。

#### 步骤

> 分解：原问题为若干子问题，这些子问题是原问题的规模较小的实例。
>
> 解决：递归的求解各子问题。然而，若子问题的规模够小，则直接求解。
>
> 合并：这些子问题的解成原问题的解。
