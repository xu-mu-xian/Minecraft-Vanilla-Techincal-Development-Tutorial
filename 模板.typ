#import "@preview/in-dexter:0.7.2": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/hydra:0.6.2": hydra
#import "@preview/itemize:0.2.0" as el
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "自定义包/stringtree.typ": stringtree
#import table: cell, header

// 有序列表
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

// 有编号代码行
#let codeline = counter("codeline")
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

// 表格
#let tab_numbering(.., desc) = {
  context str(counter(heading).get().at(0)) + "." + counter(table).display("1")
}
#let xubiao = state("xubiao", false)
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


// 例题
#let exa = counter("exa")
#let example(question, solution) = {
  exa.step()
  v(1em)
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
    title: "",
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
    #block(
      width: 100%,
      sticky: true,
      {
        v(-1.5em)
        h(-2em)
        box(
          {
            let title-text = {
              set text(fill: white, font: "Minecraft")
              [例] + context str(counter(heading).get().at(0)) + "." + context exa.display()
            }
            place(dx: 2pt, dy: 2pt)[
              #box(
                fill: rgb("#ff6565"),
                inset: (x: 0.6em, y: 0.5em),
                radius: 5pt,
                hide(title-text)
              )
            ]
            h(-2em)
            box(
              fill: rgb("#d71d1d"),
              inset: (x: 0.6em, y: 0.5em),
              radius: 5pt,
              title-text
            )
          }
        )
      }
    )
    #question
  ]
}

// 子图片
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

// 标题格式
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
#let appendix(..nums) = {
  let level = nums.pos().len()
  let space = h(0.8em)
  if level == 1 {
    let chapter-num = numbering("I", nums.at(0))
    return "附录" + chapter-num + space
  } else if level == 2 {
    return numbering("I.1", ..nums) + space
  } else if level == 3 {
    return numbering("I.1.1", ..nums) + space
  } else if level == 4 {
    return numbering("一、", nums.at(3))
  } else {
    return none
  }
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

// 专有名词
#let proper-noun(display: "", value) = [*#display*#index(display: display, value)]

// 样式
#let template-style(main-body) = {

// 代码块
show: codly-init.with()
  
// 字体
set text(
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
show strong: it => {
  set text(
    font: ("TeX Gyre Termes", "FZHeiTi GB18030L2"),
    weight: "bold", 
    fill: red,
  )
  it 
}

// 段落
set par(
  first-line-indent: (
    all: true,
    amount: 2em
  ),
  justify: true,
  spacing: 0.65em
)

// 页面
set page(
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
show: el.default-enum-list.with(
  body-indent: 0em,
  indent: 0.5em,
  label-align: left,
  label-width: 1.5em
)
show enum: it => {
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
set enum(numbering: n => text(font:"TeX Gyre Termes", [#n.]))

// 代码块
show raw: it => {
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

// 有编号代码块
show figure.where(kind: "codebox"): it => {
  set block(above: 1em, below: 1em)
  it
}

// 公式
show math.equation: it => {
  set text(
    font: "TeX Gyre Termes Math"
  )
  h(2pt) + it + h(2pt)
}

// 图片
show figure: set block(above: 1.5em, breakable: true)
set figure(numbering: it => str(counter(heading).get().at(0)) + "." + counter(image).display("1"))

// 表格
show table: it => xubiao.update(false) + it
show figure.where(kind: table): set figure(gap: 0.3em)
show figure.where(kind: table): set figure.caption(position: top, separator: "  ")
show figure.caption: set text(font: ("TeX Gyre Termes", "FZHeiTi GB18030L2",), size: 0.85em, weight: "bold")
show figure.caption: set block(sticky: true)
show table.cell: it => {
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

// 标题
show heading: set align(center)
show heading: set text(
  font: (
    "TeX Gyre Termes",
    "Source Han Serif"
  )
)
show heading.where(level: 1): it => {
  set text(size: 2em)
  counter(image).update(1)
  counter(table).update(1)
  context codeline.update(0)
  context exa.update(0)
  pagebreak(weak: true)
  block(v(5em) + it + v(2em))
}
show heading.where(level: 2): it => {
  set text(fill: rgb("#d71d1d"), size: 1.8em)
  block(v(1em) + it + v(1em))
}
show heading.where(level: 3): it => {
  set align(left)
  set text(fill: rgb("#d71d1d"), size: 1.4em)
  block(v(0.2em) + it + v(0.6em))
}
show heading.where(level: 4): it => {
  set align(left)
  set text(fill: rgb("#d71d1d"), font: "FZHeiTi GB18030L2", size: 1.1em)
  block(v(0.2em) + it + v(0.6em))
}

// 引用
show ref: it => {
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
set footnote(
  numbering: " ①"
)
show footnote.entry: it => {
  let loc = it.note.location()
  numbering(
    "①  ",
    ..counter(footnote).at(loc),
  )
  it.note.body
}

  main-body
}