create database functions_adv;
use functions_adv;

select * from dataset;

SET SQL_SAFE_UPDATES = 0;
-- change data type of hiredate and birthdate column
ALTER TABLE dataset
MODIFY hire_date DATE,
MODIFY birth_date DATE;

-- change it text to date
UPDATE dataset
SET
    hire_date = STR_TO_DATE(hire_date, '%Y-%m-%d'),
    birth_date = STR_TO_DATE(birth_date, '%Y-%m-%d');
 
-- Q1.List each employee's full name and the number of complete years they have worked at the company (as of today).
--    Label the column 'years_of_service'.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_of_service
FROM DATASET;


-- Q2.Find all employees hired in the second half of any year (July–December). Show their name and hire_date.
SELECT 
	CONCAT(first_name, ' ', last_name) AS Full_Name,
    hire_date
FROM dataset
WHERE month(hire_date) BETWEEN 7 AND 12;


-- Q3. Calculate each employee's age in years today. Then show only those who will have a birthday in the current 
--     calendar month.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
    TIMESTAMPDIFF(YEAR, birth_date, curdate()) AS Age_in_years,
    birth_date
FROM dataset
WHERE month(birth_date) = month(curdate());


-- Q4. Show the day of the week each employee was hired. Display names and the weekday name (e.g., 'Monday').
--     Sort by weekday number.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
    DAYNAME(hire_date) AS Weekday_name
FROM dataset
ORDER BY DAYOFWEEK(hire_date); 

-- Q5. For Sales employees, compute the number of months between their hire date and today. Show name, hire_date, 
--     and 'months_at_company'. Round down to whole months.
SELECT 
	CONCAT(first_name, ' ', last_name) AS Full_name,
    hire_date,
    TIMESTAMPDIFF(month, hire_date, curdate()) AS months_at_company
FROM dataset
WHERE department = 'sales';


-- Q6.Find the employee who has been with the company the longest and the one hired most recently.
--    Show both in one result set with a label column 'tenure_rank'.
(
SELECT 'Longest_Tenure' AS Tenure_rank,
		CONCAT(first_name, ' ', last_name) AS full_name,
        hire_date
FROM dataset
ORDER BY hire_date ASC
LIMIT 1
)
UNION ALL
(
SELECT 'Recent_Tenure' AS Tenure_rank,
		CONCAT(first_name, ' ', last_name) AS full_name,
        hire_date
FROM dataset
ORDER BY hire_date DESC 
LIMIT 1
);


-- Q7.Add a column 'performance_tier' — label employees as 'Top' if sales_amount > 200000, 'Good' 
--    if 100000–200000, 'Low' if 1–99999, and 'Non-Sales' if 0.
SELECT
	employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    sales_amount,
    CASE
		WHEN sales_amount > 200000 THEN 'TOP'
        WHEN sales_amount BETWEEN 100000 AND 200000 THEN 'GOOD'
        WHEN sales_amount BETWEEN 1 AND 99999 THEN 'LOW'
        WHEN sales_amount =  0 THEN 'NON-SALES'
	END AS performence_tier
FROM dataset;


-- Q8.Show each employee's salary. Replace NULL salary values with 0 and label these rows with 
--    'Salary Missing' in a new column 'salary_note'.
SELECT
	employee_id,
    COALESCE(salary, 0) AS salary,
    CASE
		WHEN salary IS NULL THEN 'Salary Missing'
        ELSE 'Available'
	END AS salary_note
FROM dataset;


-- Q9.Create a 'compensation_band' column: 'Executive' if salary > 100000, 'Senior' if 75000–100000,
--   'Mid' if 55000–75000, 'Junior' otherwise. Count how many employees fall in each band.
SELECT 
    CASE 
        WHEN salary > 100000 THEN 'Executive'
        WHEN salary > 75000 AND salary <= 100000 THEN 'Senior'
        WHEN salary > 55000 AND salary <= 75000 THEN 'Mid'
        ELSE 'Junior'
    END AS compensation_band,
    COUNT(*) AS total_employees
FROM dataset
GROUP BY 
    CASE 
        WHEN salary > 100000 THEN 'Executive'
        WHEN salary > 75000 AND salary <= 100000 THEN 'Senior'
        WHEN salary > 55000 AND salary <= 75000 THEN 'Mid'
        ELSE 'Junior'
    END;
    
    
