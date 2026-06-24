with source as (
    select
        *
    from "formula_one"."raw"."pitstops"
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
from source
)

select * from renamed