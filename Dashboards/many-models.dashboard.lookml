- dashboard: many_models
  title: Many Models
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: tC94T80lBi7umv68KmXBoA
  elements:
  - title: Table
    name: Table
    model: e_faa
    explore: flights
    type: table
    fields: [flights.air_carrier, flights.aircraft_category, flights.count]
    sorts: [flights.count desc]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
  - title: 10 Rows set in Vis editor
    name: 10 Rows set in Vis editor
    model: e_faa
    explore: flights
    type: table
    fields: [flights.air_carrier, flights.aircraft_category, flights.count]
    sorts: [flights.count desc]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    defaults_version: 1
    row: 0
    col: 8
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: e_faa
    explore: flights
    type: looker_line
    fields: [flights.air_carrier, flights.aircraft_category, flights.count]
    sorts: [flights.count desc]
    limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: thelook model
    name: thelook model
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [products.category, order_items.count]
    filters:
      order_items.status: Complete
      user_order_facts.repeat_customer: 'Yes'
      users.state: California
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      order_items.count:
        is_active: false
        palette:
          palette_id: new-visualization-colors-diverging-0
          collection_id: new-visualization-colors
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: new-visualization-colors,
          palette_id: new-visualization-colors-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: [order_items.count]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 6
    col: 0
    width: 8
    height: 6
  - name: Users Acquired over Time
    title: Users Acquired over Time
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [users.count, users.age_tier, users.created_month]
    pivots: [users.age_tier]
    fill_fields: [users.created_month]
    filters:
      users.age_tier: 20 to 29,30 to 39,40 to 49,50 to 59,60 to 69
    sorts: [users.age_tier, users.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: Pacific/Honolulu
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_types: {}
    value_labels: legend
    label_type: labPer
    inner_radius: 70
    defaults_version: 1
    row: 6
    col: 8
    width: 8
    height: 6
  - title: r_commerce tile
    name: r_commerce tile
    model: r_commerce
    explore: order_items
    type: looker_grid
    fields: [products.count, products.category, users.state]
    pivots: [products.category]
    filters:
      products.category: Active
    sorts: [products.count desc 0, products.category]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    x_axis_label: Product Category
    hide_legend: false
    series_colors: {}
    defaults_version: 1
    series_types: {}
    listen: {}
    row:
    col:
    width:
    height:
