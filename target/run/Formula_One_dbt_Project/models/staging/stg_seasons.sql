
  create view "formula_one"."dev"."stg_seasons__dbt_tmp"
    
    
  as (
    with seasons as (
  select * from "formula_one"."dev"."seasons"
)

select *
from seasons
  );