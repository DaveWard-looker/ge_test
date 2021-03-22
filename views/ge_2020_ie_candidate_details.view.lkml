view: ge_2020_ie_candidate_details {
  sql_table_name: `daveward_demodataset_dev.GE_2020_IE_Candidate_Details`
    ;;

  dimension: candidate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: concat(${candidate_id},'-',${constituency_number}) ;;
  }

  dimension: constituency {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency ;;
  }

  dimension: constituency_ainm {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency_Ainm ;;
  }

  dimension: constituency_number {
    hidden: yes
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    hidden: yes
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: firstname {
    hidden: yes
    type: string
    sql: ${TABLE}.Firstname ;;
  }

  dimension: candidate {
    type: string
    sql: concat(${firstname},' ',${surname}) ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Reach_Quota ;;
  }

  dimension: required_to_save_deposit {
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Save_Deposit ;;
  }

  dimension: result {
    hidden: yes
    type: string
    sql: ${TABLE}.Result ;;
  }

  dimension: surname {
    hidden: yes
    type: string
    sql: ${TABLE}.Surname ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: total_required_to_reach_total {
    type: sum
    value_format_name: decimal_0
    sql: ${required_to_reach_quota} ;;
  }

  measure: total_required_to_save_deposit {
    type: sum
    value_format_name: decimal_0
    sql: ${required_to_save_deposit} ;;
  }

  measure: total_votes {
    type: sum
    sql: ${votes} ;;
    value_format_name: decimal_0
  }
}
