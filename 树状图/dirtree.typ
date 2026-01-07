#let dirtree(items) = {
  let indent-step = 1.2em
  let line-thickness = 1pt
  let line-color = black
  let horizontal-len = 0.8em
  let item-height = 1.5em
  // 判断逻辑：当前行 i 之后，层级 l 是否还需要继续画竖线
  let needs-vertical-line(i, l) = {
    for j in range(i + 1, items.len()) {
      let next-level = items.at(j).at(0)
      if next-level == l { return true }
      if next-level < l { return false }
    }
    false
  }
  grid(
    columns: (auto,),
    gutter: 0pt,
    stroke: 0.5pt + red,
    ..items.enumerate().map(((i, item)) => {
      let (level, body) = item
      let prefix = stack(dir: ltr,
        ..range(level).map(l => {
          let is-current-level = (l == level - 1)
          box(width: indent-step, height: item-height, {
            // 1. 绘制“经过”当前格子的竖线（属于更深层级的兄弟节点连线）
            if not is-current-level and needs-vertical-line(i, l + 1) {
              line(angle: 90deg, length: 100%, start: (50%, 0%), stroke: line-thickness + line-color)
            }
            // 2. 绘制当前层级的 L/T 型连线
            if is-current-level {
              let has-sibling-below = needs-vertical-line(i, l + 1)
              // 竖线部分：始终有上半部分，如果有下方兄弟则有下半部分
              let v-end = if has-sibling-below { 100% } else { 50% }
              line(angle: 90deg, length: v-end, start: (50%, 0pt), stroke: line-thickness + line-color)              
              // 横线部分
              place(center + horizon, line(start: (50%, 0pt), end: (100%, 0pt), stroke: line-thickness + line-color))
            }
          })
        })
      )
      // 组装行：使用 horizon 代替 middle
      stack(dir: ltr, spacing: 0.4em,
        prefix,
        align(horizon, body)
      )
    })
  )
}
// 使用示例
#dirtree((
  (0, [Root Project]),
  (1, [src]),
  (2, [main.rs]),
  (2, [utils.rs]),
  (1, [tests]),
  (2, [integration.rs]),
  (2, [Cargo.toml]),
  (3, [多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字]),
  (2, [utils.rs]),
  (1, [utils.rs])
))

#grid(
  columns: auto,
  inset: 0.5em,
  stroke: 0.5pt + red,
  [多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字多行字], [aaaaaaaaa]
)