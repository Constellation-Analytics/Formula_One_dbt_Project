with source as (
    select
        *
    from {{ source('f1', 'lap_times') }}
),

renamed as (
    select
        raceid::integer as race_id,
        driverid::integer as driver_id,
        lap::integer as lap_number,
        position::integer as lap_position,
        time::text as lap_time,
        milliseconds::integer as lap_milliseconds
    from 
        source
)

select * from renamed