-- Create customer table
CREATE TABLE customer
(customer_id serial,
first_name varchar(100),
last_name varchar(100),
address varchar(150),
billing_info varchar(150)
)

-- Create concessions table
CREATE TABLE concessions
(item_id serial,
item_cost numeric,
item_name varchar(100),
amount int
)

-- Create ticket table
CREATE TABLE tickets
(ticket_id serial,
 order_id serial
)

-- Create movie table
CREATE TABLE movie
(movie_id serial,
 title varchar(100),
 year int,
 genre varchar(100)
)
