with source as (
    select
        *
    from "formula_one"."raw"."driver_standings"
),

renamed as (
    select
        driverstandingsid as driver_standings_id,
        raceid as race_id,
        driverid as driver_id,
        points,
        "position",
        positiontext,
        wins
    from 
        source
)

select * from renamed