with constructor_standings as (
    select * from "formula_one"."dev"."stg_constructor_standings"
),
constructors as (
    select * from "formula_one"."dev"."stg_constructors"
),
races as (
    select * from "formula_one"."dev"."stg_races"
),

season_totals as (
select
    constructor_standings.constructor_id,
    races.race_year as season,
    constructors.constructor_name,
    sum(constructor_standings.constructor_points) as season_points,
    --min(constructor_standings.constructor_position) as season_position,
    sum(constructor_standings.constructor_wins) as season_wins
from constructor_standings
    inner join constructors on constructor_standings.constructor_id = constructors.constructor_id
    inner join races on constructor_standings.race_id = races.race_id

group by
    constructor_standings.constructor_id, races.race_year, constructors.constructor_name
)

select 
    *,
    dense_rank() over(partition by season order by season_points desc) as season_position
from 
season_totals
order by
    season desc, season_points desc