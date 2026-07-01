with source as (
    select
        *
    from {{ source('f1', 'pitstops') }}
),

renamed as (
    select
        raceid::integer as race_id,
        driverid::integer as driver_id,
        stop::integer as stop_number,
        lap::integer as lap_number,
        time::text as pit_time,
        duration::text as pit_duration,
        milliseconds::integer as pit_milliseconds
    from 
        source
)

select * from renamed