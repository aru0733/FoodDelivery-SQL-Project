 --1. Customers


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

--4.Deliveries

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

-- 5. Menu Items

CREATE TABLE Menu_Items
(
    item_id INT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    calories INT,
    price DECIMAL(10,2),
    status VARCHAR(20),

    CONSTRAINT FK_MenuItems_Restaurants
        FOREIGN KEY (restaurant_id)
        REFERENCES Restaurants(restaurant_id)
);

SELECT
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fk.parent_object_id) AS ChildTable,
    OBJECT_NAME(fk.referenced_object_id) AS ParentTable
FROM sys.foreign_keys fk
WHERE OBJECT_NAME(fk.parent_object_id) = 'Menu_Items';


-- =============================================
-- 6. Orders
-- =============================================

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT FK_Orders_Restaurants
        FOREIGN KEY (restaurant_id)
        REFERENCES Restaurants(restaurant_id)
);


-- =============================================
-- 7. Order Items
-- =============================================

CREATE TABLE Order_Items
(
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT FK_OrderItems_MenuItems
        FOREIGN KEY (item_id)
        REFERENCES Menu_Items(item_id)
);



SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

-- =============================================
-- 8. Payments
-- =============================================

CREATE TABLE Payments
(
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    payment_date DATETIME NOT NULL,

    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);