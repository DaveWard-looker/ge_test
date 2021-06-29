view: fact_eliminations {
  derived_table: {
    sql: WITH CTE AS (
      SELECT
      Candidate_Id,
      candidate_first_name||' '||candidate_surname as eliminated_candidate,
      Constituency_Number,
      Result,
      Count_Number,
      Transfers,
      ROW_NUMBER() OVER ( PARTITION BY Candidate_Id, Constituency_Number, Result ORDER BY Count_Number asc ) as termination_count
      FROM `daveward-ps-dev.daveward_demodataset.GE_2020_IE_Count_Details`
      where result = 'Excluded'
      )
      SELECT
      Candidate_Id,
      eliminated_candidate,
      Constituency_Number,
      Count_Number as elimination_count,
      Transfers as Dispersal,
      FROM CTE
      WHERE termination_count = 1
       ;;
    datagroup_trigger: ge_2020_default_datagroup
  }


dimension: pk_field {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${candidate_id}||'-'||${constituency_number} ;;
}

  dimension: candidate_id {
    hidden: no
    type: number
    sql: ${TABLE}.Candidate_Id ;;
  }

  dimension: eliminated_candidate {
    type: string
    sql: ${TABLE}.eliminated_candidate ;;
  }

  dimension: elimiation {
    type: string
    sql: ${elimination_count}||'-'||${eliminated_candidate} ;;
  }

  dimension: constituency_number {
    hidden: no
    type: number
    sql: ${TABLE}.Constituency_Number ;;
  }

  dimension: elimination_count {
    type: number
    sql: ${TABLE}.elimination_count ;;
  }

  dimension: dispersal {
    hidden: yes
    type: number
    sql: ${TABLE}.Dispersal ;;
  }

  measure: total_dispersal {
    type: sum
    sql: ${dispersal} ;;
    value_format_name: decimal_0
  }

}
