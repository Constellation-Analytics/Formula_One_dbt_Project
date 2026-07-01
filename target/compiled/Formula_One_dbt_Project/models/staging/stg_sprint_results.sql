with source as (
    select
        *
    from "formula_one"."raw"."sprint_results"
),

renamed as (
    select
        resultid::integer as result_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        constructorid::integer as constructor_id,
        number as driver_number,
        grid as starting_grid_position,
        "position" as sprint_result_position,
        positiontext as sprint_result_position_text,
        positionorder as sprint_result_position_order,
        points as sprint_points,
        laps as sprint_laps,
        "time" as sprint_time,
        milliseconds as sprint_milliseconds,
        fastestlap as sprint_fastest_lap,
        fastestlaptime as sprint_fastest_lap_time,
        statusid as sprint_status_id,
        rank as sprint_rank
    from
        source
)

select * from renamed