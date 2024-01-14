CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT CHECK("concourse" IN ('A','B','C','D','E','F','T')),  
    PRIMARY KEY("id")  

);

CREATE TABLE check_ins (
    "id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
    

);

CREATE TABLE flights (
    "id" INTEGER,
    "airline_id" INTEGER,
    "flight_number" INTEGER,    
    "departure_code" TEXT,
    "heading_code" TEXT,
    "expected_departure_datetime" NUMERIC,
    "expected_arrival_datetime" NUMERIC,    
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")  

);
