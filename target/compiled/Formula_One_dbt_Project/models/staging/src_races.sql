with races as (
  select * from "formula_one"."raw"."races"
)
SELECT
	raceid,
	year,
	round,
	circuitid,
	name as circuit_name,
	date,
	NULLIF(time,'\N') AS time, 
	url,
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
FROM 
	races
where 
    year::int >= 2020