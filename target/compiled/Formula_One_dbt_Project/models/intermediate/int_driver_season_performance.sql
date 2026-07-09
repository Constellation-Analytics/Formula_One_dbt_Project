with drivers as (
    select * from "formula_one"."dev"."stg_drivers"
),
results as (
    select * from "formula_one"."dev"."stg_results"
),

races as (
    select * from "formula_one"."dev"."stg_races"
),

season_totals as (
select
    drivers.driver_id,
    races.race_year as season,
    drivers.driver_name,
    drivers.driver_surname,
    sum(results.points) as season_points,
    sum(case when results.position = 1 then 1 else 0 end) as season_wins
from drivers 
    inner join results on drivers.driver_id = results.driver_id
    inner join races on results.race_id = races.race_id

group by
    drivers.driver_id, races.race_year, drivers.driver_name, drivers.driver_surname
)

select 
    *,
    dense_rank() over(partition by season order by season_points desc) as season_position
from 
season_totals
order by
    season desc, season_points desc