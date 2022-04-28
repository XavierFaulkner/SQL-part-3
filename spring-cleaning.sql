/*Step 1 Create shirts database if it does not already exist*/
CREATE DATABASE IF NOT EXISTS shirts_db;

/*Step 2 Create shirts table inside the shirts db*/
USE shirts_db;
DROP TABLE IF EXISTS shirts;
CREATE TABLE shirts(shirt_id INT, article TEXT, color TEXT, shirt_size TEXT, last_worn INT);

/*Step 3 */
INSERT INTO shirts VALUES(1, 't-shirt', 'white', 'S', 10);
INSERT INTO shirts VALUES(2, 't-shirt', 'green', 'S', 200);
INSERT INTO shirts VALUES(3, 'polo shirt', 'black', 'M', 10);
INSERT INTO shirts VALUES(4, 'tank top', 'blue', 'S', 50);
INSERT INTO shirts VALUES(5, 't-shirt', 'pink', 'S', 0);
INSERT INTO shirts VALUES(6, 'polo shirt', 'red', 'M', 5);
INSERT INTO shirts VALUES(7, 'tank top', 'white', 'S', 200);
INSERT INTO shirts VALUES(8, 'tank top', 'blue', 'M', 15);

/*Q1 Get all data in a single line*/
SELECT * FROM shirts;

/*Q2 Add a new shirt, purple polo shirt, size M last worn 50 days ago*/
INSERT INTO shirts VALUES(8, 'polo shirt', 'purple', 'M', 50);

/*Q3 SELECT all shirts but only print out article and color*/
SELECT article, color
FROM shirts;

/*Q4 SELECT all medium shirts and print out everything but shirt_id*/
SELECT article, color, shirt_size, last_worn
from shirts;

/*Q5 Update all polo shirts Change their size to L*/
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

/*Q6 Update the shirt last worn 15 days ago change last_worn to zero ('0')*/
UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;

/*Q7 Update all white shirts and change size to 'XS' and color to 'off white'*/
UPDATE shirts
SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';

/*Q8 Delete all old shirts that were last worn 200 days ago*/
DELETE FROM shirts
where last_worn = 200;

/*Q9 Delete all tank tops. Your tastes have changed...*/
DELETE FROM shirts
where article = 'tank top';

/*Q10 Delete all shirts. You are doing some major spring cleaning!*/
DELETE FROM shirts;

/*Q11 Drop the entire shirts table. Scraping everything... you must be rich or something!*/
DROP TABLE shirts;