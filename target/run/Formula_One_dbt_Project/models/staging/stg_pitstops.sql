
  create view "formula_one"."dev"."stg_pitstops__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."pitstops"
),

renamed as (
    select
        raceid::integer as race_id,
        driverid::integer as driver_id,
        stop as stop_number,
        lap as lap_number,
        time as pit_time,
        duration as pit_duration,
        milliseconds as pit_milliseconds
    from 
        source
)

select * from renamed
  );