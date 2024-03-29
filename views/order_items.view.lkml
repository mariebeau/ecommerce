view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    label: "Order Item ID"
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  parameter: date_selector {
    type: date_time
    description: "Use this field to select a date to filter results by."
  }

  measure: count {
    type: count
    label: "Items Count"
    drill_fields: [id, orders.id, inventory_items.id]
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: cumulative_total_revenue {
    type: running_total
    sql: ${total_sale_price} ;;
    value_format_name: usd
  }

  measure: total_gross_margin {
  hidden: yes
  type: number
  # this isn't actually gross margin, but we'll pretend it is for the screenshot.
  sql:  ${total_sale_price} ;;
  value_format_name: usd
  }

  measure: percent_of_total_gross_margin {
    hidden: yes
    type: percent_of_total
    sql: ${total_gross_margin} ;;
  }
}
