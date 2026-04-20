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

// 颜色
#let dark_blue = rgb("0000aa")
#let dark_green = rgb("00aa00")
#let dark_aqua = rgb("00aaaa")
#let dark_red = rgb("aa0000")
#let dark_purple = rgb("aa00aa")
#let gold = rgb("ffaa00")
#let gray = rgb("aaaaaa")
#let dark_gray = rgb("555555")
#let blue = rgb("5555ff")
#let green = rgb("55ff55")
#let aqua = rgb("55ffff")
#let red = rgb("ff5555")
#let light_purple = rgb("ff55ff")
#let yellow = rgb("ffff55")

// 主题色
#let theme = state("theme_basic", gray)

// 颜色块
#let color_block(color, stroke: 0.5pt + black) = box(
  fill: color,
  height: 0.8em,
  radius: 0.2em,
  stroke: stroke,
  width: 0.8em
)

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
  context {
    set align(left)
    set par(justify: false)
    block(
      clip: true,
      fill: white,
      height: auto,
      stroke: 1pt + theme.get(),
      radius: 6pt,
      width: 100%,
      context grid(
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
          fill: theme.get().lighten(20%),
          inset: 8pt,
          {
            set text(
              fill: white,
              font: "Consolas",
              size: 0.85em,
              weight: "bold"
            )
            context counter(figure.where(kind: "codebox")).display()
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
  even_color: none,
  gutter: 0.2em,
  header: (),
  header_color: none,
  odd_color: none,
  row-gutter: 0.2em,
  seperator: (),
  ..content,
) = {
  figure(
    caption: caption,
    numbering: tab_numbering,
    kind: table,
    context {
      let header_color_ = {
        if header_color == none { theme.get().lighten(20%) }
        else { header_color }
      }
      let odd_color_ = {
        if odd_color == none { theme.get().lighten(96%) }
        else { odd_color }
      }
      let even_color_ = {
        if even_color == none { theme.get().lighten(90%) }
        else { even_color }
      }
      table(
        align: center + horizon,
        columns: columns,
        fill: (x, y) => {
          if y == 0 { rgb("#ffffff00") }
          else if y == 1 { header_color_ }
          else if calc.rem(y, 2) == 1 { even_color_ }
          else { odd_color_ }
        },
        gutter: gutter,
        row-gutter: row-gutter,
        stroke: none,
        table.header(
          table.cell(
            colspan: colspan,
            {
              context if xubiao.get() {
                align(right)[
                  #set text(
                    font: "Source Han Sans SC",
                    weight: "bold"
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
    }
  )
}
#let split-table(
  caption: [分栏表格标题],
  label: none,
  original-cols: 3,
  gutter-width: 0.5em,
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
  let half-idx = calc.ceil(data.len() / (col-count * 2))
  let left-part = data.slice(0, half-idx * col-count)
  let right-part = data.slice(half-idx * col-count)
  if right-part.len() < left-part.len() {
    right-part += ([],) * (left-part.len() - right-part.len())
  }
  let combined-content = ()
  for i in range(half-idx) {
    combined-content += left-part.slice(i * col-count, (i + 1) * col-count)
    combined-content += right-part.slice(i * col-count, (i + 1) * col-count)
  }
  let total-cols = col-widths + col-widths
  let inner-gutters = (0.2em,) * (col-count - 1) 
  let gutters = inner-gutters + (gutter-width,) + inner-gutters
  general-table(
    caption: caption,
    columns: total-cols,
    colspan: col-count * 2, 
    header: header + header,
    gutter: gutters,
    ..combined-content
  )
}
#let triple-split-table(
  caption: [三栏表格标题],
  original-cols: 2,
  gutter-width: 0.5em,
  seperator: (),
  header: (),
  data: (),
) = {
  let col-widths = if type(original-cols) == array { original-cols } else { (1fr,) * original-cols }
  let col-count = col-widths.len()
  let total-items = data.len()
  let rows-per-part = calc.ceil(total-items / (col-count * 3))
  let items-per-part = rows-per-part * col-count
  let combined-content = ()
  for i in range(rows-per-part) {
    let idx-l = i * col-count
    let idx-m = idx-l + items-per-part
    let idx-r = idx-m + items-per-part
    combined-content += data.slice(idx-l, calc.min(idx-l + col-count, data.len()))
    if idx-m < data.len() {
      combined-content += data.slice(idx-m, calc.min(idx-m + col-count, data.len()))
    } else {
      combined-content += ([],) * col-count
    }
    if idx-r < data.len() {
      combined-content += data.slice(idx-r, calc.min(idx-r + col-count, data.len()))
    } else {
      combined-content += ([],) * col-count
    }
  }
  let inner-gutter = (0.2em,) * (col-count - 1)
  let full-gutter = inner-gutter + (gutter-width,) + inner-gutter + (gutter-width,) + inner-gutter
  let triple-columns = col-widths * 3
  let triple-header = header * 3
  let total-span = col-count * 3
  general-table(
    caption: caption,
    columns: triple-columns,
    colspan: total-span,
    gutter: full-gutter,
    header: triple-header,
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
        context showybox(
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
                fill: theme.get().lighten(70%),
                inset: (
                  x: 0.5em,
                  y: 0.5em
                ),
                radius: 1em,
                [解]
              )
              #h(-2.4em)
              #context box(
                baseline: -2pt,
                fill: theme.get().saturate(100%).darken(10%),
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
            body-color: theme.get().lighten(70%),
            border-color: theme.get().saturate(100%).darken(10%),
            footer-color: white,
            title-color: theme.get().saturate(100%).darken(10%),
            title-inset: (x: 0.6em, y: 0.5em)
          ),
          shadow: (
            color: theme.get().lighten(20%),
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
                    [例] + context context counter(figure.where(kind: "example")).display()
                  }
                  place(dx: 2pt, dy: 2pt)[
                    #box(
                      fill: theme.get().lighten(20%),
                      inset: (x: 0.6em, y: 0.5em),
                      radius: 5pt,
                      hide(title-text)
                    )
                  ]
                  h(-2em)
                  box(
                    fill: theme.get().saturate(100%).darken(10%),
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
        return box(inset: 0pt, width: 1.7em, text(weight: "regular", numbering("1．", nums.at(4))))
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
#let continue-h5(title) = context {
  set text(fill: theme.get().saturate(100%).darken(10%), weight: "bold", font: "Source Han Sans SC", size: 1.1em)
  fake_h4.step()
  block(v(0.6em) + h(-2em) + context fake_h4.display("一、 ") + title + v(0.6em))
}

// 提示
#let tips(width: 100%, content) = context {
  h(0.5em)
  block(
    width: width,
    showybox(
      breakable: true,
      frame: (
        body-color: theme.get().lighten(70%),
        border-color: theme.get().saturate(100%).darken(10%),
        title-color: theme.get().saturate(100%).darken(10%),
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
                    fill: theme.get().lighten(20%),
                    inset: (x: 0.6em, y: 0.5em),
                    radius: 5pt,
                    hide(title-text)
                  )
                ]
                h(-2em)
                box(
                  fill: theme.get().saturate(100%).darken(10%),
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
#let icon(name) = {
  let icon_map = (
    "folder": box(image("图标/data/文件夹.png", height:1em), baseline: 0pt, height:0.85em),
    "file": box(image("图标/data/文件.png", height:1em), baseline: 0pt, height:0.85em),
    "text": box(image("图标/data/文本文件.png", height:1em), baseline: 0pt, height:0.85em),
    "png": box(image("图标/data/图片文件.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt": box(image("图标/data/NBT文件.png", height:1em), baseline: 0pt, height:0.85em),
    "json": box(image("图标/data/JSON文件.png", height:1em), baseline: 0pt, height:0.85em),
    "mcfunction": box(image("图标/data/函数文件.png", height:1em), baseline: 0pt, height:0.85em),
    "ogg": box(image("图标/data/声音文件.png", height:1em), baseline: 0pt, height:0.85em),
    "zip": box(image("图标/data/压缩文件.png", height:1em), baseline: 0pt, height:0.85em),
    "jar": box(image("图标/data/JAR文件.png", height:1em), baseline: 0pt, height:0.85em),
    "json-string": box(image("图标/data/JSON字符串.png", height:1em), baseline: 0pt, height:0.85em),
    "json-bool": box(image("图标/data/JSON布尔值.png", height:1em), baseline: 0pt, height:0.85em),
    "json-number": box(image("图标/data/JSON数值.png", height:1em), baseline: 0pt, height:0.85em),
    "json-array": box(image("图标/data/JSON数组.png", height:1em), baseline: 0pt, height:0.85em),
    "json-object": box(image("图标/data/JSON对象.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-byte": box(image("图标/data/字节型.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-bool": box(image("图标/data/布尔值.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-short": box(image("图标/data/短整型.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-int": box(image("图标/data/整型.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-long": box(image("图标/data/长整型.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-float": box(image("图标/data/单精度浮点数.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-double": box(image("图标/data/双精度浮点数.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-string": box(image("图标/data/字符串.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-byte_array": box(image("图标/data/字节型数组.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-int_array": box(image("图标/data/整型数组.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-long_array": box(image("图标/data/长整型数组.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-list": box(image("图标/data/列表.png", height:1em), baseline: 0pt, height:0.85em),
    "nbt-compound": box(image("图标/data/复合标签.png", height:1em), baseline: 0pt, height:0.85em),
    "vscode": box(image("图标/VSCode.png", height:1em), baseline: 0pt, height:0.85em),
    "dhp": box(image("图标/DHP.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio": box(image("图标/NBTStudio.png", height:1em), baseline: 0pt, height:0.85em),
    "paint": box(image("图标/画图.png", height:1em), baseline: 0pt, height:0.85em),
    "ps": box(image("图标/PS.png", height:1em), baseline: 0pt, height:0.85em),
    "gimp": box(image("图标/GIMP.png", height:1em), baseline: 0pt, height:0.85em),
    "mine_stone": box(image("图标/advancement/石器时代.png", height:auto), baseline: 1em, height:3em),
    "obtain_armor": box(image("图标/advancement/整装上阵.png", height:auto), baseline: 1em, height:3em),
    "smelt_iron": box(image("图标/advancement/来硬的.png", height:auto), baseline: 1em, height:3em),
    "sprite-activator_rail": box(image("图标/sprite/activator_rail.png", height:auto), baseline: 1em, height:3em),
    "sprite-apple": box(image("图标/sprite/apple.png", height:auto), baseline: 1em, height:3em),
    "sprite-barrier": box(image("图标/sprite/barrier.png", height:auto), baseline: 1em, height:3em),
    "sprite-detector_rail": box(image("图标/sprite/detector_rail.png", height:auto), baseline: 1em, height:3em),
    "sprite-heart_full": box(image("图标/sprite/full.png", height:auto), baseline: 0.2em, height:1em),
    "sprite-heart_half": box(image("图标/sprite/half.png", height:auto), baseline: 0.2em, height:1em),
    "sprite-light_15": box(image("图标/sprite/light_15.png", height:auto), baseline: 1em, height:3em),
    "sprite-Mu_xian": box(image("图标/sprite/Mu_xian.png", height:auto), baseline: 0.2em, height:1em),
    "sprite-structure_void": box(image("图标/sprite/structure_void.png", height:auto), baseline: 1em, height:3em),
    "nbtstudio-add_snbt": box(image("图标/NbtStudio/action_add_snbt.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-copy": box(image("图标/NbtStudio/action_copy.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-cut": box(image("图标/NbtStudio/action_cut.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-delete": box(image("图标/NbtStudio/action_delete.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-edit_snbt": box(image("图标/NbtStudio/action_edit_snbt.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-edit": box(image("图标/NbtStudio/action_edit.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-new_file": box(image("图标/NbtStudio/action_new_file.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-open_file": box(image("图标/NbtStudio/action_open_file.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-open_folder": box(image("图标/NbtStudio/action_open_folder.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-paste": box(image("图标/NbtStudio/action_paste.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-refresh": box(image("图标/NbtStudio/action_refresh.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-rename": box(image("图标/NbtStudio/action_rename.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-save": box(image("图标/NbtStudio/action_save.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-search": box(image("图标/NbtStudio/action_search.png", height:1em), baseline: 0pt, height:0.85em),
    "nbtstudio-sort": box(image("图标/NbtStudio/action_sort.png", height:1em), baseline: 0pt, height:0.85em)
  )
  if name in icon_map {
    icon_map.at(name)
  }
}

// 文件
#let codefile(title: "", body, lang: "file") = context {
  codly(
    display-name: false,
    fill: theme.get().lighten(96%),
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
      fill: theme.get().lighten(20%)
    ),
    languages: (
      json: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon("json")#h(0.5em)
        ],
        name: "json"
      ),
      mcfunction: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon("mcfunction")#h(0.5em)
        ],
        name: "mcfunction"
      ),
      txt: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon("text")#h(0.5em)
        ],
        name: "txt"
      ),
      file: (
        color: rgb("#00000000"),
        icon: [
          #set text(size: 1.2em)
          #icon("file")#h(0.5em)
        ],
        name: "file"
      )
    ),
    number-format: n => text(fill: theme.get(), weight: "bold")[#h(0.5em)#n#h(0.5em)],
    radius: 5pt,
    stroke: 1pt + theme.get().saturate(100%).darken(10%),
    zebra-fill: theme.get().lighten(90%)
  )
  show raw: set text(font: ("Consolas", "Source Han Serif"))
  raw(body, block: true, lang: lang)
}

// 树状图
#let tree(..items) = context stringtree(line_color: theme.get(), ..items)

// 填空空格
#let blank = underline("                ")

// 专有名词
#let proper-noun(display: "", value) = {
  let actual-display = if display == "" { value } else { display }
  [*#actual-display*#index(display: actual-display, value)]
}

// 文字阴影
#let shadowed_text(content, shadow-offset: (0.1em, 0.1em), shadow-color: rgb("3F3F3F")) = box(
  stack(
    dir: ltr,
    spacing: 0pt,
    place(
      dx: shadow-offset.at(0),
      dy: shadow-offset.at(1),
      {
        show text: set text(fill: rgb(shadow-color))
        content
      },
    ),
    text[#content],
  ),
)

// 文本组件
#let text_component(background: none, baseline: 25%, content, font: ("Minecraft", "Unifont"), shadow-offset: (0.1em, 0.1em), shadow-color: rgb("3F3F3F")) = [
  #context {
    let theme = theme.get()
    let default_background = if background == none { theme.lighten(70%) } else { background }
    show regex("[\u4E00-\u9FFF]"): it => text(
      font: "Unifont",
      size: 0.8em,
      it
    )
    text(
      fill: white,
      font: font,
      box(
        baseline: baseline,
        fill: default_background,
        inset: 0.5em,
        radius: 4pt,
        stroke: 1pt + theme,
        box(
          stack(
            dir: ltr,
            spacing: 0pt,
            place(
              dx: shadow-offset.at(0),
              dy: shadow-offset.at(1),
              {
                show text: set text(fill: rgb(shadow-color))
                set par(leading: 0.5em, spacing: 0.5em)
                content
              },
            ),
            text[
              #set par(leading: 0.5em, spacing: 0.5em)
              #content
            ],
          ),
        )
      )
    )
  }
]

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
      fill: theme.get(),
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
      let formats = ("1．", "(1)", "①", "A．", "a．")
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
        fill: theme.get().lighten(85%),
        stroke: 0.5pt + theme.get(),
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
  set math.mat(column-gap: 0.8em, delim: "[", row-gap: 0.6em)
  set math.cases(gap: 0.6em)
  // caption
  show figure.caption: it => {
    if repr(it.body) == "[]" {
      it.supplement
      it.counter.display(it.numbering)
    } else {
      it
    }
  }
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
  show figure.where(kind: table): set figure.caption(position: top)
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
    set text(fill: theme.get().saturate(100%).darken(10%), font: ("Minecraft", "Unifont"), size: 1.8em)
    block(v(1em) + it + v(1em))
  }
  show heading.where(level: 3): it => {
    set align(left)
    set text(fill: theme.get().saturate(100%).darken(10%), size: 1.4em)
    block(v(0.2em) + it + v(0.6em))
  }
  show heading.where(level: 4): it => {
    set align(left)
    set text(fill: theme.get().saturate(100%).darken(10%), font: "Source Han Sans SC", size: 1.1em)
    block(v(0.2em) + it + v(0.6em))
  }
  show heading.where(level: 5): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(sticky: false, v(-0.6em) + it + v(0.1em))
  }
  show heading.where(level: 6): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(sticky: false, v(-0.6em) + it)
  }
  show heading.where(level: 7): it => {
    set align(left)
    set text(font: ((name: "Source Han Serif", covers: regex("[·“”‘’…|/\[\]\{\}<>—]")), "TeX Gyre Termes", "Source Han Serif"), weight: "regular")
    block(sticky: false, v(-0.6em) + it)
  }
  // 引用
  show: el.config.ref.with(supplement: "")
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
    } else if it.element.func() == math.equation {
      context {
        link(it.element.location())[#if appendix-part.at(it.element.location()) {[#it.element.supplement (#numbering("I", counter(heading).at(it.element.location()).at(0)).#str(counter(math.equation).at(it.element.location()).at(0))) ]} else {[#it.element.supplement (#str(counter(heading).at(it.element.location()).at(0)).#str(counter(math.equation).at(it.element.location()).at(0))) ]}]
      }
    } else if it.element.func() == text {
      show regex("^\d+\."): m => m.text.slice(0, -1)
      it
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