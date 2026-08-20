 --2. Customers


Create Table Customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE,
    status VARCHAR(20)
);

EXEC sp_help 'Customers';


 --2. Restaurants


CREATE TABLE Restaurants
(
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200),
    city VARCHAR(50),
    cuisine_type VARCHAR(50),
    rating DECIMAL(2,1),
    status VARCHAR(20)
);

--3.Delivery_Partners


CREATE TABLE Delivery_Partners
(
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50),
    joining_date DATE,
    status VARCHAR(20)
);

--This query is used to check the tables list

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

--34.Deliveries

CREATE TABLE Deliveries
(
    delivery_id INT IDENTITY(1,1) PRIMARY KEY,

    order_id INT NOT NULL,

    delivery_partner_id INT NOT NULL,

    assigned_at DATETIME,
    picked_up_at DATETIME,
    delivered_at DATETIME,

    delivery_status VARCHAR(30) NOT NULL
);