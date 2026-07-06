with source as (
    select
        *
    from "formula_one"."raw"."constructor_standings"
),

renamed as (
    select 
        constructorstandingsid::integer as constructor_standings_id,
        raceid::integer as race_id,
        constructorid::integer as constructor_id,
        points::numeric(10,2) as constructor_points,
        "position"::integer as constructor_position,
        positiontext as constructor_position_text,
        wins::integer as constructor_wins
    from 
        source
)

select * from renamed