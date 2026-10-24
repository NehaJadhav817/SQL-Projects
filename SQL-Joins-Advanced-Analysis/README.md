# SQL Joins and Advanced Analysis

## Project Overview
This project demonstrates the use of SQL joins and advanced SQL concepts to analyze customer, product, order, order detail, and payment data.

The queries explore customer ordering patterns, product revenue, payment status, monthly revenue trends, duplicate payments, and customer activity.

## Tools Used
- MySQL
- SQL

## Project Files
- **SQL-Joins-Advanced-Analysis.sql:** Contains SQL queries for customer, product, order, and payment analysis.

## Database Tables
The project uses the following tables:

- **Customers:** Stores customer information.
- **Products:** Stores product details and prices.
- **Orders:** Stores order information, dates, and statuses.
- **Order_Details:** Stores products and quantities associated with orders.
- **Payments:** Stores payment details, dates, modes, and statuses.

These tables are connected through relationships such as customer IDs, order IDs, and product IDs.

## SQL Concepts Covered
- INNER JOIN
- LEFT JOIN
- Aggregate functions such as `COUNT()` and `SUM()`
- Grouping using `GROUP BY`
- Filtering grouped results using `HAVING`
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Conditional logic using `CASE`
- Date conversion and date functions
- Revenue calculations
- Duplicate record identification
- UNION and ranking-related concepts

## Analysis Areas
- Displaying customers and their orders
- Counting orders per customer
- Identifying customers who have never placed an order
- Finding orders without payment records
- Calculating product-wise revenue
- Identifying customers with failed or incomplete payments
- Finding customers with the highest purchase value
- Analyzing completed payments by region
- Identifying products that have never been ordered
- Finding customers who ordered from multiple product categories
- Calculating month-wise revenue trends
- Identifying duplicate payments
- Comparing customer average order values
- Finding inactive customers
- Analyzing products contributing to total revenue

## Project Objectives
- Practice SQL joins across related tables.
- Analyze customer ordering and payment behavior.
- Calculate revenue using product prices and quantities.
- Apply subqueries and window functions to solve analytical problems.
- Develop practical SQL skills for data analysis.

## How to Run
1. Download the SQL file from this repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Ensure the required database tables and sample data are available.
4. Review the database and table names used in the script.
5. Execute the queries and review their results.

**Important:** The current SQL script assumes that the customer, project/product, order, order detail, and payment tables already exist. Set up the required tables and data before running the complete script. The script also renames the `PROJECTS` table to `PRODUCTS`, so check that this operation is appropriate for your database before executing it.

## Conclusion
This project provides practical experience in using SQL to analyze customer behavior, product sales, orders, and payments. It demonstrates how joins, aggregate functions, subqueries, CTEs, and window functions can support data analysis and business decision-making.
