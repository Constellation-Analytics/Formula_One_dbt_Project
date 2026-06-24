with source as (
    select
        *
    from {{ source('f1', 'drivers') }}
),

renamed as (
    select
        driverid as driver_id,
        driverref as driver_ref,
        number,
        code,
        forename,
        surname,
        dob as date_of_birth,
        nationality
    from source
)

select * from renamed