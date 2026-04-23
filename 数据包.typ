// 封面
#[
  #set page(
    fill: rgb("#491e40"),
  )
  #align(center + horizon)[
    #[
      #set text(
        fill: rgb("#e9dede"),
        size: 2em,
        weight: "bold"
      )
      #[
        #set text(
          font: "Source Han Sans SC"
        )
        原版技术性开发系列教程
        #v(1em)
        第#h(10pt)3#h(10pt)册
        #v(2em)
      ]
    ]
    #[
      #set text(
        fill: rgb("#e9dede"),
        font: "Source Han Serif",
        size: 4em,
        weight: "bold"
      )
      数据包
      #v(1em)
    ]
    #[
      #set text(
        fill: rgb("#e9dede"),
        font: "Source Han Sans SC",
        size: 1.5em
      )
      徐木弦#h(1em)主编
      #v(5em)
    ]
  ]
]

#import "模板.typ": *
#show: template-style
#theme.update(dark_purple)
#let theme_basic = dark_purple
#counter(heading).update(13)

#outline(title:"目  录",indent: 2em)

#pagebreak()
#counter(page).update(1)
= 函数
使用命令方块执行命令时，在一个控制台内只能输入一条命令。为了能够在命令方块搭建的系统中批量执行命令，不得不使用命令方块链，因为它允许由命令构成的系统接受一个信号就能被激活。如果要进行一些条件判断或循环执行命令，则可以调整命令方块的设置，也可以使用其他红石元件。但是用命令方块搭建的命令系统严重依赖红石电路，使得命令编写者不仅要精通命令的语法，还要对红石电路有一定程度的了解。

于1.12-pre1加入的函数，在经过以后若干版本的更新和完善后，使得玩家能够更方便地批量管理和执行命令。#proper-noun(display: "函数（Function）", "han2 shu4")是一个允许玩家利用扩展名为 `.mcfunction` 的文本文档编写和执行多行命令的功能。函数是数据包的一部分。

函数的出现是原版技术性开发一次里程碑式的进步，它使得命令系统对红石电路的依赖程度大大下降。一些使用了函数的冒险地图真正做到了零命令方块化。一些命令的逻辑也可以借由函数清晰地表达出来。
#figure(
  caption: "在DHP内进行的函数编写",
  image("图片/在DHP内进行的函数编写.png", width: 32em)
)
== 函数格式
函数文件必须是位于能够被识别的数据包文件夹中，且必须为无BOM的UTF-8格式，在函数内容没有语法错误的情况下，函数才可以被正常识别。
=== 函数的资源路径
在数据包中，函数文件的路径为 #icon("mcfunction") `data > <命名空间> > function > <函数名称>.mcfunction`，其中 #icon("folder") `data` 目录的次级目录即为函数的命名空间，用命名空间ID的资源路径表示方式来表示函数：
#codebox("<命名空间>:<函数名称>")
#h(-2em)其中 `<函数名称>` 不需要携带 `.mcfunction` 的后缀。如果省略了命名空间，游戏会在 `minecraft` 命名空间下索引函数文件。

例如，一个函数文件的路径为 #icon("mcfunction") `data > tutorial > function > tick.mcfunction`，那么资源路径就应该写成
== 调用函数
== 函数的运行及上下文
== 回返机制
== 宏
== 命令连锁数量
== 递归
== 函数的应用实例
= 谓词
= 进度
= 物品修饰器
= 战利品表
= 配方
= 魔咒
= 对话框
= 杂项游戏内容定义格式
= 实体变种
= 自定义世界生成