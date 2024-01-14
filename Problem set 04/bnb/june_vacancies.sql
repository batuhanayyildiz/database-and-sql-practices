-- I think, this solution is not totally true. 
-- I showed all listings which have days_vacant bigger than zero. 
-- Ones With zero values should be showed as 0 value under the days_vacant column. 
-- However, they disappeared. Therefore, I could not show all listings. 
-- There are the ones with days_vacant bigger than zero.

CREATE VIEW "june_vacancies" AS
SELECT "id","property_type","host_name", COUNT("date") AS "days_vacant" 
FROM "listings" LEFT JOIN
    (
    SELECT "listing_id","date","available" FROM "availabilities"    
    )
AS "av_table" ON "av_table"."listing_id" = "listings"."id"
WHERE "available" LIKE 'TRUE' AND "date">='2023-06-01' AND "date"<'2023-07-01'
GROUP BY "id"
ORDER BY "days_vacant" DESC;










