--Customer Table
CREATE TABLE customer(
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20)
);

SELECT *
FROM customer;

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;



--Salesperson Table
CREATE TABLE salesperson(
salesperson_id SERIAL PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20)
);

CREATE OR REPLACE PROCEDURE add_salesperson(
	first_name VARCHAR(20),
	last_name VARCHAR(20)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO salesperson (first_name, last_name)
	VALUES(first_name, last_name);
END
$$

SELECT *
FROM salesperson;

CALL add_salesperson('Sell', 'Objects');
CALL add_salesperson('Maximize','Profit');


--Cars Table
CREATE TABLE cars(
car_id SERIAL PRIMARY KEY,
model VARCHAR(20),
purchase_date timestamp
);

ALTER TABLE cars
ADD invoice_id integer;

SELECT *
FROM cars;

SELECT * FROM invoice;



CREATE TABLE invoice(
invoice_id SERIAL PRIMARY KEY,
amount numeric(5,0)
);

ALTER TABLE invoice
ADD customer_id INTEGER;

SELECT *
FROM invoice;


INSERT INTO invoice(amount, customer_id)
VALUES (50.00, 2);

INSERT INTO invoice(amount, customer_id)
VALUES (150.00, 1);

INSERT INTO invoice(amount, customer_id)
VALUES (50.00, 2);

CREATE TABLE mechanic(
mechanic_id SERIAL PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20)
);

SELECT *
FROM mechanic;

INSERT INTO mechanic(first_name, last_name)
values('Wrench', 'Master');

INSERT INTO mechanic(first_name, last_name)
values('Bad', 'Repair');


CREATE TABLE service(
service_Id SERIAL PRIMARY KEY,
work_done VARCHAR(20),
work_date timestamp
);

ALTER TABLE service
ADD mechanic_id INTEGER;

SELECT *
FROM service;

SELECT * FROM cars;

ALTER TABLE service
ADD car_id INTEGER;

INSERT INTO mechanic(first_name, last_name)
values('Bad', 'Repair');

INSERT INTO service(work_done, work_date, mechanic_id, car_id)
VALUES ('New horseshoes', '2008-11-11 13:23:44', 2, 2)

INSERT INTO service(work_done, work_date, mechanic_id, car_id)
VALUES ('New time machine', '2099-11-11 13:23:44', 2, 4)


SELECT *
FROM service;


SELECT *
FROM customer;

CREATE OR REPLACE PROCEDURE customer_info()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE customer 
	SET loyalty_member = TRUE 
	WHERE customer_id IN (
		SELECT customer_id
		FROM payment
		GROUP BY customer_id 
		HAVING SUM(amount) >= 100
	);
END;
$$

UPDATE cars 
SET invoice_id = 1
WHERE car_id = 1;

UPDATE cars 
SET invoice_id = 2
WHERE car_id = 2;

UPDATE cars 
SET invoice_id = 3
WHERE car_id = 3;

SELECT * 
FROM cars;

-- Create a procedure that takes in arguments
CREATE OR REPLACE PROCEDURE add_customer(
	first_name VARCHAR(20),
	last_name VARCHAR(20)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO customer(first_name, last_name)
	VALUES(first_name, last_name);
END
$$

SELECT *
FROM invoice;

CALL add_customer('Alpha', 'Beta');
CALL add_customer('Firstie','Lastie')

INSERT INTO cars(model, purchase_date)
VALUES ('Speed Demon', NOW());

INSERT INTO cars(model, purchase_date)
VALUES ('Horsemaster', '1852-06-06 18:12:12.851');

INSERT INTO cars(model, purchase_date, invoice_id)
VALUES ('Timex', NULL, 4)

SELECT * FROM cars;

SELECT * FROM service;

INSERT INTO invoice(amount, customer_id)
VALUES (2000,1)

ALTER TABLE invoice
ADD salesperson_id INTEGER;

UPDATE invoice
SET salesperson_id = 1
WHERE customer_id = 1;

UPDATE invoice
SET salesperson_id = 2
WHERE customer_id = 2;
