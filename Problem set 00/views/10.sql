SELECT "english_title" AS 'Name Of Picture By Hokusai Where Entropy>7.4',"brightness" FROM "views"   
WHERE ("artist" LIKE 'Hokusai' AND "entropy">7.4) ORDER BY "brightness" DESC