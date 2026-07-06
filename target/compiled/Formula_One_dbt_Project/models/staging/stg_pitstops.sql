with source as (
    select
        *
    from "formula_one"."raw"."pitstops"
),

renamed as (
    select
        raceid::integer as race_id,
        driverid::integer as driver_id,
        nullif(stop, '\N')::int as stop_number,
        nullif(lap, '\N')::int as lap_number,
        nullif(time, '\N') as pit_time,
        NULLIF("duration",'\N') as pit_duration,
        NULLIF("milliseconds",'\N')::int as pit_milliseconds
    from 
        source
)

select * from renamed