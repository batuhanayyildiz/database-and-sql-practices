SELECT "first_name","last_name" FROM "players" JOIN 
(
    SELECT "salary"/"RBI" AS "salary per RBI","s"."player_id" FROM "salaries" AS "s"
    JOIN "performances" ON "performances"."player_id"="s"."player_id" 
    AND "performances"."year"="s"."year"
    WHERE "RBI" IS NOT NULL AND "RBI" IS NOT 0 AND "s"."year"='2001'

) AS "srb" ON "players"."id"="srb"."player_id" 
ORDER BY "player_id" ASC, "last_name" ASC LIMIT 10;