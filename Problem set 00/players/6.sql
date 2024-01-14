SELECT "first_name", "last_name", "debut" FROM "players"
WHERE "birth_state" LIKE 'PA' AND "birth_city" LIKE "Pittsburgh"
ORDER BY "debut" ASC,"first_name" ASC, "last_name" ASC;