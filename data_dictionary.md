# Food Delivery Business Intelligence System

## Data Dictionary

---

# 1. Customers Table

**File:** customers.csv

**Description:** Stores customer information and demographics.

| Column Name | Data Type | Description                          |
| ----------- | --------- | ------------------------------------ |
| customer_id | String    | Unique identifier for each customer  |
| first_name  | String    | Customer first name                  |
| gender      | String    | Male or Female                       |
| city        | String    | Customer city                        |
| age         | Integer   | Customer age                         |
| signup_date | Date      | Date customer registered on platform |

**Primary Key:** customer_id

---

# 2. Restaurants Table

**File:** restaurants.csv

**Description:** Stores restaurant information.

| Column Name       | Data Type | Description                           |
| ----------------- | --------- | ------------------------------------- |
| restaurant_id     | String    | Unique identifier for each restaurant |
| restaurant_name   | String    | Restaurant name                       |
| city              | String    | Restaurant city                       |
| cuisine_type      | String    | Type of cuisine served                |
| restaurant_rating | Float     | Average restaurant rating             |
| partner_since     | Date      | Date restaurant joined platform       |

**Primary Key:** restaurant_id

---

# 3. Delivery Partners Table

**File:** delivery_partners.csv

**Description:** Stores delivery partner information.

| Column Name      | Data Type | Description                            |
| ---------------- | --------- | -------------------------------------- |
| partner_id       | String    | Unique identifier for delivery partner |
| partner_name     | String    | Delivery partner name                  |
| city             | String    | Partner operating city                 |
| vehicle_type     | String    | Bike, Scooter, or Cycle                |
| experience_years | Integer   | Years of delivery experience           |
| joining_date     | Date      | Date partner joined platform           |

**Primary Key:** partner_id

---

# 4. Orders Table

**File:** orders.csv

**Description:** Stores order transactions and operational information.

| Column Name           | Data Type | Description                    |
| --------------------- | --------- | ------------------------------ |
| order_id              | String    | Unique order identifier        |
| customer_id           | String    | Customer placing the order     |
| restaurant_id         | String    | Restaurant receiving the order |
| partner_id            | String    | Delivery partner assigned      |
| order_date            | Date      | Date of order                  |
| order_value           | Float     | Food order value (₹)           |
| company_commission    | Float     | Commission earned by company   |
| delivery_fee          | Float     | Delivery fee charged           |
| delivery_time_minutes | Integer   | Delivery duration in minutes   |
| order_status          | String    | Delivered or Cancelled         |
| customer_rating       | Float     | Rating given by customer       |

**Primary Key:** order_id

**Foreign Keys:**

* customer_id → Customers.customer_id
* restaurant_id → Restaurants.restaurant_id
* partner_id → Delivery_Partners.partner_id

---

# 5. Payments Table

**File:** payments.csv

**Description:** Stores payment transaction information.

| Column Name    | Data Type | Description                       |
| -------------- | --------- | --------------------------------- |
| payment_id     | String    | Unique payment identifier         |
| order_id       | String    | Associated order                  |
| payment_method | String    | UPI, Credit Card, Debit Card, COD |
| payment_status | String    | Success, Failed, Refunded         |
| payment_amount | Float     | Amount paid by customer           |
| payment_date   | Date      | Payment transaction date          |

**Primary Key:** payment_id

**Foreign Key:**

* order_id → Orders.order_id

---

# Entity Relationship Summary

Customers (1) → (M) Orders

Restaurants (1) → (M) Orders

Delivery Partners (1) → (M) Orders

Orders (1) → (1) Payments

---

# Project KPIs

## Revenue KPIs

* Total Order Value (GMV)
* Company Revenue
* Average Order Value (AOV)

## Customer KPIs

* Total Customers
* Repeat Customers
* Customer Retention Rate

## Restaurant KPIs

* Revenue by Restaurant
* Orders by Cuisine
* Average Restaurant Rating

## Delivery KPIs

* Average Delivery Time
* Cancellation Rate
* Delivery Partner Performance

## Payment KPIs

* Payment Success Rate
* Refund Rate
* Revenue by Payment Method
