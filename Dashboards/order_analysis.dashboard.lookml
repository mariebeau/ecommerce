- dashboard: order_analysis
  title: Order Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  query_timezone: query_saved
  elements:
  - name: Users by State
    title: Users by State
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_geo_choropleth
    fields: [users.state, users.count]
    sorts: [users.count desc]
    limit: 500
    query_timezone: Pacific/Honolulu
    map: usa
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors: ["#1A73E8"]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 41.69496238228255
    map_longitude: -102.28683471679689
    map_zoom: 3
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
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
    defaults_version: 1
    series_types: {}
    listen:
      Status: orders.status
      Age: users.age
    row: 0
    col: 0
    width: 12
    height: 6
  - title: Top Sales by Category
    name: Top Sales by Category
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_pie
    fields: [products.category, products.count]
    sorts: [products.count desc]
    limit: 5
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 70
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
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
    defaults_version: 1
    series_types: {}
    listen:
      Status: orders.status
      Age: users.age
    row: 0
    col: 12
    width: 12
    height: 6
  - name: Users Acquired over Time
    title: Users Acquired over Time
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [users.count, users.age_tier, users.created_month]
    pivots: [users.age_tier]
    fill_fields: [users.created_month]
    filters: {}
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
    listen:
      Status: orders.status
      Age: users.age
      Cohort: users.age_tier
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Sales Over Time
    name: Sales Over Time
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_line
    fields: [orders.created_month, orders.count, users.age_tier]
    pivots: [users.age_tier]
    fill_fields: [orders.created_month]
    filters:
      orders.created_month: 2019/01/01 to 2019/10/01
      users.age_tier: "-Below 0,-0 to 9,-10 to 19,-70 or Above,-Undefined"
    sorts: [orders.created_month desc, users.age_tier]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: pct_cohort_still_active, label: Pct Cohort
          Still Active, expression: "${users.count} / max(${users.count})", value_format: !!null '',
        value_format_name: percent_0, is_disabled: true, _kind_hint: measure, _type_hint: number}]
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 70
    defaults_version: 1
    hidden_fields: []
    listen:
      Status: orders.status
      Age: users.age
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Orders by Status
    name: Orders by Status
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [orders.status, orders.count]
    filters:
      inventory_items.created_week: 2019/06/01 to 2019/12/31
    sorts: [orders.count desc]
    limit: 500
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
    listen: {}
    row: 13
    col: 0
    width: 11
    height: 4
  - title: Orders by Month
    name: Orders by Month
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_grid
    fields: [orders.count, orders.created_month]
    fill_fields: [orders.created_month]
    filters:
      inventory_items.created_week: 2019/06/01 to 2019/12/31
    sorts: [orders.count desc]
    limit: 500
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
    listen: {}
    row: 17
    col: 0
    width: 11
    height: 6
  - title: Key Category Orders by Date
    name: Key Category Orders by Date
    model: mb_ecommerce_demo
    explore: order_items
    type: looker_column
    fields: [products.category, orders.count, orders.created_month]
    pivots: [products.category]
    fill_fields: [orders.created_month]
    filters:
      orders.created_month: 2019/05/01 to 2019/12/01
      orders.status: ''
      users.age: "[0, 100]"
      products.category: Accessories,Fashion Hoodies & Sweatshirts,Sweaters,Skirts,Swim,Tops
        & Tees
    sorts: [orders.created_month desc, products.category]
    column_limit: 50
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
    listen: {}
    row: 13
    col: 11
    width: 8
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mb_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: inventory_items.created_date
  - name: Status
    title: Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - cancelled
      - complete
      - pending
    model: mb_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: orders.status
  - name: Age
    title: Age
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: mb_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.age
  - name: Cohort
    title: Cohort
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: overflow
      options: []
    model: mb_ecommerce_demo
    explore: order_items
    listens_to_filters: []
    field: users.age_tier
