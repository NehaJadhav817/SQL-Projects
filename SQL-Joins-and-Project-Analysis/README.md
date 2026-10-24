# SQL Joins and Project Analysis

## Project Overview
This project demonstrates the use of SQL to manage and analyze project-related data. It includes multiple related tables for users, clients, projects, tasks, and invoices.

The project focuses on understanding table relationships, retrieving information from multiple tables, and performing project, task, and invoice analysis using SQL queries.

## Tools Used
- MySQL
- SQL
- Microsoft Excel

## Project Files
- **SQL-Joins-and-Project-Analysis.sql:** Contains database creation statements, table definitions, sample data, and SQL queries.
- **SQL-Joins-and-Project-Analysis-Documentation.xlsx:** Contains table structures and practice questions.

## Database Tables
The project uses the following tables:

- **USERS:** Stores user details, roles, creation dates, and account status.
- **CLIENTS:** Stores client names, industries, countries, and status.
- **PROJECTS:** Stores project names, client relationships, project dates, and budgets.
- **TASKS:** Stores task assignments, task status, and hours spent by users.
- **INVOICES:** Stores invoice dates, amounts, and payment statuses.

Primary keys and foreign keys are used to define relationships between the tables.

## SQL Concepts Covered
- Database and table creation
- Primary key and foreign key constraints
- Inserting and retrieving records
- Filtering data using `WHERE`
- Sorting results using `ORDER BY`
- Aggregate functions such as `COUNT()`, `SUM()`, `AVG()`, and `MAX()`
- Grouping data using `GROUP BY`
- Filtering grouped results using `HAVING`
- INNER JOIN and LEFT JOIN
- Subqueries
- UNION
- Date functions and date arithmetic
- Updating and deleting records
- Altering tables and modifying columns
- Conditional logic using `CASE`
- Window functions such as `RANK()`

## Analysis Areas
- Displaying active users
- Counting projects for each client
- Comparing project budgets with the average budget
- Analyzing task status and hours spent
- Identifying projects without tasks or invoices
- Calculating invoice totals and client-wise revenue
- Finding top revenue-generating clients
- Identifying users working on multiple projects
- Checking project completion status
- Ranking projects by invoice revenue
- Calculating each project's percentage contribution to total revenue

## Project Objectives
- Understand relationships between multiple database tables.
- Practice SQL joins to retrieve related information.
- Analyze project budgets, task assignments, and invoice data.
- Apply aggregate functions and subqueries to answer business questions.
- Develop practical SQL skills for data analysis.

## How to Run
1. Download the SQL file from this repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Execute the database and table creation statements.
4. Insert the sample data.
5. Run the SQL queries and review the results.

## Conclusion
This project provides practical experience with relational databases and SQL-based analysis. It demonstrates how joins, aggregate functions, subqueries, and other SQL concepts can be used to analyze relationships between users, clients, projects, tasks, and invoices.
