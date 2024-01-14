SELECT "city" , COUNT(name) AS 'school_count' FROM "schools"
WHERE "type" IS 'Public School'
GROUP BY "city" 
ORDER BY "school_count" DESC , "city" ASC LIMIT 10;

