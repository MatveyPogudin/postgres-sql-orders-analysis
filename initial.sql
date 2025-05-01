CREATE TABLE goods (
  good_id SERIAL PRIMARY KEY,
  good_name VARCHAR(40),
  category VARCHAR(20),
  price NUMERIC(10,2)
);

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birthday DATE,
  email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  good_id INT REFERENCES goods(good_id),
  quantity INT,
  total_sum NUMERIC(10,2)
);
