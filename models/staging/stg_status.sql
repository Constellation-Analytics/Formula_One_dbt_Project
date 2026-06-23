with status as (
  select * from {{ ref('status') }}
),

renamed as (
  select 
    "statusId" as status_id,
    status
from 
  status
)

select * from renamed