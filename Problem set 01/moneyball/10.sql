


SELECT "first_name","last_name","salary","year","HR"
FROM "players" JOIN
    (
    SELECT "a"."year","HR","salary","a"."player_id" FROM "salaries" AS "a"
    JOIN "performances" 
    ON "performances"."player_id"="a"."player_id"
    AND "performances"."year"="a"."year"
    ) 
AS "b" ON "b"."player_id"="players"."id" 
ORDER BY "id" ASC,"year" DESC,"HR" DESC, "salary" DESC;


    
    




   