CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "amount_in_gram" NUMERIC,
    "dollar_per_gram" NUMERIC,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" NUMERIC,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER CHECK("gluten_free" IN (0,1)),
    "dollar_per_donut" NUMERIC,
    PRIMARY KEY ("id")

);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_no" TEXT NOT NULL,
    "customer_id" INTEGER ,    
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    PRIMARY KEY("id") 
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,    
    PRIMARY KEY("id")
);

CREATE TABLE "donuts_ingredients" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE "orders_donuts" (
    "id" INTEGER,
    "order_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE "customers_orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "order_id" INTEGER,
    "datetime" NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    PRIMARY KEY("id")
);