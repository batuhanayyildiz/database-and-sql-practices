CREATE VIEW "frequently_reviewed" AS
SELECT "id","property_type","host_name",COUNT("reviews_id") AS "reviews" 
FROM "listings" JOIN 
    (SELECT "id" AS "reviews_id","listing_id" FROM "reviews")
AS "review_table" ON "listings"."id"="review_table"."listing_id" 
GROUP BY "id" ORDER BY "reviews" DESC, "property_type" ASC, "host_name" ASC LIMIT 100;
