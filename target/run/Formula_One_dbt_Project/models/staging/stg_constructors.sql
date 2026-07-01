
  create view "formula_one"."dev"."stg_constructors__dbt_tmp"
    
    
  as (
    with source as (
    select * from "formula_one"."dev"."seed_constructors"
),

renamed as (
    select 
        "constructorId"::TEXT as constructor_id,
        "constructorRef"::TEXT as constructor_ref,
        name::TEXT as constructor_name,
        nationality::TEXT as constructor_nationality
        --url -- excluded (not needed for analysis) 

    from 
        source
)

select * from renamed
  );