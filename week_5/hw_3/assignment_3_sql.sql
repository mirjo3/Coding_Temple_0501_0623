-- Creating 7 Tables (customer, car, payment, dealership, sales, car_service, mechanic)
CREATE TABLE customer (
	customer_id SERIAL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	customer_contact VARCHAR(20),
	car_id SERIAL
);

CREATE TABLE car (
	car_in SERIAL,
	car_name VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INT,
	car_miles NUMERIC,
	car_used BOOLEAN,
	car_invoice SERIAL
)
;

CREATE TABLE payment (
	payment_id SERIAL,
	customer_id SERIAL,
	car_invoice SERIAL,
	car_cost NUMERIC,
	service_cost NUMERIC
)
;

CREATE TABLE dealership (
	dealership_id SERIAL,
	service_id SERIAL,
	contact_number VARCHAR(20),
	customer_contact VARCHAR(20)
)
;

CREATE TABLE sales (
	sales_id SERIAL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sales_title VARCHAR(50),
	sales_info VARCHAR(20),
	car_invoice SERIAL,
	dealership_id SERIAL
)
;

CREATE TABLE car_service (
	service_id SERIAL,
	service_name VARCHAR(50),
	service_type VARCHAR(50),
	service_cost INT,
	mechanic_id SERIAL,
	car_id SERIAL
)
;

CREATE TABLE mechanic (
	mechanic_id SERIAL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	mechanic_title VARCHAR(50),
	mechanic_info VARCHAR(20),
	service_type VARCHAR(50),
	dealership_id SERIAL
)
;

--Placing 2 rows of data in each table
INSERT INTO customer VALUES
('1001', 'Mr.', 'Mister', '555-555-5555', '101'),
('1002', 'Ms.', 'Misses', '999-999-9999', '102');

INSERT INTO car VALUES
('101', 'CR-X', 'Honda', 'Civic', 1991, 300000, True, 5555),
('102', 'AE86', 'Toyota', 'Corolla', 1985, 450000, True, 6666);

 INSERT INTO payment VALUES
(999901, 1001, 861001, 3500, 5000),
(999901, 1002, 861002, 8000, 3000);

INSERT INTO dealership VALUES
(4311001, 1230001, '1-800-888-8888', '555-555-5555'),
(4311001, 1230002, '1-800-888-8888', '999-999-9999');

INSERT INTO sales VALUES
(77701, 'Ben', 'Dover', 'Sales Associate', '222-222-2222', 5555, 4311001),
(77701, 'Tom', 'Ford', 'Head of Sales', '111-111-1111', 1111, 4311001);

INSERT INTO car_service VALUES
(1230001, 'Replaced spark plugs', 'Maintenance', 3000),
(1230002, 'Replaced clutch', 'Maintenance', 5000);
 
INSERT INTO mechanic VALUES
(999998, 'Bob', 'McBobster', 'Mechanic', '123-456-7890', 'Maintenance', 4311001),
(999997, 'Big', 'Bear', 'Drag Racer', '456-789-0123', 'Maintenance', 4311001);