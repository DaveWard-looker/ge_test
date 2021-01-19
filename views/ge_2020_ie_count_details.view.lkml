view: ge_2020_ie_count_details {
  sql_table_name: `daveward_demodataset_dev.GE_2020_IE_Count_Details`
    ;;

  dimension: candidate_first_name {
    type: string
    sql: ${TABLE}.Candidate_First_Name ;;
  }

  dimension: candidate_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: candidate_surname {
    type: string
    sql: ${TABLE}.Candidate_surname ;;
  }

  dimension: constituency_name {
    type: string
    sql: ${TABLE}.Constituency_Name ;;
  }

  dimension: constituency_number {
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: non_transferable {
    type: number
    sql: ${TABLE}.Non_Transferable ;;
  }

  dimension: occurred_on_count {
    type: number
    sql: ${TABLE}.Occurred_On_Count ;;
  }

  dimension: required_to_reach_quota {
    type: number
    sql: ${TABLE}.Required_To_Reach_Quota ;;
  }

  dimension: required_to_save_deposit {
    type: number
    sql: ${TABLE}.Required_To_Save_Deposit ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.Result ;;
  }

  dimension: total_votes {
    type: number
    sql: ${TABLE}.Total_Votes ;;
  }

  dimension: transfers {
    type: number
    sql: ${TABLE}.Transfers ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: count {
    type: count
    drill_fields: [constituency_name, candidate_surname, candidate_first_name]
  }
}
