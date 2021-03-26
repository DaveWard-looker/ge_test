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
    type: number
    sql: ${TABLE}.Count_Number ;;
  }

  dimension: candidate_per_count {
    type: string
    sql: concat(${candidate_first_name},' ',${candidate_surname},' Count No: ',${count_number});;
  }

  dimension: count_status {
    type: string
    sql: concat(${candidate_first_name},' ',${candidate_surname},' - ',${result}) ;;
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
    type: string
    sql: case when ${TABLE}.Result is null then 'Running' else ${TABLE}.Result end  ;;
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
    type: sum
    sql: ${first_preference_vote} ;;
    value_format_name: decimal_0
  }

  measure: total_votes_this_count {
    type: sum
    sql: ${votes_this_count}  ;;
  value_format_name: decimal_0
}

  measure: total_transfers {
    type: sum
    sql: ${transfers} ;;
  value_format_name: decimal_0
}

  measure: total_required_to_save_deposit {
    type: sum
    sql: ${required_to_save_deposit}  ;;
  value_format_name: decimal_0
}

  measure: total_required_to_reach_quota {
    type: sum
    sql: ${required_to_reach_quota} ;;
  value_format_name: decimal_0
}

  measure: total_non_transferable {
    type: sum
    sql: ${non_transferable} ;;
  value_format_name: decimal_0
}

  measure: votes_count_1 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "1"]
  }
  measure: votes_count_2 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "2"]}
  measure: votes_count_3 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "3"]}
  measure: votes_count_4 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "4"]}
  measure: votes_count_5 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "5"]}
  measure: votes_count_6 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "6"]}
  measure: votes_count_7 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "7"]
    }
  measure: votes_count_8 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "8"]
  }
  measure: votes_count_9 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "9"]
  }
  measure: votes_count_10 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "10"]
  }
  measure: votes_count_11 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "11"]
  }
  measure: votes_count_12 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "12"]
    }
  measure: votes_count_13 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "13"]
    }
  measure: votes_count_14 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "14"]
    }
  measure: votes_count_15 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "15"]
    }
  measure: votes_count_16 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "16"]
    }
  measure: votes_count_17 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "17"]
    }
  measure: votes_count_18 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "18"]
    }
  measure: votes_count_19 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "19"]
    }
  measure: votes_count_20 {
    group_label: "Count Measures"
    type: sum
    sql: ${votes_this_count}  ;;
    filters: [count_number: "20"]
    }


  measure: count {
    type: count
    drill_fields: [constituency_name, candidate_surname, candidate_first_name]
  }
}
