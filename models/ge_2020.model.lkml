connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"


datagroup: ge_2020_default_datagroup {
  sql_trigger: SELECT current_timestamp() ;;
  max_cache_age: "200 hour"
}

persist_with: ge_2020_default_datagroup

explore: fact_ndt {}

explore: ireland_general_election {
  query: constituency {
    dimensions: [ge_2020_ie_candidate_details.constituency]
    measures: [ge_2020_ie_candidate_details.first_count_quota_attainment]
  }
  # access_filter: {
  #   field: constituency_name
  #   user_attribute: constituency
  # }
  view_label: "Count"
  from: ge_2020_ie_count_details
  join: ge_2020_ie_constituency_details {
    view_label: "Constituency"
    sql_on: ${ireland_general_election.constituency_number} = ${ge_2020_ie_constituency_details.constituency_number};;
    relationship: many_to_one
  }
  join: ge_2020_ie_candidate_details {
    view_label: "Candidate"
    sql_on: ${ireland_general_election.candidate_id} = ${ge_2020_ie_candidate_details.candidate_id}
    and ${ireland_general_election.constituency_number} = ${ge_2020_ie_candidate_details.constituency_number};;
    relationship: many_to_one
  }
}
