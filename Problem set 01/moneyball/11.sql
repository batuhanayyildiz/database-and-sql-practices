--> SELECT "first_name","last_name","dollars per hit"
SELECT "first_name", "last_name", "dollars per hit" FROM "players"
JOIN (
    SELECT "st"."player_id","salary"/"H" AS "dollars per hit" FROM "salaries" AS "st" 
    JOIN "performances" ON "st"."player_id"="performances"."player_id" 
    AND "st"."year"="performances"."year" 
    WHERE "st"."year"='2001' AND "H" IS NOT 0
    )
AS "pdh" ON "players"."id"="pdh"."player_id"
ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC LIMIT 10;





