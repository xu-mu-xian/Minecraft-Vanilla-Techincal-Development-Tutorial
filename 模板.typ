#import "@preview/in-dexter:0.7.2": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/hydra:0.6.2": hydra
#import "@preview/itemize:0.2.0" as el
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/tdtr:0.5.0" : *
#import "自定义包/stringtree.typ": stringtree
#import table: cell, header

// 附录
#let appendix-part = state("appendix-part", false)
#let appendix = {
  counter(heading).update(0)
  appendix-part.update(true)
}

// 有编号代码行
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
                "Source Han Serif"
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
            context {
              let it = query(selector(figure).before(here())).last()
              numbering(it.numbering, ..counter(figure.where(kind: "codebox")).at(here()))
            }
          }
        )
      )
    ) + label
  }
)

// 参数解释
#let param-desc(prefix: "其中的参数：", ..args) = {
  let pos-args = args.pos()
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.7em,
    row-gutter: 0.8em,
    ..pos-args.chunks(2).enumerate().map(((i, pair)) => {
      let (info, desc) = pair
      (
        grid.cell(align: right, inset: (x: -0.3em))[
          #if i == 0 [#prefix]
          #info——],
        desc
      )
    }).flatten()
  )
}

// 表格
#let tab_numbering(n, ..desc) = {
  context if appendix-part.get() {
    numbering("I", counter(heading).get().at(0)) + "." + str(n)
  } else {
    str(counter(heading).get().at(0)) + "." + str(n)
  }
}
#let xubiao = state("xubiao", false)
#let general-table(
  caption: [表格标题],
  columns: auto,
  colspan: 1,
  header: (),
  seperator: (),
  ..content,
) = {
  figure(
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
}
#let split-table(
  caption: [分栏表格标题],
  label: none,
  original-cols: 3,
  gutter-width: 3pt,
  header: (),
  seperator: (),
  data: (),
) = {
  let col-widths = if type(original-cols) == array {
    original-cols
  } else {
    (1fr,) * original-cols
  }
  let col-count = col-widths.len()
  let missing = calc.rem(data.len(), col-count)
  let padded-data = data
  if missing > 0 {
    padded-data += ([],) * (col-count - missing)
  }
  let rows = padded-data.chunks(col-count)
  let half-idx = calc.ceil(rows.len() / 2)
  let left-part = rows.slice(0, half-idx)
  let right-part = rows.slice(half-idx)
  let combined-content = ()
  for i in range(half-idx) {
    combined-content += left-part.at(i)
    combined-content += ([],)
    if i < right-part.len() {
      combined-content += right-part.at(i)
    } else {
      combined-content += ([],) * col-count
    }
  }
  let auto-columns = col-widths + (gutter-width,) + col-widths
  let total-cols-count = col-count * 2 + 1
  let dual-header = header + ([],) + header
  let new-seperator = seperator
  for s in seperator {
    new-seperator.push(s + col-count + 1)
  }
  general-table(
    caption: caption,
    columns: auto-columns,
    colspan: total-cols-count,
    header: dual-header,
    seperator: new-seperator,
    ..combined-content
  )
}
#let triple-split-table(
  caption: [三栏表格标题],
  original-cols: 2,
  gutter-width: 3pt,
  seperator: (),
  header: (),
  data: (),
) = {
  let col-widths = if type(original-cols) == array { original-cols } else { (1fr,) * original-cols }
  let col-count = col-widths.len()
  let missing = calc.rem(data.len(), col-count)
  let padded-data = data + (([],) * (if missing > 0 { col-count - missing } else { 0 }))
  let rows = padded-data.chunks(col-count)
  let total-rows = rows.len()
  let part-size = calc.ceil(total-rows / 3)
  let left-part = rows.slice(0, part-size)
  let mid-part  = rows.slice(part-size, calc.min(part-size * 2, total-rows))
  let right-part = rows.slice(calc.min(part-size * 2, total-rows))
  let combined-content = ()
  for i in range(part-size) {
    combined-content += left-part.at(i)
    combined-content += ([],)
    if i < mid-part.len() {
      combined-content += mid-part.at(i)
    } else {
      combined-content += ([],) * col-count
    }
    combined-content += ([],) 
    if i < right-part.len() {
      combined-content += right-part.at(i)
    } else {
      combined-content += ([],) * col-count
    }
  }
  let triple-columns = col-widths + (gutter-width,) + col-widths + (gutter-width,) + col-widths
  let triple-header = header + ([],) + header + ([],) + header
  let total-span = col-count * 3 + 2
  let new-seperator = seperator
  for s in seperator {
    new-seperator.push(s + col-count + 1)
  }
  general-table(
    caption: caption,
    columns: triple-columns,
    colspan: total-span,
    header: triple-header,
    seperator: new-seperator,
    ..combined-content
  )
}

