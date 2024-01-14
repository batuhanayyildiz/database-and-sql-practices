SELECT "city", COUNT("name") AS 'school_count' FROM "schools"
WHERE "type" IS 'Public School'
GROUP BY "city" HAVING "school_count" <=3
ORDER BY "school_count" DESC, "city" ASC;
