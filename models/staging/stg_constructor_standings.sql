with source as (
    select
        *
    from {{ source('f1', 'constructor_standings') }}
),

renamed as (
    select 
        constructorstandingsid::integer as constructor_standings_id,
        raceid::integer as race_id,
        constructorid::integer as constructor_id,
        points::integer as constructor_points,
        "position"::integer as constructor_position,
        positiontext::text as constructor_position_text,
        wins::integer as constructor_wins
    from 
        source
)

select * from renamed