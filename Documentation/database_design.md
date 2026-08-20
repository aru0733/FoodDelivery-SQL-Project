# Database Design

## Tables

For this project I decided to use separate tables for customers,
restaurants, menu items, orders, payments, deliveries and reviews.

I separated the information instead of keeping everything in one
large table because the same customer and restaurant information
would otherwise be repeated many times.

## Customers

Stores information about customers.

Primary Key:
- customer_id

## Restaurants

Stores information about restaurants.

Primary Key:
- restaurant_id

## Menu_Items

Stores the food items available at each restaurant.

Primary Key:
- item_id

Foreign Key:
- restaurant_id → Restaurants

## Orders

Stores the main information about each order.

Primary Key:
- order_id

Foreign Keys:
- customer_id → Customers
- restaurant_id → Restaurants

## Order_Items

Stores the individual food items included in an order.

Primary Key:
- order_item_id

Foreign Keys:
- order_id → Orders
- item_id → Menu_Items

I created this table because one order can contain multiple
food items.

## Payments

Stores payment information for orders.

Primary Key:
- payment_id

Foreign Key:
- order_id → Orders

## Delivery_Partners

Stores information about delivery partners.

Primary Key:
- partner_id

## Deliveries

Stores delivery information for orders.

Primary Key:
- delivery_id

Foreign Keys:
- order_id → Orders
- partner_id → Delivery_Partners

## Reviews

Stores customer reviews for restaurants.

Primary Key:
- review_id

Foreign Keys:
- customer_id → Customers
- restaurant_id → Restaurants
- order_id → Orders
----------------------------------------------------------------------------------------------------------------------------
## Customers Table

The Customers table stores the basic information of people who
use the food delivery platform.

Columns:

- customer_id - unique ID for each customer
- customer_name - customer's name
- email - customer's email address
- phone - customer's phone number
- city - customer's city
- registration_date - date the customer registered
- status - current customer status

The customer_id is the primary key because each customer needs
a unique identifier.

I used NOT NULL for customer_name because a customer record
should have a name.

I used UNIQUE for email so that the same email cannot be used
for multiple customer records.
------------------------------------------------------------------------------------------------------------------------------------
## Restaurants Table

The Restaurants table stores information about restaurants
available on the platform.

Columns:

- restaurant_id - unique ID of the restaurant
- restaurant_name - name of the restaurant
- phone - restaurant contact number
- address - restaurant address
- city - restaurant city
- cuisine_type - type of food served
- rating - restaurant rating
- status - current restaurant status

The restaurant_id is the primary key.
------------------------------------------------------------------------------------------------------------------------------------

## Delivery_Partners Table

The Delivery_Partners table stores information about people
who deliver orders.

Columns:

- partner_id - unique ID of the delivery partner
- partner_name - partner's name
- phone - contact number
- city - city where the partner operates
- joining_date - date the partner joined
- status - current partner status

The partner_id is the primary key.


------------------------------------------------------------------------------------------------------------------------------------

## Menu_Items Table

The Menu_Items table stores the food items offered by each
restaurant.

Columns:

- item_id - unique ID of the menu item
- restaurant_id - identifies the restaurant offering the item
- item_name - name of the food item
- category - category of the item
- calories - approximate calories in the item
- price - selling price of the item
- status - current availability/status of the item

The item_id is the primary key.

The restaurant_id is a foreign key referencing the
Restaurants table.

Relationship:

Restaurants 1 ---- M Menu_Items

One restaurant can have many menu items.
------------------------------------------------------------------------------------------------------------------------------------

## Orders Table

The Orders table stores information about orders placed by
customers.

Columns:

- order_id - unique ID of the order
- customer_id - identifies the customer who placed the order
- restaurant_id - identifies the restaurant receiving the order
- order_date - date and time when the order was placed
- order_status - current status of the order
- total_amount - total value of the order

The order_id is the primary key.

The customer_id is a foreign key referencing Customers.

The restaurant_id is a foreign key referencing Restaurants.

Relationships:

Customers 1 ---- M Orders

Restaurants 1 ---- M Orders

------------------------------------------------------------------------------------------------------------------------------------


## Order_Items Table

The Order_Items table stores the individual menu items included
in each customer order.

An order can contain multiple items, so order details are stored
separately from the Orders table.

Columns:

- order_item_id - unique ID for the order item record
- order_id - identifies the order
- item_id - identifies the menu item
- quantity - number of units ordered
- unit_price - price of the item at the time of the order

The order_item_id is the primary key.

The order_id is a foreign key referencing Orders.

The item_id is a foreign key referencing Menu_Items.

Relationship:

Orders 1 ---- M Order_Items

Menu_Items 1 ---- M Order_Items

------------------------------------------------------------------------------------------------------------------------------------
## Payments Table

The Payments table stores payment information for customer orders.

Columns:

- payment_id - unique ID of the payment
- order_id - identifies the order associated with the payment
- payment_method - method used to make the payment
- amount - amount paid
- payment_status - current status of the payment
- payment_date - date and time of the payment

The payment_id is the primary key.

The order_id is a foreign key referencing the Orders table.

For this project, each order has one payment record.

Relationship:

Orders 1 ---- 1 Payments

------------------------------------------------------------------------------------------------------------------------------------
## Reviews Table

The Reviews table stores customer feedback for restaurants
after an order.

Columns:

- review_id - unique ID of the review
- customer_id - customer who submitted the review
- restaurant_id - restaurant being reviewed
- order_id - order associated with the review
- rating - rating given by the customer
- review_text - written feedback
- review_date - date and time of the review

The review_id is the primary key.

customer_id, restaurant_id and order_id are foreign keys.

Relationships:

Customers 1 ---- M Reviews

Restaurants 1 ---- M Reviews

Orders 1 ---- M Reviews