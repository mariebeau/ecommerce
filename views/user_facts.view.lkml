
view: user_facts {
    derived_table: {
      explore_source: order_items {
        column: count { field: orders.count }
        column: id { field: users.id }
      }
    }
    dimension: count {
      description: ""
      type: number
    }
    dimension: id {
      label: "Users Customer ID"
      description: ""
      value_format: "0"
      type: number
    }
}
