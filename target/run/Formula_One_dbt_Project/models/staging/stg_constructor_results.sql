
  create view "formula_one"."dev"."stg_constructor_results__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."constructor_results"
),

renamed as (
    select 
        constructorresultsid as constructor_results_id,
        raceid as race_id,
        constructorid as constructor_id,
        points,
        NULLIF(status,'\N') AS status
    from 
        source
)

select * from renamed
  );