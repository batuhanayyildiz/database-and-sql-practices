SELECT "year", "HR" FROM "performances" WHERE "player_id" IN (
    SELECT "id" FROM "players" 
    WHERE "first_name" LIKE 'Ken' AND "last_name" LIKE 'Griffey' 
    ORDER BY "birth_year" DESC LIMIT 1
    ) ORDER BY "year" DESC;
