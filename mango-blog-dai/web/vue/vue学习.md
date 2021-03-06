# Vue学习
## 1.	Vue实例
### 1.1	构造器
*  每个Vue.js应用都是通过构造函数Vue创建Vue的根实例启动的：

    var vm = new Vue({
      // 选项
    })

    *在实例化Vue时，需要传入一个选项对象，它可以包含数据、模版、挂载元素、方法、生命周期钩子等选项。

## 1.2属性与方法
* 每个Vue实例都会代理其data对象里所有的属性
* 除了data属性，Vue实例还暴露了一些有用的实例属性与方法。这些属性都有前缀$，以便与代理的data属性区分。

## 1.3实例生命周期
* 每个Vue实例在被创建之前都要经过一系列的初始化过程。例如，实例需要配置数据观测、编译模版、挂载实例到DOM，然后在数据变化时更新DOM。在这个过程中，实例也会调用一些生命钩子，这就是给我们提供了执行自己定义逻辑的机会。钩子包括：mounted、updated、destoryed、created。

## 1.4生命周期
* 下面这张图展示了生命周期：

![](https://hbimg.b0.upaiyun.com/245ed3bc3f4a0e1698faf640863a1271a3e8ad3520b2d-Lq3J0w_fw658)