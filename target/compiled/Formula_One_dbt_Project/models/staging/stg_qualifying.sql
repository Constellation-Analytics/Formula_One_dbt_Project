with source as (
    select
        *
    from "formula_one"."raw"."qualifying"
),

renamed as (
    select
        qualifyid::integer as qualify_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        constructorid::integer as constructor_id,
        number as driver_number,
        position as qualifying_position,
        q1 as qualifying_q1,
        q2 as qualifying_q2,
        q3 as qualifying_q3
    from 
        source
)

select * from renamed