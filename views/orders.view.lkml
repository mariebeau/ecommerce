view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    label: "Order ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${created_date}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${created_month}
    {% else %}
      ${created_date}
    {% endif %};;
    html:
    {% if date_granularity._parameter_value == 'day' %}
      <font color="darkgreen">{{ rendered_value }}</font>
   {% elsif date_granularity._parameter_value == 'month' %}
      <font color="darkred">{{ rendered_value }}</font>
    {% else %}
      <font color="black">{{ rendered_value }}</font>
    {% endif %};;
  }
  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.id, order_items.count, products.category]
  }

  measure: count_without_liquid {
    type: count
    hidden: yes
  }

  measure: count_with_liquid {
    type: count
    hidden: yes
    link: {
      label: "Status Count"
      url: "https://www.google.com/search?q={{ status._value }}"
    }
  }
}
