with source as (
    select * from {{ source('f1', 'results') }}
),

renamed as (
    select 
        resultid::integer as result_id,
        raceid::integer as race_id,
        driverid::integer as driver_id,
        constructorid::integer as constructor_id,
        number::integer,
        grid::integer,
        NULLIF(position,'\N') AS position,
        positiontext::text,
        positionorder::integer,
        points::integer,
        laps::integer,
        NULLIF("time",'\N') AS result_time,
        NULLIF(milliseconds,'\N') AS milliseconds,
        NULLIF(fastestlap,'\N') AS fastestlap,
        NULLIF(rank,'\N') AS rank,
        NULLIF(fastestlaptime,'\N') AS fastestlaptime,
        NULLIF(fastestlapspeed,'\N') AS fastestlapspeed,
        statusid::integer
    from 
        source
)

select * from renamed