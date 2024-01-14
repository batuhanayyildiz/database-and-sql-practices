--name,id,nametype,class,mass,discovery,year,lat,long
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC 
);
.import --csv --skip 1 meteorites.csv meteorites_temp
--- Cleaning null values.
UPDATE "meteorites_temp" SET "mass"=NULL WHERE "mass"='';
UPDATE "meteorites_temp" SET "year"=NULL WHERE "year"='';
UPDATE "meteorites_temp" SET "lat"=NULL WHERE "lat"='';
UPDATE "meteorites_temp" SET "long"=NULL WHERE "long"='';

---Rounding decimals

UPDATE "meteorites_temp" SET "mass"= ROUND("mass",2),
"lat"=ROUND("lat",2),
"long"=ROUND("lat",2);

--Deleting nametype='Relict'
DELETE FROM "meteorites_temp" WHERE "nametype" LIKE 'Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,  
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name","class","mass","discovery","year","lat","long"
FROM "meteorites_temp" ORDER BY "year" DESC,"name" ASC;