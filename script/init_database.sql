-- Create data base and Schemas

-- =====================================================
-- Script Purpose:
-- This script is used to initialize the Data Warehouse environment.
-- It performs the following operations:
-- 1. Checks if the 'DataWarehouse' database already exists
-- 2. Drops the existing database (if found) to ensure a clean setup
-- 3. Creates a new 'DataWarehouse' database
-- 4. Defines three schemas: bronze, silver, and gold
--
-- These schemas represent different layers of data processing:
-- - bronze: raw data (as received from source systems)
-- - silver: cleaned and transformed data
-- - gold: final, business-ready data for analytics and reporting


-- =====================================================

-- =====================================================
-- ⚠️ WARNING:
-- This script will permanently delete the existing 
-- 'DataWarehouse' database if it already exists.
--
-- All data inside the database will be lost.
--
-- Use this script only in development or testing environments.
-- Do NOT run this in production unless you are absolutely sure.


-- =====================================================


USE master;
 GO

 IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
 BEGIN

  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
   DROP DATABASE DataWarehouse;
END;
GO

  -- create database--
CREATE DATABASE DataWarehouse;
USE DataWarehouse;

--create schema--
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
