with source as (
    select
        *
    from {{ source('f1', 'sprint_results') }}
),

renamed as (
    select
        resultid::integer as result_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        constructorid::integer as constructor_id,
        number::integer as driver_number,
        grid::integer as starting_grid_position,
        "position"::integer as sprint_result_position,
        positiontext::text as sprint_result_position_text,
        positionorder::integer as sprint_result_position_order,
        points::integer as sprint_points,
        laps::integer as sprint_laps,
        "time"::text as sprint_time,
        milliseconds::integer as sprint_milliseconds,
        fastestlap::integer as sprint_fastest_lap,
        fastestlaptime::text as sprint_fastest_lap_time,
        statusid::integer as sprint_status_id,
        rank::integer as sprint_rank
    from
        source
)

select * from renamed