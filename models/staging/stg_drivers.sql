with source as (
    select
        *
    from {{ source('f1', 'drivers') }}
),

renamed as (
    select
        driverid::integer as driver_id,
        driverref::text as driver_ref,
        number::integer as driver_number,
        code::text as driver_code,
        forename::text as driver_forename,
        surname::text as driver_surname,
        dob::date as date_of_birth,
        nationality::text as driver_nationality
        --url -- excluded (not needed for analysis) 
    from 
        source
)

select * from renamed