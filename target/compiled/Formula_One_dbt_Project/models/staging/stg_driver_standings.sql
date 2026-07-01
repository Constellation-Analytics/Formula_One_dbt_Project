with source as (
    select
        *
    from "formula_one"."raw"."driver_standings"
),

renamed as (
    select
        driverstandingsid::integer as driver_standings_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        points::integer as driver_points,
        "position"::integer as driver_position,
        positiontext::text as driver_position_text,
        wins::integer as driver_wins
    from 
        source
)

select * from renamed