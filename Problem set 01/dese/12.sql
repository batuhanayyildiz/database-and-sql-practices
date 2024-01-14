SELECT "name" AS 'district_name', "exemplary", "per_pupil_expenditure" 
FROM "staff_evaluations" JOIN (
    SELECT * FROM "expenditures" JOIN "districts" 
    ON "districts"."id"="expenditures"."district_id"
    ) 
AS "second" ON "second"."district_id"="staff_evaluations"."district_id" 
WHERE "per_pupil_expenditure"> 
    (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"     
    )
AND "exemplary" >
    (
    SELECT AVG("exemplary") FROM "staff_evaluations"    
    )

ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC  ;

