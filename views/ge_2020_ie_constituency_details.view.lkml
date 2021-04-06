view: ge_2020_ie_constituency_details {
  sql_table_name: `daveward_demodataset_dev.GE_2020_IE_Constituency_Details`
    ;;

  dimension: constituency_ainm {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency_Ainm ;;
  }

  dimension: constituency_name {
    label: "constituency_name"
    type: string
    sql: ${TABLE}.Constituency_Name ;;
  }

  dimension: constituency_number {
    label: "constituency_number"
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    label: "count_number"
    hidden: yes
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  # dimension_group: date_of_election {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.Date_Of_Election ;;
  # }

  dimension: number_of_candidates {
    label: "number_of_candidates"
    type: number
    sql: ${TABLE}.Number_Of_Candidates ;;
  }

  dimension: number_of_seats {
    label: "number_of_seats"
    type: number
    sql: ${TABLE}.Number_of_Seats ;;
  }

  dimension: quota {
    hidden: yes
    type: number
    sql: ${TABLE}.Quota ;;
  }

  dimension: required_save_deposit {
    hidden: yes
    type: number
    sql: ${TABLE}.Required_Save_Deposit ;;
  }

  dimension: seats_filled {
    type: number
    sql: ${TABLE}.Seats_Filled ;;
  }

  dimension: seats_in_constituency {
    type: number
    sql: ${TABLE}.SeatsinConstit ;;
  }

  dimension: spoiled {
    hidden: yes
    type: number
    sql: ${TABLE}.Spoiled ;;
  }

  dimension: electorate {
    hidden: yes
    type: number
    sql: ${TABLE}.Total_Electorate ;;
  }

  dimension: poll {
    hidden: yes
    type: number
    sql: ${TABLE}.Total_Poll ;;
  }

  dimension: valid_poll {
    hidden: yes
    type: number
    sql: ${TABLE}.Valid_Poll ;;
  }

  measure: count {
    type: count
    drill_fields: [constituency_name]
  }

  measure: total_quota {
    type: sum
    sql: ${quota} ;;
    value_format_name: decimal_0
  }

  measure: total_electorate {
    type: sum
    sql: ${electorate} ;;
    value_format_name: decimal_0
  }

  measure: total_poll {
    type: sum
    sql: ${poll} ;;
    value_format_name: decimal_0
  }

  measure: total_valid_poll {
    type: sum
    sql: ${valid_poll} ;;
    value_format_name: decimal_0
  }

  measure: total_spoiled_votes {
    type: sum
    sql: ${spoiled} ;;
    value_format_name: decimal_0
  }

  measure: turnout {
    type: number
    sql: 1.00*${total_poll}/nullif(${total_electorate},0) ;;
    value_format_name: percent_2
  }

  measure: candidates_per_seat_rate {
    type: sum
    sql: ${number_of_candidates}/${seats_in_constituency} ;;
    value_format_name: decimal_2
  }

  measure: seats_filled_this_count {
    type: max
    sql: ${seats_filled} ;;
    value_format_name: decimal_0
    }
}
