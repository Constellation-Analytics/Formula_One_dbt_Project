
  create view "formula_one"."dev"."stg_driver_standings__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."driver_standings"
),

renamed as (
    select
        driverstandingsid as driver_standings_id,
        raceid as race_id,
        driverid as driver_id,
        points,
        "position",
        wins
    from source
)

select * from renamed
  );