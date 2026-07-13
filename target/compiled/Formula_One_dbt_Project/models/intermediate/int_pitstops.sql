with pitstops as (
    select * from "formula_one"."dev"."stg_pitstops"
),

results as (
    select * from "formula_one"."dev"."stg_results"
),

races as (
    select * from "formula_one"."dev"."stg_races"
),

drivers as (
    select * from "formula_one"."dev"."stg_drivers"
), 

constructors as (
    select * from "formula_one"."dev"."stg_constructors"
)

SELECT 
    pitstops.race_id,
    pitstops.driver_id,
    races.race_year,
    races.race_round,
    races.race_name,
    races.race_date,
    drivers.driver_name,
    drivers.driver_surname,
    constructors.constructor_name,
    count(pitstops.stop_number) as total_pitstops,
    min(pitstops.pit_milliseconds) as min_pit_milliseconds,
    max(pitstops.pit_milliseconds) as max_pit_milliseconds,
    round(avg(pitstops.pit_milliseconds),2) as avg_pit_milliseconds,
    sum(pitstops.pit_milliseconds) as total_pit_milliseconds
FROM pitstops 
    INNER JOIN races ON pitstops.race_id = races.race_id
    INNER JOIN results ON pitstops.race_id = results.race_id AND pitstops.driver_id = results.driver_id
    INNER JOIN drivers ON pitstops.driver_id = drivers.driver_id
    INNER JOIN constructors ON results.constructor_id = constructors.constructor_id


where pitstops.race_id not in (select pitstops.race_id from "formula_one"."dev"."int_pitstops")


GROUP BY pitstops.race_id, pitstops.driver_id, races.race_year, races.race_round, races.race_name, races.race_date, drivers.driver_name, drivers.driver_surname, constructors.constructor_name

ORDER BY pitstops.race_id desc