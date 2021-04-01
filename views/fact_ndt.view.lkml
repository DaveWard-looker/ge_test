# If necessary, uncomment the line below to include explore_source.
# include: "ge_2020.model.lkml"

view: fact_ndt {
  derived_table: {
    explore_source: ireland_general_election {
      column: candidate { field: ge_2020_ie_candidate_details.candidate }
      column: party { field: ge_2020_ie_candidate_details.party }
      column: constituency_name { field: ge_2020_ie_constituency_details.constituency_name }
      column: count {}
      column: total_first_preference_vote {}
      column: total_non_transferable {}
    }
  }
  dimension: candidate {
    label: "Candidate Candidate"
  }
  dimension: party {
    label: "Candidate Party"
  }
  dimension: constituency_name {
    label: "Constituency Constituency Name"
  }
  dimension: count {
    label: "Count Count"
    type: number
  }
  dimension: total_first_preference_vote {
    label: "Count Total First Preference Vote"
    value_format: "#,##0"
    type: number
  }
  dimension: total_non_transferable {
    label: "Count Total Non Transferable"
    value_format: "#,##0"
    type: number
  }
}
