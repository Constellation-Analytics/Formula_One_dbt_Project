
  create view "formula_one"."dev"."stg_constructors__dbt_tmp"
    
    
  as (
    with source as (
    select * from "formula_one"."dev"."constructors"
),

renamed as (
select 
    "constructorId" as constructor_id,
    "constructorRef" as constructor_ref,
    name,
    nationality
from 
    source)

select * from renamed
  );