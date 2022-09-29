# The name of this view in Looker is "Salaries Raw"
view: salaries_raw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: [DWH.salaries_raw]
    ;;
  drill_fields: [int64_field_0]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: int64_field_0 {
    primary_key: yes
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Company Location" in Explore.

  dimension: company_location {
    type: string
    sql: ${TABLE}.company_location ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}.company_size ;;
  }

  dimension: employee_residence {
    type: string
    sql: ${TABLE}.employee_residence ;;
  }

  dimension: employment_type {
    type: string
    sql: ${TABLE}.employment_type ;;
  }

  dimension: experience_level {
    type: string
    sql: ${TABLE}.experience_level ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: remote_ratio {
    type: number
    sql: ${TABLE}.remote_ratio ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}.salary ;;
  }

  dimension: salary_currency {
    type: string
    sql: ${TABLE}.salary_currency ;;
  }

  dimension: salary_in_usd {
    type: number
    sql: ${TABLE}.salary_in_usd ;;
  }

  dimension: work_year {
    type: number
    sql: ${TABLE}.work_year ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [int64_field_0]
  }
}
