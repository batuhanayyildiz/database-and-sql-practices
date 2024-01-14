SELECT "name","evaluated" FROM "districts" 
JOIN "staff_evaluations" ON "staff_evaluations"."district_id"="districts"."id" ;