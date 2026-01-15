#let stringtree(line_thickness: 0.5pt, line_color: black, ..items) = {
  set par(justify: true)
  let items = items.pos()
  let indent_half = 0.6em 
  let line_y_offset = 0.9em 
  let needs_vertical_line(i, l) = {
    for j in range(i + 1, items.len()) {
      let next-level = items.at(j).at(0)
      if next-level == l { return true }
      if next-level < l { return false }
    }
    false
  }
  let max_level = items.map(it => it.at(0)).fold(0, (a, b) => calc.max(a, b))
  let total_columns = 2 * max_level + 1
  grid(
    columns: (..range(max_level).map(_ => (indent_half, indent_half)).flatten(), 1fr),
    ..items.enumerate().map(((i, item)) => {
      let level = item.at(0)
      let body = item.at(1)
      let show_line = item.at(2, default: true)
      let row1_lines = range(level).map(l => {
        let is_current_level = (l == level - 1)
        let has_v_line = if is_current_level { true } else { needs_vertical_line(i, l + 1) }
        (
          grid.cell(
            stroke: (
              right: if not is_current_level and has_v_line { line_thickness + line_color } else { none }
              ),
            v(line_y_offset)
          ),
          grid.cell(
            stroke: (
              left: if is_current_level { line_thickness + line_color } else { none },
              bottom: if is_current_level and show_line { line_thickness + line_color } else { none }
            ),
            v(line_y_offset)
          )
        )
      }).flatten()
      let row2_lines = range(level).map(l => {
        let is_current_level = (l == level - 1)
        let has_v_line_path = if l < level - 1 { needs_vertical_line(i, l + 1) } else { false }
        let has_v_line_current = if is_current_level { needs_vertical_line(i, l + 1) } else { false }
        (
          grid.cell(stroke: (right: if has_v_line_path { line_thickness + line_color } else { none }), []),
          grid.cell(stroke: (left: if has_v_line_current { line_thickness + line_color } else { none }), [])
        )
      }).flatten()
      grid.cell(
        colspan: total_columns,
        block(breakable: false, width: 100%)[
          #grid(
            columns: (..range(max_level).map(_ => (indent_half, indent_half)).flatten(), 1fr),
            stroke: none,
            row-gutter: 0pt, 
            ..row1_lines,
            grid.cell(
              colspan: total_columns - (2 * level),
              rowspan: 2,
              inset: (left: 0.1em, y: 0.35em), 
              align(horizon, body)
            ),
            ..row2_lines
          )
        ]
      )
    }).flatten()
  )
}