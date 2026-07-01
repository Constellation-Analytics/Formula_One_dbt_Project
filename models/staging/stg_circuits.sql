with source as (
    select * from {{ ref('seed_circuits') }}
),

renamed as (
    select 
        "circuitId"::integer as circuit_id,
        "circuitRef"::integer as circuit_ref,
        "name"as circuit_name,
        "location",
        "country",
        "lat" as latitude,
        "lng" as longitude,
        "alt" as altitude
        --url -- excluded (not needed for analysis) 

    from 
        source
)

select * from renamed