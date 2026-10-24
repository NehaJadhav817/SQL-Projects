# SQL Group By and Having

## Project Overview
This project demonstrates the use of SQL aggregate functions, GROUP BY, and HAVING clauses to analyze sales data.

The project uses a sales dataset containing information about order dates, regions, countries, products, categories, salespersons, quantities, unit prices, discounts, and revenue.

SQL queries are used to summarize sales performance, compare revenue, calculate quantities, and analyze sales across different categories.

## Tools Used
- MySQL
- SQL
- Microsoft Excel

## Project Files
- **SQL-Group-By-and-Having-Documentation.xlsx:** Contains the sales table structure and SQL questions.
- **SQL-Group-By-and-Having.sql:** Contains the SQL statements, sample sales data, and query solutions.

## Database Information
The project uses a Sales table with the following columns:
- SaleID
- OrderDate
- Region
- Country
- Product
- Category
- Saleperson
- Quantity
- UnitPrice
- Discount
- Revenue

The table contains 30 sample sales records.

## SQL Concepts Covered
- Database creation using `CREATE DATABASE`
- Table creation using `CREATE TABLE`
- Data insertion using `INSERT INTO`
- Data retrieval using `SELECT`
- Aggregate functions such as `SUM()`, `COUNT()`, `AVG()`, `MAX()`, and `MIN()`
- Grouping records using `GROUP BY`
- Filtering grouped results using `HAVING`
- Filtering records using `WHERE`
- Sorting results using `ORDER BY`
- Removing duplicate values using `DISTINCT`
- Limiting results using `LIMIT`
- Date-based filtering
- Combining filtering, grouping, and sorting in SQL queries

## Analysis Areas
- Total revenue by region
- Number of sales by product
- Total quantity sold by category
- Average unit price by product
- Number of orders by salesperson
- Maximum revenue by country
- Minimum discount by category
- Revenue by product and category
- Product quantity comparisons
- Salesperson performance analysis
- Revenue and quantity analysis using filtering conditions
- Top-performing and lowest-performing regions

## Project Objectives
- Understand how `GROUP BY` organizes records into groups.
- Use aggregate functions to summarize sales data.
- Apply `HAVING` to filter grouped results.
- Analyze revenue, quantity, discounts, and sales performance.
- Combine SQL clauses to answer business-related questions.

## How to Run
1. Download the SQL file from this repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Execute the database creation and table creation statements.
4. Insert the sample sales records.
5. Run the SQL queries in order and review the results.

## Conclusion
This project demonstrates how SQL aggregation and grouping can be used to summarize sales data and explore business performance across products, regions, countries, categories, and salespersons.
