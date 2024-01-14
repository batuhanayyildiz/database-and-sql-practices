SELECT "name","total hits" FROM "teams" JOIN (
    SELECT "team_id","H" AS 'total hits' FROM "performances" 
    WHERE "year"='2001'
    ORDER BY "H" DESC LIMIT 10) 
AS "second" ON "second"."team_id"="teams"."id" 
ORDER BY "total hits" DESC; 
