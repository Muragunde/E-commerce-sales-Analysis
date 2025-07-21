# Superstore Sales SQL Analysis
This project contains a series of SQL queries performed on the sample_superstore dataset. The aim is to explore, clean, and analyze sales data using structured queries. Below is a summary of key tasks performed in the SQL script:

### Database Setup & Table Handling
Created and selected a database named sales.

Renamed table sample - superstore to sample_superstore for easier referencing.

Basic commands such as SELECT, COUNT, DESCRIBE, and EXPLAIN used to understand table structure and total records.

### Data Exploration
Counted rows with COUNT(*) and COUNT(Order ID).

Grouped data by Segment and City to find frequency distribution.

Identified duplicate entries based on Row ID.

### Sales Aggregation and Trends
Calculated monthly sales per Sub-Category.

Computed cumulative sales using SUM(...) OVER(...).

Generated running totals and moving averages of sales ordered by Order Date.

### Ranking and Filtering
Used DENSE_RANK() to find the 4th highest sales value.

Retrieved the third highest unique sales using LIMIT and OFFSET.

Queried for maximum sales, and second-highest sales using nested subqueries.

### Data Cleaning
Ensured Order Date is in proper DATE format using ALTER TABLE.

Checked for NULL values after date conversion using STR_TO_DATE().

### Conditional Aggregation
Filtered cities with more than one order using HAVING COUNT(*) > 1.

Filtered rows where sales are above average using subqueries.


# Superstore Data Warehouse Project (Star Schema)
This SQL project implements data modeling using a star schema approach to analyze sales data from the sample_superstore dataset. It separates transactional and reference data into fact and dimension tables to support efficient reporting and BI querying.

## Database: sales
All queries are executed within the sales database, which houses the following components:
CSV File : https://github.com/Muragunde/E-commerce-sales-Analysis/blob/main/Sample%20-%20Superstore.csv

## Steps Performed
1. Dimension Tables Creation
DimDate

Contains unique combinations of Order ID, Order Date, and Ship Date.

Auto-incremented surrogate key: dimdate_key.
Dimdate screenshort : 

DimCustomers

Contains customer-level details (Customer ID, Customer Name, Segment).

Auto-incremented surrogate key: dimcustkey.
Dimcustmers screenshort :

DimRegion

Includes City, State, Country, and Postal Code.

Auto-incremented surrogate key: dimregkey.

DimRegion screenshort : 

DimProducts

Stores product metadata: Product ID, Category, Sub-Category, Product Name.

Auto-incremented surrogate key: dimprodkey.
DimProducts screenshort : 


## DashBoard of E-Commerce Sales :