-- Q10.Display each employee's status. If 'Inactive', show their salary reduced by 20% as 'adjusted_salary'. 
--     If 'Active', show salary as-is. Use a single query.
SELECT 
	employee_id,
    status,
    CASE WHEN status = 'Inactive' THEN salary * 0.8
    ELSE salary END AS Adjusted_salary
FROM dataset;


-- Q11.For each department, count: (a) total employees, (b) active employees, (c) inactive employees — all
--     in one query using conditional aggregation.
SELECT
	Department,
    COUNT(*) AS total_employees, 
	SUM(CASE WHEN status = 'Active' THEN 1 ELSE 0 END) AS Active_employees,
    SUM(CASE WHEN status = 'Inactive' THEN 1 ELSE 0 END) AS Inactive_employees
FROM dataset
GROUP BY department;


-- Q12.Extract the username part from each employee's email (the part before the '@'). 
--     Display employee_id and the extracted username.
SELECT 
	employee_id,
    SUBSTRING_INDEX(email, '@' , 1) AS user_name
FROM dataset;


-- Q13. Concatenate first_name and last_name into a single 'full_name' column, formatted as 'LAST, First' 
--      (last name in uppercase).
SELECT 
	CONCAT(upper(last_name), ',', first_name) AS full_name
FROM dataset;


-- Q14.Find all employees whose last name contains exactly 6 characters. Show their full name and department.
SELECT 
	CONCAT(first_name, ' ' ,last_name) AS full_name,
	Department
FROM dataset
WHERE LENGTH(last_name) = 6;


-- Q15.Format the phone numbers to include dashes replaced by dots (e.g., '555.0101'). Show employee name and
--     the reformatted phone.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
    replace(phone, '-', '.') AS reformatted_phone
FROM dataset;            


-- Q16.Generate a temporary password for each employee in the format: first 3 letters of last name 
--     (uppercase) + employee_id + '!'. Display employee_id and 'temp_password'.
SELECT 
	employee_id,
    CONCAT(UPPER(LEFT(last_name, 3)), employee_id, '!') AS temp_password
FROM dataset;


-- Q17.Find employees whose first name starts with a vowel (A, E, I, O, U). Return their names sorted alphabetically.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
FROM dataset
WHERE first_name LIKE 'A%'
   OR first_name LIKE 'E%'
   OR first_name LIKE 'I%'
   OR first_name LIKE 'O%'
   OR first_name LIKE 'U%'
ORDER BY full_name;


-- Q18.Calculate the total annual compensation (salary + salary * bonus_pct) for each employee. 
--     Round the result to 2 decimal places. Handle NULL salaries as 0.
SELECT 
	employee_id,
    ROUND(
			COALESCE(salary, 0) + COALESCE(salary, 0) * COALESCE(bonus_pct, 0), 
            2
		) AS total_annual_compensation
FROM dataset;


-- Q19.Show each Sales employee's sales_amount and what percentage it represents of the total sales of
--     all Sales employees. Round to 1 decimal place.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    sales_amount,
    ROUND(
        (sales_amount * 100.0) / SUM(sales_amount) OVER (),
        1
    ) AS percentage_of_total_sales
FROM dataset
WHERE department = 'Sales';


-- Q20.For each department, compute the salary standard deviation and variance. 
--     Show department, STDDEV, and VARIANCE rounded to 2 decimals.
SELECT 
	department,
    ROUND(STDDEV(salary), 2) AS std_dev,
    ROUND(VARIANCE(salary), 2) AS var
FROM dataset
GROUP BY department;


-- Q21.Rank employees by salary within their department (highest = rank 1). Show name, department, salary, 
--     and rank. Employees with equal salary share the same rank.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department 
        ORDER BY salary DESC
    ) AS rank_in_department
FROM dataset;


-- Q22.Find the difference between each Sales employee's sales_amount and the average sales_amount across all 
--     Sales employees. Show name, sales_amount, avg_sales, and difference. Use ABS() to show the absolute gap.
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
    sales_amount,
    ROUND(AVG(sales_amount) OVER (), 2) AS avg_sales,
    ROUND(
        ABS(sales_amount - AVG(sales_amount) OVER ()),
        2
    ) AS difference
FROM dataset
WHERE department = 'Sales';


-- Q23.Compute the ceiling of salary/1000 for each employee (i.e., which 'thousand-band' bracket they fall in). 
--     Show employee name, salary, and 'salary_band'.
SELECT
	CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    CEILING(salary / 1000.0) AS salary_band
FROM dataset;

