
  create view "formula_one"."dev"."stg_drivers__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."drivers"
),

renamed as (
    select
        driverid::integer as driver_id,
        driverref as driver_ref,
        number as driver_number,
        code as driver_code,
        forename as driver_name,
        surname as driver_surname,
        dob::date as driver_date_of_birth,
        nationality as driver_nationality
        --url -- excluded (not needed for analysis) 
    from 
        source
)

select * from renamed
  );