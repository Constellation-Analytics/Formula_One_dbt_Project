with source as (
    select
        *
    from "formula_one"."raw"."lap_times"
),

renamed as (
    select
        raceid as race_id,
        driverid as driver_id,
        lap,
        position,
        time,
        milliseconds
    from 
        source
)

select * from renamed