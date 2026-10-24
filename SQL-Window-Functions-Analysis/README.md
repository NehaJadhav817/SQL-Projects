# SQL Window Functions Analysis

## Project Overview

This project demonstrates the practical application of SQL window functions to analyze sales data using MySQL.

It focuses on ranking sales, calculating running totals, comparing customer orders, analyzing regional performance, and identifying sales trends through practical SQL queries.

## Tools Used

- MySQL
- SQL
- MySQL Workbench
- Microsoft Excel

## Project Files

- **SQL-Window-Functions-Analysis-Documentation.xlsx:** Contains the sales dataset and project-related questions.
- **SQL-Window-Functions-Analysis.sql:** Contains SQL queries and solutions for sales analysis using window functions.
- **README.md:** Provides the project overview, SQL concepts, objectives, and execution instructions.

## Database Information

The project uses a MySQL database named `windfun` and a sales dataset containing information such as:

- Order_ID
- Order_Date
- Customer_ID
- Customer_Name
- Region
- Salesperson
- Total_Amount

## SQL Concepts Covered

- Ranking functions: `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`
- Value functions: `LAG()`, `LEAD()`, `FIRST_VALUE()`, `LAST_VALUE()`
- Aggregate window functions: `SUM()`, `AVG()`, `MAX()`, `COUNT()`
- Distribution function: `NTILE()`
- Window partitioning using `PARTITION BY`
- Window ordering using `ORDER BY`
- Running totals and cumulative sales
- Moving averages
- Sales percentage calculations
- Conditional logic using `CASE`
- Subqueries and filtering ranked results

## Analysis Areas

- Ranking salespeople within each region
- Identifying the top three sales in each region
- Assigning row numbers to customer orders
- Calculating running and cumulative sales
- Comparing current, previous, and next order amounts
- Finding first and latest order amounts per customer
- Calculating regional average sales
- Analyzing three-order moving averages
- Dividing sales into quartiles
- Calculating order contribution percentages
- Identifying the highest and second-highest regional sales
- Counting customer orders
- Comparing individual orders with regional averages

## Project Objectives

- Understand SQL window functions and their practical applications.
- Analyze sales performance across regions and salespeople.
- Calculate cumulative totals and moving averages.
- Compare customer orders over time.
- Apply ranking and distribution functions.
- Develop advanced SQL querying and analytical skills.

## How to Run

1. Download or clone the repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Import the sales dataset from the Excel workbook into MySQL.
4. Ensure the database, table names, and column names match those used in the SQL script.
5. Execute the required setup statements.
6. Run the SQL queries and review the results.

## Conclusion

This project demonstrates how SQL window functions can be used to analyze sales performance, compare orders, calculate cumulative metrics, and identify patterns across customers, regions, and salespeople. It provides practical experience with advanced MySQL analytical techniques.
