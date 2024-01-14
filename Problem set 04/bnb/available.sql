CREATE VIEW "available" AS
SELECT "id", "property_type","host_name","date" FROM "listings"  
JOIN 
    (
    SELECT "id" AS "av_id","listing_id", "date","available" FROM "availabilities"
    )   
AS "av_table" ON "listings"."id"="av_table"."listing_id" WHERE "available" LIKE 'TRUE';