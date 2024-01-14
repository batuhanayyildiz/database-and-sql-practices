CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id") 
);

CREATE TABLE "schools" (
   "id" INTEGER,
   "name" TEXT NOT NULL,
   "type" TEXT,
   "location" TEXT,
   "foundation_year" NUMERIC,
   PRIMARY KEY("id")
);

CREATE TABLE "companies" (
   "id" INTEGER,
   "name" TEXT NOT NULL,
   "industry" TEXT,
   "location" TEXT NOT NULL,   
   PRIMARY KEY("id")
);

CREATE TABLE "user_user_connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,    
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "user_school_affiliation" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC CHECK ("end_date">="start_date"), 
    "degree" TEXT,
    PRIMARY KEY("id"),    
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "user_company_affiliation" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC CHECK ("end_date">="start_date"), 
    "degree" TEXT,
    PRIMARY KEY("id"),    
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
