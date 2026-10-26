# SQL E-commerce Subquery Analysis

## Project Overview
This project focuses on analyzing e-commerce data using SQL subqueries and advanced query techniques. It explores product pricing, customer purchasing behavior, employee performance, order values, revenue trends, and payment-related patterns.

The project uses customer, product, employee, and order data to solve business-oriented SQL questions of increasing difficulty.

## Tools Used
- MySQL
- SQL
- Microsoft Excel

## Project Files
- **SQL-Ecommerce-Subquery-Analysis.sql:** Contains SQL queries for e-commerce data analysis.
- **SQL-Ecommerce-Subquery-Documentation.xlsx:** Contains the data tables and SQL practice questions.

## Dataset Information
The Excel workbook contains the following sheets:

- **Orders_Fact:** Contains order-level information, including customer details, product information, order dates, revenue, profit, and order status.
- **Customers:** Contains customer details, regions, cities, signup dates, and loyalty tiers.
- **Products:** Contains product names, categories, sub-categories, costs, and prices.
- **Employees:** Contains employee details, regions, and hiring dates.
- **Questions:** Contains SQL questions arranged by increasing difficulty.

## SQL Concepts Covered
- Scalar and correlated subqueries
- Subqueries with `IN`, `ALL`, and `ANY`
- `EXISTS` and `NOT EXISTS`
- Aggregate functions such as `SUM()`, `AVG()`, `COUNT()`, `MAX()`, and `MIN()`
- Filtering with `WHERE` and `HAVING`
- Common Table Expressions (CTEs)
- Derived tables and nested subqueries
- Window functions such as `ROW_NUMBER()`
- Conditional aggregation using `CASE`
- Revenue calculations and percentage-based analysis
- Date functions and date conversion
- `UNION ALL`
- Customer and product performance analysis

## Analysis Areas
- Identifying products priced above the average product price
- Finding customers who purchased Electronics products
- Identifying orders with the highest net amount
- Finding products that have never been ordered
- Calculating customer lifetime spending
- Identifying the most expensive product in each category
- Analyzing employee profit generation
- Finding customers who purchased from multiple categories
- Calculating regional return rates
- Comparing order values with customer averages
- Identifying inactive customers
- Analyzing revenue by category and month
- Identifying high-value and VIP customers
- Finding products contributing to revenue
- Comparing product prices across categories

## Project Objectives
- Practice SQL subqueries using practical e-commerce scenarios.
- Analyze customer purchasing behavior and spending patterns.
- Evaluate product pricing and revenue performance.
- Apply correlated subqueries, CTEs, and window functions.
- Develop problem-solving skills for data analysis using SQL.

## How to Run
1. Download the SQL file and Excel workbook from this repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Prepare the database tables using the data and table structures provided in the workbook.
4. Ensure that the database and table names match those used in the SQL script.
5. Execute the queries and review their results.

**Note:** The SQL script assumes that the required database tables already exist. Prepare the tables and load the data before running the analytical queries. Some queries use advanced SQL features that require MySQL 8.0 or later.

## Conclusion
This project demonstrates how SQL subqueries and advanced query techniques can be used to analyze e-commerce data. It provides practical experience in evaluating customer behavior, product pricing, sales performance, and revenue patterns.
