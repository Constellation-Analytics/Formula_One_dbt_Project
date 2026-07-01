
  create view "formula_one"."dev"."stg_constructor_results__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."constructor_results"
),

renamed as (
    select 
        constructorresultsid::integer as constructor_results_id,
        raceid::integer as race_id,
        constructorid::integer as constructor_id,
        points as constructor_points,
        NULLIF(status,'\N') AS status
    from 
        source
)

select * from renamed
  );