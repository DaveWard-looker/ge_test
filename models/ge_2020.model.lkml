connection: "bigquery_personal_instance"

# include all the views
include: "/views/**/*.view"

datagroup: ge_2020_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ge_2020_default_datagroup

explore: ge_2020_ie_candidate_details {}

explore: ge_2020_ie_constituency_details {}

explore: ge_2020_ie_count_details {}
