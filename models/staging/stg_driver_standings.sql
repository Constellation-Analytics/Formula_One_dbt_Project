with source as (
    select
        *
    from {{ source('f1', 'driver_standings') }}
),

renamed as (
    select
        driverstandingsid::integer as driver_standings_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        points as driver_points,
        "position" as driver_position,
        positiontext as driver_position_text,
        wins as driver_wins
    from 
        source
)

select * from renamed