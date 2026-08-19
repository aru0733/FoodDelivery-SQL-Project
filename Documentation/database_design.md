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