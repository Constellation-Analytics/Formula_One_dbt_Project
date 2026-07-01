with results as (
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

select 
    results.result_id,
    results.race_id,
    results.driver_id,
    results.constructor_id,
    results.number,
    results.grid as starting_position,
    results."position" as finishing_position,
    case
        when positionText = 'R' then 'Retired'
        when positionText = 'D' then 'Disqualified'
        when positionText = 'N' then 'Not Classified'
        when positionText = 'E' then 'Excluded'
        when positionText = 'W' then 'Withdrawn'
        else 'Finished'
    end as race_status,
    --results.positionorder,
    results.points,
    results.laps,
    results.result_time,
    results.milliseconds,
    results.fastestlap,
    results.rank,
    results.fastestlaptime,
    results.fastestlapspeed,
    results.statusid,
    races.race_year,
    races.race_round,
    races.circuit_id,
    races.race_name,
    races.race_date,
    races.race_time,
    races.fp1_date,
    races.fp1_time,
    races.fp2_date,
    races.fp2_time,
    races.fp3_date,
    races.fp3_time,
    races.quali_date,
    races.quali_time,
    races.sprint_date,
    races.sprint_time,
    drivers.driver_ref,
    drivers.driver_number,
    drivers.driver_code,
    drivers.driver_forename,
    drivers.driver_surname,
    drivers.date_of_birth,
    drivers.driver_nationality,
    constructors.constructor_ref,
    constructors.constructor_name,
    constructors.constructor_nationality
from 
    results
    inner join races on results.race_id = races.race_id
    left join drivers on results.driver_id = drivers.driver_id
    left join constructors on results.constructor_id = constructors.constructor_id