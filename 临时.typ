#import "模板.typ": *
#show: template-style
= a<subsec:tags_common_to_all_block_entities>
#heading(level: 4, numbering: none, [所有种类旗帜])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，该旗帜的自定义名称，需要为文本组件。]),
  (1, [#icon("nbt-list") *patterns*: 可选，按顺序使用的旗帜图案。列表中复合标签的次序越靠前，其对应的图案在旗帜上的层级就越往下。]),
  (2, [#icon("nbt-compound") 一个单独的旗帜图案。]),
  (3, [#icon("nbt-string") *#underline[color]*: 图案的颜色。有效值有 `black`（黑色）、`blue`（蓝色）、`brown`（棕色）、`cyan`（青色）、`gray`（灰色）、`green`（绿色）、`light_blue`（淡蓝色）、`light_gray`（淡灰色）、`lime`（黄绿色）、`magenta`（品红色）、`orange`（橙色）、`pink`（粉红色）、`purple`（紫色）、`red`（红色）、`white`（白色）、`yellow`（黄色）。]),
  (3, [#icon("nbt-string")#icon("nbt-compound") *#underline[pattern]*: 图案的类型，当使用 #icon("nbt-string") 字符串形式时，值为图案的命名空间ID。旗帜图案可由数据包自定义，在数据包内的相应文件为 #icon("json") `data > <命名空间> > banner_pattern > <ID>.json`。也可以以内联SNBT的形式直接在此处定义一个图案类型，此时使用 #icon("nbt-compound") 复合标签形式。]),
  (4, [*若使用 #icon("nbt-compound") 复合标签形式，则以下字段：*], false),
  (4, [#icon("nbt-string") *asset_id*: 资源包内旗帜图案纹理的命名空间ID，文件路径为 #icon("png") `assets > <命名空间> > textures > entity > banner > <路径>.png`。]),
  (4, [#icon("nbt-string") *translation_key*: 该旗帜图案的翻译标识符前缀，游戏解析时会加上 #icon("nbt-string") `color` 字段的值作为后缀。])
)
#heading(level: 4, numbering: none, [木桶、箱子、陷阱箱、发射器、投掷器、潜影盒])
#tree(
  (0, [#icon("nbt-compound") 根标签]),
  (1, link(<subsec:tags_common_to_all_block_entities>)[方块实体共通标签]),
  (1, [#icon("nbt-string")#icon("nbt-list")#icon("nbt-compound") *CustomName*: 可选，此容器的自定义名称，会出现在容器UI中，需要为文本组件。])
)