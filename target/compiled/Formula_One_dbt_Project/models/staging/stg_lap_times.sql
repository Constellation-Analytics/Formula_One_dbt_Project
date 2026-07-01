with source as (
    select
        *
    from "formula_one"."raw"."lap_times"
),

renamed as (
    select
        raceid::integer as race_id,
        driverid::integer as driver_id,
        lap as lap_number,
        position as lap_position,
        time as lap_time,
        milliseconds as lap_milliseconds
    from 
        source
)

select * from renamed