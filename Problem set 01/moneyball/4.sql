SELECT "first_name", "last_name", "salary" FROM "players" 
JOIN "salaries" ON "players"."id"="salaries"."player_id" 
ORDER BY "salary" ASC, "first_name" ASC,"last_name" ASC,"player_id" ASC LIMIT 50;