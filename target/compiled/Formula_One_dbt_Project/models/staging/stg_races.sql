with source as (
  select * from "formula_one"."raw"."races"
),

renamed as (
	select
		raceid::integer as race_id,
		year::integer as race_year,
		round::integer as race_round,
		circuitid::integer as circuit_id,
		name as race_name,
		date::date as race_date,
		NULLIF(time,'\N') AS race_time, 
        --url -- excluded (not needed for analysis) 
		NULLIF(fp1_date,'\N') AS fp1_date,
		NULLIF(fp1_time,'\N') AS fp1_time,
		NULLIF(fp2_date,'\N') AS fp2_date,
		NULLIF(fp2_time,'\N') AS fp2_time,
		NULLIF(fp3_date,'\N') AS fp3_date,
		NULLIF(fp3_time,'\N') AS fp3_time,
		NULLIF(quali_date,'\N') AS quali_date,
		NULLIF(quali_time,'\N') AS quali_time,
		NULLIF(sprint_date,'\N') AS sprint_date,
		NULLIF(sprint_time,'\N') AS sprint_time
	from 
		source
)

select * from renamed