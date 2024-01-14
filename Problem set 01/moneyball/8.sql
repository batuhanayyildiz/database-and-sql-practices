SELECT "salary"  FROM "salaries" JOIN (
    SELECT "player_id" FROM "performances" 
    WHERE "year" ='2001' AND "HR" = (
        SELECT MAX("HR") FROM "performances"
        )
    ) AS "second" ON "salaries"."player_id"="second"."player_id" 
    WHERE "year" ='2001';

