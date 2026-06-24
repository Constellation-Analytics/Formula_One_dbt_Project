
  create view "formula_one"."dev"."stg_lap_times__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."lap_times"
),

renamed as (
    select
        raceid as race_id,
        driverid as driver_id,
        lap,
        position,
        time,
        milliseconds
    from source
)

select * from renamed
  );