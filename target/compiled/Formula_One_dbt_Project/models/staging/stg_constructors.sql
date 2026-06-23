with source as (
    select * from "formula_one"."dev"."constructors"
),

renamed as (
select 
    "constructorId" as constructor_id,
    "constructorRef" as constructor_ref,
    name,
    nationality,
    url
from 
    source)

select * from renamed