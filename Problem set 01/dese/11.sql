SELECT "school_name","graduated","per_pupil_expenditure" FROM "expenditures" 
JOIN (
    SELECT "name" AS 'school_name',"graduated" ,"district_id" FROM "schools" 
    JOIN "graduation_rates" ON "schools"."id"="graduation_rates"."school_id"
    ) 
AS "second" ON "second"."district_id"="expenditures"."district_id"
ORDER BY "per_pupil_expenditure" DESC, "school_name" ASC;