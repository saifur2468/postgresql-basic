create database Online_Bookstore ;

create table customers(
  customer_id int primary key,
first_name varchar ( 50 ),
last_name varchar  ( 50 ),
email varchar ( 100 ) unique,
city varchar ( 50 ),
country varchar  ( 50 ),
registration_date Date 
)


insert into customers(
  customer_id,
first_name ,
last_name ,
email ,
city ,
country ,
registration_date
)
values(1, 'John', 'Smith', 'john.smith@email.com', 'New York', 'USA', '2023-01-15'),
(2, 'Emma', 'Johnson', 'emma.j@email.com', 'London', 'UK', '2023-02-20'),
(3, 'Michael', 'Brown', 'mbrown@email.com', 'Toronto', 'Canada', '2023-01-10'),
(4, 'Sophia', 'Davis', 'sophia.d@email.com', 'Sydney', 'Australia', '2023-03-05'),
(5, 'James', 'Wilson', 'jwilson@email.com', 'New York', 'USA', '2023-02-28'),
(6, 'Oliver', 'Taylor', 'oliver.t@email.com', 'London', 'UK', '2023-04-12'),
(7, 'Ava', 'Anderson', 'ava.anderson@email.com', 'Los Angeles', 'USA', '2023-03-18'),
(8, 'William', 'Martinez', 'w.martinez@email.com', 'Madrid', 'Spain', '2023-01-25'),
(9, 'Isabella', 'Garcia', 'isabella.g@email.com', 'Mexico City', 'Mexico', '2023-02-14'),
(10, 'Lucas', 'Rodriguez', 'lucas.r@email.com', 'Buenos Aires', 'Argentina', '2023-03-30');

create table books(
  book_id int primary key,
title  varchar(200),
author varchar(100),
genre varchar(200),
price decimal (10 , 2 ),
publication_year int,
stock_quantity int
);

insert into books(
  book_id ,
title  ,
author ,
genre ,
price ,
publication_year ,
stock_quantity 
)
values(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '12.99', '1925', '45'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '14.99', '1960', '32'),
(3, '1984', 'George Orwell', 'Science Fiction', '13.99', '1949', '28'),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', '11.99', '1813', '50'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '12.99', '1951', '22'),
(6, 'Harry Potter and the Sorcerer Stone', 'J.K. Rowling', 'Fantasy', '19.99', '1997', '60'),
(7, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '15.99', '1937', '38'),
(8, 'Brave New World', 'Aldous Huxley', 'Science Fiction', '13.99', '1932', '25'),
(9, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '29.99', '1954', '41'),
(10, 'Animal Farm', 'George Orwell', 'Fiction', '10.99', '1945', '55'),
(11, 'Fahrenheit 451', 'Ray Bradbury', 'Science Fiction', '12.99', '1953', '30'),
(12, 'The Great Adventure', 'John Anderson', 'Fiction', '16.99', '2020', '18'),
(13, 'Mystery in Paris', 'Marie Dubois', 'Mystery', '14.99', '2019', '27'),
(14, 'Romance in Rome', 'Isabella Rossi', 'Romance', '13.99', '2021', '35')





-- Create Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);




INSERT INTO orders
(order_id, customer_id, book_id, order_date, quantity, total_amount)
VALUES
(1, 1, 1, '2023-05-10', 2, 25.98),
(2, 1, 6, '2023-05-15', 1, 19.99),
(3, 2, 3, '2023-05-12', 1, 13.99),
(4, 3, 2, '2023-05-11', 3, 44.97),
(5, 4, 7, '2023-05-13', 1, 15.99),
(6, 5, 9, '2023-05-14', 2, 59.98),
(7, 2, 4, '2023-05-16', 1, 11.99),
(8, 6, 6, '2023-05-17', 2, 39.98),
(9, 7, 1, '2023-05-18', 1, 12.99),
(10, 8, 8, '2023-05-19', 1, 13.99),
(11, 1, 10, '2023-06-01', 2, 21.98),
(12, 3, 5, '2023-06-02', 1, 12.99),
(13, 9, 11, '2023-06-03', 3, 38.97),
(14, 10, 12, '2023-06-04', 1, 16.99),
(15, 4, 13, '2023-06-05', 2, 29.98),
(16, 5, 14, '2023-06-06', 1, 13.99),
(17, 2, 6, '2023-06-07', 1, 19.99),
(18, 7, 3, '2023-06-08', 2, 27.98);

--  4Display all books with their titles and prices, ordered by price (lowest to highest)
select * from books
ORDER BY Price DESC;

select * from books
ORDER BY Price asc;


-- 1 Find all distinct countries where customers are from

select * from customers 
order by country;

-- 2 Find all books whose titles start with "The"

SELECT *
FROM books
WHERE title LIKE 'The%';



-- 3 Change the column name first_name to customer_first_name in the customers table

ALTER TABLE customers
RENAME first_name to customer_first_name  ;

--  select * from customers
-- 5  Find all books in the Fantasy genre
SELECT *
FROM books
WHERE genre = 'Fantasy';

-- 6 Count the total number of orders in the database
SELECT COUNT(*) AS total_orders
FROM orders;

--  7 Find the average price of books by genre, but only show genres with an average price greater than $14
SELECT genre,
       AVG(price) AS average_price
FROM books
GROUP BY genre
HAVING AVG(price) > 14;

-- 8  Find all customers whose email addresses end with .com and are from either USA or UK
SELECT *
FROM customers
WHERE email LIKE '%.com'
  AND country IN ('USA', 'UK');
--  9 Display all customers with their full name in uppercase (concatenated first and last name),
-- original email, and city in lowercase.
-- Only show customers from USA or UK.


SELECT 
    UPPER(customer_first_name || ' ' || last_name) AS full_name,
    email,
    LOWER(city) AS city
FROM customers
WHERE country IN ('USA', 'UK');
-- 10 Find the total revenue, average order amount, maximum order amount, and
-- minimum order amount from all orders placed in June 2023.

SELECT
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_amount,
    MAX(total_amount) AS maximum_order_amount,
    MIN(total_amount) AS minimum_order_amount
FROM orders
WHERE order_date >= '2023-06-01'
  AND order_date < '2023-07-01';