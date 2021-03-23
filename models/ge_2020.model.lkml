connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"

datagroup: ge_2020_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ge_2020_default_datagroup



explore: ireland_general_election {
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
