# SQL Functions Analysis

## Project Overview

This project demonstrates the practical use of SQL functions to analyze employee data using MySQL.

It covers employee service duration, age calculation, salary analysis, sales performance, employee status, contact information, and department-wise statistics through practical SQL queries.

## Tools Used

- MySQL
- SQL
- MySQL Workbench
- Microsoft Excel

## Project Files

- **employee-sales-dataset-and-sql-questions.xlsx:** Contains the employee dataset and SQL practice questions.
- **sql-functions-practice-and-analysis.sql:** Contains SQL queries and solutions covering various SQL functions.
- **README.md:** Provides the project overview, concepts, objectives, and execution instructions.

## Database Information

The project uses a database named `functions_adv` and an employee dataset containing the following columns:

- Employee_ID
- First_Name
- Last_Name
- Department
- Hire_Date
- Birth_Date
- Salary
- Bonus_Pct
- Sales_Amount
- Region
- Email
- Phone
- Status

## SQL Concepts Covered

- Date and time functions: `YEAR()`, `MONTH()`, `DAYNAME()`, `CURDATE()`, `TIMESTAMPDIFF()`
- String functions: `CONCAT()`, `UPPER()`, `LEFT()`, `REPLACE()`, `SUBSTRING_INDEX()`
- Conditional logic using `CASE`
- Handling NULL values using `COALESCE()`
- Aggregate functions: `COUNT()`, `AVG()`, `SUM()`
- Mathematical functions: `ROUND()`, `ABS()`, `CEILING()`
- Grouping using `GROUP BY`
- Combining results using `UNION ALL`
- Window functions: `RANK()` and `AVG() OVER()`
- Salary ranking, compensation analysis, and conditional aggregation

## Analysis Areas

- Employee age and years of service
- Hiring date and weekday analysis
- Salary and compensation bands
- Employee performance tiers based on sales
- Active and inactive employee analysis
- Department-wise employee statistics
- Email username and phone number formatting
- Annual compensation calculations
- Sales contribution percentages
- Salary variance and standard deviation
- Employee salary ranking within departments

## Project Objectives

- Understand and apply different MySQL functions.
- Perform employee and salary analysis using SQL.
- Practice string manipulation and date calculations.
- Handle missing values and apply conditional logic.
- Use aggregate and window functions for business analysis.
- Strengthen practical SQL problem-solving skills.

## How to Run

1. Download or clone the repository.
2. Open MySQL Workbench or another compatible SQL editor.
3. Import the employee dataset from the Excel workbook into a MySQL table.
4. Ensure the table name and column names match those used in the SQL script.
5. Execute the database setup and data preparation statements.
6. Run the SQL queries and review the results.

## Conclusion

This project demonstrates how SQL functions can be used to transform employee data, analyze salaries and sales performance, evaluate employee tenure, and generate useful business insights. It provides practical experience with MySQL functions and advanced querying techniques.
