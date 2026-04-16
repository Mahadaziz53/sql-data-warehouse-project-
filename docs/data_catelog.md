1:Overview (Gold Layer – dim_customers)

👉  Table Name: gold.dim_customers

👉 Type: Dimension Table
----------------------------------------------------------------------------------------------------
👉 Purpose:
Provides a unified customer profile by integrating CRM and ERP data, used for reporting and analytics.
| Column Name             | Data Type    | Description (One Line)                                     |
| ----------------------- | ------------ | ---------------------------------------------------------- |
| customer_key            | INT          | Surrogate key generated for unique customer identification |
| customer_id             | INT          | Original customer ID from CRM system                       |
| customer_number         | NVARCHAR(50) | Business key used to link customer across systems          |
| customer_firstname      | NVARCHAR(50) | Customer's first name                                      |
| customer_lastname       | NVARCHAR(50) | Customer's last name                                       |
| customer_marital_status | NVARCHAR(50) | Customer's marital status (Single/Married)                 |
| customer_country        | NVARCHAR(50) | Customer's country from location data                      |
| gender                  | NVARCHAR(50) | Final gender value (CRM prioritized, else ERP used)        |
| customer_birthdate      | DATE         | Customer's birth date from ERP system                      |
| customer_create_date    | DATE         | Date when customer record was created     
________________________________________________________________________________________________
2: Overview (Gold Layer – dim_products)

👉 Table Name: gold.dim_products

👉 Type: Dimension Table
--------------------------------------------------------------------------------------------------
👉 Purpose:
Provides a clean and current product dimension by combining product and category data, used for reporting and analytics.
| Column Name    | Data Type    | Description (One Line)                                    |
| -------------- | ------------ | --------------------------------------------------------- |
| product_key    | INT          | Surrogate key generated for unique product identification |
| product_id     | INT          | Original product ID from source system                    |
| product_number | NVARCHAR(50) | Business key used to identify product across systems      |
| product_name   | NVARCHAR(50) | Name of the product                                       |
| category_id    | NVARCHAR(50) | Category ID used to link product with category table      |
| category       | NVARCHAR(50) | Product category name                                     |
| sub_category   | NVARCHAR(50) | Product sub-category name                                 |
| maintenance    | NVARCHAR(50) | Maintenance type of product                               |
| product_cost   | INT          | Cost of the product                                       |
| product_line   | NVARCHAR(50) | Product line classification (e.g., Mountain, Road)        |
| start_date     | DATE         | Product record effective start date                       |
___________________________________________________________________________________________________
3 : Overview (Gold Layer – fact_sales)

👉 Table Name: gold.fact_sales

👉 Type: Fact Table

👉 Purpose:
Stores sales transaction data enriched with product and customer keys, used for business reporting and analytics.
--------------------------------------------------------------------------------------------------
| Column Name   | Data Type    | Description (One Line)                    |
| ------------- | ------------ | ----------------------------------------- |
| order_number  | NVARCHAR(50) | Unique sales order identifier             |
| product_key   | INT          | Foreign key linking to product dimension  |
| customer_key  | INT          | Foreign key linking to customer dimension |
| order_date    | DATE         | Date when the order was placed            |
| shipping_date | DATE         | Date when the order was shipped           |
| due_date      | DATE         | Expected delivery date of the order       |
| sales_amount  | INT          | Total sales amount for the order          |
| quantity      | INT          | Number of items sold                      |
| price         | INT          | Price per unit of the product             |

|
