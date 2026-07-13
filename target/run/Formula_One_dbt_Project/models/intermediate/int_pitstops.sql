
      insert into "formula_one"."dev"."int_pitstops" ("race_id", "driver_id", "race_year", "race_round", "race_name", "race_date", "driver_name", "driver_surname", "constructor_name", "total_pitstops", "min_pit_milliseconds", "max_pit_milliseconds", "avg_pit_milliseconds", "total_pit_milliseconds")
    (
        select "race_id", "driver_id", "race_year", "race_round", "race_name", "race_date", "driver_name", "driver_surname", "constructor_name", "total_pitstops", "min_pit_milliseconds", "max_pit_milliseconds", "avg_pit_milliseconds", "total_pit_milliseconds"
        from "int_pitstops__dbt_tmp105905941576"
    )


  