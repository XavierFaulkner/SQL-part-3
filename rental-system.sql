USE `rental_db`;

-- Q1 Customer 'Angel' has rented 'SBA1111A' from today for 10 days. (Hint: You need to insert a rental record. Use a SELECT subquery to get the customer_id to do this you will need to use
-- parenthesis for your subquery as one of your values. Use CURDATE() (or NOW()) for today, and DATE_ADD(CURDATE(), INTERVAL x unit) to compute a future date.)
INSERT INTO rental_records 
VALUES (NULL, 'SBA1111A', (SELECT customer_id FROM customers WHERE name = 'Angel'), CURRENT_DATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY), NULL);

-- Q2 Customer 'Kumar' has rented 'GA5555E' from tomorrow for 3 months.
INSERT INTO rental_records 
VALUES (NULL, 'GA5555E', (SELECT customer_id FROM customers WHERE name = 'Kumar'), CURRENT_DATE() + 1, DATE_ADD(CURRENT_DATE() + 1, INTERVAL 3 MONTH), NULL);

-- Q3 List all rental records (start date, end date) with vehicle's registration number, brand, and customer name, sorted by vehicle's categories followed by start date.
SELECT rr.start_date, rr.end_date, rr.veh_reg_no, v.brand, name
FROM rental_records AS rr
JOIN customers AS c
USING (customer_id)
JOIN vehicles AS v
USING (veh_reg_no)
ORDER BY v.category, rr.start_date;

-- Q4 List all the expired rental records (end_date before CURDATE()).
SELECT * FROM rental_records
WHERE end_date < CURRENT_DATE();

-- Q5 List the vehicles rented out on '2012-01-10' (not available for rental), in columns of vehicle registration no, customer name, start date and end date. (Hint: the given date is in between the start_date and end_date.)
SELECT veh_reg_no, name, start_date, end_date
FROM rental_records
JOIN customers
using (customer_id)
WHERE start_date < DATE('2012-01-10') AND end_date > DATE('2012-01-10');

-- Q6 List all vehicles rented out today, in columns registration number, customer name, start date, end date.
SELECT veh_reg_no, name, start_date, end_date
FROM rental_records
JOIN customers
using (customer_id)
WHERE start_date = CURRENT_DATE();

-- Q7 Similarly, list the vehicles rented out (not available for rental) for the period from '2012-01-03' to '2012-01-18'. (Hint: start_date is inside the range; or end_date is inside the range; or start_date is before the range and end_date is beyond the range.)
SELECT veh_reg_no, name, start_date, end_date
FROM rental_records
JOIN customers
using (customer_id)
WHERE (start_date > DATE('2012-01-03') AND start_date < DATE('2012-01-18')) OR (end_date > DATE('2012-01-03') AND end_date < DATE('2012-01-18')) OR (start_date < DATE('2012-01-03') AND end_date > DATE('2012-01-18'));

-- Q8 List the vehicles (registration number, brand and description) available for rental (not rented out) on '2012-01-10' (Hint: You could use a subquery based on a earlier query).
SELECT DISTINCT veh_reg_no, brand, v.desc
FROM rental_records
JOIN vehicles AS v
USING (veh_reg_no)
WHERE start_date > DATE('2012-01-10') OR end_date < DATE('2012-01-10');

-- Q9 Similarly, list the vehicles available for rental for the period from '2012-01-03' to '2012-01-18'.
SELECT DISTINCT veh_reg_no, brand, v.desc
FROM rental_records
JOIN vehicles AS v
USING (veh_reg_no)
WHERE start_date > DATE('2012-01-18') OR end_date < DATE('2012-01-03');

-- Q10 Similarly, list the vehicles available for rental from today for 10 days.
SELECT DISTINCT veh_reg_no, brand, v.desc
FROM rental_records
JOIN vehicles AS v
USING (veh_reg_no)
WHERE start_date > CURRENT_DATE() + 10 OR end_date < CURRENT_DATE();