with source as (
    select
        *
    from {{ source('f1', 'qualifying') }}
),

renamed as (
    select
        qualifyid::integer as qualify_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        constructorid::integer as constructor_id,
        number::integer as driver_number,
        position::integer as qualifying_position,
        q1::text as qualifying_q1,
        q2::text as qualifying_q2,
        q3::text as qualifying_q3
    from 
        source
)

select * from renamed