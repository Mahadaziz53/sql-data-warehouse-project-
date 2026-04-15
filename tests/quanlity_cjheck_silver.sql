/*
================================================================================================================
Quanlity Check
*/
-- check For nulls value;
-- Expectation : No result 

SELECT cst_id from bronze.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1 OR cst_id is null

-- DATA Standization & Consistency

SELECT DISTINCT cst_gndr   --1. Unique values dekhne ke liye Gender mein kya values hain? (M, F, etc.)
FROM bronze.crm_cust_info



-- check For nulls value;
-- Expectation : No result 
--second table 

SELECT prd_id,
COUNT (*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS null


SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm !=TRIM(prd_nm)

-- Check for Nulls or Negative Numbers
-- Expectation : No Results

SELECT prd_cost
FROM silver.crm_prd_info
where prd_cost  < 0 OR prd_cost IS NULL

-- Data Standardization &  Consistency
SELECT DISTINCT prd_line
from silver.crm_prd_info

-- Check for invalid Date Orders
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt


-- handle date validation OF 2 SECOND TABLE
SELECT 
prd_id,
prd_key,
prd_nm,
prd_start_dt,
prd_end_dt,
LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt )-1 --his query uses LEAD() to fetch the next start date for each product, allowing us to derive end dates and build time-based records.”
AS prd_end_dt_test
from bronze.crm_prd_info
where prd_key IN  ('AC-HE-HL-U509-R','AC-HE-HL-U509')
SELECT *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last --
FROM bronze.crm_cust_info  
WHERE cst_id = 29466         

SELECT
*
FROM(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last  
)t WHERE flag_last!=1



SELECT
*
FROM(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last  
FROM bronze.crm_cust_info
)t WHERE flag_last=1 AND cst_id =29466 --
