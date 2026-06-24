
  create view "formula_one"."dev"."stg_circuits__dbt_tmp"
    
    
  as (
    with source as (
    select * from "formula_one"."dev"."circuits"
),

renamed as (
    select 
        "circuitId" as circuit_id,
        "circuitRef" as circuit_ref,
        name,
        location,
        country,
        lat as latitude,
        lng as longitude,
        alt as altitude
        --url -- excluded (not needed for analysis) 

    from 
        source
)

select * from renamed
  );