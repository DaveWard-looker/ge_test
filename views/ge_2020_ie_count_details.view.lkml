view: ge_2020_ie_count_details {
  derived_table: {
    sql:
    SELECT
      Constituency_Name
      ,Candidate_surname
      ,Candidate_First_Name
      ,Result
      ,Count_Number
      ,Non_Transferable
      ,Occurred_On_Count
      ,Required_To_Reach_Quota
      ,Required_To_Save_Deposit
      ,Transfers
      ,Votes
      ,Total_Votes
      ,Constituency_Number
      ,Candidate_Id
  FROM `daveward-ps-dev.daveward_demodataset.GE_2020_IE_Count_Details`
  where Count_Number <= Occurred_On_Count OR Occurred_On_Count = 0
    ;;
  }


  dimension: candidate_first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Candidate_First_Name ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${candidate_id},'-',${constituency_number},'-',${count_number}) ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: candidate_surname {
    hidden: yes
    type: string
    sql: ${TABLE}.Candidate_surname ;;
  }

  dimension: constituency_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Constituency_Name ;;
  }

  dimension: constituency_number {
    hidden: yes
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: count_number {
    label: "count_number"
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: non_transferable {
    hidden: yes
    type: number
    sql: ${TABLE}.Non_Transferable ;;
  }

  dimension: count_result_reached_on {
    hidden: yes
    type: number
    sql: ${TABLE}.Occurred_On_Count ;;
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
    label: "result"
    type: string
    sql: ${TABLE}.Result ;;
  }

  dimension: votes_this_count {
    hidden: yes
    type: number
    sql: ${TABLE}.Total_Votes ;;
  }

  dimension: transfers {
    hidden: yes
    type: number
    sql: ${TABLE}.Transfers ;;
  }

  dimension: first_preference_vote {
    hidden: yes
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: total_first_preference_vote {
    label: "total_first_preference_vote"
    type: sum
    sql: ${first_preference_vote} ;;
    value_format_name: decimal_0
  }

  measure: total_votes_this_count {
    label: "total_votes_this_count"
    type: sum
    sql: ${votes_this_count}  ;;
  value_format_name: decimal_0
}

  measure: total_transfers {
    label: "total_transfers"
    type: sum
    sql: ${transfers} ;;
  value_format_name: decimal_0
}

  measure: total_required_to_save_deposit {
    label: "total_required_to_save_deposit"
    type: sum
    sql: ${required_to_save_deposit}  ;;
  value_format_name: decimal_0
}

  measure: total_required_to_reach_quota {
    label: "total_required_to_reach_quota"
    type: sum
    sql: ${required_to_reach_quota} ;;
  value_format_name: decimal_0
}

  measure: total_non_transferable {
    label: "total_non_transferable"
    type: sum
    sql: ${non_transferable} ;;
  value_format_name: decimal_0
}




  measure: count {
    type: count
    drill_fields: [constituency_name, candidate_surname, candidate_first_name]
  }
}
