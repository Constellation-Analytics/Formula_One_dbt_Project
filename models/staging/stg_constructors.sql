with source as (
    select * from {{ ref('constructors') }}
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