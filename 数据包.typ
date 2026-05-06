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
#codebox("tutorial:tick")
#h(-2em)函数文件的名称也可以为空，比如 #icon("mcfunction") `data > tutorial > function > .mcfunction`，它的资源路径为
#codebox("tutorial:")
命名空间是 #icon("mcfunction") `data` 目录下为函数文件分类的第一种手段，在 #icon("mcfunction") `function` 文件夹中，函数也可以进行二次分类。函数文件不必直接作为 #icon("mcfunction") `function` 文件夹的次层级文件，可以嵌套进多层文件夹中。此时函数的资源路径就需要带上其父文件夹的名称。例如，一个函数文件的路径为 #icon("mcfunction") `tutorial > function > test > main.mcfunction`，可以看到函数 #icon("mcfunction") `main.mcfunction` 位于文件夹 #icon("folder") `test`，而 #icon("folder") `test` 又是 #icon("folder") `function` 的子文件夹，那么资源路径就应该写成
#codebox("tutorial:test/main")
存放函数的文件夹可以多层嵌套，以对函数进行适当的分类，不建议直接把所有函数文件全部写在 #icon("folder") `function` 根目录下。例如，《跃动晶界2》地图所用的数据包采用了如下的分类模式#footnote[此处仅展示部分目录。]：
#tree(
  (0, [#icon("folder") *function*]),
  (1, [#icon("folder") *dialog*: 所有对话框相关的逻辑。]),
  (2, [#icon("folder") *main*: 主屏幕对话框的显示内容、配置数据。]),
  (2, [#icon("folder") *pause*: 游戏暂停对话框的显示内容、配置数据。]),
  (1, [#icon("folder") *game*: 正式游戏内容相关的逻辑。]),
  (2, [#icon("folder") *checkpoint*: 所有难度不同关卡的记录点信息。]),
  (2, [#icon("folder") *item*: 所有道具的行为逻辑。]),
  (2, [#icon("folder") *over*: 游戏结束时需要执行的函数。]),
  (2, [#icon("folder") *start*: 游戏开始时需要执行的函数。])
)
#h(-2em)不同的开发者有各自的分类方式，社区在这个议题上暂时没有统一标准。

和其他资源一样，函数也可以通过数据包#proper-noun(display: "函数标签（Function tags）", "han2 shu4 biao1 qian1")分类。函数标签可以表示为
#codebox("#<命名空间>:<ID>")
原版数据包不存在任何内置的函数标签，因此需要在数据包中手动创建函数标签。标签文件的路径为 `data > <命名空间> > tags > function > <标签名>.json`。一个函数标签文件的内容如下所示：
#tree(
  (0, [#icon("json-object") 文件封装]),
  (1, [#icon("json-bool") *replace*: 指定此标签的引用是否覆盖较低优先级数据包中同命名空间内的同名标签，若设为 `true`，则忽略较低优先级数据包内的引用；若设为 `false`，则此标签内的引用作为对同名标签内引用内容的补充。默认为 `false`。]),
  (1, [#icon("json-object") *#underline[values]*: 此标签引用的函数，可以引用一个函数，也可以引用其他函数标签。]),
  (2, [#icon("json-string") 一个函数的命名空间ID。]),
  (2, [#icon("json-string") 一个函数标签，需要带 `#` 号。]),
  (2, [#icon("json-object") 引用函数的完整格式。]),
  (3, [#icon("json-string") *#underline[id]*: 一个函数的命名空间ID或函数标签。]),
  (3, [#icon("json-bool") *required*: 用 `false` 表示该条目是可选的，若该条目 #icon("json-string") `id` 所述函数不存在，则不会使标签加载失败。默认为 `true`。])
)
#h(-2em)例如，一个函数标签的内容如下：
#codefile(
  lang: "json",
  title: "data > minecraft > tags > function > load.json",
  read("代码/教程数据包/data/minecraft/tags/function/load0.json")
)
#h(-2em)这时称函数 `tutorial:load` 和函数 `tutorial:game/load` 被标签 `#minecraft:load` 调用（引用）。
=== 函数的格式
==== 命令行与注释行
在一个函数文件中，同一行内只允许有一条命令，每一个命令行的行首和行末可以添加若干空格和制表符，游戏在识别时会自动去除这些空格和制表符。这里的“一行”与输入的回车符挂钩，一些编译器视图中会有自动换行，视图中的自动换行不算作不同的行。函数文件中允许有空行，也允许在一行的开头使用 `#` 以表示该行是#proper-noun(display: "注释行（Comment line）", "zhu4 shi4 hang2")，可以添加#proper-noun(display: "注释（Comment）", "zhu4 shi4")。

在函数文件中编写命令时，命令开头不允许使用斜杠 `/`，所有命令都必须语法正确，否则该函数无效。例如，函数 `leap_of_crystal_realm:registry` 的内容如下所示：
#codefile(
  lang: "mcfunction",
  title: "data > leap_of_crystal_realm > function > registry.mcfunction",
  read("代码/教程数据包/data/leap_of_crystal_realm/function/registry.mcfunction")
)
#h(-2em)这是一个有效的函数，现逐行分析：第1、4、7行是注释行，仅在编写函数时作为注释使用，不会对函数内容造成影响，但注释时必须在该行开头添加 `#` 符号。第2、5、8行是命令行，没有语法错误。第3和第6行是空行，不会对函数造成影响。

单人游戏中函数的权限等级为2，因此函数内命令所需的权限等级不能超过2。但是如果函数在专用服务器上运行，#icon("file") `server.properties` 中的 `function-permission-level` 能调整函数的权限等级，届时函数就有能力执行所需权限等级更高的命令。

在函数中，每一行命令的字符不受32500字符数的限制，但一个函数的命令总数会受到游戏规则 `max_command_sequence_length` 的限制。其计算方式见节@sec:max_command_sequence_length。
==== 换行
一般而言，一条有效的命令占据一行，如果在命令行行末添加反斜杠符 `\`，则可以在下一行继续书写该命令的后续部分。游戏在读取时会对上下行进行拼接，行末的反斜杠符 `\` 只会作为换行符号识别，不会识别为命令的一部分。函数文件允许连续换行，只要识别到反斜杠符，则下一行的内容就会被拼接到上一行。

对于换行所用的反斜杠符 `\`，其后方不能再添加除空格、制表符外的其他字符，而该符号前的空格均会被识别为命令的一部分。下一行不能为注释行，且行首的空格和制表符在识别过程中会被直接忽略。因此如果需要在命令参数之间进行换行，则参数之间的空格应书写在换行前反斜杠符 `\` 的前面。

例如，函数 `tutorial:line_break` 的内容如下所示：
#codefile(
  lang: "mcfunction",
  title: "data > tutorial > function > line_break.mcfunction",
  read("代码/教程数据包/data/tutorial/function/line_break.mcfunction")
)
#h(-2em)这是一个有效的含换行的函数。经过拼接，得到函数内的命令：
#codebox("execute as @a store result score @s x run data get entity @s Pos[0]")
适当运用换行可以对函数文件进行排版，便于函数的维护。上述的函数 `tutorial:line_break` 对 `/execute` 进行了换行，每条子命令分别位于一行。
==== 宏行
函数可以使用#proper-noun(display: "宏（Macro）", "hong2")，当一个命令行的行首有 `$` 字符时，该行被识别为#proper-noun(display: "宏行（Macro line）", "hong2 hang2")，函数则为#proper-noun(display: "宏函数（Macro function）", "hong2 han2 shu4")。`$` 与命令之间可以有空格和制表符，但 `$` 前面不能有任何空格和制表符。此时可以在该行使用可替代字段。可替代字段使用如下的格式：
#codebox("$(<键>)")
其中 `<键>` 可以接受的字符有：
+ 数字：`0123456789`；
+ 大写字母：`ABCDEFGHIJKLMNOPQRSTUVWXYZ`；
+ 小写字母：`abcdefghijklmnopqrstuvwxyz`；
+ 下划线：`_`。
可代替字段区分大小写，大小写不同会被识别为不同的字段。

例如，函数 `tutorial:macro` 是一个有效的宏函数：
#codefile(
  lang: "mcfunction",
  title: "data > tutorial > function > macro.mcfunction",
  read("代码/教程数据包/data/tutorial/function/macro.mcfunction")
)
在编写函数时，如果函数行内有可替代字段，该行开头的 `$` 不能缺失。
== 调用函数
函数可以以以下几种方式被调用：
=== 函数标签
调用一个函数标签则同时调用其中的函数，并按照函数标签定义的从上到下的顺序依次调用。若函数标签 `#tutorial:main` 有如下的内容：
#codefile(
  lang: "json",
  title: "data > tutorial > tags > function > main.json",
  read("代码/教程数据包/data/tutorial/tags/function/main.json")
)
调用标签 `#tutorial:test` 时，依次调用 `tutorial:test1` 和 `tutorial:test2` 两个函数。

函数标签也可以嵌套在其他函数标签文件内，但要注意避免递归引用。例如，一个函数标签 `#tutorial:load` 的内容如下所示：
#codefile(
  lang: "json",
  title: "data > tutorial > tags > function > load.json",
  read("代码/教程数据包/data/tutorial/tags/function/load.json")
)
#h(-2em)其中 `#tutorial:main` 又依次引用了 `tutorial:test1` 和 `tutorial:test2` 两个函数，所以调用 `#tutorial:load` 后，会依次调用三个函数：`tutorial:test1`、`tutorial:test2` 和 `tutorial:test3`。

如果一个标签多次引用了同一函数，则函数标签被调用时该函数只会被调用一次，且会按照该函数第一次出现的位置调用。例如，函数标签 `#tutorial:example` 的内容如下所示：
#codefile(
  lang: "json",
  title: "data > tutorial > tags > function > example.json",
  read("代码/教程数据包/data/tutorial/tags/function/example.json")
)
#h(-2em)则此标签会先调用 `tutorial:test1`，再调用函数 `tutorial:test2`。

以下函数标签具有特殊行为：
==== 标签 `#minecraft:load`
*使用 `/reload` 或重新进入游戏使得数据包重新加载后，所有在函数标签 `#minecraft:load` 中引用的函数会被依次调用一遍。*这个标签的命名空间必须为 `minecraft`，不允许有其他的资源路径，函数标签的文件名必须为 `load`，路径必须为 #icon("json") `data > minecraft > tags > function > load.json`。

若 `#minecraft:load` 的内容为
#codefile(
  lang: "json",
  title: "data > minecraft > tags > function > load.json",
  read("代码/教程数据包/data/minecraft/tags/function/load.json")
)
#h(-2em)则每次数据包重新加载后，当前的 `tutorial:test1`、`tutorial:test2` 都会依次被调用一遍。
==== 标签 `#minecraft:tick`
*所有在函数标签 `#minecraft:tick` 中引用的函数会在每游戏刻的开始被调用一次，是为高频调用*，实际效果和保持开启的循环型命令方块一致。和 `#minecraft:load` 一样，`#minecraft:tick` 的命名空间必须为 `minecraft`，不允许有其他的资源路径，函数标签的文件名必须为 `tick`，路径必须为 #icon("json") `data > minecraft > tags > function > tick.json`。

例如，有函数标签 `#minecraft:tick`：
#codefile(
  lang: "json",
  title: "data > tutorial > tags > function > example.json",
  read("代码/教程数据包/data/minecraft/tags/function/tick.json")
)
#h(-2em)则每个游戏刻会依次调用 `tutorial:test1`、`tutorial:test2` 这两个函数。
=== 命令/function与/execute
命令 `/function` 用于主动调用一个函数或一个函数标签，需要的权限等级为2，它的其中一条语法为：
#codebox("function <name>")
#param-desc(
  [`<name>`（函数 `minecraft:function`）], [一个函数的命名空间ID或一个函数标签。]
)
#example(
  [调用函数 `tutorial:test1`。],
  [
    命令为
    #codebox("function tutorial:test1")
  ]
)
#example(
  [调用函数标签 `#tutorial:main` 内的所有函数。],
  [
    命令为
    #codebox("function #tutorial:main")
  ]
)
命令 `/function` 也可以作为 `/execute` 的子命令并调用函数。而* `/execute` 的 `if function` 子命令在判断函数返回值的同时也会调用一次函数*。
=== 命令/schedule
在命令方块电路中，如果要使某一个命令延迟几秒再被执行，使用的手段则是红石中继器，每一个红石中继器最多可以提供4 rt的信号延迟。

数据包同样提供了可以延迟执行命令的手段，即*以服务端为名义*，计划在未来的某一时间调用函数。这种手段就是命令 `/schedule`，命令 `/schedule` 的*执行者为服务端，命令执行位置被固定为世界出生点，这个位置不一定是$(0,0)$。同时，执行朝向为向南、执行维度为主世界。*这意味着在命令 `/execute` 上做出的执行上下文的更新在 `/schedule` 上是不起作用的。它需要的权限等级为2，以下是所有用法：
===== 在经指定的时间后再运行函数，语法为
#codebox("schedule function <function> <time> [append|replace]")
#param-desc(
  [`<name>`（函数 `minecraft:function`）], [一个函数的命名空间ID或一个函数标签。],
  [`<time>`（时间 `minecraft:time`）], [确定将要运行的函数还需等待的计划时间。时间参数的格式为：`<单精度浮点数>[<单位>]`，单位可以为：`t`（游戏刻），`s`（秒）或 `d`（游戏日，1游戏日固定为24000游戏刻），若不写单位，则默认单位为游戏刻。],
  [`[append|replace]` ], [可选，当拥有相同命名空间ID的函数被规定了多个不同的计划时间后，该参数定义了函数按照哪个计划运行。默认为 `replace`。]
)
== 函数的运行及上下文
== 回返机制
== 宏
== 命令连锁数量 <sec:max_command_sequence_length>
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
#appendix
= 索引
== 专有名词（汉语拼音顺序）
#columns(2)[
  #make-index(indexes: ("Default",), use-page-counter: true)
]