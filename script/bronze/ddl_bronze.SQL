/*
================================================================================================================
DDL Script : Create Bronze Tables
================================================================================================================

Scrpit Purpose :
   This script creates tables in the 'Bronze' schema, dropping existing tables if they already exists.
   Run this script to re-define the DDL structure of 'bronze' Tables
=======================================================================================================================
*/

IF OBJECT_ID ('bronze.crm_cust_info','U') is not null
DROP TABLE bronze.crm_cust_info; -- Drop table if exists

CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_data DATE

);


IF OBJECT_ID ('bronze.crm_prd_info','U') is not null
DROP TABLE bronze.crm_prd_info; -- Drop table if exists

CREATE TABLE bronze.crm_prd_info(
prd_id  INT,
prd_key  NVARCHAR(50),
prd_nm   NVARCHAR(50),
prd_cost Int,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME


);


IF OBJECT_ID ('bronze.crm_sales_details','U') is not null
DROP TABLE bronze.crm_sales_details; -- Drop table if exists

CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT

);


IF OBJECT_ID ('bronze.erp_loc_a101','U') is not null
DROP TABLE bronze.erp_loc_a101; -- Drop table if exists

CREATE  TABLE bronze.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_cust_az12','U') is not null
DROP TABLE bronze.erp_cust_az12; -- Drop table if exists

CREATE TABLE bronze.erp_cust_az12(
cid NVARCHAR (50),
bdate DATE,
gen NVARCHAR (50)

);	

IF OBJECT_ID ('bronze.erp_px_cat_giv2','U') is not null
DROP TABLE bronze.erp_px_cat_giv2; -- Drop table if exists

CREATE TABLE bronze.erp_px_cat_g1v2(
id   NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenacne NVARCHAR(50)
);


SELECT * FROM sys.schemas WHERE name = 'bronze'; -- check schema is exit or not .

SELECT * FROM INFORMATION_SCHEMA.TABLES; -- check it in which database tabel is created.


USE DataWarehouse;
GO
