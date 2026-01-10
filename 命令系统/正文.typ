#import "@preview/in-dexter:0.7.2": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/hydra:0.6.2": hydra
#import "@preview/itemize:0.2.0" as el
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "自定义包/stringtree.typ": stringtree
#show: codly-init.with()
#import table: cell, header

// 封面
#[
  #set page(
    fill: rgb("#b34545"),
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
          font: "FZHeiTi GB18030L2"
        )
        原版技术性开发系列教程
        #v(1em)
        第#h(10pt)1#h(10pt)册
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
      命令系统Ciallo!
      #v(1em)
    ]
    #[
      #set text(
        fill: rgb("#e9dede"),
        font: "FZHeiTi GB18030L2",
        size: 1.5em
      )
      徐木弦#h(1em)主编\
      （急招：编写组成员）
      #v(5em)
    ]
  ]
]

// 字体
#set text(
  font: (
    (
      name: "FZShuSong GB18030L2",
      covers: regex("[·“”‘’…|/\[\]\{\}<>—]")
    ),
    "TeX Gyre Termes",
    "FZShuSong GB18030L2"
  ),
  lang: "zh"
)
#show strong: it => {
  set text(
    font: ("TeX Gyre Termes", "FZHeiTi GB18030L2"),
    weight: "bold", 
    fill: red,
  )
  it 
}

// 段落
#set par(
  first-line-indent: (
    all: true,
    amount: 2em
  ),
  justify: true,
  spacing: 0.65em
)

// 页面
#set page(
  header: context [
    #counter(footnote).update(0)
    #set text(
      size: 0.8em
    )
    #if calc.rem(here().page(), 2) == 1 {
      [
        #set text(
          font: (
            "TeX Gyre Termes",
            "FZKaiTi GB18030L2"
          )
        )
        #hydra(skip-starting: false, 1)
        #h(1fr)
        徐木弦原版技术性开发系列教程
      ]
    } else {
      [
        #set text(
          font: (
            "TeX Gyre Termes",
            "FZKaiTi GB18030L2"
          )
        )
        徐木弦原版技术性开发系列教程
        #h(1fr)
        #hydra(2, skip-starting: false)
      ]
    }
  ],
  numbering: "1",
  number-align: center,
)

// 有序列表
#show: el.default-enum-list.with(
  body-indent: 0em,
  indent: 0.5em,
  label-align: left,
  label-width: 1.5em
)
#let c1 = counter("L1")
#let c2 = counter("L2")
#let c3 = counter("L3")
#let item(level, body, new: false) = {
  if new {
    c1.update(0)
    c2.update(0)
    c3.update(0)
  }
  if level == 1 { c2.update(0); c3.update(0) }
  else if level == 2 { c3.update(0) }
  if level == 1 { c1.step() }
  else if level == 2 { c2.step() }
  else if level == 3 { c3.step() }
  context {
    let label-text = if level == 1 { c1.display("1.") }
    else if level == 2 { c2.display("(1)") }
    else if level == 3 { c3.display("①") }
    else { c1.display("a.") }
    let label-width = 1.5em
    let gap = if level == 2 { 0.5em } else { 0em }
    let left-indent = (level - 1) * 1.5em + 0.5em
    set par(
      first-line-indent: 0em, 
      hanging-indent: label-width + gap,
    )
    
    pad(left: left-indent)[
      #box(width: label-width)[#label-text]#h(gap)#body
    ]
  }
}
#let i1 = item.with(1)
#let i2 = item.with(2)
#let i3 = item.with(3)
#let i4 = item.with(4)
#show enum: it => {
  set par(first-line-indent: 0em)
  set text(
    font: (
      (
        name: "FZShuSong GB18030L2",
        covers: regex("[·“”‘’…|/\[\]\{\}<>—]")
      ),
      "TeX Gyre Termes",
      "FZShuSong GB18030L2"
    )
  )
  it
}
#set enum(numbering: n => text(font:"TeX Gyre Termes", [#n.]))

// 代码块
#show raw: it => {
  if it.block {
    it
  } else {
    h(0.25em) + box(
      baseline: -1pt,
      outset: (x: 2pt, y: 3pt),
      fill: rgb("#fef2f2"),
      stroke: 0.5pt + red,
      radius: 2pt,
      text(font: ("Consolas","FZShuSong GB18030L2"), size: 0.9em, it)
    ) + h(0.25em)
  }
}

// 有编号代码行
#let codeline = counter("codeline")
#show figure.where(kind: "codebox"): it => {
  set block(above: 1em, below: 1em)
  it
}
#let codebox(body, label: none, supplement: none) = figure(
  supplement: supplement,
  kind: "codebox",
  {
    set align(left)
    block(
      clip: true,
      fill: white,
      height: auto,
      stroke: 1pt + red,
      radius: 6pt,
      width: 100%,
      grid(
        columns: (1fr, auto),
        column-gutter: 16pt,
        block(
          inset: 8pt,
          width: 100%,
          {
            set text(
              font: (
                "Consolas",
                "FZShuSong GB18030L2"
              ),
              size: 0.85em
            )
            body
          }
        ),
        grid.cell(
          align: horizon,
          fill: rgb("#ff6565"),
          inset: 8pt,
          {
            set text(
              fill: white,
              font: "Consolas",
              size: 0.85em,
              weight: "bold"
            )
            context[#counter(heading).get().at(0)] + "." + h(-0.5em) + [
              #codeline.step()
              #context codeline.display()
            ]
          }
        )
      )
    ) + label
  },
  numbering: it => [#counter(heading).get().at(0).#(counter("codeline").get().at(0)+1)]
)

// 公式
#show math.equation: it => {
  set text(
    font: "TeX Gyre Termes Math"
  )
  h(2pt) + it + h(2pt)
}

// 参数解释
#let param-desc(prefix: "其中的参数：", ..args) = {
  let pos-args = args.pos()
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.2em,
    row-gutter: 0.65em,
    ..pos-args.chunks(2).enumerate().map(((i, pair)) => {
      let (info, desc) = pair
      (
        grid.cell(align: right)[
          #if i == 0 [#prefix]
          #info——],
        desc
      )
    }).flatten()
  )
}

// 例题
#let exa = counter("exa")
#let example(question, solution) = {
  exa.step()
  block(height: 0pt, width: 0pt, sticky: true)
  showybox(
    breakable: true,
    footer: [
      #h(-1em)
      #box[
        #box(
          fill: rgb("#ffcece"),
          inset: (
            x: 0.5em,
            y: 0.5em
          ),
          radius: 1em,
          [解]
        )
        #h(-2.4em)
        #box(
          baseline: -2pt,
          fill: rgb("#d71d1d"),
          inset: (
            x: 0.5em,
            y: 0.5em
          ),
          radius: 1em,
          [
            #set text(
              fill: white,
              font: "Minecraft"
            )
            解
          ]
        )
      ]
      #h(1em)
      #solution
    ],
    footer-style: (
      color: black,
      sep-thickness: 0pt
    ),
    frame: (
      body-color: rgb("#ffcece"),
      border-color: rgb("#d71d1d"),
      footer-color: white,
      title-color: rgb("#d71d1d"),
      title-inset: (x: 0.6em, y: 0.5em)
    ),
    shadow: (
      color: rgb("#ff6565"),
      offset: 3pt
    ),
    title: {
      set text(
        font: "Minecraft"
      )
      [例] + context str(counter(heading).get().at(0)) + "." + context exa.display()
    },
    title-style: (
      boxed-style: (
        anchor: (
          x: left,
          y: horizon
        ),
        radius: 5pt
      ),
      color: white
    )
  )[
    #show: block.with(breakable: true)
    #question]
}

// 图片
#show figure: set block(above: 1.5em, breakable: true)
#set figure(numbering: it => str(counter(heading).get().at(0)) + "." + counter(image).display("1"))
#let sub-figure(align: center, caption: [子图片], columns: 2, gutter: 2em, label: none, rows: auto, ..images) = [
  #figure(
    caption: caption,
    grid(
      align: align,
      columns: columns,
      gutter: gutter,
      rows: rows,
      ..images
    ),
  ) #label
  #let sub-figure-counter = columns - 1
  #counter(image).update(n => n - sub-figure-counter)
]

// 表格
#let tab_numbering(.., desc) = {
  context str(counter(heading).get().at(0)) + "." + counter(table).display("1")
}
#show figure.where(kind: table): set figure(gap: 0.3em)
#show figure.where(kind: table): set figure.caption(position: top, separator: "  ")
#show figure.caption: set text(font: ("TeX Gyre Termes", "FZHeiTi GB18030L2",), size: 0.85em, weight: "bold")
#show figure.caption: set block(sticky: true)
#show table.cell: it => {
  if it.y == 1 {
    set text(
      fill: white,
      font: ("TeX Gyre Termes", "FZHeiTi GB18030L2"),
      size: 0.85em,
      weight: "bold"
    )
    it
  }
  else {
    set text(
      size: 0.85em
    )
    it
  }
}
#let xubiao = state("xubiao")
#show table: it => xubiao.update(false) + it
#let general-table(
  caption: [表格标题],
  columns: auto,
  colspan: 1,
  header: (),
  seperator: (),
  ..content,
) = figure(
  caption: caption,
  numbering: tab_numbering,
  table(
    align: center + horizon,
    columns: columns,
    fill: (x, y) => {
      if x in seperator {red}
      else if y == 0 { rgb("#ffffff00") }
      else if y == 1 { rgb("#ff6565") }
      else if calc.rem(y, 2) == 1 {rgb("#fde9e9")}
      else {rgb("#fff8f8")}
    },
    gutter: 0.2em,
    stroke: none,
    table.header(
      table.cell(
        colspan: colspan,
        {
          context if xubiao.get() {
            align(right)[
              #set text(
                font: "FZKaiTi GB18030L2"
              )
              （续表）
            ]
          } else {
            v(-0.9em)
            xubiao.update(true)
          }
        }
      ),
      ..header
    ),
    ..content
  )
)

// 标题
#show heading: set align(center)
#show heading: set text(
  font: (
    "TeX Gyre Termes",
    "Source Han Serif"
  )
)
#show heading.where(level: 1): it => {
  set text(size: 2em)
  counter(image).update(1)
  counter(table).update(1)
  context codeline.update(0)
  context exa.update(0)
  pagebreak(weak: true)
  block(v(5em) + it + v(2em))
}
#show heading.where(level: 2): it => {
  set text(fill: rgb("#d71d1d"), size: 1.8em)
  block(v(1em) + it + v(1em))
}
#show heading.where(level: 3): it => {
  set align(left)
  set text(fill: rgb("#d71d1d"), size: 1.4em)
  block(v(0.2em) + it + v(0.6em))
}
#show heading.where(level: 4): it => {
  set align(left)
  set text(fill: rgb("#d71d1d"), font: "FZHeiTi GB18030L2", size: 1em)
  block(v(0.2em) + it + v(0.6em))
}
#let book-heading(..nums) = {
  let level = nums.pos().len()
  let space = h(0.8em)
  if level == 1 {
    let chapter-num = numbering("一", nums.at(0))
    return "第" + chapter-num + "章" + space
  } else if level == 2 {
    return numbering("1.1", ..nums) + space
  } else if level == 3 {
    return numbering("1.1.1", ..nums) + space
  } else if level == 4 {
    return numbering("一、", nums.at(3))
  } else {
    return none
  }
}
#set heading(
  numbering: book-heading
)

// 引用
#show ref: it => {
  if it.element != none and it.element.func() == heading {
    let el = it.element
    let nums = counter(heading).at(el.location())
    if el.level == 1 {
      [第#numbering("一", nums.at(0))章]
    } else if el.level == 2 {
      numbering("1.1", ..nums)
    } else if el.level == 3 {
      numbering("1.1.1", ..nums)
    } else if el.level == 4 {
      numbering("一、", nums.at(3))
    }
  } else {
    it
  }
}

// 脚注
#set footnote(
  numbering: " ①"
)
#show footnote.entry: it => {
  let loc = it.note.location()
  numbering(
    "①  ",
    ..counter(footnote).at(loc),
  )
  it.note.body
}

// 提示
#let tips(width: 100%, content) = block(
  width: width,
  showybox(
    breakable: true,
    frame: (
      body-color: rgb("#ffcece"),
      border-color: rgb("#d71d1d"),
      title-color: rgb("#d71d1d"),
      title-inset: (x: 0.6em, y: 0.5em)
    ),
    title: (text(font: "Minecraft", size: 0.9em, "小提示")),
    title-style: (
      boxed-style: (
        anchor: (
          x: left,
          y: horizon
        ),
        radius: 5pt
      ),
      color: white
    ),
    width: width,
    [
      #set text(size: 0.9em)
      #content
    ]
  )
)

