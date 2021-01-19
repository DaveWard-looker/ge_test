view: ge_2020_ie_candidate_details {
  sql_table_name: `daveward_demodataset_dev.GE_2020_IE_Candidate_Details`
    ;;

  dimension: candidate_id {
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: constituency {
    type: string
    sql: ${TABLE}.Constituency ;;
  }

  dimension: constituency_ainm {
    type: string
    sql: ${TABLE}.Constituency_Ainm ;;
  }

  dimension: constituency_number {
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.Firstname ;;
  }

  dimension: gender_id {
    type: string
    sql: ${TABLE}.Gender_Id ;;
  }

  dimension: party_abbreviation {
    type: string
    sql: ${TABLE}.Party_Abbreviation ;;
  }

  dimension: party_id {
    type: string
    sql: ${TABLE}.Party_Id ;;
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

  dimension: surname {
    type: string
    sql: ${TABLE}.Surname ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: count {
    type: count
    drill_fields: [firstname, surname]
  }
}
