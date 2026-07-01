
  create view "formula_one"."dev"."stg_driver_standings__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."driver_standings"
),

renamed as (
    select
        driverstandingsid::integer as driver_standings_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        points as driver_points,
        "position" as driver_position,
        positiontext as driver_position_text,
        wins as driver_wins
    from 
        source
)

select * from renamed
  );