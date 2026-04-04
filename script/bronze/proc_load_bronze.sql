/*
====================================================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze)
===================================================================================================================
Script Purpose:
   This stored procedure loads data into the 'Bronze' schema from external CSV files.
   It performs the following actions:
   - Truancate the bronze tables before loading data.
   - uses the 'BULK Inserts ' Commnad to load data from CSV files to Bronze tables.

 Parameters:
   None.
  This stored procedure does not any parameter or return any values.

 Usage Example:
   EXEC bronze.load_bronze;
=========================================================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze as --A stored procedure like `CREATE OR ALTER PROCEDURE bronze.load_bronze` creates a reusable block of SQL code that can be executed to perform tasks such as loading data into tables.
BEGIN 
   DECLARE @start_time DATETIME ,@end_time DATETIME,@batch_start_time DATETIME , @batch_end_time DATETIME; -- Declaring two variables to store the start and end time of the procedure execution .
   BEGIN TRY 
        SET @batch_start_time = GETDATE(); -- Capture the start time of the Data loading process
        PRINT '=========================================';
        PRINT 'Loading Bronze Layer ' 
        print '=========================================';

        print '______________________________________';
        print 'Loading CRM Tables';
        print '----------------------------------------';

        SET @start_time = GETDATE(); -- Capture the start time of the TABLE loading process
        print 'Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info; -- Clear existing data from the table

        print '>> Inserting data into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
       WITH (
         FIRSTROW=2, -- Skip the header row
         FIELDTERMINATOR=',', -- Specify the field delimiter
         TABLOCK  -- Table lock for better performance
         );
         SET @end_time = GETDATE(); -- Capture the end time of the TABLE loading process
         PRINT '>> Loading duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds';
         print '-----------------------------------------';

        SET @start_time =GETDATE();    
        print 'Truncating table :bronze.crm_prd_info ' 
        TRUNCATE TABLE bronze.crm_prd_info;
        print '>> Inserting data into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
           FIRSTROW=2, -- Skip the header row
           FIELDTERMINATOR=',', -- Specify the field delimiter
            TABLOCK  -- Table lock for better performance
            );
            SET @end_time = GETDATE();
            PRINT '>> Loadinf duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds';
            print '----------------------------------------';


            SET @start_time = GETDATE();
            print 'Truncating table :bronze.crm_sales_details ';

         TRUNCATE TABLE bronze.crm_sales_details;;
         print '>> Inserting data into: bronze.crm_sales_details';
         BULK INSERT bronze.crm_sales_details
         FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
         WITH (
           FIRSTROW=2, -- Skip the header row
           FIELDTERMINATOR=',', -- Specify the field delimiter
           TABLOCK  -- Table lock for better performance
           );
           SET @end_time = GETDATE();
           PRINT '>> Loadinf duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds';
           print '---------------------------------';

           print '_________________________________________';
           print 'Loading ERP Tables';
           print '-----------------------------------------';

           SET @start_time = GETDATE();
           print 'Truncating the Table  bronze.erp_loc_a101: '
           TRUNCATE TABLE bronze.erp_loc_a101;

           print '>> Inserting data into: bronze.erp_loc_a101';
           BULK INSERT bronze.erp_loc_a101
           FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
           WITH (
              FIRSTROW=2, -- Skip the header row
              FIELDTERMINATOR=',', -- Specify the field delimiter
               TABLOCK  -- Table lock for better performance
               );
               SET @end_time = GETDATE();
               PRINT '>> Loading duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds'; -- Calculate and print the duration of the TABLE loading process
               PRINT '-----------------------------';

              SET @start_time = GETDATE();
              print 'Truncating the Table  bronze.erp_cust_az12: '
              TRUNCATE TABLE bronze.erp_cust_az12;
              print '>> Inserting data into: bronze.erp_cust_az12';
              BULK INSERT bronze.erp_cust_az12
              FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
              WITH (
                  FIRSTROW=2, -- Skip the header row
                  FIELDTERMINATOR=',', -- Specify the field delimiter 
                  TABLOCK  -- Table lock for better performance
                  );

                  SET @end_time = GETDATE();
                  PRINT '>> Loading duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds';


               print 'Truncating the Table  bronze.erp_px_cat_g1v2: ';
               SET @start_time = GETDATE();

               TRUNCATE TABLE bronze.erp_px_cat_g1v2;
               print '>> Inserting data into: bronze.erp_px_cat_g1v2';
               BULK INSERT bronze.erp_px_cat_g1v2
               FROM 'C:\Users\mahad aziz\Desktop\sql real world project\dbc9660c89a3480fa5eb9bae464d6c07 (2)\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
               WITH (
                  FIRSTROW=2, -- Skip the header row
                  FIELDTERMINATOR=',', -- Specify the field delimiter
                  TABLOCK  -- Table lock for better performance
                  );
                  SET @end_time = GETDATE();;
                  PRINT '>> Loading duration:' + CAST(DATEDIFF(SECOND, @start_time, @end_time ) AS NVARCHAR) + ' seconds';
                  print '-----------------------------------------';

                  SET @batch_end_time = GETDATE(); ;
                  PRINT '==========================================';
                  PRINT 'Bronze Layer Loaded Successfully';
                  PRINT 'Total loading duration:' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time ) AS NVARCHAR) + ' seconds'; -- Calculate and print the total duration of the Data loading procesS
                  PRINT '==========================================';
   END TRY
   BEGIN CATCH -- Handle any errors that occur during the execution of the TRY block
      PRINT'==========================================';
      PRINT 'Error OCCURED DURING LOADING BRONZE LAYER';
      PRINT 'Error message '+ ERROR_MESSAGE(); -- Display the error message
      PRINT 'Error message'+ CAST(ERROR_NUMBER() AS NVARCHAR(50));-- Display the error number
      PRINT 'Error message'+ CAST(ERROR_SEVERITY() AS NVARCHAR(50));-- Display the error severity
      PRINT '=========================================';
  END CATCH
 END





