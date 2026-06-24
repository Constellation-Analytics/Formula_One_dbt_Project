with source as (
    select * from {{ ref('constructors') }}
),

renamed as (
    select 
        "constructorId" as constructor_id,
        "constructorRef" as constructor_ref,
        name,
        nationality
        --url -- excluded (not needed for analysis) 

    from 
        source
)

select * from renamed