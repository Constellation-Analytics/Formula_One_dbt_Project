
  create view "formula_one"."dev"."stg_sprint_results__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."sprint_results"
)/*,

renamed as (
    select
        resultid as result_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        number,
        grid,
        NULLIF(position,'\N') AS position,
        positionorder,
        points,
        laps,
        NULLIF("time",'\N') AS "time",
        NULLIF(milliseconds,'\N') AS milliseconds,
        NULLIF(fastestlap,'\N') AS fastestlap,
        NULLIF(rank,'\N') AS rank,
        NULLIF(fastestlaptime,'\N') AS fastestlaptime,
        NULLIF(fastestlapspeed,'\N') AS fastestlapspeed,
        statusid
    from
        source
)*/

select * from source
  );