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

  dimension: party {
    type: string
    sql: ${TABLE}.Party_Id ;;
    html: <img src = "http://www.google.com/s2/favicons?domain={{party_url._value}}.ie" /> {{value}} ;;
    link: {
      label: "Link to Party Website"
      url: "http://www.google.ie/search?q={{value}}&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain={{party_url._value}}.ie"
    }
  }

  dimension: candidate {
    type: string
    sql: concat(${firstname},' ',${surname}) ;;
    link: {
      label: "Irish Times Articles on {{value}}"
      icon_url: "https://www.google.com/s2/favicons?domain=irishtimes.com"
      url: "https://www.irishtimes.com/search/search-7.4195619?q=%22{{value | url_encode}}%22"
    }
  }

  dimension: gender {
    label: "gender"
    type: string
    sql: ${TABLE}.Gender_Id ;;
  }

  dimension: party_abbreviation {
    label: "party_abbreviation"
    type: string
    sql: ${TABLE}.Party_Abbreviation ;;
  }

  dimension: party_url {
    hidden: yes
    type: string
    sql: replace(replace(replace(replace(replace(replace(replace(replace(replace(${party},'Green Party/ Comhaontas Glas','greenparty'),'The Labour Party','Labour'),'Solidarity - People Before Profit','pbp'),'Renua Ireland','Renua'),' ',''),'ú','u'),'á','a'),'í','i'),'é','e') ;;
  }



  dimension: required_to_reach_quota {
    label: "required_to_reach_quota"
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Reach_Quota ;;
  }

  dimension: required_to_save_deposit {
    label: "required_to_save_deposit"
    hidden: yes
    type: number
    sql: ${TABLE}.Required_To_Save_Deposit ;;
  }

  dimension: result {
    label: "result"
    type: string
    sql: ifnull(${TABLE}.Result,'Excluded') ;;
  }

  dimension: surname {
    hidden: yes
    type: string
    sql: ${TABLE}.Surname ;;
  }

  dimension: votes {
    hidden: yes
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: total_required_to_reach_total {
    label: "total_required_to_reach_total"
    type: sum
    value_format_name: decimal_0
    sql: ${required_to_reach_quota} ;;
  }

  measure: total_required_to_save_deposit {
    label: "total_required_to_save_deposit"
    type: sum
    value_format_name: decimal_0
    sql: ${required_to_save_deposit} ;;
  }

  measure: total_votes {
    label: "Total First Preference Vote"
    type: sum
    sql: ${votes} ;;
    value_format_name: decimal_0
    html: @{positive_format} ;;
  }


  measure: first_count_quota_attainment {
    label: "first_count_quota_attainment"
    type: number
    sql: 1.00*${total_votes}/nullif(${ge_2020_ie_constituency_details.total_quota},0) ;;
    value_format_name: percent_2
  }

  measure: share_of_electorate {
    label: "share_of_electorate"
    type: number
    sql: ${total_votes}/${ge_2020_ie_constituency_details.total_electorate} ;;
    value_format_name: percent_2
  }

  measure: share_of_poll {
    label: "share_of_poll"
    type: number
    sql: ${total_votes}/${ge_2020_ie_constituency_details.total_poll} ;;
    value_format_name: percent_2
  }

  measure: count_of_candidates {
    label: "count_of_candidates"
    type: count_distinct
    sql: ${primary_key} ;;
    value_format_name: decimal_0
    drill_fields: [candidate,constituency,result,total_votes]
  }

  measure: consituencies_contested {
    label: "consituencies_contested"
    type: count_distinct
    sql: ${constituency} ;;
    value_format_name: decimal_0
  }

}
