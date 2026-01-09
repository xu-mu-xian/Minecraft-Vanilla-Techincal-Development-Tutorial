#let stringtree(line_thickness: 0.5pt, line_color: black, ..items) = {
  set par(justify: true)
  let items = items.pos()
  let indent_half = 0.6em 
  let line_y_offset = 1em 
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
    rows: (line_y_offset, auto),
    ..items.enumerate().map(((i, item)) => {
      let (level, body) = item
      let row1 = range(level).map(l => {
        let is_current_level = (l == level - 1)
        let has_v_line = if is_current_level { true } else { needs_vertical_line(i, l + 1) }
        (
          grid.cell(
            stroke: (right: if not is_current_level and has_v_line { line_thickness + line_color } else { none }),
            v(line_y_offset)
          ),
          grid.cell(
            stroke: (
              left: if is_current_level { line_thickness + line_color } else { none },
              bottom: if is_current_level { line_thickness + line_color } else { none }
            ),
            v(line_y_offset)
          )
        )
      }).flatten()    
      let current_span = total_columns - (2 * level)
      row1.push(grid.cell(
        colspan: current_span,
        rowspan: 2, 
        inset: (left: 0.1em, y: 0.4em), 
        align(horizon, body)
      ))
      let row2 = range(level).map(l => {
        let is_current_level = (l == level - 1)
        let has_v_line_path = if l < level - 1 { needs_vertical_line(i, l + 1) } else { false }
        let has_v_line_current = if is_current_level { needs_vertical_line(i, l + 1) } else { false }
        (
          grid.cell(stroke: (right: if has_v_line_path { line_thickness + line_color } else { none }), []),
          grid.cell(stroke: (left: if has_v_line_current { line_thickness + line_color } else { none }), [])
        )
      }).flatten()
      (..row1, ..row2)
    }).flatten()
  )
}