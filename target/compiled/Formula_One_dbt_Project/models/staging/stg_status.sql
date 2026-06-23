with status as (
  select * from "formula_one"."dev"."status"
),

renamed as (
  select 
    "statusId" as status_id,
    status
from 
  status
)

select * from renamed