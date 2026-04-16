-- gold.dim_customer:
CREATE VIEW gold.dim_customers AS  -- This is veiw
SELECT
ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
ci.cst_id As Customer_id,
ci.cst_key AS Customer_number,
ci.cst_firstname AS Customer_firstname,
ci.cst_lastname AS Customer_lastname,
ci.cst_material_status AS Customer_marital_status,
la.cntry AS Customer_country,
CASE WHEN ci.cst_gndr!='n/a' THEN ci.cst_gndr -- CRM is the master for gender info
   ELSE COALESCE(ca.gen,'n/a')
END AS Gender,
ca.bdate As Customer_birthdate,
ci.cst_create_date as Customer_create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca 
ON      ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON      ci.cst_key = la.cid

-- gold.dim_products
CREATE VIEW gold.dim_products AS
SELECT 
ROW_NUMBER() OVER (order BY pn.prd_start_dt,pn.prd_key) AS product_key, 
pn.prd_id AS Product_id,
pn.prd_key AS Product_number, 
pn.prd_nm AS Product_name,
pn.cat_id AS Category_id,
pc.cat AS  Category,
pc.subcat AS Sub_Category,
pc.maintenacne AS Maintenance,
pn.prd_cost AS Product_cost,
pn.prd_line AS Product_line,
pn.prd_start_dt AS Start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON     pn.cat_id =pc.id
WHERE prd_end_dt IS NUll   -- Filter out all historical data

-- gold_fact_sales
CREATE VIEW gold.fact_sales AS
SELECT 
sd.sls_ord_num AS Order_Number,
pr.product_key,
cu.customer_key,
sd.sls_order_dt AS Order_date,
sd.sls_ship_dt AS shipping_date,
sd.sls_due_dt AS Due_date,
sd.sls_sales AS Sales_amount,
sd.sls_quantity AS Quantity,
sd.sls_price AS price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu
ON sd.sls_cust_id=cu.customer_id


