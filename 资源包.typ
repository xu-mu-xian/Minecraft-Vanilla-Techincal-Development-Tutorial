// 封面
#[
  #set page(
    fill: rgb("#5f9122"),
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
        第#h(10pt)2#h(10pt)册
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
      资源包
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
#theme.update(dark_green)
#let theme_basic = dark_green
#counter(heading).update(8)

#outline(title:"目  录",indent: 2em)

#pagebreak()
#counter(page).update(1)
= 纹理和图集
纹理（Texture），即游戏资源的外观。资源包中的纹理文件几乎覆盖了游戏中所有可见资源的外观，包括但不限于方块、物品、实体、粒子效果、GUI、字体、图标，甚至天空的颜色、标题画面的背景、游戏logo也由纹理决定。
= 模型
= 字体
= 声音
= 着色器 \*