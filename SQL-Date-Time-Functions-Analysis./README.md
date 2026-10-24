# SQL Date & Time Functions Analysis

## Project Overview

This project demonstrates the use of MySQL date and time functions to analyze sales orders and employee attendance data.

It covers date calculations, sales trends, order delivery timelines, customer purchasing patterns, and employee working hours using practical SQL queries.

## Tools Used

- MySQL
- SQL
- MySQL Workbench
- CSV files

## Project Files

- **sql-date-time-functions-analysis.sql:** Contains database creation, data import, data cleaning, and SQL query solutions.
- **README.md:** Provides project details, SQL concepts, and execution instructions.

**Note:** The SQL script requires external CSV files: `Book1.csv` and `attendence_data.csv`.

## Database Information

The project uses a MySQL database named `FUNCTIONS` with two tables:

- **Order_Data:** Order IDs, dates, times, customer details, region, order status, shipment dates, delivery dates, and total amounts.
- **Attendance_Data:** Employee IDs, names, departments, login dates, login times, and logout times.

## SQL Concepts Covered

- Database and table creation
- Data import and data cleaning
- Date conversion using `STR_TO_DATE()`
- Date and time functions: `YEAR()`, `MONTH()`, `MONTHNAME()`, `QUARTER()`, `DAYNAME()`, `WEEK()`, `DATEDIFF()`, `TIMESTAMPDIFF()`, and `HOUR()`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `MIN()`, and `MAX()`
- `GROUP BY`, `WHERE`, `ORDER BY`, `DISTINCT`, and `LIMIT`
- Joins, subqueries, and conditional logic using `CASE`
- Window functions using `LAG()`

## Analysis Areas

- Monthly and yearly order analysis
- Current-year and previous-year sales
- Delivery and shipment time calculations
- Weekend orders and peak order hours
- Quarterly and cumulative sales analysis
- Year-over-year sales growth
- Customer ordering patterns
- Financial year analysis (April–March)
- Employee working hours and late logins
- Department-wise attendance analysis
- Consecutive employee attendance days

## Project Objectives

- Understand MySQL date and time functions.
- Analyze sales and delivery performance.
- Calculate sales metrics and identify trends.
- Evaluate employee attendance and working hours.
- Practice aggregate functions, joins, subqueries, and window functions.

## How to Run

1. Download or clone the repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Obtain the required CSV files.
4. Update the file paths in the `LOAD DATA INFILE` statements.
5. Execute the database and table creation statements.
6. Import the data and run the data cleaning queries.
7. Execute the SQL queries and review the results.

## Conclusion

This project demonstrates how MySQL date and time functions support practical business analysis of sales orders, delivery performance, customer purchasing patterns, and employee attendance. It builds SQL skills in data transformation, calculations, and advanced querying techniques.