// 图标
#let icon(name: none) = {
  if name == "folder" {
    box(image("图标/data/文件夹.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "file" {
    box(image("图标/data/文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "text" {
    box(image("图标/data/文本文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "png" {
    box(image("图标/data/图片文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "nbt" {
    box(image("图标/data/NBT文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json" {
    box(image("图标/data/JSON文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "mcfunction" {
    box(image("图标/data/函数文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "ogg" {
    box(image("图标/data/声音文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "zip" {
    box(image("图标/data/压缩文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "jar" {
    box(image("图标/data/JAR文件.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json-string" {
    box(image("图标/data/JSON字符串.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json-bool" {
    box(image("图标/data/JSON布尔值.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json-number" {
    box(image("图标/data/JSON数值.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json-array" {
    box(image("图标/data/JSON数组.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "json-object" {
    box(image("图标/data/JSON对象.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "vscode" {
    box(image("图标/VSCode.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "dhp" {
    box(image("图标/DHP.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "nbtstudio" {
    box(image("图标/NBTStudio.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "paint" {
    box(image("图标/画图.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "ps" {
    box(image("图标/PS.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
  if name == "gimp" {
    box(image("图标/GIMP.png", height:1em), baseline: 1pt)
    counter(image).update(n => n - 1)
  }
}

// 文件
#let codefile(title: "", body, lang: "file") = {
  codly(
    display-name: false,
    fill: rgb("#fff8f8"),
    header: [
      #set text(
        fill: white,
        font: (
          "Consolas",
          "FZShuSong GB18030L2"
        ),
        weight: "bold"
      )
      #h(0.5em)
      #title
    ],
    header-cell-args: (
      fill: rgb("#ff6565")
    ),
    languages: (
      json: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon(name:"json")#h(0.5em)
        ],
        name: "json"
      ),
      mcfunction: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon(name:"mcfunction")#h(0.5em)
        ],
        name: "mcfunction"
      ),
      txt: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon(name:"text")#h(0.5em)
        ],
        name: "txt"
      ),
      file: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon(name:"file")#h(0.5em)
        ],
        name: "file"
      )
    ),
    number-format: n => text(fill: red, weight: "bold")[#h(0.5em)#n#h(0.5em)],
    radius: 5pt,
    stroke: 1pt + rgb("#d71d1d"),
    zebra-fill: rgb("#fde9e9")
  )
  show raw: set text(font: ("Consolas", "FZShuSong GB18030L2"))
  raw(body, block: true, lang: lang)
}

// 树状图
#let tree(..items) = stringtree(line_color: red, ..items)

#heading(level: 1, numbering: none, outlined: false, [第一版序言])
Minecraft拥有多种多样的玩法，生存、PVP、PVE、模组、建筑、红石电路这些为众多玩家所熟知的玩法自成体系，玩家可以自由选择其中的某一方面深入研究。在这些玩法中，比较默默无闻的一种玩法可能便是广义上的命令，即包含了MC-CMD（命令）、资源包和数据包的系统。

在没有系统地接触命令系统前，玩家对于这个系统不了解、甚至完全没有意识到这个系统的存在都是有可能的。对于一些仅对命令系统做出更新的快照版本，一些玩家可能认为它们是“无用的”，即使这些更新在大部分情况下丰富了命令系统，使得服务器的运营、冒险地图及原版模组的制作更方便。在较为早期的版本中，命令更多依靠命令方块运行，这使得一些玩家错误地认为冒险地图或原版模组中的机关是由纯粹的红石电路运行的，并将这些机关的巧妙之处完全归结于红石电路的运作而完全忽略命令的作用。

这是因为命令系统更多地呈现一种“在后台运行”的状态，玩家无法在明面上查看它们的运行逻辑，更多地只是感受它们带来的效果。其次，命令系统是一个“入门难、精通容易”的板块，学习的门槛较高，一些基本的概念，如权限等级、命名空间ID、加载等级、坐标、目标选择器、JSON、NBT、记分板等，都是难于理解而对命令学习至关重要的知识点。再者，普通玩家在接触到命令系统时，更多地是熟悉诸如 `/kill`、`/gamemode` 这类带有简单参数的命令写法，而不会深究命令中各参数的意义，浅尝辄止的行为让玩家不大可能形成命令系统是一个完备体系的认识。最后，玩家在游戏时一般不会启用命令，而大部分命令所需的权限等级较高（即需要启用命令才能使用），因此一般玩家很少会与命令产生接触。

不过，命令系统应用范围极广，它对游戏的作用也是显而易见的，服务器的运行、冒险地图的制作、原版模组的制作均需要使用命令系统。对于游戏原有内容的修改和新内容的制作，如游戏外观的修改、粒子动画效果、自定义战利品、自定义物品等，均可以由命令系统来完成。命令系统提供了一个在不修改源代码的情况下的开发环境，使得Minecraft几乎成为了一款“无限”的游戏，唯一有限的也许便是玩家的想象力。同时，命令系统也极大地丰富了游戏社区、论坛。

在历代版本更新中，命令系统也随之有过大大小小的改善。在早期的版本中，命令一般只能借由聊天栏和命令方块执行，而命令方块是一种红石元件，因此彼时命令的自动化执行对于红石电路的依赖性较强，只能将红石信号转化为命令执行的信号或条件。然而在后续的版本中，函数及数据包的问世使得命令能够脱离红石电路单独运行，并随着数据包的不断完善，命令系统的研究和应用则更加方便。一些冒险地图真正做到了零命令方块化，命令的执行全部转交给数据包完成。因此命令方块及红石电路的教程则放在了附录中，不使用数据包仅使用命令方块时可以参阅这些内容。

对于这样一个较为完备的体系，笔者在前人既有教程的基础上，理清思路，加以整理，为之编写完整的命令教程。在内容安排上，优先讲述基本概念，如权限等级、命令执行上下文、命名空间ID、数据包标签、参数、区块及加载等级等，这些概念是能够执行命令的最基本条件。在绪论之后是命令系统的五大重要基础板块：坐标、目标选择器、JSON、NBT和记分板，这些内容是需要熟练掌握的基本功。在第七章，我们主要学习命令 `/execute`，这条命令能够修改命令执行上下文，一般可以认为是整个命令系统中最强大的命令。一些零散的命令则放到了第八章中讲解。资源包和数据包则被安排到了其他教程中，这些内容是命令系统的进阶部分，一定程度上脱离了狭义的命令体系，却也是命令系统的精华部分。学有余力的读者可进行《资源包》和《数据包》两本教程的学习。

在系统学习命令系统前，读者需要了解到的一点是，其他玩法领域可能更多地追求稳定的游戏环境，因此可能会选择旧的游戏版本。而命令系统随着版本更新不断完善，使得命令玩家不自觉地追求新版本，因此有关命令的讨论一般都基于最新版游戏。一些问题，诸如“在1.8版本中这个命令怎么写”，则可能得不到答复，因为命令系统在扁平化时经历了巨大的改动，使得改动前后几乎是两个完全不同的系统。同时，不同平台的命令系统也是不互通的，本教程仅适用于Java版，部分内容与基岩版不同，因此无法作为基岩版命令教学的参考。

那么在学习命令之前需要掌握哪些预备知识呢？首先需要对原版的Minecraft有足够的了解，因为命令基本上涉及了游戏中的方方面面。其次可以适当学习一些英语，命令的参数中有大量的英语单词，如果熟悉它们的意思将会极大提升命令编写的效率。本教程在论述的过程中，会经常使用高等数学、线性代数和概率论与数理统计的语言，读者可先行了解与命令系统紧密相关的一些数学知识，如向量代数与空间解析几何、矩阵与变换、随机事件及概率分布等。计算机图形学的一些内容也包括在内。此外，大家还可以提前学习一些编程思想，建立严密的逻辑思维能力，懂得如何指挥电脑（游戏）进行工作。没有相关编程基础并不意味着完全不能学好命令，编程思维也可以在命令学习的过程中逐步建立。

本教程仅作为基础教程使用，即仅介绍命令系统中所有的基本概念，并在此基础上进行一定的应用、扩展，其中应用层面主要面向冒险地图和原版模组的制作。一些较为高级的算法则不在本教程范围之内。其中带“\*”号的是选择性学习内容，它们所述的一些是不常用的内容，一些则是《资源包》或《数据包》两本教程的相关内容，想进修《资源包》和《数据包》的读者需留意这些带“\*”号知识点。

限于笔者的知识水平，本教程必有一定疏漏之处，望广大读者斧正！
#align(end)[编者]
#align(end)[2024年1月24日]

#heading(level: 1, numbering: none, outlined: false, [第二版序言])

自2023年发布的1.19.4起，Minecraft的技术性开发板块进入了又一个新时代，这可谓是自2012年骇人更新加入命令方块、2018年水域更新扁平化以来第三次革命性的巨变。这次“巨变”的主要体现在于：逐步开放了很多API，即将很多固有注册表转为可写注册表，使得原先需要大量命令模拟的效果用数据包自定义即可，这无疑大大省去了技术性开发的成本。从这两年Minecraft Java版的更新迭代可以看出，Minecraft的开发重点逐渐地由加入新的实质性游戏内容转为对数据包、资源包的支持。新游戏内容更新的占比下降，技术性更新的占比上升。数据包、资源包的版本号更迭已由先前的一个大版本一次变为一个快照一次，迭代速度越来越快。以数据包为例，2022年数据包的版本号为10，彼时距数据包的加入仅过了四年多；而截止至2024年底，数据包的版本号已达到了61。

许多玩家对自1.17以来的Minecraft开发极不满意，有些人认为Minecraft近几年并没有革命性的更新出现，每个版本的更新内容也极少，对游戏深度的挖掘不够，“敷衍了事”。对于每个快照更新介绍中大篇幅的技术性更新内容，大量玩家则视若无睹。这个现象直接反映了普通玩家对技术性开发这一板块认识的欠缺，正如第一版序言所说，“玩家对于这个系统不了解、甚至完全没有意识到这个系统的存在”。为此，对玩家进行技术性开发板块知识的普及很有必要。

不得不承认的是，技术性开发确实是一种门槛较高的玩法，其学习成本较高，容错率低，开发周期长，且开发过程不可见，因此难于在社区中引起较大的讨论度。目前，各大社区平台仍然缺乏专门的技术性开发论坛，现有的教程也零碎且不完整。社区的讨论主要集中于原版游戏内容、Mods玩法等，鲜有技术性开发有关的资料，这使其搜索难度较大。技术性开发玩家通常“单打独斗”，缺少交流，进一步限制了有开发想法的玩家学习进步。为此，为已入门的技术性开发玩家编写系统性的、完整的教程很有必要。

原版技术性开发的命令、资源包、数据包三个板块在本系列教程中分作三部分别讲述。对于其中的一些基本概念，如注册表、坐标、目标选择器、文本组件、NBT、记分板、属性、存档格式等，为了便于教程编纂，将其放在《命令系统》一书中与命令语法一起说明。命令是数据包的一个子集，用于函数中，数据包为它提供了程序化运行的环境。在早先的版本中，命令通常是红石电路的一个子集，用于命令方块中，由红石信号控制命令的执行。虽然现在主流的开发环境是数据包，但仍有玩家使用命令方块红石电路进行开发，因此本系列教程中仍保留对命令方块红石电路的讲解，《命令系统》书中的一些例子则提供了使用数据包和使用命令方块红石电路的两种解法，但侧重于使用数据包，而在《数据包》中则仅提供使用数据包的解法。资源包是相对较独立的一个板块，其内容中仅少部分与数据包有关联，对美术设计的要求较高，部分开发资源包的玩家专注于资源包，不会去开发数据包。然而在开发实践中数据包与资源包的联系却越来越紧密，仅依靠数据包能够实现的效果有限，与资源包配合开发能得到更好的效果。

这一版的《命令系统》教程相较上一版而言，对调了一些章节使得教程整体的逻辑更合理。同时新增了一些章节，新增的内容大多拆分自原本的章节，但对这些被拆分的内容有了更详尽的叙述。原本教程中零散的内容在这一版中均尽可能地归到一类下。经过这些变动后，教程的整体章节较先前的版本有了很大的不同。产生这些变动的主要原因是文本组件的存储格式由JSON变为了SNBT，即使在数据包中文本组件仍使用JSON格式。从教程逻辑上讲，文本组件应合并至“NBT格式”一章，但上一版的“NBT格式”一章已有11个小节，内容量极其庞大，若再塞入文本组件的全部内容，只会使“NBT格式”一章显得更臃肿。况且属性、状态效果这些内容依照存储格式也归到了实体格式或物品堆叠组件格式之下，将这些归类的内容全部放入“NBT格式”一章更不适宜。于是，原本经典的的“绪论——坐标——目标选择器——原始JSON文本——NBT格式——记分板——命令 `/execute` ——杂项命令”的教程章节顺序已不适用。经过考虑，这一版的教程章节变动安排如下：

+ “绪论”、“坐标与区块”、“UUID与目标选择器”三章的顺序不变，仅调整这三章内部小节的顺序及编排。

+ 删去原本的“NBT格式”一章，并将其重命名为“NBT与JSON格式”，新的章节保留原本“NBT格式”一章的概述、NBT路径、命令 `/data` 的语法。同时将原本“原始JSON文本”一章的“JS对象表示法”一节移入新的“NBT与JSON格式”。随后将概述一节中涉及SNBT和JSON相互转换的内容移出，单独设置一个小节。

+ 将新的“NBT与JSON格式”提前至第四章，将“原始JSON文本”改名为“文本组件”并后移至第五章。“文本组件”一章将同时讲解其SNBT和JSON形式。

+ 对于从原本“NBT格式”一章中移出的其他内容，结合属性、状态效果，单独开设新的一章“存档格式”作为第六章，同时合并原本附录II“游戏文件”的内容至这一章的概述小节。新的“存档格式”包含命令存储格式、区域文件格式、方块实体格式、实体格式、属性格式、状态效果格式、标记格式、展示实体格式、交互实体格式、玩家格式和物品堆叠组件格式。

+ “记分板”、“命令的执行”、“其他分类的命令”分别顺延至第七、八、九章。“命令的执行”更名为“命令 `/execute`”。

+ 由于章节合并，“其他分类的命令”中“状态效果”、“属性”两节被删除。

+ 删除原本的附录II“游戏文件”。

受限于编者的知识水平，本教程一定有不足之处，望广大读者斧正！
#align(end)[编者]
#align(end)[2025年2月7日]

#show outline.entry.where(level: 1): it => {
  set text(
    font: (
      "TeX Gyre Termes",
      "Source Han Serif"
    ),
    weight:"bold"
  )
  it
}
#show outline.entry.where(level: 4): it => {}
#outline(title:"目  录",indent: 2em)

#pagebreak()
#counter(page).update(1)
= 绪论
原版技术性开发，Minecraft Wiki称为“Java版可自定义内容”，是由命令、资源包、数据包及相关的组件附件组合成的一个板块。技术性开发成果丰富，这些成果即是社区玩家常用的Mods、冒险地图、数据包、资源包、服务器等。Minecraft的技术性开发大致分为Mods开发和原版开发，其区别在于是否对游戏的源代码进行了修改。

本系列教程针对的是原版技术性开发，这一部分玩家的工作方向通常为制作冒险地图、开发原版模组、制作资源包或者管理服务器。

#pagebreak()

== 注册表与数据值
Minecraft有许多不同的游戏资源，如草方块、石头、箭、铁锹、猪等，对这些游戏资源进行分类，可以将草方块、石头分为方块，箭、铁锹分为物品，猪划分至实体。方块、物品、实体显然是区分这些游戏资源的“大类”。*注册表（Registry）*#index(display:"注册表（Registry）","zhucebiao")就是对不同资源进行分类管理的机制。除分类管理外，还需要给予每种资源一个独特的“身份证”，目的是与别的资源区分开来，唯一地映射到注册表内的给定值。这些“身份证”被称为游戏资源的数据值，或称ID。
=== 注册表 \*
注册表可分为以下两类：*固有注册表（Built-in registry）*#index(display:"固有注册表（Built-in registry）","guyouzhucebiao")和*可写注册表（Writable registry）*#index(display:"可写注册表（Writable registry）","kexiezhucebiao")。无论资源位于什么类型的注册表，*游戏都只会识别已被注册的资源*。

下面列举了Minecraft中所有的资源类型：
==== 固有注册表
固有注册表存储硬编码的游戏内容，除非修改源代码，否则其中的内容不可更改。
#general-table(
  caption: [固有注册表],
  columns: (7fr, 4fr, 7fr, 2fr),
  colspan: 4,
  header:([注册表], [资源类型], [数据包路径], [默认值]),
  [`ACTIVITY`], [生物AI], [`activity`], [],
    [`ATTRIBUTE`], [属性], [`atrribute`], [],
    [`ATTRIBUTE_TYPE`], [环境属性类型], [`attribute_type`], [],
    [`BIOME_SOURCE`], [生物群系源], [`worldgen/biome_source`], [],
    [`BLOCK`], [方块], [`block`], [`air`],
    [`BLOCK_ENTITY_TYPE`], [方块实体类型], [`block_entity_type`], [`furnace`],
    [`BLOCK_PREDICATE_TYPE`], [方块谓词类型], [`block_predicate_type`], [],
    [`BLOCK_STATE_PROVIDER_TYPE`], [方块状态提供器类型], [`worldgen/block_state_provider_type`], [],
    [`BLOCK_TYPE`], [方块类型], [`block_type`], [],
    [`CARVER`], [雕刻器类型], [`worldgen/carver`], [],
    [`CHUNK_GENERATOR`], [区块生成器类型], [`worldgen/chunk_generator`], [],
    [`CHUNK_STATUS`], [区块状态], [`chunk_state`], [`empty`],
    [`COMMAND_ARGUMENT_TYPE`], [命令参数类型], [`command_argument_type`], [],
    [`CONSUME_EFFECT_TYPE`], [消耗使用效果类型], [`consume_effect_type`], [],
    [`CREATIVE_MODE_TAB`], [创造标签页], [`creative_mode_tab`], [],
    [`CUSTOM_STAT`], [统计信息], [`custom_stat`], [], 
    [`DATA_COMPONENT_PREDICATE_TYPE`], [数据组件谓词类型], [`data_component_predicate_type`], [],
    [`DATA_COMPONENT_TYPE`], [数据组件类型], [`data_component_type`], [],
    [`DEBUG_SUBSCRIPTION`], [调试订阅], [`debug_description`], [], 
    [`DECORATED_POT_PATTERN`], [饰纹陶罐图案类型], [`decorated_pot_pattern`], [], 
    [`DENSITY_FUNCTION_TYPE`], [密度函数类型], [`worldgen/density_function_type`], [],
    [`DIALOG_ACTION_TYPE`], [对话框操作类型], [`dialog_action_type`], [],
    [`DIALOG_BODY_TYPE`], [对话框主体类型], [`dialog_body_type`], [],
    [`DIALOG_TYPE`], [对话框类型], [`dialog_type`], [],
    [`ENCHANTMENT_EFFECT_COMPONENT_TYPE`], [魔咒效果组件类型], [`enchantment_effect_component_type`], [],
    [`ENCHANTMENT_ENTITY_EFFECT_TYPE`], [魔咒实体效果类型], [`enchantment_entity_effect_type`], [], 
    [`ENCHANTMENT_LEVEL_BASED_VALUE_TYPE`], [魔咒等级依赖函数类型], [`enchantment_level_based_value_type`], [],
    [`ENCHANTMENT_LOCATION_BASED_EFFECT_TYPE`], [魔咒位置依赖函数类型], [`enchantment_location_based_effect_type`], [],
    [`ENCHANTMENT_PROVIDER_TYPE`], [魔咒提供器类型], [`enchantment_provider_type`], [],
    [`ENCHANTMENT_VALUE_EFFECT_TYPE`], [魔咒值效果类型], [`enchantment_value_effect_type`], [],
    [`ENVIRONMENT_ATTRIBUTE`], [环境属性], [`environment_attribute`], [],
    [`ENTITY_SUB_PREDICATE_TYPE`], [实体子谓词类型], [`entity_sub_predicate_type`], [],
    [`ENTITY_TYPE`], [实体类型], [`entity_type`], [`pig`], 
    [`FEATURE`], [地物类型], [`worldgen/feature`], [],
    [`FEATURE_SIZE_TYPE`], [树木生成的最小空间要求类型], [`worldgen/feature_size_type`], [],
    [`FLOAT_PROVIDER_TYPE`], [浮点数提供器类型], [`float_provider_type`], [], 
    [`FLUID`], [流体类型], [`fluid`], [`empty`],
    [`FOLIAGE_PLACER_TYPE`], [树叶放置器类型], [`worldgen/foliage_placer_type`], [],
    [`GAME_EVENT`], [游戏事件], [`game_event`], [`step`],
    [`GAME_RULE`], [游戏规则], [`game_rule`], [`step`],
    [`HEIGHT_PROVIDER_TYPE`], [高度提供器类型], [`height_provider_type`], [],
    [`INCOMING_RPC_METHOD`], [服务端管理协议中的请求方法], [`incoming_rpc_methods`], [],
    [`INPUT_CONTROL_TYPE`], [对话框输入控件类型], [`	input_control_types`], [],
    [`INT_PROVIDER_TYPE`], [整数提供器类型], [`int_provider_type`], [],
    [`ITEM`], [物品], [`item`], [`air`],
    [`SLOT_SOURCE_TYPE`], [槽位源类型], [`slot_source_type`], [],
    [`LOOT_CONDITION_TYPE`], [战利品表谓词类型], [`loot_condition_type`], [],
    [`LOOT_FUNCTION_TYPE`], [物品修饰器类型], [`loot_function_type`], [],
    [`LOOT_NBT_PROVIDER_TYPE`], [战利品表相关NBT源类型], [`loot_nbt_provider_type`], [],
    [`LOOT_NUMBER_PROVIDER_TYPE`], [值提供器类型], [`loot_number_provider_type`], [],
    [`LOOT_POOL_ENTRY_TYPE`], [抽取项类型], [`loot_pool_entry_type`], [],
    [`LOOT_SCORE_PROVIDER_TYPE`], [分数提供器类型], [`loot_score_provider_type`], [],
    [`MAP_DECORATION_TYPE`], [地图图标类型], [`map_decoration_type`], [],
    [`MATERIAL_CONDITION`], [地表规则条件], [`worldgen/material_condition`], [],
    [`MATERIAL_RULE`], [地表规则], [`worldgen/material_rule`], [],
    [`MEMORY_MODULE_TYPE`], [生物记忆], [`memory_module_type`], [`dummy`],
    [`MENU`], [屏幕类型], [`menu`], [],
    [`MOB_EFFECT`], [状态效果], [`mob_effect`], [],
    [`NUMBER_FORMAT_TYPE`], [记分板分数显示样式类型], [`number_format_type`], [],
    [`OUTGOING_RPC_METHOD`], [服务端管理协议中的通知方法], [`outgoing_rpc_methods`], [],
    [`PARTICLE_TYPE`], [粒子类型], [`particle_type`], [],
    [`PLACEMENT_MODIFIER_TYPE`], [放置修饰器类型], [`worldgen/placement_modifier_type`], [],
    [`PERMISSION_CHECK_TYPE`], [命令权限检查类型], [`permission_check_type`], [],
    [`PERMISSION_TYPE`], [命令权限类型], [`permission_type`], [],
    [`POINT_OF_INTEREST_TYPE`], [兴趣点类型], [`point_of_interest_type`], [],
    [`POOL_ALIAS_BINDING`], [模板池映射], [`worldgen/pool_alias_binding`], [],
    [`POSITION_SOURCE_TYPE`], [位置源类型], [`position_source_type`], [],
    [`POS_RULE_TEST`], [位置规则测试类型], [`pos_rule_test`], [],
    [`POTION`], [药水效果], [`potion`], [],
    [`RECIPE_BOOK_CATEGORY`], [配方书分类标签], [`recipe_book_category`], [],
    [`RECIPE_DISPLAY`], [预览配方类型], [`recipe_display`], [],
    [`RECIPE_SERIALIZER`], [配方序列化/反序列化器], [`recipe_serializer`], [],
    [`RECIPE_TYPE`], [配方类型], [`recipe_type`], [],
    [`REGISTRY`], [注册表], [`root`], [],
    [`ROOT_PLACER_TYPE`], [树根放置器类型], [`worldgen/root_placer_type`], [],
    [`RULE_TEST`], [规则测试], [`rule_test`], [],
    [`RULE_BLOCK_ENTITY_MODIFIER`], [方块实体数据修饰器], [`rule_block_entity_modifier`], [],
    [`SENSOR_TYPE`], [感受器类型], [`sensor_type`], [],
    [`SLOT_DISPLAY`], [预览槽位类型], [`slot_display`], [],
    [`SOUND_EVENT`], [声音事件], [`sound_event`], [],
    [`SPAWN_CONDITION_TYPE`], [通用变种选择器类型], [`spawn_condition_type`], [],
    [`STAT_TYPE`], [统计类型], [`stat_type`], [],
    [`STRUCTURE_PIECE`], [结构片段], [`worldgen/structure_piece`], [],
    [`STRUCTURE_PLACEMENT`], [结构放置方式], [`worldgen/structure_placement`], [],
    [`STRUCTURE_POOL_ELEMENT`], [结构模板池元素], [`worldgen/structure_pool_element`], [],
    [`STRUCTURE_PROCESSOR`], [结构处理器], [`worldgen/structure_processor`], [],
    [`STRUCTURE_TYPE`], [结构类型], [`worldgen/structure_type`], [],
    [`TEST_ENVIRONMENT_DEFINITION_TYPE`], [测试环境类型], [`test_environment_definition_type`], [],
    [`TEST_FUNCTION`], [硬编码测试函数], [`test_function`], [],
    [`TEST_INSTANCE_TYPE`], [测试实例类型], [`test_instance_type`], [],
    [`TICKET_TYPE`], [加载标签及计算标签类型], [`ticket_type`], [],
    [`TREE_DECORATOR_TYPE`], [树额外装饰器类型], [`worldgen/tree_decorator_type`], [],
    [`TRIGGER_TYPE`], [触发器类型], [`trigger_type`], [],
    [`TRUNK_PLACER_TYPE`], [树干放置器类型], [`worldgen/trunk_placer_type`], [],
    [`VILLAGER_PROFESSION`], [村民职业], [`villager_profession`], [`none`],
    [`VILLAGER_TYPE`], [村民类型], [`villager_type`], [`plain`]
)
==== 可写注册表
可写注册表允许数据包通过数据反序列化器向其中添加自定义（或称数据驱动）的游戏内容。
#general-table(
  caption: [可写注册表],
  columns: (auto, auto, auto),
  colspan: 3,
  header:([注册表], [资源类型], [数据包路径]),
    [`ADVANCEMENT`], [进度], [`advancement`],
    [`BANNER_PATTERN`], [旗帜图案], [`banner_pattern`],
    [`BIOME`], [生物群系], [`worldgen/biome`],
    [`CAT_VARIANT`], [猫的变种], [`cat_variant`],
    [`CHAT_TYPE`], [聊天类型], [`chat_type`],
    [`CHICKEN_VARIANT`], [鸡的变种], [`chicken_variant`],
    [`CONFIGURED_CARVER`], [已配置的雕刻器], [`worldgen/configured_carver`],
    [`CONFIGURED_FEATURE`], [已配置的地物], [`worldgen/configured_feature`],
    [`COW_VARIANT`], [牛的变种], [`cow_variant`], 
    [`DAMAGE_TYPE`], [伤害类型], [`damage_type`],
    [`DENSITY_FUNCTION`], [密度函数], [`worldgen/density_function`],
    [`DIALOG`], [对话框], [`dialog`],
    [`DIMENSION`], [维度], [`dimension`],
    [`DIMENSION_TYPE`], [维度类型], [`dimension_type`],
    [`ENCHANTMENT`], [魔咒数据格式], [`enchantment`],
    [`ENCHANTMENT_PROVIDER`], [魔咒提供器], [`enchantment_provider`], [`FLAT_LEVEL_GENERATOR_PRESET`], [超平坦世界生成预设], [`worldgen/flat_level_generator_preset`],
    [`FROG_VARIANT`], [青蛙的变种], [`frog_variant`],
    [`INSTRUMENT`], [山羊角乐器], [`instrument`],
    [`ITEM_MODIFIER`], [物品修饰器], [`item_modifier`],
    [`JUKEBOX_SONG`], [唱片机曲目], [`jukebox_song`],
    [`LEVEL_STEM`], [维度], [`dimension`],
    [`LOOT_TABLE`], [战利品表], [`loot_table`],
    [`MULTI_NOISE_BIOME_SOURCE_PARAMETER_LIST`], [多噪声参数列表], [`worldgen/multi_noise_biome_source_parameter_list`],
    [`NOISE`], [噪声], [`worldgen/noise`],
    [`NOISE_SETTINGS`], [噪声设置], [`worldgen/noise_settings`],
    [`PAINTING_VARIANT`], [画的变种], [`painting_variant`],
    [`PIG_VARIANT`], [猪的变种], [`pig_variant`],
    [`PLACED_FEATURE`], [已放置的地物], [`worldgen/placed_feature`],
    [`PREDICATE`], [谓词], [`predicate`],
    [`PROCESSOR_LIST`], [处理器列表], [`worldgen/processor_list`],
    [`RECIPE`], [配方], [`recipe`],
    [`STRUCTURE`], [已配置的结构地物], [`worldgen/structure`],
    [`STRUCTURE_SET`], [结构集], [`worldgen/structure_set`],
    [`TEMPLATE_POOL`], [结构池], [`worldgen/template_pool`],
    [`TEST_ENVIRONMENT`], [测试环境], [`test_environment`],
    [`TEST_INSTANCE`], [测试实例], [`test_instance`],
    [`TIMELINE`], [时间线], [`timeline`],
    [`TRIAL_SPAWNER_CONFIG`], [试炼刷怪笼配置], [`trial_spawner`],
    [`TRIM_MATERIAL`], [盔甲纹饰材料], [`trim_material`],
    [`TRIM_PATTERN`], [盔甲纹饰图案], [`trim_pattern`],
    [`WOLF_VARIANT`], [狼的变种], [`wolf_variant`],
    [`WORLD_PRESET`], [世界预设], [`worldgen/world_preset`],
    [`ZOMBIE_NAUTILUS_VARIANT`], [僵尸鹦鹉螺变种], [`zombie_nautilus_variant`]
)
==== 不属于任何注册表的游戏资源
有一些游戏资源不属于任何注册表，这些资源包括数据包内的函数、结构模板以及资源包内的所有内容。这些资源类型中部分都与可写注册表的性质类似，即可以自定义写入资源；部分则不能增添新的资源，但可以修改已有资源的配置文件。
#i1[数据包内容]
#i2[函数：可写，即 `function` 路径下的内容。]
#i2[结构模板：可写，即 `structure` 路径下的内容。]
#i1[资源包内容]
#i2[纹理图集：位于资源包内路径 `atlases`。]
#i2[方块状态：位于 `blockstates`。]
#i2[纹饰图案：位于 `equipment`。]
#i2[字体：可写，位于 `font`。]
#i2[物品模型映射：位于 `items`。]
#i2[模型：包括方块模型和物品模型，位于 `models`。]
#i2[粒子：位于 `particles`。]
#i2[着色器：可写，位于 `shaders`。]
#i2[后处理管线：位于 `post_effect`。]
#i2[声音：可写，位于 `sounds`。]
#i2[纹理：可写，位于 `textures`。]
#i1[属性修饰符：可写，存储于所属物品的堆叠组件内。]
#i1[Boss栏：可写，存储于存档文件夹中的 `level.dat`。]
#i1[命令存储：可写，存储于存档文件夹中的 `data\command_storage_minecraft.dat`。]
#i1[随机序列：可写，存储于存档文件夹中各自维度的 `data\random_sequences.dat` 文件内。]

=== 扁平化 \*
Minecraft的历次版本更新都会对某一些特定的系统进行优化和更改，比如：战斗更新对PVP机制进行了颠覆性的更改，使得1.9之前和之后的PVP是两个完全不同的系统。命令系统也经历过类似的大幅度更改，这便是随着水域更新进行的*扁平化（The flattening）*#index(display:"扁平化（The flattening）","bianpinghua")。

在Minecraft开发之初，由于游戏资源的数量有限，只需要使用1字节就可以设置所有游戏资源的ID。在历次版本更新中，Minecraft的方块、物品数量越来越多，特别是自缤纷更新以来，方块的数量呈爆炸式增长。在扁平化之前，为了应对这些不断增多的游戏资源，一种解决办法是将一大类全部收归到某一个特定的ID中，用这个ID来表示这一类方块，然后在后面附加一个Damage值来表示这一类方块中的某一种。比如花岗岩属于石头一类，石头的数字ID为1，而花岗岩的Damage值为1，所以在旧版本中给予玩家一块花岗岩的命令为：
#codebox("give @p 1 1 1")
可以看到这条命令中有三个参数，第一个 `1` 为石头的ID，第二个 `1` 为数量，第三个 `1` 为Damage值。这种表示方式的底层逻辑是：在访问花岗岩时，必须先访问上一级的数字ID，再访问Damage值，如此才能映射至花岗岩这个值。

缤纷更新做了一个小修改：即启用了部分英文ID，于是在1.8中给予玩家一块花岗岩的命令变为：
#codebox("give @p stone 1 1")
但是缤纷更新做出的这种更改是不完全的，虽然在命令的主体部分将数字ID替换成了英文ID，但是方块的Damage值仍然存在，这种一级ID——Damage值的映射方式没有改变。

时间来到了2017年，水域更新加入了大量的游戏内容，原先的映射方式已不能适应新版本。于是，*Java版1.13的更新基本上删除了所有的数字ID，使得每一个游戏资源都有其独立的英文ID。同时也删除了用Damage值映射方块的办法，去除了中间层，使得资源的映射方式只需要一个键名即可，这一过程便被称作“扁平化”*#footnote[并非所有数字ID都被移除，至今Minecraft仍保留了部分需要使用数字ID的地方。]。比如，在1.13中给予玩家一块花岗岩的命令为：
#codebox("give @p granite 1")
其中参数 `granite` 为花岗岩的键名，`1` 为物品数量。扁平化对所有需要ID的对象都进行了修改，包括但不限于方块、物品、实体、生物群系、粒子、声音事件和画。其具体内容可分为以下几类：
+ 拆分

  拆分是最能体现扁平化过程的一类。此举移除了用于指定大类下某一种方块的Damage值，使得一类方块下的每一种方块都有其独立的ID。举例：`stone` 一类共有七种不同的方块：石头、花岗岩、磨制花岗岩、闪长岩、磨制闪长岩、安山岩和磨制安山岩，分别对应0 \~ 6的Damage值。拆分后这七种方块都被给予了独立的ID：`stone`、`granite`、`polished_granite`、`diorite`、`polished_diorite`、`andesite` 和 `polished_andesite`。
+ 重命名

  顾名思义，该类即对原有的英文ID进行重命名。有相当一部分重命名是为了迎合方块或物品的英文名称。举例：草方块在扁平化前的ID为 `grass`，扁平化后被重命名为 `grass_block`。
+ 重新分类

  这种操作常见于台阶和由双台阶组成的完整方块。扁平化前的台阶和双台阶有两种不一样的ID，扁平化后取消双台阶的ID，并对台阶的下属分类进行拆分，同时取消相关的Damage值。举例：双木台阶被取消，统一更换为木制台阶，同时ID拆分为橡木、云杉、白桦、丛林木、金合欢和深色橡木。
+ 合并

  合并常见于有不同方块状态的方块。举例：燃烧的熔炉和熔炉有不同的ID，现合并为熔炉一种，同时将是否燃烧设定为方块状态。
=== 命名空间ID
游戏资源的指定有一个前提是这些对象的ID相互之间不能混淆。数字ID及使用Damage值作区分的指定方法能够避免对象之间的冲突，但扁平化后这种指定方法便无效了。为此在当前的版本中统一使用*（赋）命名空间ID（Namespaced identifier）*#index(display: "（赋）命名空间ID（Namespaced identifier）", "mingmingkongjian")来映射注册表内的值。

命名空间ID，又称*（赋）命名空间标识符*、*资源路径（Resource location）*#index(display: "资源路径（Resource location）", "ziyuanlujing")、*资源标识符（Resource identifier）*#index(display: "资源标识符（Resource identifier）", "ziyuanbiaoshifu")或*命名空间字符串（Namespaced string）*#index(display: "命名空间字符串（Namespaced string）", "mingmingkongjianzifuchuan")，是字符串化的映射方式。无论命名空间ID用于映射何种对象，它们都具有同一的表达方式：
#codebox("<namespace>:<path>")
#param-desc(
  [`<namespace>`], [命名空间。], [`<path>`], [路径。]
)
在写法上，除用于分割命名空间和路径的冒号 `:` 外，其中所有的字符都只能为合法字符。合法字符包含以下几类：
#wrap-content(
  tips(
    [大写字母在命名空间ID中为非法字符！],
    width: 7em
  ),
  [
    + 数字：`0123456789`；
    + 小写字母：`abcdefghijklmnopqrstuvwxyz`；
    + 下划线：`_`；
    + 连字符：`-`；
    + 点：`.`。
  ],
  align: right
)
除此之外所有的字符均为非法字符，包括汉字、平假名、片假名、西里尔字母、希腊字母、制表符、几何图形符、`+` 等符号。斜杠 `/` 比较特殊，它在命名空间中为非法字符，但是在路径中可用于分割目录的不同层级，以下会有详细说明。
==== 命名空间ID的实际意义
#wrap-content(
  tips(
    [原版游戏中大部分对象都使用命名空间 `minecraft`，但是六种基本命令参数类型（@subsec:command_argument#h(-0.7em)）却使用命名空间 `brigadier`。],
    width: 13em
  ),
  [
    
    *命名空间（Namespace）*#index(display: "命名空间（Namespace）", "mingmingkongjian")是游戏资源的区界，它位于资源类型的父层级，所有来自Minecraft原版游戏的资源均位于命名空间 `minecraft`。*通过不同的自定义命名空间可以将新增的内容和原版内容区分开来，以防止新内容和原版内容、新内容和其他新内容之间产生冲突。*例如，有两个命名空间ID `minecraft:something` 和 `custom:something`，它们指定的是两个不同的对象，因为它们的命名空间不同，前者为 `minecraft`，后者为 `custom`，即使两者拥有相同的路径（名称） `something`。
  ],
  align: left
)
部分游戏资源在命名空间下有一定的文件路径，尤其是资源包、数据包内容，这时就可以使用 `/` 以表明它们的文件路径。这里命名空间实际上是一个文件夹，这个文件夹的结构一般是 `<命名空间>\<资源类型>\<文件夹1>\<文件夹2>\…\<文件名>.<后缀>`。若要映射到这个文件，则命名空间ID的写法为
#codebox("<命名空间>:<文件夹1>/<文件夹2>/…<文件名>")
注意以下几点：
+ 资源类型不作为命名空间ID的一部分；
+ 资源路径的子文件夹至文件之间的一系列路径必须完整；
+ 文件名后缀不写。
下面举两个例子以说明之：
#example(
  [
    有数据包函数文件路径为 `minecraft\function\load.mcfunction`，试用命名空间ID指定之。
  ],
  [
    这里 `function` 为资源类型，`.mcfunction` 为文件的后缀。故命名空间ID为
    #codebox("minecraft:load")
  ]
)
#example(
  [
    有资源包纹理文件路径为 `minecraft\textures\block\command_block_front.png`，试用命名空间ID指定之。
  ],
  [
    这里 `textures` 为资源类型，`.png` 是文件后缀，依照其路径将命名空间ID写为
    #codebox("minecraft:block/command_block_front")
  ]
)
==== 命名空间ID字符串的识别与一般写法
命名空间ID是形如 `<字符串>:<字符串>` 的字符串，游戏在识别、调用相关对象时，如果冒号 `:` 存在，会将冒号前的内容视作命名空间，其中不能出现斜杠 `/`；将冒号后的内容视作路径，可以出现斜杠。为了保证识别的正确性，整个字符串中最多只能出现一个冒号，否则识别会出现错误。如果冒号不存在，字符串的形式为 `<字符串>`，则游戏会直接将整个字符串直接识别为路径，并默认命名空间为 `minecraft`，有些时候可以适当地减少书写命名空间，但省略命名空间的行为仍是不被建议的：虽然命名空间在原版大部分需要ID的地方上不是必须的，但在一些情况下命名空间是必须的，包括但不限于NBT路径中指定ID的节点。鉴于读者在实践的过程中可能会忘记必须添加命名空间的地方，或是混淆原版内容和自定义的内容，那么最好还是完整地书写命名空间ID。
#example(
  [
    #h(-2em)下列命名空间ID的识别结果为何？
    #codebox("something") <code:namespaced_id_example_1>
    #codebox("minecraft:something") <code:namespaced_id_example_2>
    #codebox("custom:something") <code:namespaced_id_example_3>
    #codebox("minecraft/custom:something") <code:namespaced_id_example_4>
    #codebox("minecraft/something") <code:namespaced_id_example_5>
    #codebox("minecraft:Something") <code:namespaced_id_example_6>
    #codebox("minecraft:custom:something") <code:namespaced_id_example_7>
  ],
  [
    以上各命名空间ID的识别结果列于下表：
    #general-table(
      caption: [命名空间ID的识别结果],
      columns: (auto, auto, auto ,auto),
      colspan: 4,
      header:([命名空间ID], [识别的命名空间], [识别的路径], [识别结果]),
        [@code:namespaced_id_example_1], [`minecraft`], [`something`], [`minecraft:something`],
        [@code:namespaced_id_example_2], [`minecraft`], [`something`], [`minecraft:something`],
        [@code:namespaced_id_example_3], [`custom`], [`something`], [`custom:something`],
        [@code:namespaced_id_example_4], [-（含有非法字符 `/`）], [-], [识别失败],
        [@code:namespaced_id_example_5], [`minecraft`], [`minecraft/something`], [`minecraft:minecraft/something`],
        [@code:namespaced_id_example_6], [`minecraft`], [-（含有非法字符 `S`）], [识别失败],
        [@code:namespaced_id_example_7], [-（冒号数量大于1）], [-], [识别失败]
    )
  ]
)
一般而言，命名空间和路径推荐的写法是*蛇形命名法（Snake case）*#index(display: "蛇形命名法（Snake case）", "shexingmingmingfa")，即当名称中含有多个单字时，以下划线 `_` 取代每一个空格的写法。蛇形命名法的书写仍需遵守合法字符的规定，不能出现大写字母。例如，下面的命名空间ID在命名空间和路径上均使用了蛇形命名法：
#codebox("ancient_city:get_out")
=== 数据包标签
一个单独的命名空间ID只能映射至单独的一个对象，如果要同时映射多个对象，一般的做法是将对象分类，通过映射同一种类别的对象从而映射多个对象。这种将游戏资源分类的手段被称为*数据包标签（Tags in data packs）*#index(display: "数据包标签（Tags in data packs）", "shujubaobiaoqian")，简称*标签（Tag）*#index(display: "标签（Tag）", "biaoqian")由于命令系统存在多个名为“标签”的概念，笔者不建议使用这样的简称以防止与其他概念的混淆。。原版游戏有一些既有数据包标签，数据包标签的名称大多拥有实际的意义：例如，数据包标签 `#fire` 映射至两种方块，即 `fire`（火焰）和 `soul_fire`（灵魂火焰）；`#mineable/axe` 映射至所有能被斧采集的方块。

数据包标签的表示方式类似于命名空间ID，但需要在前面加上井号 `#`，写法为
#codebox("#<namespace>:<id>")
例如 `#minecraft:fire`。数据包标签映射的对象可以直接是一个游戏资源，如方块、实体等，也可以是另一个数据包标签。例如，数据包标签 `#minecraft:mineable/axe` 还包含了 `#minecraft:planks`（所有种类的木板）、`#minecraft:signs`（所有种类的告示牌）等数据包标签。指定某数据包标签时，其映射的其他数据包标签下的对象也会被选择。但是同一个数据包标签映射的资源类型必须相同，不能将不同类型的对象放入一个数据包标签中，例如，猪和石头不能被放在同一个数据包标签中。

数据包标签涵盖的对象类型非常广，包括方块、实体、物品、游戏事件、生物群系等。读者可以在既有数据包标签的基础上，使用数据包添加一些自定义的数据包标签。
== 命令
*命令（Command）*#index(display: "命令（Command）", "mingling")，又称*控制台命令（Console command）*#index(display: "控制台命令（Console command）", "kongzhitaimingling")、*斜杠命令（Slash command）*#index(display: "斜杠命令（Slash command）", "xiegangmingling")或*MC-CMD*#index("MC-CMD")，*是一种高级的、通过输入具有特定语法文本以实现控制游戏本身运行的功能*。命令文本需要讲究严格的语法，不允许任何模糊的表达。目前MC-CMD已被正式确认为一种编程语言，名称为mcfunction，与C语言、Java、Python等并列——但这是一种只适用于游戏Minecraft内部的编程语言，无法与外部环境进行交互。
=== 命令参数 <subsec:command_argument>
参数是命令的组成部分，每一条命令都由一个命令头和若干参数组成，参数之间用空格分隔，由此得到命令的通用格式：
#codebox("<命令名> [<参数1>] [<参数2>] …")
例如在下面的命令中，`say` 是该命令的命令名，`Hello World!` 是后续参数：
#codebox("say Hello World!") <code:say_hello_world>
在本教程中，为了方便解释命令中各参数的语法，会使用一系列括号或其他符号来表示这些参数的具体内容及可用性。为了使说明更加方便，本教程采用了和游戏本体、Minecraft Wiki一样的命令语法格式，如下表所示。
#general-table(
  caption: [语法指引格式],
  columns: (1fr, 3fr, 5fr),
  colspan: 3,
  header:([语法], [含义], [举例]),
  [`字面量`], [按字面量原样输入], [命令 `/locate biome` 中第2个参数 `biome` 即为字面量，编写命令时不要更改这个参数的写法。],
  [`<参数>`], [需要使用一合适的值来替换该参数], [命令 `/say <message>` 的第2个参数需要用自定的值，比如 `/say Hello World!`。],
  [`[<参数>]`], [该参数是可选的，如果使用该参数，则需要使用一合适的值替换之], [命令 `/summon <entity> [<pos>] [<nbt>]` 中第3、4个参数可选，填写这些参数时需要用自定的值。],
  [`(参数|参数)`], [（必须的）在显示的值中选择一个填写。语法介绍中这些值由竖线分隔], [命令 `/time query (daytime|gametime|day)` 的第3个参数是必填的，从 `daytime`、`gametime` 和 `day` 中选择一个填写。],
  [`[参数|参数]`], [（可选的）在显示的值中选择一个填写。语法介绍中这些值由竖线分隔], [命令 `/experience add <targets> <amount> [levels|points]` 的第5个参数虽然不是必写的，但仍可以从参数 `points` 和 `levels` 中选择一个填写。],
  [`-> 子命令`], [必须接入一条子命令], [命令 `/execute positioned <pos> -> execute` 的第6个参数是必填的，内容为命令 `/execute` 的一个子命令。],
  [`-> [子命令]`], [可以接入一条子命令], [命令 `/execute (if|unless) block <pos> <block> -> [execute]` 的第7个参数可以填写 `/execute` 的子命令，也可以不填写。]
)
下面举一实例以说明之：
#example(
  [
    #h(-2em)命令 `/data` 的一种语法如下所示：#codebox("data get (block <targetPos>|entity <target>|storage <target>) [<path>] [<scale>]")
  ],
  [
    语法中 `data` 为命令名，`get` 是字面量，这两者必须按语法指引中的字面量原样输入命令。
    第3、4个参数必须从 `block <targetPos>`、`entity <target>` 和 `storage <target>` 中选则一种，且不得空缺。若使用 `block <targetPos>`，则 `block` 按原样输入，后续使用 `<targetPos>` 的自定义值，但不得在 `block` 后续使用 `<target>` 参数，因为 `<target>` 是 `entity` 或 `storage` 的后续参数。第5、6个参数 `[<path>]`、`[<scale>]` 可选并自定义值。使用该语法且实际可行的命令可以是：
    #codebox("data get entity @s SelectedItem") <code:grammar_guideline_example>
    命令@code:grammar_guideline_example 使用了参数 `entity`，`@s` 是 `<target>` 使用的值，`SelectedItem` 是 `[<path>]` 使用的值，参数 `[<scale>]` 未使用。
  ]
)
为了使不同的命令具有不同的功能，它们使用的参数类型各不相同。有些命令作用的对象为实体，它们则会使用指定实体的参数，有些命令作用的对象为某一个坐标，则其使用坐标参数。游戏使用的命令参数有如布尔值、整型、函数、槽位值、坐标值、目标选择器、JSON、NBT等。一些复杂参数会在本教程后文呈现，下面列举的是基本参数，即在Brigadier中使用的六种基本数据类型：
#i1(new: true)[*布尔值（Boolean）*#index(display: "布尔值（Boolean）", "buerzhi")]
只有两种可用参数，为 `true` 和 `false`，分别代表“是”与“否”。
#i1[*整数（Integer）*#index(display: "整数（Integer）", "zhengxing")]
使用32位整型，即介于 `-2147483648` 和 `2147483647` 之间的整数值，如 `1`、`0`、`-1` 等。不同命令中使用整型的参数规定的最大可用值和最小可用值不一致。
#i1[*长整数（Long）*#index(display: "长整数（Long）", "changzhengxing")]
使用64位整型，即介于 `-9223372036854775808` 和 `9223372036854775807` 之间的整数值。
#i1[*单精度浮点数（Float）*#index(display: "单精度浮点数（Float）", "danjingdufudianshu")]
使用占据4字节的浮点数，范围大约介于$-3.4×10^38$和$3.4×10^38$之间，在不同命令中使用单精度浮点数的参数规定的最大可用值和最小可用值不一致。一些单精度浮点数的示例有：`0`、`1.1`、`-1`、`.5` 等，小数形式的整数部分可以省略。在命令参数中使用的浮点数暂时不支持科学计数法#footnote[参见#link("https://bugs.mojang.com/browse/MC/issues/MC-130925")[MC-130925]。]。
#i1[*双精度浮点数（Double）*#index(display: "双精度浮点数（Double）", "shuangjingdufudianshu")]
使用占据4字节的浮点数，范围大约介于$-1.8×10^108$和$1.8×10^108$之间。可以表示比单精度浮点数绝对值更大的有效数字。
#i1[*字符串（String）*#index(display: "字符串（String）", "zifuchuan")]
#i2[*单个词（Single word）*#index(display: "单个词（Single word）", "dangeci")]
即不含空格的字符串，如 `word`，若单个词的内容由多个词语组成，则一般使用下划线 `_` 连接相邻词，如 `word_with_underscores`。
#i2[*词组（Quotable phrase）*#index(display: "词组（Quotable phrase）", "cizu")]
可以由双引号括起，如 `"quoted phrase"`，也可以使用单引号来定义，如 `'quoted phrase'`，此时单词之间可以有空格。
#i2[*贪婪词组（Greedy phrase）*#index(display: "贪婪词组（Greedy phrase）", "tanlancizu")]
这种形式的词组不带引号，任意使用空格。该形式的参数通常位于命令的末尾，将命令的剩余部分全部作为字符串参数。如：`words with spaces`。上文中命令@code:say_hello_world 就使用了这种参数。
=== 命令的输入
命令是一种文本输入，以下是可供命令输入的途径：
#i1(new: true)[使用聊天栏输入命令]
为了和普通的聊天文本区分开来，在聊天栏中输入命令时会在命令前加一个前缀 `/`，此前缀必不可少。在不使用按键 `T` 召唤聊天栏时可以直接键入 `/` 输入命令，这是使玩家快速进入命令输入模式的一种办法。

呼出聊天栏后，可以使用 `↑` 或 `↓` 键调用*命令历史（Command history）*#index(display: "命令历史（Command history）", "minglinglishi")，即先前键入的命令。如果之前输入的命令有语法错误的话，切换至该命令时依旧会有语法错误，不会自动更正，更不会因为含有语法错误就不显示该命令。这种快捷键在命令方块控制台中不适用。命令历史可以跨存档调用。

在聊天栏输入命令时，`Tab` 键可用于补全命令。未输入任何命令字符的时候，使用 `Tab` 键可以看到聊天栏上出现的一个命令列表（如@fig:using_tab_when_typing_command），鼠标滚轮有助于翻找需要的命令。
#figure(
  caption: [在聊天栏输入命令时使用 `Tab` 键],
  image("图片/在聊天栏输入命令时使用Tab键.png", width: 20%)
) <fig:using_tab_when_typing_command>
读者可以直接在命令列表中点击需要的命令，或者如@fig:command_typing (a) 所示，输入命令的前若干字符后使用 `Tab` 键补全。若这个命令后续还有其他参数，则也可以如@fig:command_typing (b) 所示用 `Tab` 键补全。
#sub-figure(
  caption: [命令输入过程],
  label: <fig:command_typing>,
  [#image("图片/命令输入过程a.png", height: 4em)\(a)],
  [#image("图片/命令输入过程b.png", height: 4em)\(b)]
)
聊天栏的字符数量被限制在256以内，命令开头的 `/` 也会被计入字符数。因此，聊天栏不能用于执行太长的命令。
#i1[在命令方块或命令方块矿车内输入命令]
命令方块控制台可输入的字符最多为32500个，较聊天栏的限制有很大提升。文本框长度有限，每次只能显示命令的其中一段，需要使用 `鼠标左键` 或 `←`、`→` 键移动光标调整命令显示的位置，且每次打开命令方块GUI时光标总显示在命令的末尾。

在命令方块或命令方块矿车内输入命令时，斜杠前缀 `/` 不是必须的。和在聊天栏中使用命令一样，当文本框中无任何内容时，下方会显示一个命令列表（如@fig:command_block_gui），通过调整鼠标滚轮能够调整命令列表显示的位置，按 `Tab` 键能够在输入命令时自动补全或选择命令的部分。
#figure(
  caption: [命令方块GUI],
  image("图片/命令方块GUI.png")
) <fig:command_block_gui>
#i1[在数据包函数文件中输入命令]
这种编写方式需要使用一定的编译软件，常用的编译软件有Windows自带的记事本、Visual Studio Code等。函数中的命令不能带有斜杠前缀。具体的内容可参阅《数据包》教程的描述。
#i1[在服务器控制台中输入命令]
#i1[在带有 `run_command` 动作的点击事件的文本组件或对话框按钮中输入命令]
=== 权限等级与限制条件
命令功能强大、种类繁多，如果在任意情况下都能够随意使用，则很有可能会破坏玩家的游戏体验。因此，命令系统有一套专门的机制用于控制游戏内可用命令的情形，即权限等级。*权限等级（Permission level）*#index(display: "权限等级（Permission level）", "quanxiandengji")用于决定命令执行者可以使用什么样的命令。所有命令都有一个所需的权限等级，如果命令执行者没有达到该有的权限等级，则无法执行该命令。例如：`/advancement` 需要的权限等级为2，命令方块的权限等级也为2，因此命令方块可以执行该命令；而关闭命令的单人游戏玩家的权限为0，所以该玩家不能执行该命令。

权限等级共分为0、1、2、3、4级，表罗列了Java版所有可用命令需要的权限等级与限制条件。除权限等级之外，一些命令还对当前的游戏世界有限制：一些命令只能在专用服务器（以下简称多人游戏）中使用，另有只能在非专用服务器（以下简称单人游戏，无论是否对局域网开放）中使用的命令，然而大部分命令都是无此限制条件的。
#general-table(
  caption: [Java版可用命令列表],
  columns: (3fr, 3fr, 2fr, 3pt, 2fr, 2fr, 2fr),
  colspan: 7,
  header:([命令], [权限等级], [限制条件], [], [命令], [权限等级], [限制条件]),
  seperator: (3,),
  [`/advancement`], [2], [], [], [`/attribute`], [2], [],
  [`/ban`], [3], [仅多人游戏], [], [`/ban-ip`], [3], [仅多人游戏],
  [`/banlist`], [3], [仅多人游戏], [], [`/bossbar`], [2], [],
  [`/chase`], [0], [仅调试工具], [], [`/clear`], [2], [], 
  [`/clone`], [2], [], [], [`/damage`], [2], [],
  [`/data`], [2], [], [], [`/datapack`], [2], [], 
  [`/debug`], [3], [], [], [`/debugconfig`], [3], [仅调试工具],
  [`/debugmobspawning`], [2], [仅调试工具], [], [`/debugpath`], [2], [仅调试工具],
  [`/defaultgamemode`], [2], [], [], [`/deop`], [3], [仅多人游戏],
  [`/dialog`], [2], [], [], [`/difficulty`], [2], [],
  [`/effect`], [2], [], [], [`/enchant`], [2], [],
  [`/execute`], [2], [], [], [`/experience`], [2], [],
  [`/fill`], [2], [], [], [`/fillbiome`], [2], [],
  [`/fetchprofile`], [2], [], [], [`/forceload`], [2], [],
  [`/function`], [2], [], [], [`/gamemode`], [2], [],
  [`/gamerule`], [2], [], [], [`/give`], [2], [],
  [`/help`], [0], [], [], [`/item`], [2], [],
  [`/jfr`], [4], [], [], [`/kick`], [3], [],
  [`/kill`], [2], [], [], [`/list`], [0], [],
  [`/locate`], [2], [], [], [`/loot`], [2], [],
  [`/me`], [0], [], [], [`/msg`], [0], [],
  [`/op`], [3], [仅多人游戏], [], [`/pardon`], [3], [仅多人游戏],
  [`/pardon-ip`], [3], [仅多人游戏], [], [`/particle`], [2], [],
  [`/perf`], [4], [], [], [`/place`], [2], [],
  [`/playsound`], [2], [], [], [`/publish`], [4], [仅单人游戏],
  [`/raid`], [3], [仅调试工具], [], [`/random`], [0（不使用 `sequence`）或2（使用 `sequence`）], [],
  [`/recipe`], [2], [], [], [`/reload`], [2], [],
  [`/return`], [2], [], [], [`/ride`], [2], [],
  [`/rotate`], [2], [], [], [`/save-all`], [4], [仅多人游戏],
  [`/save-off`], [4], [仅多人游戏], [], [`/save-on`], [4], [仅多人游戏],
  [`/say`], [2], [], [], [`/serverpack`], [2], [仅调试工具],
  [`/schedule`], [2], [], [], [`/scoreboard`], [2], [],
  [`/seed`], [0（单人游戏）或2（多人游戏）], [], [], [`/setblock`], [2], [],
  [`/setidletimeout`], [3], [仅多人游戏], [], [`/setworldspawn`], [2], [],
  [`/spawn_armor_trims`], [2], [仅调试工具], [], [`/spawnpoint`], [2], [],
  [`/spectate`], [2], [], [], [`/spreadplayers`], [2], [],
  [`/stop`], [4], [仅多人游戏], [], [`/stopsound`], [2], [],
  [`/stopwatch`], [2], [], [], [`/summon`], [2], [],
  [`/swing`], [2], [], [], [`/tag`], [2], [],
  [`/team`], [2], [], [], [`/teammsg`], [0], [],
  [`/teleport`], [2], [], [], [`/tell`], [0], [],
  [`/tellraw`], [2], [], [], [`/test`], [2], [],
  [`/tick`], [3], [], [], [`/time`], [2], [],
  [`/title`], [2], [], [], [`/tm`], [0], [],
  [`/tp`], [2], [], [], [`/transfer`], [3], [仅多人游戏],
  [`/version`], [0], [], [], [`/version`], [0（单人游戏）或2（多人游戏）], [],
  [`/w`], [0], [], [], [`/waypoint`], [2], [],
  [`/warden_spawn_tracker`], [2], [仅调试工具], [], [`/weather`], [2], [],
  [`/whitelist`], [3], [仅多人游戏], [], [`/worldborder`], [2], [],
  [`/xp`], [2], []
)
=== 命令的解析 \*
游戏处理命令的过程可分为*解析*和*执行*两个阶段。Minecraft使用*Brigadier*作为命令的解析器、派发器。

命令的实质是一个根命令节点的直接量分支，这就意味着所有的命令都是一个树状结构，命令中每一个参数都作为一个节点，而命令名作为根节点使用。显然，一个节点可能会有两种类型：字面量和变量，反映到命令文本语法中分别为字面量参数和需要自定义值的参数。

游戏在读取命令后，会首先解析根节点是否是已注册的命令，其次解析下一个参数即子节点是否可用，然后依次解析余下的节点。Brigadier读取到某一个节点时，会枚举其子节点的所有可行节点，并在聊天栏或命令方块控制台内显示为可读性较强的可视化参数列表。
#figure(
  caption: [命令 `tag` 的所有结点和分支],
  image("图片/命令tag的所有结点和分支.png", width: 40%)
) <fig:branch_of_command_tag>
以命令 `/tag` 为例，其命令树如@fig:branch_of_command_tag 所示。`tag` 是根命令，其子节点 `<target>` 是一个需要特定参数类型（这里是 `entity`）的节点，解析此节点的时候，会判断输入的参数是否为 `entity` 类型，若为否则解析异常，命令无法执行。2级子节点是已注册的字面量 `add`、`remove` 和 `list`，解析该级节点的工作比较简单：只需读取该节点的文本是否与注册的字面量吻合。若2级子节点的参数指定为 `add`、`remove`，则读取3级子节点 `<name>`，这个节点又是一个需要自定义的量；若2级子节点的参数指定为 `list`，则不能再添加后续参数。
=== 命令上下文
当一条命令被执行时，该命令一定有一个调用者以及调用环境，这一系列调用者及调用环境构成的集合被称为*命令上下文（Command context）*#index(display: "命令上下文（Command context）", "minglingshangxiawen")，或称*执行上下文（Execution context）*#index(display: "执行上下文（Execution context）", "zhixingshangxiawen")、*命令源（Command origin）*#index(display: "命令源（Command origin）", "minglingyuan")、*命令来源堆叠（Command source stack）*#index(display: "命令来源堆叠（Command source stack）", "minglinglaiyuanduidie")。

命令上下文由以下参数构成：
#i1(new: true)[执行权限等级]
#i1[*执行者（Executor）*#index(display: "执行者（Executor）", "zhixingzhe")]
由“执行者名称”和“执行者实体”两个参数构成，但执行者实体不一定存在，例如执行者为命令方块、命令方块矿车或服务端的时候。
#i1[*执行位置（Execution position）*#index(display: "执行位置（Execution position）", "zhixingweizhi")]
这个参数是命令执行时所在的坐标，包含$x$、$y$、$z$三个坐标参数。
#i1[*执行朝向（Execution rotation）*#index(display: "执行朝向（Execution rotation）", "zhixingchaoxiang")]
这个参数是命令执行时面向的方向，包含偏航角和俯仰角两个参数。
#i1[*执行锚点（Execution anchor）*#index(display: "执行锚点（Execution anchor）", "zhixingmaodian")]
这个参数是局部坐标的原点，当执行者为实体时，这个参数可以指定执行的锚点基于实体的脚部还是眼部，因此有脚部和眼部两个可用参数。其中脚部即为原本的执行位置，眼部为原本的执行位置在$y$轴方向加上实体眼睛的高度。
#i1[*执行维度（Execution dimension）*#index(display: "执行维度（Execution dimension）", "zhixingweidu")]
这个参数是命令执行所在的维度，执行位置位于这个维度内。
#i1[执行输出反馈]
尝试执行命令会产生一定的执行效果，并在执行失败或执行成功时返回*成功次数（Success）*#index(display: "成功次数（Success）", "chenggongcishu")和*结果（Result）*#index(display: "结果（Result）", "jieguo")两个返回值。其中成功次数总是为0或1，结果一定为整数，遇到小数时则向下取整。下面讨论所有种类的命令执行效果：
#i2[*无法解析*]
这种效果会在命令中存在无法解析的参数、输入的命令不完整或执行上下文不符合命令的限制条件，如执行者拥有的权限等级不够、超出游戏世界的限制时出现。此时命令没有返回值。在聊天栏或命令方块内输入的命令若无法解析，则会返回语法错误信息。在函数内的命令若无法解析，则该函数无法加载。
#i2[*执行错误*]
出现这种效果说明命令中存在严重的漏洞。此时命令没有返回值。
#i2[*Void*]
当且仅当执行命令 `/function` 时会出现这种效果，说明 `/function` 调用了一个void类型的函数，没有返回值。
#i2[*执行中断*]
当且仅当执行命令 `/execute` 时会出现这种效果，此时 `/execute` 的分支数量为0，在 `run` 子命令执行前执行就已经中止。此时命令没有返回值。
#i2[*执行失败*和*执行成功*]
当命令执行效果不是上述4种中任意一种时，才能出现执行失败或执行成功。且只有当执行效果为执行失败或执行成功时，才能返回成功次数和结果。执行失败并不意味着命令没有起作用，执行成功也不意味着命令会对游戏做出更改。

不同情况下的命令上下文列举于下表：
#general-table(
  caption: [不同情况的命令上下文],
  columns: (4fr, 5fr, 4fr, 4fr, 4fr, 4fr, 4fr),
  colspan: 7,
  header:([情况], [执行权限等级], [执行者], [执行位置], [执行朝向], [执行锚点], [执行维度]),
  [玩家], [视情况而定], [玩家], [玩家的位置], [玩家的朝向], [脚部], [玩家所在的维度],
  [服务器控制台], [4], [Server], [世界出生点方块的西北下角顶点], [水平向南], [脚部], [主世界],
  [服务端], [2], [Server], [世界出生点方块的西北下角顶点], [水平向南], [脚部], [主世界],
  [命令方块], [2], [命令方块], [命令方块的正中心], [命令方块的朝向], [脚部], [命令方块所在维度],
  [命令方块矿车], [2], [命令方块矿车], [命令方块矿车的位置], [命令方块矿车的朝向], [脚部], [命令方块矿车所在维度],
  [函数], [可修改], [该函数的调用者], [函数调用者的位置], [函数调用者的朝向], [函数调用者的锚点], [函数调用者所在维度],
  [告示牌], [2], [点击告示牌的玩家], [告示牌所在方块正中心], [水平向南], [脚部], [告示牌所在维度],
  [`/execute`], [-], [修饰后的执行者], [修饰后的执行位置], [修饰后的执行朝向], [修饰后的执行锚点], [修饰后的执行维度],
  [自定义进度], [2], [获得进度的玩家], [玩家的位置], [玩家的朝向], [脚部], [玩家所在的维度],
  [自定义魔咒], [2], [魔咒作用的实体], [魔咒作用的位置], [魔咒作用实体的朝向], [脚部], [魔咒作用的维度]
)
#tips(
  [
    玩家的权限等级与其游戏模式无关，需要分情况讨论：
    + 若该玩家是服务器管理员，则他的权限等级由`ops.json`中的值决定，默认为4级；
    + 若该玩家处于启用命令的单人世界中或为启用命令的局域网世界所有者，则他的权限等级为4级；
    + 若该玩家处于启用命令的局域网世界中，则他的权限等级为4级；
    + 非上述情况者权限等级一律为0级。
    函数的权限等级默认为2级，可在`server.properties`中修改。
  ],
  width: 100%
)
== JSON格式
在讲述数据包和资源包这两种开发实例之前，有必要先介绍Minecraft使用的用于数据交换的格式，即JSON格式。事实上，这种数据格式的应用极其广泛，是当今互联网最通用的数据交换格式之一。在Minecraft中，为方便网络传输和数据存储，一些游戏内程序会被*序列化*为JSON格式。而对于数据包、资源包内容中的JSON格式而言，游戏会尝试将这些JSON数据*反序列化*为游戏内相应的程序。

游戏的一些数据以 `.json` 文件的格式存储在各文件夹中。这些文件有如：资源包的模型文件，数据包的进度、谓词文件，游戏版本信息文件，等等。下面展示的是金合欢木按钮的模型文件：
#codefile(
  lang: "json",
  title: "assets > minecraft > models > block > acacia_button.json",
  "{
  \"parent\": \"minecraft:block/button\",
  \"textures\": {
    \"texture\": \"minecraft:block/acacia_planks\"
  }
}")
=== JSON数据类型
*JSON（JavaScript Object Notation，JavaScript对象表示法）*#index("JSON（JavaScript Object Notation，JavaScript对象表示法)")是一种轻量级数据交换格式，独立于编程语言，是JavaScript的一个子集。其内容主要由键和值构成，即*键值对（Name-value pair）*#index(display: "键值对（Name-value pair）", "jianzhidui")，这些键值对可认为是一个个*字段（Field）*#index(display: "字段（Field）", "ziduan")。这种格式主要有两个优点：第一，便于编写者阅读和修改；第二，由于其轻量级的特点，其对环境的依赖程度较小，因此能用于存储大量不同种类的信息。Minecraft使用的JSON标准为ECMA-404。

JSON格式键值对的基本语法为：
#codebox("\"<键>\":<值>")
#wrap-content(
  tips(
    [键名的两侧必须是*英文引号*，且不接受单引号！],
    width: 10em
  ),
  [
    
    对于一个键，可以给其定义一个值。在书写时，JSON的所有键的键名必须用*双引号*引起。若有多个键值对，则需使用逗号将这些键值对分隔开来，最后一个键值对的后面不加逗号，如：
  ],
  align: right
)
#codebox("\"<键>\":<值>,\"<键>\":<值>")
在一个`.json`文件中，须使用花括号 `{}` 将所有的键值对封装包裹在一起，如：
#codebox("{\"<键>\":<值>,\"<键>\":<值>}")
对于值而言，每一个不同的键都需的值的类型不尽相同，比如键 `color` 可能需要的是颜色值，`bold` 可能需要的是布尔值，`text` 可能需要的是字符串，等等。JSON一共使用六种不同的数据类型：
#i1(new: true)[#icon(name: "json-string") *字符串（String）*#index(display: "字符串（String）", "zifuchuan")]
常见的数据类型，可以包含任意字符（如空格），字符串由一对*（英文）双引号*定义，*不接受单引号*，用法举例：
#codebox("\"description\": \"The default data for Minecraft\"")
也可以使用中文：
#codebox("\"description\": \"我的世界默认数据包\"")
JSON同时也支持Unicode，表示方式为 `\uxxxx`，其中每一个 `x` 都为一个十六进制数字。例如，符号★的Unicode为 `U2605`，则在字符串中输入★的方式可以为：
#codebox("\"text\": \"\u2605\"")
这样便可以在字符串中输入一些生僻字或是在键盘上无法直接打出来的字符。但是Minecraft的字库是有限的，并非所有的字符都可以在Minecraft中显示。
#i1[#icon(name: "json-bool") *布尔值（Boolean）*#index(display: "布尔值（Boolean）", "buerzhi")]
由 `true`（真）或 `false`（假）定义，这两者是JSON中的字面量符号，不需要使用双引号引起，举例：
#codebox("\"bold\": true")
#codebox("\"italic\": false")
#i1[#icon(name: "json-number") *数值（Number）*#index(display: "数值（Number）", "shuzhi")]
由数字定义，允许使用整数、浮点数或是科学计数法表示的数，举例：
#codebox("\"min\": 1.0")
在JSON中使用的数值不需要注明它们的数据类型。
#i1[#icon(name: "json-array") *数组（Array，或称为列表）*#index(display: "数组（Array）", "shuzu")]
由一对方括号定义，数组中元素与元素之间使用逗号隔开，*最后一个元素后不能有逗号*。这些元素可以是其他的数据类型，如字符串、布尔值、数值和对象，数组中甚至能嵌套数组。在定义其他的数据类型时，需注意这些数据类型的定义方法。以下为包含了数值的数组：
#codebox("\"frames\": [1, 2, 3, 4, 5]")
下面为包含了字符串的数组，字符串均由一对双引号定义：
#codebox("\"text\": [\"A\", \"B\", \"C\"]")
对于数组内的元素，其数据类型不必完全一致，例如：
#codebox("\"extra\": [1, {\"text\": \"2\"}, \"3\"]")
#i1[#icon(name: "json-object") *对象（Object）*#index(display: "对象（Object）", "duixiang")]
由一对花括号定义，对象内字段与字段之间使用逗号隔开，*最后一个字段后不能有逗号*。对象中可以包含其他数据类型，也可以在对象中嵌套对象。整个 `.json` 文件就可以看作是一个大的对象。在编写JSON的时候，通常需要用到对象嵌套对象，因此花括号一定要检查是否匹配。用法举例：
#codebox("{
  \"rolls\": {
    \"type\": \"minecraft:binomial\",
    \"n\": 3,
    \"p\": 0.2
  }
}")
#i1[Null]
空值，作为字面量符号使用。Minecraft基本不使用这种数据类型。

由于JSON为多层级结构，为了方便说明，本系列教程会使用和Minecraft Wiki一样的树状图来表示。例如：
#tree(
  (0, [#icon(name: "json-object")]),
  (1, [#icon(name: "json-string") *string*: `这是一个字符串`]),
  (1, [#icon(name: "json-bool") *boolean*: `true`]),
  (1, [#icon(name: "json-number") *number*: `5`]),
  (1, [#icon(name: "json-array") *array*]),
  (2, [#icon(name: "json-string") `这是数组的第一个元素，是一个字符串`]),
  (2, [#icon(name: "json-object") ]),
  (3, [#icon(name: "json-string") *string*: `这是对象内的一个字符串`]),
  (1, [#icon(name: "json-object") ]),
  (2, [#icon(name: "json-string") *string*: `这是对象内的一个字符串`])
)

对应的JSON为：
#codebox("{
  \"string\": \"这是一个字符串\",
  \"boolean\": true,
  \"number\": 5,
  \"array\": [
    \"这是数组的第一个元素，是一个字符串\",
    {
      \"string\": \"这是对象内的一个字符串\"
    }
  ],
  {
    \"string\": \"这是对象内的一个字符串\"
  }
}")
#tips(
  [
    如何看懂树状图？
    #i1(new: true)[父节点和子节点的关系会以这样的方式表示：]
    #tree(
      (0, [这是父节点]),
      (1, [这是子节点])
    )
    相同层级的节点会表示为相同的缩进。
    #i1[对于一个字段：]
    #icon(name: "json-string") *field*: `这是一个字段`
    #i2[字段开头的#icon(name: "json-string")#icon(name: "json-bool")#icon(name: "json-number")#icon(name: "json-array")#icon(name: "json-object")表示这个字段使用的数据类型。]
    #i2[加粗红色的字表示这个字段的键名。]
    #i2[冒号后面如果只有`代码块`，表示此`代码块`是该字段使用的真实值。如果冒号后面是一段文字，则这是对于该字段的解释。如：]
    #icon(name: "json-string") *field*: 这是对于这个字段的解释。
  ],
  width: 100%
)
=== JSON的转义序列
使用JSON字符串时，如果字符串本身的内容中含有英文引号 `"`，如一个JSON字段 `text` 的值需要为 `"Hello World!"`，那该如何编写JSON呢？若使用如下的JSON：
#codebox("\"text\":\"\"Hello World!\"\"") <code:json_escape_error>
这样通常会产生报错，这是由于用于定义字符串的引号和值中的英文引号发生了配对从而导致了错误，因此需要使用*转义字符（Escape character）*#index(display: "转义字符（Escape character）", "zhuanyizifu")`\` 对文本引号进行转义。转义的作用为：将被转义的字符转换成字符，被转换的引号便不再与用于定义字符串的引号发生配对。除用于转义英文引号外，反斜杠还可以用于转义反斜杠以及创造一些特定的转义序列。JSON中可用的转义序列如下：
#wrap-content(
  tips([`\b`、`\f`、`\n`、`\r`、`\t` 这些特殊的转义序列能在JSON中使用，但这不代表这些转义序列能在相应的游戏实例中真正起作用。例如，在物品修饰器中定义物品名称时，虽然JSON支持输入换行符 `\n`，但物品名称本身不支持换行。], width: 11em),
  [
+ `\"`，是半角双引号（英文引号） `"` 的转义方式（中文引号不需要转义）；
+ `\\`，是反斜杠 `\` 的转义方式，已被转义的反斜杠被视为普通字符，不再具有转义作用；
+ `\b`，退格；
+ `\f`，换页；
+ `\n`，换行；
+ `\r`，回车；
+ `\t`，制表符；
+ `\u<unicode>`，用四位十六进制表示Unicode字符。
  ],
  align: right
)
由此可以得出字段@code:json_escape_error 的正确写法：
#codebox("\"text\":\"\\\"Hello World!\\\"\"")
同样地，如果值为 `\Hello World!\`，需要对反斜杠进行转义，正确的写法为：
#codebox("\"text\":\"\\\\Hello World!\\\\\"")
#example(
  [
    #h(-2em)判断下列JSON的转义是否有效，若有效，则写出其值。
    #codebox("\"text\":\"\\\\\\Hello World\\\\\\\"")<code:json_escape_example_1>
    #codebox("\"text\":\"\\\"\\\\Hello World!\\\\\\\"\"")<code:json_escape_example_2>
    #codebox("\"text\":\"\\\"Hello World!\\\\\\\"\"")<code:json_escape_example_3>
    #codebox("\"text\":\"\\\"Hello World!\\\\\"\"")<code:json_escape_example_4>
  ],
  [
    字段@code:json_escape_example_1 的值出现了连续三个反斜杠 `\\\` 的情况，第一个反斜杠用于转义第二个反斜杠，而第二个反斜杠不再具有转义作用；而第三个反斜杠后面没有其他转义序列，故值无效。

    对于@code:json_escape_example_2，依次检验所有反斜杠：第一个反斜杠用于转义引号，第二个反斜杠用于转义第三个反斜杠，第四个反斜杠用于转义第五个反斜杠，第六个反斜杠用于转义引号。故值为`"\Hello World!\"`。

    字符串两端的反斜杠数量不一定需要相等，因此字段@code:json_escape_example_3 是有效的，输出结果`"Hello World\"`。

    注意，@code:json_escape_example_4 的所有转义序列都书写正确，但第三个反斜杠后面存在一个引号，而第三个反斜杠已被第二个反斜杠转义而失去转义作用。因此用于定义字符串的引号配对混乱，该值无效。判断一个值是否有效，不仅需要有效的转义序列，还要注意字符串本身的双引号是否正确配对。
  ]
)
特殊情况下，JSON字段可能会以字符串类型包含另一个需要被解析的JSON数据而非直接嵌套为相应类型的值，例如：
#tree(
  (0, [#icon(name: "json-string") *content*: `{"text":"Hello World!"}`])
)
字段 #icon(name: "json-string") `content` 的值类型为字符串，两端一定需要一对引号。为了防止决定字符串的引号与值中的引号发生匹配混乱，会将值中的引号进行转义：
#codebox("\"content\": \"{\\\"text\\\":\\\"Hello World!\\\"}\"")
如果 #icon(name: "json-string") `text` 字段的值也带有引号，如 `"Hello World!"`，则需要相应地添加反斜杠：
#tree(
  (0, [#icon(name: "json-string") *content*: `{"text":"\"Hello World!\""}`])
)
这时如果把字段 #icon(name: "json-string") `content` 写成如下的形式：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\"Hello World!\\\"\\\"}\"")
现在来手动分析这个字段。把 #icon(name: "json-string") `content` 的值拆出来，对所有的转义序列都去掉反斜杠。首先，键 #icon(name: "json-string") `text` 两端的引号被转义，因此能够正常匹配。其次，冒号 `:` 之后、字符 `H` 之前有两个已被转义的引号；而字符感叹号 `!` 后又有两个已被转义的引号，一共有四个被转义的引号：
#codebox("{\"text\":\"\"Hello World!\"\"}")
所以不可避免地又发生了引号匹配混乱的情况。现在要解决的问题就是如何让这些引号不发生匹配混乱。最有效的写法就是*从里层向外层书写，每嵌套一层，就在上一层所有需要被转义的字符（如 `"` 和 `\`）前添加反斜杠*。因此，对于里层的 `{"text":"\"Hello World!\""}`，需要在所有的 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"text\\\":\\\"\\\\\\\"Hello World!\\\\\\\"\\\"}\"")<code:multilevel_escaping>
@code:multilevel_escaping 才是正确的写法。如果更进一步，将@code:multilevel_escaping 封装在对象中，让它作为另一个 #icon(name: "json-string") `content` 的值，这样就又增加了一层嵌套，于是应在@code:multilevel_escaping 的每一个 `"` 和 `\` 之前都添加一个反斜杠：
#codebox("\"content\": \"{\\\"content\\\": \\\"{\\\\\\\"text\\\\\\\":\\\\\\\"\\\\\\\\\\\\\\\"Hello World!\\\\\\\\\\\\\\\"\\\\\\\"}\\\"}\"")
== 游戏文件
游戏的各项数据被零零散散地存放在各个游戏文件里，部分数据对于做技术性开发而言非常重要，因此有必要适当掌握游戏文件的结构。
=== 常用文件格式
存储Minecraft数据的文件格式有很多种，下面介绍一些常见的文件格式。
#i1(new: true)[#icon(name: "text") `.txt` 文件]
`.txt` 文件是非常常见的文本文件，用Windows自带的记事本即可打开。这种文件通常被用于存储一些简易的文本，如游戏标题画面上的闪烁标语，有时也被用于存储游戏中的设置，在这些 `.txt` 文件中更改的内容会在游戏本体上有相应的改动。有时候 `.txt` 文件也可用于记录一些自定义的、不作为游戏数据的文本。有效的 `.txt` 文件必须为无BOM的UTF-8格式。
#i1[#icon(name: "mcfunction") `.mcfunction` 文件]
`.mcfunction` 文件，即函数文件，同样必须为无BOM的UTF-8格式。函数文件可以用Windows10自带的记事本打开并编辑，默认的Windows10记事本已经为无BOM的UTF-8格式，这点从记事本页面下方的状态栏就可以看到。记事本无法指出函数中的语法错误，必须得手动检查，笔者更推荐在编译软件中打开函数文件。本教程推荐的辅助工具是 #icon(name: "dhp") Data-pack Helper Plus（DHP），这是编译软件 #icon(name: "vscode") Visual Studio Code（VS Code）的一个扩展，可在 #icon(name: "vscode") VS Code的应用商店中找到。#icon(name: "dhp") DHP是专门用于制作Minecraft数据包或资源包部分文件的辅助工具，在编写数据包或资源包的过程中，#icon(name: "dhp") 提供了高亮显示，并为部分错误的语法提供解决方案。

《数据包》教程提供了该文件格式的具体编写规范。
#i1[#icon(name: "json") `.json` 和 `.mcmeta` 文件]
`.json` 和 `.mcmeta` 文件都是使用JSON格式的文件。这些文件中的JSON格式是允许换行的，且为了美观、可读性，编写者在习惯上会在所有的 `.json` 和 `.mcmeta` 文件中使用换行，并使得同一层级的字段在行前缩进上保持一致。`.json` 和 `.mcmeta` 文件没有专门用于注释的语法，若需要注释，则使用游戏不需要、不会被游戏识别的键，如 `_comment1`、`_comment2`。
#i1[#icon(name: "nbt") `.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件]
`.mca`、`.dat`、`.dat_old` 和 `.nbt` 文件均是使用NBT格式的文件，通常用于存储世界的全局信息和结构信息。同样地，这两类文件不能用 #icon(name: "dhp") DHP在编译软件内进行编辑，但可以在NBT编辑器内编辑，本教程推荐的编辑器为 #icon(name: "nbtstudio") NbtStudio。一些无法由命令进行编辑的信息可以通过 #icon(name: "nbtstudio") NbtStudio修改。
#i1[#icon(name: "png") `.png` 文件]
`.png` 文件是图片文件，被用于存储游戏中的绝大部分图像，包括但不限于图标、游戏截图、资源包纹理。可以使用Windows自带的 #icon(name: "paint") 画图、#icon(name: "ps") PS或 #icon(name: "gimp") GIMP处理，但需要注意 #icon(name: "paint") 画图不支持透明背景。
#i1[#icon(name: "ogg") `.ogg` 文件]
游戏中所有的声音文件都为 `.ogg` 格式，从外部导入声音时应注意格式转换。直接修改文件名后缀是无效的，可以使用
#i1[#icon(name: "zip") `.zip` 文件]
压缩文件，即 `.zip` 文件，也是常用的文件格式，通常被用于数据包和资源包的压缩。读者可自行选择合适的压缩软件对数据包或资源包进行压缩。
#i1[其他的文件格式]
Minecraft还使用其他一些文件格式，如 `.jfr` 文件、`.log` 文件等。具体见下文的说明。
=== .minecraft文件夹 \*
`.minecraft` 文件夹，macOS上为 #icon(name: "folder") `minecraft`，是存储Java版所有游戏数据的文件夹。

对于Windows系统，这个文件夹默认位于 #icon(name: "folder") `C: Users\Admin\AppData\Roaming\.minecraft`，其中 #icon(name: "folder") `AppData` 文件夹一般是隐藏的，可以在文件资源管理器 `查看` 工具栏，在 `显示/隐藏` 一项勾选 `隐藏的项目` 以显示这个文件夹。

对于Mac系统，这个文件夹默认位于 #icon(name: "folder") `home\用户名\Library\Application Support\minecraft`。对于Linux系统，这个文件夹默认位于 #icon(name: "folder") `home\用户名\.minecraft`，其中以 `.` 开头的文件夹默认是隐藏的，需要使用 `Ctrl` + `H` 切换是否可见。

第三方启动器会有其特殊的文件夹路径，具体见各启动器的设置。由官方启动器运行的游戏可以在启动器内手动修改存储路径，或者在默认存储路径处使用快捷方式重定向至自定义路径下。

随着游戏内容的增多、各种其他资源（如光影、模组）不断被下载到游戏中， #icon(name: "folder") `.minecraft`中的子文件（夹）可能会持续增多。鉴于无法讲到所有可能出现的文件（夹），本节仅列举原版游戏使用文件（夹）。文件结构如下所示：
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *assets*: 存放原版资源包部分游戏资源的文件夹，如简体中文的语言文件、声音 `.ogg` 文件等，其中这些文件被称为*散列资源文件*。]),
  (2, [#icon(name: "folder") *indexes*]),
  (3, [#icon(name: "json") *\<版本号>.json*: 该版本号用于映射散列资源的哈希表。]),
  (2, [#icon(name: "folder") *log_configs*]),
  (3, [#icon(name: "file") *client-<版本号>.xml*]),
  (2, [#icon(name: "folder") *objects*: 此文件夹专门用于存储声音、语言文件。]),
  (3, [#icon(name: "folder") *\<哈希值前两位>*]),
  (4, [#icon(name: "file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon(name: "folder") *skins*]),
  (3, [#icon(name: "folder") *\<哈希值前两位>*]),
  (4, [#icon(name: "file") *\<哈希值>*: 散列资源文件。]),
  (2, [#icon(name: "folder") *virtual*])
)
#tips(
  [
    #icon(name: "folder") `assets` 文件夹内的资源文件都是用*哈希值（Hash value，散列值）*#index(display: "哈希值（Hash value，散列值）", "haxizhi")加密的，以哈希表的方式映射资源位置。要查询 #icon(name: "folder") `assets` 内的任意一个资源文件，需按照以下步骤：
    #i1(new: true)[打开 #icon(name: "folder") `indexes` 文件夹，找到需要提取资源的 #icon(name: "json") `<版本号>.json` 文件。其中的内容大致如下所示：
    #codefile(
      lang: "json",
      title: ".minecraft > assets > indexes > <版本号>.json",
  "{
  \"objects\": {
    \"icons/icon_128x128.png\": {
      \"hash\": \"b62ca8ec10d07e6bf5ac8dae0c8c1d2e6a1e3356\", 
      \"size\": 9101
    }, 
    \"icons/icon_16x16.png\": {
      \"hash\": \"5ff04807c356f1beed0b86ccf659b44b9983e3fa\", 
      \"size\": 781
    }, 
    \"icons/icon_256x256.png\": {
      \"hash\": \"8030dd9dc315c0381d52c4782ea36c6baf6e8135\", 
      \"size\": 19642
    },
    \"_comment\": \"后续还有很多其他资源\"
  }
}")]
    #i1[用编译软件的查询功能在 #icon(name: "json") `<版本号>.json` 文件中查找所需资源，记录对应 #icon(name: "json-string") `hash` 字段的值，此即为映射该资源的哈希值。]
    #i1[打开 #icon(name: "folder") `objects` 文件夹，找到匹配的 #icon(name: "folder") `<哈希值前两位>` 文件夹，在此文件夹内找寻对应哈希值命名的文件，此即为需要找寻的资源。]
  ]
)
#example(
  [
    在 #icon(name: "folder") `assets` 文件夹内找到1.21.4版本（哈希表版本号显示为 `19`）简体中文语言的资源文件。
  ],
  [
    在 #icon(name: "json") `<19>.json` 文件中查询 `zh\_cn` 字样，可以找到一个键名为 `minecraft/lang/zh_cn.json` 的键值对：
    #codebox("\"minecraft/lang/zh_cn.json\": {
  \"hash\": \"4674523c91196e0898c24a06531f94154111f2a3\",
  \"size\": 459788
}")
    这时获取到哈希值 `4674523c91196e0898c24a06531f94154111f2a3`，其前两位是 `46`。然后打开文件夹 #icon(name: "folder") `objects\46`，在其中找到名为 #icon(name: "file") `4674523c91196e0898c24a06531f94154111f2a3` 的文件，此即为简体中文的语言文件。打开后会发现文件中的汉字均是用Unicode码表示的。
  ]
)
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *backups*: 存放备份存档的文件夹。]),
  (2, [#icon(name: "zip") *\<日期>\_\<时间>\_\<存档名称>.zip*: 一个备份存档。]),
  (1, [#icon(name: "folder") *bin*]),
  (2, [#icon(name: "folder") *\<随机ID>*]),
  (3, [#icon(name: "file") `.dll` 或 `.so` 文件]),
  (1, [#icon(name: "folder") *crash-reports*: 存储游戏崩溃报告的文件夹。]),
  (2, [#icon(name: "text") *crash-\<日期>\_\<时间>-\<逻辑端类型>.txt*: 一份*崩溃报告（Crash Report）*#index(display: "崩溃报告（Crash Report）", "bengkuibaogao")文件。])
)
#tips(
  [游戏可能会以各种原因而发生*崩溃（Crash）*#index(display: "崩溃（Crash）", "bengkui")，读者可以从崩溃报告中查询崩溃原因。例如，以下是一份崩溃报告的开头部分内容：
  #codefile(
    lang: "txt",
    title: ".minecraft > crash-reports > crash-2024-02-08_21.25.56-server.txt",
    "---- Minecraft Crash Report ----
// I bet Cylons wouldn't have this problem.

Time: 2024-02-08 21:25:56
Description: Ticking entity"
  )
  其中第二行是“诙谐的评论”，对崩溃报告的分析没有作用。`Description` 行是崩溃原因，此处的崩溃原因是 `Ticking entity`，这种崩溃通常意味着有实体发生了错误。后文通常是崩溃的具体原因。
  
  鉴于崩溃原因多种多样，本教程无法介绍每一种崩溃原因及其解决办法，读者可以从社区获取各种崩溃原因的解决办法或者使用AI分析。]
)
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *debug*: 存储函数调试结果的文件夹。]),
  (2, [#icon(name: "text") *debug-trace-\<日期>\_\<时间>.txt*: 一份调试结果。])
)
#tips(
  [
    命令 `/debug` 可用于函数的调试，并将调试的结果以 `.txt` 的文件格式存入 #icon(name: "folder") debug 中。文件中的内容极为详细，可以以此观察函数的整个运行过程，并从中找到错误的地方。调试结果的具体内容如：
    #codefile(
      lang: "txt",
      title: ".minecraft > debug > debug-trace-2022-10-10_19.16.40.txt",
      "[C] scoreboard players reset @s heart_of_life
    [E] 未知的记分项'heart_of_life'    [C] advancement revoke @s only plus:items/heart_of_life
    [E] 无法撤销Mu_xian的进度plus:items/heart_of_life，因为该玩家并未达成此进度    [C] effect clear @s absorption
    [M] 已移除Mu_xian的伤害吸收效果
  [R = 1] effect clear @s absorption
  [C] scoreboard players add @s max_health 2
    [M] 将Mu_xian的[max_health]增加了2（现在是44）
  [R = 44] scoreboard players add @s max_health 2
  [C] function plus:game/attributes/max_health
    [M] 已执行函数plus:game/attributes/max_health中的0条命令
  [R = 0] function plus:game/attributes/max_health
  [F] plus:game/attributes/max_health size=60
    [C] execute as @a if score @s max_health matches 1 run attribute @s max_health base set 1 -> 0
    [C] execute as @a if score @s max_health matches 2 run attribute @s max_health base set 2 -> 0"
    )
    其中首行是函数的命名空间ID。以 `[C]` 开头的内容为函数中的命令行；以 `[E]` 开头的内容指明了上一条命令行出现错误的地方；以 `[M]` 开头的内容说明上一条命令执行成功，并有 `[R=<值>]` 输出执行的结果。`[F]` 说明上一条命令引用了其他函数，并指出被引用的函数的大小。
  ]
)
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *libraries*: 按Maven仓库的标准目录结构组织和存储的第三方库。]),
  (2, [#icon(name: "folder") 一个第三方库。]),
  (1, [#icon(name: "folder") *logs*: 存储日志文件的文件夹。]),
  (2, [#icon(name: "zip") *\<日期>-\<日志编号>.log.gz*: 压缩文件，可使用解压软件打开。]),
  (3, [#icon(name: "file") *\<日期>-\<日志编号>.log*: 日志文件。]),
  (2, [#icon(name: "file") *latest.log*: 最新一次游戏或当前正在进行的游戏所生成的日志文件。])
)
#tips(
  [日志文件会存储游戏运行全过程的各种反馈，包括加载错误时的反馈，这些文件对游戏调试很重要。文件内容大致如下所示：
  #codefile(
    title: ".minecraft > log > 2025-03-07-1.log.gz > 2025-03-07-1.log",
    "[19:06:06] [Render thread/INFO]: Using default channel type
[19:06:06] [Render thread/INFO]: Started serving on 10000
[19:06:06] [Render thread/INFO]: [System] [CHAT] 本地游戏已在端口[10000]上开启
[19:06:41] [User Authenticator #1/INFO]: UUID of player XVExodus is 0caaf85c-27b0-4cf6-8f63-7278c55aa0e1
[19:06:42] [Server thread/INFO]: XVExodus[/172.20.10.5:53055] logged in with entity id 252 at (-8.221424908762929, 0.0, 8.503485026934579)
[19:06:42] [Server thread/INFO]: XVExodus加入了游戏
[19:06:42] [Render thread/INFO]: [System] [CHAT] XVExodus加入了游戏
[19:09:58] [Server thread/WARN]: XVExodus moved too quickly! -7.169010753171733,-1.6414613841373864,7.738717431310306
[19:12:34] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:13:54] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:14:43] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:16:11] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]
[19:16:37] [Render thread/INFO]: Loaded 610 advancements
[19:18:25] [Render thread/WARN]: Unable to play empty soundEvent: minecraft:entity.salmon.ambient
[19:18:32] [Render thread/INFO]: [System] [CHAT] 已设置重生点
[19:20:23] [Render thread/INFO]: Loaded 612 advancements
[19:22:03] [Server thread/WARN]: XVExodus moved too quickly! -4.311401208300595,-1.8757037979856364,17.86772802981045
[19:23:27] [Server thread/INFO]: [Mu_xian: 已将Mu_xian传送至XVExodus]
[19:23:27] [Render thread/INFO]: Loaded 612 advancements
[19:24:38] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]
[19:25:06] [Server thread/INFO]: [XVExodus: 已将XVExodus传送至Mu_xian]"
  )
  ]
)
#tree(
  (0, [#icon(name: "folder") *.minecraft*]),
  (1, [#icon(name: "folder") *resourcepacks*: 存储所有资源包的文件夹，其基本结构见@sec:resourcepack，具体的制作方式将在《资源包》教程中给出。]),
  (1, [#icon(name: "folder") *saves*: 存储游戏中所有存档的文件夹，具体结构见@sec:saves 。]),
  (2, [#icon(name: "folder") *\<存档名称>*: 一个存档。]),
  (1, [#icon(name: "folder") *screenshots*: 存储 `F2` 截屏图片的文件夹。]),
  (2, [#icon(name: "png") *\<日期>\_\<时间>.png*: 一张截屏，名称可手动修改。]),
  (1, [#icon(name: "folder") *versions*: 存储游戏不同版本游戏资源的文件夹。]),
  (2, [#icon(name: "folder") *\<版本号>*: 一个游戏版本，可以是正式版，也可以是快照。]),
  (3, [#icon(name: "jar") *\<版本号>.jar*: 物理客户端文件，是存放该版本号游戏源代码的地方。可以用压缩软件打开这个文件。]),
  (4, [#icon(name: "folder") *assets*: 存放该版本号原版资源包内容的文件夹，它决定了客户端游戏内容的外观。在制作资源包时可以参考这个文件夹的结构。不含在 #icon(name: "folder") `.minecraft\assets` 中存放的语言和声音文件。]),
  (4, [#icon(name: "folder") *com*]),
  (4, [#icon(name: "folder") *data*: 存放该版本号原版数据包内容的文件夹，它决定了可写注册表的内容，如进度、战利品表、配方、结构等。在制作数据包时可以参考这个文件夹的结构。]),
  (4, [#icon(name: "file") *flightrecorder-config.jfc*: Java Flight Recorder配置文件，可用于JFR分析。]),
  (4, [#icon(name: "folder") *META-INF*: `.jar` 文件的元数据。]),
  (5, [#icon(name: "file") *LICENSE*: 游戏许可协议。]),
  (5, [#icon(name: "file") *MANIFEST.MF*: 清单文件。]),
  (5, [#icon(name: "file") *MOJANGCS.RSA*: 用于验证JAR的文件。]),
  (5, [#icon(name: "file") *MOJANGCS.SF*: JAR签名。]),
  (4, [#icon(name: "folder") *net*: 自25w45a起，Mojang发布的未经混淆的客户端其源代码均存储于该文件夹内。其中的类文件均未被混淆，可查看，是制作Mods的重要依据。]),
  (5, [#icon(name: "folder") *minecraft*]),
  (6, [#icon(name: "file") *\<名称>.class*: 一个未混淆的Java类文件。]),
  (4, [#h(-2em)#icon(name: "png") *pack.png*: 原版资源包的图标。#figure(caption: [原版资源包的图标（pack.png）],image("图片/原版资源包的图标（pack.png）.png", width: 10%))]),
  (4, [#icon(name: "json") *versions.json*: 版本信息文件，存储该版本的信息。]),
  (3, [#icon(name: "json") *\<版本号>.json*: 客户端清单文件。]),
  (1, [#icon(name: "folder") *webcache2*]),
  (1, [#icon(name: "text") *allowed_symlinks.txt*: 信任符号链接列表文件。]),
  (1, [#icon(name: "text") *command\_history.txt*: 命令历史文件，最多只能保留50条记录。]),
  (1, [#icon(name: "png") *debug.stitched\_items.png*]),
  (1, [#icon(name: "png") *debug.stitched\_terrain.png*]),
  (1, [#icon(name: "nbt") *hotbar.nbt*: 存储在创造模式中保存的快捷栏信息的文件，在创造模式中的快捷栏以 `C` + `<数字>` 存储，然后以 `X` + `<数字>` 调用。可以用NBT编辑器打开这个文件。]),
  (1, [#icon(name: "text") *launcher\_cef\_log.txt*]),
  (1, [#icon(name: "json") *launcher\_entitlements.json*]),
  (1, [#icon(name: "json") *launcher\_gamer\_pics.json*]),
  (1, [#icon(name: "json") *launcher\_msa\_credentials.json*]),
  (1, [#icon(name: "json") *launcher\_profiles.json*: 启动器档案文件。]),
  (1, [#icon(name: "json") *launcher\_quick\_play.json*: 启动器快速进入游戏存档信息文件。]),
  (1, [#icon(name: "json") *launcher\_settings.json*: 启动器配置文件。]),
  (1, [#icon(name: "json") *launcher\_skins.json*]),
  (1, [#icon(name: "json") *launcher\_ui\_state.json*]),
  (1, [#h(-2em)#icon(name: "text") *options.txt*: 该文件存储了游戏中设定的选项，可以通过更改该文件中的内容以更改在游戏中的设置。此外一些在选项界面中不存在的设置也可以通过该文件更改。文件中内容如下所示：#codefile(lang:"txt",title:".minecraft\options.txt","version:4189
ao:true
biomeBlendRadius:2
enableVsync:false
entityDistanceScaling:1.0
entityShadows:true")]),
  (1, [#icon(name: "file") *output-client.log*]),
  (1, [#icon(name: "file") *output-server.log*]),
  (1, [#icon(name: "json") *realms\_persistence.json*: 存储Realms数据的文件。]),
  (1, [#icon(name: "nbt") *servers.dat*: 存储玩家添加到服务器列表的多人游戏服务器的数据。]),
  (1, [#icon(name: "png") *textures\_0.png*]),
  (1, [#icon(name: "png") *textures\_1.png*]),
  (1, [#icon(name: "png") *textures\_2.png*]),
  (1, [#icon(name: "png") *textures\_3.png*]),
  (1, [#icon(name: "png") *textures\_4.png*]),
  (1, [#icon(name: "json") *usercache.json*: 游戏为减少重复获取玩家档案信息所使用的缓存文件。])
)
== 数据包
Minecraft的命令系统虽然完善，但其功能十分有限。例如，命令没有办法直接指导游戏世界的生成；直接用命令模拟一些游戏机制也不够灵活。数据包可以看作是命令系统功能的延伸：它不仅为命令提供了程序化执行的环境，更开放了部分API以允许数据驱动内容。

*数据包（Data pack）*#index(display: "数据包（Data pack）", "shujubao")*允许玩家在不修改游戏代码的前提下覆盖既有的或添加自定义的游戏内容。*因此，*原版技术性开发从不添加任何不在可写注册表内的游戏内容，只会用各种手段模拟这些游戏内容*。数据包本质上是一个文件夹或压缩文件。一个数据包仅对特定的游戏世界有效，它被储存在 `.minecraft\saves\<存档名称>\datapacks` 中。数据包可以是文件夹，也可以是 `.zip` 类型的压缩文件。同一个 #icon(name:"folder") `datapacks` 文件夹内能存放多个数据包。

数据包有两种添加方式——
+ 手动添加：直接将数据包添加至 `.minecraft\saves\<存档名称>\datapacks`。
+ 创建世界时添加数据包：在创建新的世界界面，选择 `更多`，点击 `数据包` 选项，此时会进入选择数据包窗口，类似于资源包选项的窗口，可在“可用”一栏内选用数据包，只有“已选”一栏的数据包有效，且数据包的加载顺序可以在该栏中调换。点击 `打开包文件夹` 选项后游戏会弹出一个临时的文件夹，此时可以将数据包拖入其中。
#figure(
  caption: [选择数据包窗口],
  image("图片/选择数据包窗口.png", width: 70%)
)
当一个存档中存在多个有效的已启用数据包时，游戏会根据数据包的顺序加载其内容，这里的“有效”是指数据包有合法的元数据且数据包内无任何语法错误。已启用数据包的加载顺序存储于 #icon(name:"nbt") `level.dat` 中。在选择数据包窗口“已选”一栏的加载顺序表现为从下到上。

若这些数据包对同种资源进行定义，则*后加载的数据包会对先加载的数据包进行覆盖*，表明越靠后加载的数据包其优先级越高。可使用命令  `/datapack` 查询、修改、控制这些数据包的启用或禁用，`/datapack` 所需的权限等级为2，以下是所有用法：
#i1(new: true)[启用指定数据包]
#codebox("datapack enable <name>")
#param-desc(
  [`<name>`（字符串 `brigadier:string`）#footnote[括号中内容为该参数的类型及该参数类型在注册表内的命名空间ID，后续教程均如此。]], [指定数据包的名称。必须使用单个词，可用引号括起整个字符串。可用字符有：\
  数字 `0123456789`；\
  大写字母 `ABCDEFGHIJKLMNOPQRSTUVWXYZ`；\
  小写字母 `abcdefghijklmnopqrstuvwxyz`；\
  下划线 `_`；\
  加号 `+`、减号 `-`；\
  点 `.`；\
  引号 `'`、`"`；\
  反斜杠 `\`。\
  如果用引号括起整个字符串，字符串内的同种引号与反斜杠前需要加上反斜杠 `\` 转义。]
)
#i1[禁用指定数据包]
#codebox("datapack disable <name>")
#i1[列举所有数据包]
#codebox("datapack list [available|enabled]")
#param-desc(
  [`[available|enabled]`], [可选，若设为 `available` 则列举所有可用数据包，无论是否启用；若设为 `enabled`，则仅列举已启用数据包。默认为 `available`。]
)
#i1[启用指定的数据包，并设置其优先级为最低或最高]
#codebox("datapack enable <name> (first|last)")
#param-desc(
  [`(first|last)`], [设置 `first` 以将该数据包的加载位次设为*首位*，因此优先级设为*最低*；设置 `last` 以将该数据包的加载位次设为*末位*，因此优先级设为*最高*。]
)
#i1[启用指定的数据包，并调整其加载优先级居于另一个数据包]
#codebox("datapack enable <name> (before|after) <existing>")
#param-desc(
  [`(before|after)`], [设置 `before` 以将该数据包的加载放于数据包 `<existing>` *之前1位*，因此优先级比数据包 `<existing>` *低1级*；设置 `before` 以将该数据包的加载放于数据包 `<existing>` *之后1位*，因此优先级比数据包 `<existing>` *高1级*。],
  [`<existing>`（字符串 `brigadier:string`）], [必须为一个存在并已启用的数据包的名称。可用字符与<name>一致。]
)
#i1[新建一个空数据包，并设置此数据包的描述，注意，被创建的数据包默认为禁用状态]
#codebox("datapack create <id> <description>")
#param-desc(
  [`<id>`（字符串 `brigadier:string`）], [新建数据包的名称，可用字符与上述 `<name>` 参数一致。],
  [`<description>`（文本组件 `minecraft:component`）], [该数据包的描述，是为元数据 `pack.mcmeta` 内 #icon(name: "json-string")#icon(name: "json-object")#icon(name: "json-array") `description` 的值。需要是文本组件，具体写法可参照@chap:text_component。]
)
编写数据包是一个“修改——调试——再修改——再调试”的重复过程，在既有内容的基础上对数据包做出修改并保存后，游戏不会立即识别这些修改的内容，而是依旧在修改前数据包的基础上运行原先的内容。此时需要重新加载数据包。

每次玩家进入存档（或称之为启动服务端）后，游戏都会按照加载顺序加载数据包，无论是否为首次进入存档。如果新加载的数据包内含有无效数据，则使用先前版本的数据包。在游戏过程中可以用命令 `/reload` 重新加载数据包而不必退出游戏并重新进入存档，这种方式被称为*热重载*。`/reload` 需要的权限等级为2，其语法中不需附带任何参数：
#codebox("reload")
但是，使用 `/reload` 和重启服务端加载数据包的加载行为不同。`/reload` 只能用于重新加载数据包标签、函数、进度、战利品表、物品修饰器、战利品表谓词和配方这些注册项，剩余的注册项无法使用 `/reload` 加载，必须通过重启服务端加载。
#wrap-content(
  box(
    width: 12em,tips(
    [删除Anvil文件或自定义维度文件夹是比较危险的行为，可能会删掉存档中一些重要数据，删除之前需慎重考虑！]
  )),
  [

    其中维度、世界生成这些控制世界生成方式的注册项，对于已经生成的区块或维度，也无法通过世界加载重新生成这些区块或维度。因此自定义世界生成模块需要在世界首次加载时就被应用，即需要在创建世界时添加数据包而非在世界运行过程中手动添加数据包。如果确需在在世界运行过程中修改世界生成，可在确保世界仅作调试使用的前提下删除存档中需要重新生成区块的Anvil文件或自定义维度文件夹使其重新加载。
  ],
  align: right,
  column-gutter: 2em
)
对于非数据包标签、函数、进度、战利品表、物品修饰器、战利品表谓词或配方的注册项，进入存档会出现*实验性设置（Experimental settings）*#index(display: "实验性设置（Experimental settings）", "shiyanxingshezhi")的警告，此时可点击创建备份并加载或我知道我在做什么！。但若这些注册项出现各种各样的错误（不一定是语法错误），则进入存档会出现*安全模式（Safe mode）*#index(display: "安全模式（Safe mode）", "anquanmoshi")错误，可在官方启动器设置中打开“当《Minecraft：Java版》启动时输出日志”一项以随时获得错误日志，或在 `.minecraft\debug` 文件夹中获取 `.txt` 输出日志以检查存在的错误。

数据包的编写是一个极为繁琐的过程，需要不断地调试、纠错，有时甚至要对其底层逻辑进行重构。在编写数据包之前，读者应提前做好规划，对其可行性进行初步的研究，还要考虑数据包运行过程中的流畅性、玩家游玩过程中的平衡性。编写过程合理使用文件层级，对文件适当分类，以免内容混乱，降低文件可读性。

原版数据包位于 #icon(name: "folder") `.minecraft\versions\<版本号>\<版本号>.jar\data`，是编写自定义数据包的重要依据，读者可参考之。
=== 数据包的元数据与基本结构
一个数据包拥有以下的基本结构：
#tree(
  (0, [#icon(name: "folder") *\<数据包名称>*或 #icon(name: "zip") *\<数据包名称>.zip*]),
  (1, [#icon(name: "folder") *\<子数据包>*]),
  (2, [递归此文件夹结构]),
  (1, [#icon(name: "folder") *data*]),
  (1, [#icon(name: "json") *pack.mcmeta*]),
  (1, [#icon(name: "png") *pack.png*])
)
其中，#icon(name: "json") `pack.mcmeta` 是数据包的*元数据（Metadata）*#index(display: "元数据（Metadata）", "yuanshuju")。只有当元数据存在时，游戏才能识别数据包。#icon(name: "json") `pack.mcmeta` 使用JSON格式，其包含的内容如下所示：
== 资源包<sec:resourcepack>
== 游戏机制
游戏为命令提供了一个运行环境，为此命令系统不免受到游戏机制的制约。在时间上，命令受到游戏循环驱动的影响，以游戏刻为单位执行；在空间上，命令受到区块加载的影响，只能在允许运算的区块中执行。本节旨在介绍游戏加载、运行、更新的一些基本游戏机制。
=== 端
Minecraft的架构是*客户端-服务端模型*，顾名思义，Minecraft使用*客户端（Cilent）*#index(display:"客户端（Cilent）","kehuduan")和*服务（器）端（Server）*#index(display:"服务（器）端（Server）","fuwuduan")来运作自身。这两个*端（Sides）*#index(display:"端（Sides）","duan")之间的通信是由*封包（Packet）*#index(display:"封包（Packet）","fengbao")实现的。在网络工程中，这个概念一般译为“数据包”，而Minecraft中另有一个叫Datapack（数据包）的概念，故Packet在Minecraft技术性开发领域会特地译为“封包”。

然而，仅通过客户端和服务端理解Minecraft的运作是远远不够的，因为Minecraft的架构还包括*物理端（Physical sides）*#index(display:"物理端（Physical sides）","wuliduan")和*逻辑端（Logical sides）*#index(display:"逻辑端（Logical sides）","luojiduan")，并且物理端和逻辑端分别具有各自的客户端和服务端。
==== 物理客户端
*物理客户端（Physical client）*#index(display:"物理客户端（Physical client）","wulikehuduan")是指下载游戏版本得到的`<version>.jar`文件，它的默认文件路径为`.minecraft\<版本号>\<version>.jar`。物理客户端包含了游戏的全部内容，也包含了内置的客户端和服务端，即*逻辑客户端（Logical client）*#index(display:"逻辑客户端（Logical client）","luojikehuduan")和*逻辑服务端（Logical server）*#index(display:"逻辑服务端（Logical server）","luojifuwuduan")，其中逻辑服务端又称*内置服务器（Integrated server，或译为集成服务端）*#index(display:"内置服务器（Integrated server）","neizhifuwuqi")。内置服务器会受到客户端的影响。

逻辑客户端负责接收来自玩家的输入、处理资源包、渲染游戏画面，并将数据输送给逻辑服务端处理；逻辑服务端负责处理由客户端发送的数据，运行游戏逻辑。例如，当玩家在游戏中移动时，客户端会根据玩家输入的移动方向渲染玩家此时的游戏画面，同时又将玩家移动的信息通过封包发送给逻辑服务端，逻辑服务端计算玩家的坐标、玩家周围是否存在任何的碰撞箱阻止玩家移动，将计算结果通过封包返还给逻辑客户端，渲染玩家移动的游戏画面。客户端的渲染会与服务端产生不一致的情况，例如标记是一种仅存在于服务端的实体，在客户端上并不会渲染标记，参见@sec:technical_entity。
#figure(
  caption: [逻辑客户端和逻辑服务端的运行流程],
  image("图片/逻辑客户端和逻辑服务端的运行流程.png", width: 60%)
)
*即使是进行单人游戏，Minecraft依旧会在玩家进入本地世界时创建一个内置服务器，在本地世界关闭时内置服务器即被关闭。*这个内置服务器可以开放至局域网，从而将单人游戏开放为局域网联机的多人游戏。此时内置服务器拥有一个地址，其格式为
#codebox("<IPv4地址>:<端口>")
局域网联机的IPv4地址可由CMD的`ipconfig`命令查询。端口是一个数值，可以自由指定，范围为`0`至`65535`（含两端）。除了通过暂停游戏的对局域网开放选项外，玩家还可以通过命令`/publish`开放内置服务器，该命令所需权限等级为4，且仅能在单人游戏中使用，其语法为：
#codebox("publish [<allowCommands>] [<gamemode>] [<port>]")

== 服务器

== 带有简单参数的命令指引

= 坐标
Minecraft的游戏世界是三维的。在编写数据包的时候，有时需要确定实例所需的位置参数。这样的参数被称为*坐标（Coordinate）*#index(display:"坐标（Coordinate）","zuobiao")。本章将详细介绍各种坐标参数以及这些参数在命令上的应用。
#pagebreak()
== 坐标系与坐标
Minecraft使用的空间直角坐标系是右手坐标系。在这种空间直角坐标系中，$x$轴和$z$轴所反映的是水平方向上的位置，$y$轴所反映的是垂直方向上的位置。其中，*$x$轴的正方向指向正东，而$z$轴的正方向指向正南*。
#figure(
  caption: [适用于Minecraft的空间直角坐标系],
  image("图片/适用于Minecraft的空间直角坐标系.png"),
)
在命令参数中，可以用三个分量来表示某一点的位置，这是一个有序的实数三元组：
#codebox("<x> <y> <z>")
比如，用数学方法表示的点$(0,4,4)$在一些命令参数中直接表示为`0 4 4`。

#example(
  [
    空间直角坐标系中有两个点$A(124.5,76,−64.29)$、$B(−10.003,80,−33.33)$，则$B$点在水平位置上位于$A$点的什么方向？
  ],
  [
    $B$点$x$坐标位于$A$点$x$坐标的负方向，因此$B$点在东西方向上位于$A$点的西方；$B$点$z$坐标位于$A$点$z$坐标的正方向，因此$B$点在东西方向上位于$A$点的南方。综上所述，$B$点位于$A$点的西南方向。

  ]
)

虽然不同的坐标表示方式基本一致，但不同的命令作用的对象不同，其坐标参数类型也不完全一致，下文将梳理命令系统使用的所有种类的坐标参数。

=== 坐标的命令参数类型
命令使用4种与坐标相关的参数类型：方块坐标`minecraft:block_pos`、三维坐标`minecraft:vec3`、平面方块坐标`minecraft:column_pos`和二维坐标`minecraft:vec2`。它们的关系和应用场景可以很清晰地列于下表：
#general-table(
  caption: [Minecraft中的坐标参数],
  columns: 3,
  colspan: 3,
  header: ([], [一般应用于方块], [一般应用于非方块的游戏内容]),
  [三维], [`minecraft:block_pos`], [`minecraft:vec3`],[二维], [`minecraft:column_pos`], [`minecraft:vec2`]
)

==== 方块坐标
坐标表示的是一个没有体积的点，而方块是有体积的，因此需要给方块规定一个基准点，用这个基准点的坐标来表示该对象的坐标。

Minecraft规定：大部分方块的长、宽和高均为1米，体积为1立方米。用坐标系表示这些位置时，默认了方块的边长和坐标系的单位长度在数值上相等，这意味着坐标系的基本单位为米，或称为“格”。

一个方块使用其*西北下角*的点作为它的*方块坐标（Block position）*#index(display:"方块坐标（Block position）","fangkuaizuobiao")。若一个方块的西北下角顶点坐标为$(x,y,z)$，则该方块的方块坐标记为$(x,y,z)$，而这个方块位于$(x,y,z)$和$(x+1,y+1,z+1)$这两个坐标围成的立体几何图形之间。
#context counter(figure).display("1")
#figure(
  caption: [用方块这个方向的顶点来表示方块坐标],
  image("图片/用方块这个方向的顶点来表示方块坐标.png", width: 35%)
)
由于方块的角总是位于整数坐标点，作为命令参数`minecraft:block_pos`的方块坐标一定是由三个整数构成的有序三元组。
#example(
  [
    #h(-2em)如图所示，方块坐标为`0 0 0`的方块为哪一个？
    #figure(caption: "", image("图片/方块坐标例题.png", width: 30%))
  ],
  [
    方块坐标严格按照西北下角顶点来计算，而正西、正北分别是$x$轴和$z$轴的负方向，因此用方块坐标指示的方块位置，永远位于实际坐标的东南方向，且在垂直方向上位于上方，在空间直角坐标系中的反映即为$x$、$y$、$z$三个坐标轴的正方向。因此方块坐标为`0 0 0`的方块位于第一卦限，即方块$A$。

  ]
)

==== 三维坐标
*三维坐标（Three-dimensional coordinates）* #index(display:"三维坐标（Three-dimensional coordinates）","sanweizuobiao")是精确表示一个位置的坐标参数，命令参数类型为`minecraft:vec3`，用于表示坐标位置的三个元素均为双精度浮点数。三维坐标一般应用于实体，它也可能会在粒子生成和声音播放的时候被使用。例如，这是一个合法的三维坐标：
#codebox("5.0 56.0 17.0")
#h(-2em)这个坐标带有小数点，因为三维坐标的三个参数均是双精度浮点数。但是，这并不意味着三维坐标只能使用浮点数。也可以在三维坐标中使用整数形式，如：
#codebox("5 56 17")
注意，上述这两个坐标描述的位置并不是一致的。在实际操作中，却发现这个玩家位于三维坐标$(5.5,56.0,17.5)$。如图，可以观察到玩家的坐标发生了“偏移”，与实际坐标有所出入。其中$x$坐标和$z$坐标都发生了“偏移”，而$y$坐标不受影响。
#figure(
  caption: [整数坐标发生的“偏移”],
  image("图片/整数坐标发生的“偏移”.png",width: 80%)
)
这些位置的偏移都位于相对方块两条对边的中心线上，这是因为三维坐标使用了*中心校准（Center correct）*#index(display:"中心校准（Center correct）","zhongxinjiaozhun")，即使用整数形式的三维坐标，当其某一个坐标参数为$n$（$n∈Z$）时，其实际坐标为$n−0.5$，这样可以使得实体位置与方块位置相适应。注意*中心校准仅适用于$x$坐标和$z$坐标。$y$坐标严格使用实际坐标*。

注意这里不使用“三维坐标根据方块坐标位于方块中心”的说法，是因为三维坐标的三个参数中整数和浮点数形式可以混用，并且使用小数形式的参数严格遵循实际坐标，整数形式的参数则使用中心校准。比如，位于`5 56 17.0`的玩家实际位于$(5.5,56,17.0)$。

==== 平面方块坐标
故名思义，平面方块坐标`minecraft:column_pos`就是二维的方块坐标，以西北角的二维坐标作为一个方块纵列的平面坐标，两个元素均为整数。

==== 二维坐标
即只由$x$坐标和$z$坐标构成的*二维坐标（Two-dimensional coordinates）*#index(display:"二维坐标（Three-dimensional coordinates）","erweizuobiao")。二维坐标的命令参数类型为`minecraft:vec2`，两个元素均为双精度浮点数。二维坐标若为整数，则也使用中心校准。
= 文本组件<chap:text_component>
= 存档格式
== 存档文件夹的结构<sec:saves>
== 技术性实体<sec:technical_entity>

#heading(level: 1, numbering: none, outlined: false, [索引])
#columns(2)[
  #make-index(use-page-counter: true)
]