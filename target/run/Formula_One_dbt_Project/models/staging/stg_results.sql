
  create view "formula_one"."dev"."stg_results__dbt_tmp"
    
    
  as (
    with source as (
    select * from "formula_one"."raw"."results"
),

renamed as (
select 
    resultid,
    raceid,
    driverid,
    constructorid,
    number,
    grid,
    NULLIF(position,'\N') AS position,
    positiontext,
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
)

select * from renamed
  );