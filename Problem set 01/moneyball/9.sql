SELECT "name","average salary" FROM "teams" JOIN(
    SELECT "team_id", ROUND(AVG(salary),2) AS "average salary" FROM "salaries"
    WHERE "year" ='2001'
    GROUP BY "team_id"
    ) AS "s" ON "s"."team_id"="teams"."id"
    ORDER BY "average salary" ASC LIMIT 5; 