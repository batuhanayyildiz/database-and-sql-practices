CREATE TABLE IF NOT EXISTS inscriptions (
    "id" INTEGER,
    "sentence_no" INTEGER,
    "char_no" INTEGER,
    "message_length" INTEGER,
    PRIMARY KEY("id")
);

INSERT INTO "inscriptions"("sentence_no","char_no","message_length") 
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "message" AS
SELECT substr("sentence","char_no","message_length") AS "phrase" FROM "inscriptions" 
JOIN (
    SELECT "id","sentence" FROM "sentences" WHERE "id" IN
    (SELECT "sentence_no" FROM "inscriptions")
    )
AS "selected_sentences" ON "inscriptions"."sentence_no"="selected_sentences"."id";