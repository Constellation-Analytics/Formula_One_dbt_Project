with source as (
    select
        *
    from {{ source('f1', 'sprint_results') }}
),

renamed as (
    select
        resultid as result_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        number,
        grid,
        "position",
        positiontext,
        positionorder,
        points,
        laps,
        "time",
        milliseconds,
        fastestlap,
        fastestlaptime,
        statusid,
        rank
    from
        source
)

select * from renamed