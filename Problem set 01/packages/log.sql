
-- *** The Lost Letter ***

SELECT "id" FROM "addresses" WHERE "address"='900 Somerville Avenue';

SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Finnegan Street'; -- Returns none

SELECT "address" FROM "addresses" WHERE "address" LIKE '2 F%'; -- To check misspelling in address writing.

SELECT "id","type" FROM "addresses" WHERE "address" LIKE '2 Finnigan Street'; -- Find type of adress

SELECT "id","contents" FROM "packages" WHERE "from_address_id"=(
SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue')
AND "to_address_id"=(
SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Finnigan Street'); -- To find apckage and its id


SELECT "action","timestamp" FROM "scans" WHERE "package_id" IN (
SELECT "id" FROM "packages" WHERE "from_address_id"=(
SELECT "id" FROM "addresses" WHERE "address" LIKE '900 Somerville Avenue')
AND "to_address_id"=(
SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Finnigan Street')
) ORDER BY "timestamp" DESC; -- To find, action of package.




-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;

SELECT "address" FROM "addresses" WHERE "id" = (
SELECT "to_address_id" FROM "packages" WHERE "from_address_id" IS NULL
); -- To find address package ended up

SELECT "action","timestamp" FROM "scans" WHERE "package_id" = (
SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
) ORDER BY "timestamp" DESC; -- To check dropped

-- *** The Forgotten Gift ***

SELECT * FROM "packages" WHERE "from_address_id" = (
SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
); -- To find contents of package

SELECT * FROM "scans" WHERE "package_id"=(
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
      )
) ORDER BY "timestamp" DESC; 
-- To investigate actions and the last action

SELECT "name" FROM "drivers" WHERE "id"=(
    SELECT "driver_id" FROM "scans" WHERE "package_id"=(
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
    ) ORDER BY "timestamp" DESC LIMIT 1
); -- To find who has the package

