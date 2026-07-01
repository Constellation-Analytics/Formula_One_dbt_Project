with source as (
    select * from "formula_one"."dev"."seed_constructors"
),

renamed as (
    select 
        "constructorId"::integer as constructor_id,
        "constructorRef" as constructor_ref,
        name as constructor_name,
        nationality as constructor_nationality
        --url -- excluded (not needed for analysis) 

    from 
        source
)

select * from renamed