// 例题
#let example(question, solution, label: none, supplement: "例") = figure(
  kind: "example",
  supplement: supplement,
  {
    block(
      {
        showybox(
          breakable: true,
          footer: [
            #set enum(
              full: true, 
              numbering: (..nums) => {
                let formats = ("(1)", "①", "A.", "a.")
                let level = nums.pos().len()
                let format-str = formats.at(calc.min(level - 1, formats.len() - 1))
                let current-number = nums.pos().last()
                if level == 2 {
                  numbering(format-str, current-number)
                } else {
                  text(font: "TeX Gyre Termes", numbering(format-str, current-number))
                }
              }
            )
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
          #set enum(
            full: true, 
            numbering: (..nums) => {
              let formats = ("(1)", "①", "A.", "a.")
              let level = nums.pos().len()
              let format-str = formats.at(calc.min(level - 1, formats.len() - 1))
              let current-number = nums.pos().last()
              if level == 2 {
                numbering(format-str, current-number)
              } else {
                text(font: "TeX Gyre Termes", numbering(format-str, current-number))
              }
            }
          )
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
                    [例] + context {
                      let it = query(selector(figure).before(here())).last()
                      numbering(it.numbering, ..counter(figure.where(kind: "example")).at(here()))
                    }
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
          #h(-2em)#question
        ]
      }
    ) + label
  }
)

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
]

// 标题格式
#let book-heading(..nums) = {
  let level = nums.pos().len()
  let space = h(0.8em)
  context {
    if appendix-part.get() {
      if level == 1 { 
        return "附录" + numbering("I", nums.at(0)) + space
      } else if level == 2 {
        return numbering("I.1", ..nums) + space
      } else if level == 3 {
        return numbering("I.1.1", ..nums) + space
      } else if level == 4 {
        return numbering("一、", nums.at(3))
      } else if level == 5 {
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("1.", nums.at(4))))
      } else if level == 6 {
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("(1)", nums.at(5))))
      } else {
        return none
      }
    } else {
      if level == 1 {
        return "第" + numbering("一", nums.at(0)) + "章" + space
      } else if level == 2 {
        return numbering("1.1", ..nums) + space
      } else if level == 3 {
        return numbering("1.1.1", ..nums) + space
      } else if level == 4 {
        return numbering("一、", nums.at(3))
      } else if level == 5 {
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("1.", nums.at(4))))
      } else if level == 6 {
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("(1)", nums.at(5))))
      } else if level == 7 {
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("①", nums.at(6))))
      } else {
        return none
      }
    }
  }
}

// 序号重置
#let reset-h5 = context {
  if counter(heading).get().len() >= 5 {
    counter(heading).update(counter(heading).get().slice(0, 4))
  }
}
#let reset-h6 = context {
  if counter(heading).get().len() >= 6 {
    counter(heading).update(counter(heading).get().slice(0, 5))
  }
}

// 序号接续
#let fake_h4 = counter("fake_heading_4")
#let continue-h5(title) = {
  set text(fill: rgb("#d71d1d"), weight: "bold", font: "Source Han Sans SC", size: 1.1em)
  fake_h4.step()
  block(v(0.6em) + h(-2em) + context fake_h4.display("一、 ") + title + v(0.6em))
}

// 提示
#let tips(width: 100%, content) = {
  h(0.5em)
  block(
    width: width,
    showybox(
      breakable: true,
      frame: (
        body-color: rgb("#ffcece"),
        border-color: rgb("#d71d1d"),
        title-color: rgb("#d71d1d"),
        title-inset: (x: 0.6em, y: 0.5em)
      ),
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
                  [小提示]
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
        #set text(size: 0.9em)
        #content
      ]
    )
  )
}

