view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    label: "Customer ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    value_format_name: decimal_0
  }

  dimension: age_tier {
    type: tier
    label: "Age Tier (Integer)"
    group_label: "Age tiers"
    tiers: [0, 10, 20, 30, 40, 50, 60, 70]
    style: integer
    sql: ${age} ;;
  }

  dimension: age_tier_r {
    type: tier
    label: "Age Tier (Relational)"
    group_label: "Age tiers"
    tiers: [0, 10, 20, 30, 40, 50, 60, 70]
    style: relational
    value_format_name: decimal_0
    sql: ${age} ;;
  }

  dimension: age_tier_i {
    type: tier
    label: "Age Tier (Interval)"
    group_label: "Age tiers"
    tiers: [0, 10, 20, 30, 40, 50, 60, 70]
    style: interval
    value_format_name: decimal_0
    sql: ${age} ;;
  }


  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    #drill_fields: [city, count]
    #link: {
      #label: "Top 10 cities as column chart"
      #url: "
      #{% assign vis_config = '{
      #\"type\": \"looker_column\",
      #\"colors\": [\"#1A73E8\"]
      #}' %}
      #{{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=10"
    #}
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      saralooker.count,
      user_data.count
    ]
  }
}
