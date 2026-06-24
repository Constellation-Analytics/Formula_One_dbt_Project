
  create view "formula_one"."dev"."stg_drivers__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."drivers"
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
  );