# SQL Mixed Clauses

## Project Overview
This project demonstrates the application of multiple SQL clauses and functions to analyze sales data. It includes queries for sales performance analysis, revenue comparisons, product analysis, customer spending, and salesperson performance.

The project uses a sales dataset containing order dates, regions, countries, customers, products, categories, salespersons, quantities, unit prices, discounts, and revenue.

## Tools Used
- MySQL
- SQL
- Microsoft Excel

## Project Files
- **SQL-Mixed-Clauses-Documentation.xlsx:** Contains the database table structure, sample sales data, and SQL questions.
- **SQL-Mixed-Clauses.sql:** Contains the database creation statements, sample data insertion queries, and SQL solutions.

## Database Information
The project uses a `Sales_Data` table containing the following columns:
- OrderID
- OrderDate
- Region
- Country
- Customer
- Product
- Category
- SalesPerson
- Quantity
- UnitPrice
- Discount
- Revenue

The dataset contains 100 sample sales records.

## SQL Concepts Covered
- Database and table creation
- Data insertion and retrieval
- Filtering using `WHERE`
- Grouping using `GROUP BY`
- Filtering grouped results using `HAVING`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `MAX()`, and `MIN()`
- Sorting using `ORDER BY`
- Limiting results using `LIMIT`
- Subqueries and nested queries
- Conditional aggregation using `CASE`
- Removing duplicates using `DISTINCT`
- Date-based filtering and monthly analysis
- Calculating revenue and discount amounts
- Correlated subqueries
- Window functions such as `LAG()` and `RANK()`

## Analysis Areas
- Top products by revenue
- Salesperson performance and sales quantity
- Revenue analysis by region and country
- Customer spending and average order value
- Product and category comparisons
- Monthly sales trends
- Revenue contribution percentages
- Discount analysis
- Salesperson revenue rankings
- Product quantity and sales performance

## Project Objectives
- Apply multiple SQL clauses in practical scenarios.
- Analyze sales data using aggregate functions.
- Use subqueries to compare sales performance.
- Calculate revenue contributions and discount amounts.
- Explore product, customer, regional, and salesperson performance.
- Understand advanced SQL techniques for data analysis.

## How to Run
1. Download the SQL file from this repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Execute the database and table creation statements.
4. Insert the sample sales data.
5. Run the SQL queries and review their results.

Some queries use window functions and require a compatible MySQL version, such as MySQL 8.0 or later.

## Conclusion
This project demonstrates how SQL can be used to analyze sales data through filtering, aggregation, subqueries, conditional logic, and window functions. It provides practical examples of combining SQL techniques to answer business-related questions.




