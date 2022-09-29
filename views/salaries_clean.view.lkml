view: salaries_clean {
  sql_table_name: [conferencias-363803:DWH.salaries_clean]
    ;;

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

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: remote_ratio {
    type: string
    sql: ${TABLE}.remote_ratio ;;
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
    drill_fields: [company_size,work_year,employee_residence,experience_level,job_title,remote_ratio,salary_in_usd]
  }

  measure: salary_sum {
    label: "Sum of Salary"
    type: sum
    sql: ${salary_in_usd} ;;
    value_format:"$#,##0.00"
  }

  measure: salary_max {
    label: "Maximum Salary"
    type: max
    sql: ${salary_in_usd} ;;
    value_format:"$#,##0.00"
  }

  measure: salary_min {
    label: "Minimum Salary"
    type: min
    sql: ${salary_in_usd} ;;
    value_format:"$#,##0.00"
  }

  measure: salary_avg {
    label: "Average Salary"
    type: average
    sql: ${salary_in_usd} ;;
    value_format:"$#,##0.00"
  }

  measure: distinct_job_title {
    label: "Count Job Titles"
    type: count_distinct
    sql: ${job_title} ;;
    value_format:"0"
    drill_fields: [job_title,count]
  }

  measure: distinct_countries {
    label: "Count Residence Countries"
    type: count_distinct
    sql: ${employee_residence} ;;
    value_format:"0"
    drill_fields: [employee_residence,count]
  }
}