// 图标
#let icon(name: none) = {
  if name == "folder" {
    box(image("图标/data/文件夹.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "file" {
    box(image("图标/data/文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "text" {
    box(image("图标/data/文本文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "png" {
    box(image("图标/data/图片文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt" {
    box(image("图标/data/NBT文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json" {
    box(image("图标/data/JSON文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "mcfunction" {
    box(image("图标/data/函数文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "ogg" {
    box(image("图标/data/声音文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "zip" {
    box(image("图标/data/压缩文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "jar" {
    box(image("图标/data/JAR文件.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json-string" {
    box(image("图标/data/JSON字符串.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json-bool" {
    box(image("图标/data/JSON布尔值.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json-number" {
    box(image("图标/data/JSON数值.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json-array" {
    box(image("图标/data/JSON数组.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "json-object" {
    box(image("图标/data/JSON对象.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-byte" {
    box(image("图标/data/字节型.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-bool" {
    box(image("图标/data/布尔值.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-short" {
    box(image("图标/data/短整型.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-int" {
    box(image("图标/data/整型.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-long" {
    box(image("图标/data/长整型.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-float" {
    box(image("图标/data/单精度浮点数.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-double" {
    box(image("图标/data/双精度浮点数.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-string" {
    box(image("图标/data/字符串.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-byte_array" {
    box(image("图标/data/字节型数组.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-int_array" {
    box(image("图标/data/整型数组.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-long_array" {
    box(image("图标/data/长整型数组.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-list" {
    box(image("图标/data/列表.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbt-compound" {
    box(image("图标/data/复合标签.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "vscode" {
    box(image("图标/VSCode.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "dhp" {
    box(image("图标/DHP.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "nbtstudio" {
    box(image("图标/NBTStudio.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "paint" {
    box(image("图标/画图.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "ps" {
    box(image("图标/PS.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "gimp" {
    box(image("图标/GIMP.png", height:1em), baseline: 0pt, height:0.85em)
  }
  if name == "mine_stone" {
    box(image("图标/advancement/石器时代.png", height:auto), baseline: 1em, height:3em)
  }
  if name == "obtain_armor" {
    box(image("图标/advancement/整装上阵.png", height:auto), baseline: 1em, height:3em)
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
          "Source Han Serif"
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
  show raw: set text(font: ("Consolas", "Source Han Serif"))
  raw(body, block: true, lang: lang)
}

// 树状图
#let tree(..items) = stringtree(line_color: red, ..items)

// 填空空格
#let blank = underline("                ")

// 专有名词
#let proper-noun(display: "", value) = {
  let actual-display = if display == "" { value } else { display }
  [*#actual-display*#index(display: actual-display, value)]
}
// 样式
#let template-style(main-body) = {
  // 代码块
  show: codly-init.with()
  // 字体
  set text(
    font: (
      (
        name: "Source Han Serif",
        covers: regex("[·“”‘’…|/\[\]\{\}<>—]")
      ),
      "TeX Gyre Termes",
      "Source Han Serif"
    ),
    lang: "zh"
  )
  show strong: it => {
    set text(
      font: ("Roboto", "Source Han Sans SC"),
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
    leading: 0.8em,
    spacing: 0.8em
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
              "Minecraft",
              "Unifont"
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
              "Minecraft",
              "Unifont"
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
    label-align: left,
    label-width: (2em, 2em, 1.5em, 1.5em, 1em)
  )
  show enum: it => {
    set par(first-line-indent: 0em)
    set text(
      font: (
        (
          name: "Source Han Serif",
          covers: regex("[·“”‘’…|/\[\]\{\}<>—]")
        ),
        "TeX Gyre Termes",
        "Source Han Serif"
      )
    )
    it
  }
  set enum(
    full: true, 
    numbering: (..nums) => {
      let formats = ("1.", "(1)", "①", "A.", "a.")
      let level = nums.pos().len()
      let format-str = formats.at(calc.min(level - 1, formats.len() - 1))
      let current-number = nums.pos().last()
      if level == 3 {
        numbering(format-str, current-number)
      } else {
        text(font: "TeX Gyre Termes", numbering(format-str, current-number))
      }
    }
  )
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
        text(font: ("Consolas","Source Han Serif"), size: 0.9em, it)
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
      font: (
        "TeX Gyre Termes Math",
        "Source Han Serif"
      )
    )
    h(2pt) + it + h(2pt)
  }
  set math.equation(
    numbering: n => {
      [(#context if appendix-part.get() {
          numbering("I", counter(heading).get().at(0)) + "." + str(n)
        } else {
          str(counter(heading).get().at(0)) + "." + str(n)
        })
      ]
    },
    number-align: bottom
  )
  // 图片
  show figure: set block(above: 1.5em, breakable: true)
  set figure(numbering: n => {
    context if appendix-part.get() {
      numbering("I", counter(heading).get().at(0)) + "." + str(n)
    } else {
      str(counter(heading).get().at(0)) + "." + str(n)
    }
  })
  // 表格
  show table: it => xubiao.update(false) + it
  show figure.where(kind: table): set figure(gap: 0.3em)
  show figure.where(kind: table): set figure.caption(position: top, separator: "  ")
  show figure.caption: set text(font: ("TeX Gyre Termes", "Source Han Sans SC",), size: 0.85em, weight: "bold")
  show figure.caption: set block(sticky: true)
  show table.cell: it => {
    if it.y == 1 {
      set text(
        fill: white,
        font: ("TeX Gyre Termes", "Source Han Sans SC"),
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
  set heading(numbering: book-heading)
  show heading: set align(center)
  show heading: set text(
    font: (
      "TeX Gyre Termes",
      "Source Han Serif"
    )
  )
  show heading.where(level: 1): it => {
    set text(size: 2em)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(math.equation).update(0)
    counter(figure.where(kind: "codebox")).update(0)
    counter(figure.where(kind: "example")).update(0)
    pagebreak(weak: true)
    block(v(5em) + it + v(2em))
  }
  show heading.where(level: 2): it => {
    set text(fill: rgb("#d71d1d"), font: ("Minecraft", "Unifont"), size: 1.8em)
    block(v(1em) + it + v(1em))
  }
  show heading.where(level: 3): it => {
    set align(left)
    set text(fill: rgb("#d71d1d"), size: 1.4em)
    block(v(0.2em) + it + v(0.6em))
  }
  show heading.where(level: 4): it => {
    set align(left)
    set text(fill: rgb("#d71d1d"), font: "Source Han Sans SC", size: 1.1em)
    block(v(0.2em) + it + v(0.6em))
  }
  show heading.where(level: 5): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(v(-0.6em) + it + v(0.1em))
  }
  show heading.where(level: 6): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(v(-0.6em) + it)
  }
  show heading.where(level: 7): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(v(-0.6em) + it)
  }
  // 引用
  show ref: it => {
    if it.element == none {
      return it
    }
    if it.element.func() == heading {
      let nums = counter(heading).at(it.element.location())
      context {
        link(it.element.location())[#if appendix-part.at(it.element.location()) {
          if it.element.level == 1 {
            [附录#numbering("I", counter(heading).at(it.element.location()).at(0))]
          } else if it.element.level == 2 {
            numbering("I.1", ..counter(heading).at(it.element.location()))
          } else if it.element.level == 3 {
            numbering("I.1.1", ..counter(heading).at(it.element.location()))
          } else if it.element.level == 4 {
            numbering("一、", counter(heading).at(it.element.location()).at(3))
          }
        } else {
          if it.element.level == 1 {
            [第#numbering("一", counter(heading).at(it.element.location()).at(0))章]
          } else if it.element.level == 2 {
            numbering("1.1", ..counter(heading).at(it.element.location()))
          } else if it.element.level == 3 {
            numbering("1.1.1", ..counter(heading).at(it.element.location()))
          } else if it.element.level == 4 {
            numbering("一、", counter(heading).at(it.element.location()).at(3))
          }
        }]
      }
    } else if it.element.func() == figure {
      context {
        link(it.element.location())[#if appendix-part.at(it.element.location()) {[#it.element.supplement #numbering("I", counter(heading).at(it.element.location()).at(0)).#counter(figure.where(kind: it.element.kind)).at(it.element.location()).at(0)]} else {[#it.element.supplement#str(counter(heading).at(it.element.location()).at(0)).#counter(figure.where(kind: it.element.kind)).at(it.element.location()).at(0)]}]
      }
    } else {
      it
    }
  }
  show: el.config.ref.with(supplement: "")
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
  // 目录
  show outline.entry.where(level: 1): it => {
    set text(
      font: (
        "TeX Gyre Termes",
        "Source Han Serif"
      ),
      weight:"bold"
    )
    let loc = it.element.location()
    context {
      let is-app = appendix-part.at(loc)
      if is-app and it.element.numbering != none {
        let nums = counter(heading).at(loc)
        let prefix = [附录#numbering("I", nums.at(0)) #h(1em)]
        block(
          width: 100%,
          link(loc)[
            #prefix #it.element.body
            #box(width: 1fr, it.fill)
            #it.page()
          ]
        )
      } else {
        it
      }
    }
  }
  show outline.entry.where(level: 2): it => {
    set text(
      font: (
        (
          name: "TeX Gyre Termes",
          covers: regex("[.1234567890IV]")
        ),
        "Minecraft",
        "Unifont"
      )
    )
    let loc = it.element.location()
    context {
      let is-app = appendix-part.at(loc)
      if is-app and it.element.numbering != none {
        let nums = counter(heading).at(loc)
        let prefix = [#numbering("I.1", ..nums) #h(1em)]
        block(
          width: 100%,
          link(loc)[
            #h(2em)
            #prefix #it.element.body
            #box(width: 1fr, it.fill)
            #it.page() 
          ]
        )
      } else {
        it
      }
    }
  }
  show outline.entry.where(level: 3): it => {
    let loc = it.element.location()
    context {
      let is-app = appendix-part.at(loc)
      if is-app and it.element.numbering != none {
        let nums = counter(heading).at(loc)
        let prefix = [#numbering("I.1", ..nums) #h(1em)]
        block(
          width: 100%,
          link(loc)[
            #h(4em)
            #prefix #it.element.body
            #box(width: 1fr, it.fill)
            #it.page() 
          ]
        )
      } else {
        it
      }
    }
  }
  show outline.entry.where(level: 4): it => {}
  show outline.entry.where(level: 5): it => {}
  show outline.entry.where(level: 6): it => {}
  show outline.entry.where(level: 7): it => {}
  main-body
}