with source as (
    select
        *
    from {{ source('f1', 'pitstops') }}
),

renamed as (
    select
        raceid as race_id,
        driverid as driver_id,
        stop as stop_number,
        lap,
        time,
        duration,
        milliseconds
    from 
        source
)

select * from renamed