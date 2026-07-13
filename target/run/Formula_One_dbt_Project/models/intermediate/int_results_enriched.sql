
      insert into "formula_one"."dev"."int_results_enriched" ("result_id", "race_id", "driver_id", "constructor_id", "circuit_id", "starting_position", "finishing_position", "race_status", "race_status_description", "points", "laps", "result_time", "milliseconds", "fastestlap", "fastestlaptime", "race_year", "race_round", "race_name", "race_date", "driver_name", "driver_surname", "driver_date_of_birth", "driver_nationality", "constructor_name", "constructor_nationality")
    (
        select "result_id", "race_id", "driver_id", "constructor_id", "circuit_id", "starting_position", "finishing_position", "race_status", "race_status_description", "points", "laps", "result_time", "milliseconds", "fastestlap", "fastestlaptime", "race_year", "race_round", "race_name", "race_date", "driver_name", "driver_surname", "driver_date_of_birth", "driver_nationality", "constructor_name", "constructor_nationality"
        from "int_results_enriched__dbt_tmp105906630249"
    )


  