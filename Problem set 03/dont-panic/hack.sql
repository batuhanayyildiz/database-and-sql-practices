
SELECT * FROM "users" WHERE "username" LIKE 'admin';

INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
VALUES (
'update',
'admin',
'admin',
(SELECT "new_password" FROM "user_logs" WHERE "type"='insert' AND "new_username" ='admin'),
(SELECT "password" FROM "users" WHERE "username" LIKE 'emily33'));

UPDATE "users" SET "password"='982c0381c279d139fd221fce974916e7' 
WHERE "username" LIKE 'admin';

DELETE FROM "user_logs" WHERE"id"=(
    SELECT "id" FROM "user_logs" WHERE "type"='update' 
    AND "old_username" LIKE 'admin' AND "old_username" LIKE 'admin' 
    ORDER BY "id" DESC LIMIT 1) ;

SELECT * FROM "user_logs" ORDER BY "id" DESC;
SELECT * FROM "users" WHERE "username" LIKE 'admin';