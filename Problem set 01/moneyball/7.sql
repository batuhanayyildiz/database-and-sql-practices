SELECT "first_name","last_name" FROM "players" JOIN (
    SELECT * FROM "salaries" 
    WHERE "salary" = (
        SELECT MAX(salary) FROM "salaries"
        )
    ) AS "second" ON "players"."id"="second"."player_id";
