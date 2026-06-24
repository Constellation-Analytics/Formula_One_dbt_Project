
  create view "formula_one"."dev"."stg_constructor_standings__dbt_tmp"
    
    
  as (
    with source as (
    select
        *
    from "formula_one"."raw"."constructor_standings"
),

renamed as (
    select 
        constructorstandingsid as constructor_standings_id,
        raceid as race_id,
        constructorid as constructor_id,
        points,
        "position",
        positiontext,
        wins 
    from 
        source
)

select * from renamed
  );