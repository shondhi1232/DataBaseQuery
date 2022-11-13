
-- show all data from table--
-- SELECT * FROM customers ;

-- 1. Creating database query
CREATE DATABASE database_assignment;

-- 2. create table
CREATE TABLE customers(
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Date_of_Birth DATE,
    Phone VARCHAR(30) UNIQUE,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(40) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Points INT (50)
);

-- 2. Inserting values in the table
INSERT INTO customers (FirstName, LastName, Date_of_Birth, Phone, Address, City, State, Points)
VALUES ('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', ' CO', 2967),
('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
('Clemmie', 'Betchley', '1973-11-07','', '5 Spohn Circle', 'Arlington', 'TX',3675);


-- 4. Show only 2 members whose points are more than 1000
SELECT * FROM customers 
WHERE  (Points BETWEEN 1000 AND 3000);

--  Show members whose points are more than 1000
SELECT * FROM customers 
WHERE(Points >= 1000);

-- 5. Find the customers whose age is in 1980 to 1990 or points less than 1000
SELECT * FROM customers 
WHERE ((Date_of_Birth BETWEEN '1980-00-00' AND'1990-00-00') OR (Points < 1000));

-- 6. Order the customers by points in ascending and descending order.
SELECT * FROM customers 
ORDER BY Points ;

  -- decending order
SELECT * FROM customers 
ORDER BY Points DESC;

-- 7. Find the customer whose name contains 'burgh' using like and regexp
SELECT * FROM customers 
WHERE FirstName LIKE '%burgh%' OR LastName LIKE '%burgh%';

-- 8. Find the customer who does not have phone number
SELECT * FROM customers
WHERE phone = '';

-- 9. Change the 'Date of Birth' column name into 'dob'
ALTER TABLE customers
CHANGE COLUMN Date_of_Birth dob DATE ;

-- 10. Find the max point holder customer
SELECT * FROM customers 
WHERE Points = (SELECT MAX(Points) FROM customers );

-- 11. Execute a query for the following scenario
SELECT * ,
(CASE
  WHEN Points<1000 THEN 'The bronze member'
  WHEN (Points > 1000 AND Points < 2000) THEN 'The Silver member'
  WHEN (Points > 2000) AND (Points < 3000) THEN 'The Gold member'
  ELSE 'The Platinum member'
END ) AS Points
FROM customers;



-- if we want write the query separately--
-- 11.1--
-- SELECT Points AS bronze_member , FirstName, LastName, Phone ,Address, City
-- FROM customers
-- WHERE (Points<1000);

-- 11.2--
-- SELECT * FROM customers 
-- WHERE Points =(SELECT Points AS Silver_member
-- FROM customers
-- WHERE (Points > 1000 AND Points < 2000));

-- 11.3--
-- SELECT Points AS gold_member , FirstName, LastName , Phone ,Address, City
-- FROM customers 
-- WHERE (Points > 2000) AND (Points < 3000);

-- 11.4--
-- SELECT Points AS platinum_member , FirstName, LastName , Phone ,Address, City
-- FROM customers 
-- WHERE (Points > 3000);
