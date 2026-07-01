with status as (
  select * from "formula_one"."dev"."seed_status"
),

renamed as (
  select 
    "statusId"::integer as status_id,
    status::text as status_description
from 
  status
)

select * from renamed