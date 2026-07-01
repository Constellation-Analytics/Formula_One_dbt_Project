with source as (
    select
        *
    from {{ source('f1', 'constructor_results') }}
),

renamed as (
    select 
        constructorresultsid::integer as constructor_results_id,
        raceid::integer as race_id,
        constructorid::integer as constructor_id,
        points::integer as constructor_points,
        NULLIF(status,'\N') AS status
    from 
        source
)

select * from renamed