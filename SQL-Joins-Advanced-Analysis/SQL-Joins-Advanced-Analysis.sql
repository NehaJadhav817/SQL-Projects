create database joins3;
use joins3;

select * from customers;
select * from projects;

RENAME TABLE PROJECTS TO PRODUCTS;

select * from PRODUCTS;
select * from orders;
select * from order_details;
select * from payments;

SET SQL_SAFE_UPDATES = 0;

-- change data type of orderdate text to date
UPDATE orders
SET orderdate = STR_TO_DATE(orderdate, '%e/%c/%Y');

ALTER TABLE orders
MODIFY orderdate DATE;

-- change data type of paymentdate text to date
UPDATE payments
SET paymentdate = STR_TO_DATE(paymentdate, '%e/%c/%Y');

ALTER TABLE payments
MODIFY paymentdate DATE;

-- Q1. Display all customers with their orders.
SELECT c.Customername, o.orderid
FROM customers c
INNER JOIN orders o
WHERE c.customerid = o. customerid;


-- Q2. List all orders along with payment status
SELECT o.Orderid, p.paymentstatus
FROM orders o
LEFT JOIN Payments p ON o.orderid = p.orderid; 


-- Q3. Find total number of orders per customer
SELECT c.customerid , COUNT(o.orderid) AS Total_orders
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid;


-- Q4. Show all products that were ordered at least once
SELECT p.productname, o.orderid
FROM Products p
INNER JOIN order_details o ON p.productid = o.productid;


-- Q5. Display all payments with corresponding orders
SELECT p.paymentid, p.paymentstatus, o.orderid
FROM payments p
LEFT JOIN orders o ON p.orderid = o.orderid;


-- Q6. Find customers who never placed any order
SELECT c.customerid, o.orderid 
FROM customers c
LEFT JOIN Orders o ON c.customerid = o.customerid
WHERE orderid IS NULL;


-- Q7. Identify orders without payment records
SELECT o.orderid
FROM orders o
LEFT JOIN payments p ON p.orderid = o.orderid
WHERE p.paymentid IS NULL;


-- Q8. List customers whose orders were cancelled but payment was completed
SELECT c.customerid, o.orderstatus, p.paymentstatus
FROM Customers c
JOIN orders o ON o.customerid = c.customerid
JOIN payments p ON p.orderid = o.orderid
WHERE o.orderstatus = 'cancelled'
AND p.paymentstatus = 'completed';


-- Q9. Find total revenue generated per product (ignore failed payments)
SELECT pr.productid,
       SUM(od.quantity * pr.unitprice) AS total_revenue
FROM products pr
JOIN order_details od ON pr.productid = od.productid
JOIN payments p ON od.orderid = p.orderid
WHERE p.paymentstatus != 'Failed'
GROUP BY pr.productid;


-- Q10. Display customers who placed orders but never completed a payment
SELECT c.customerid, o.orderid
FROM customers c
JOIN orders o ON c.customerid = o.customerid
LEFT JOIN payments p ON p.orderid = o.orderid
WHERE p.orderid IS NULL
OR p.paymentstatus != 'COMPLETE';


-- Q11. Find orders that contain multiple products
SELECT od.orderid
FROM Order_details od
GROUP BY od.orderid
HAVING COUNT(DISTINCT od.productid) > 1;


-- Q12. Identify products that were ordered but never paid for
SELECT DISTINCT o.productid
FROM Order_details o
LEFT JOIN Payments p ON p.orderid = o.orderid
WHERE p.orderid IS NULL;


-- Q13. Find customers with highest total purchase value
SELECT c.customerid, SUM(od.quantity * p.unitprice) AS total_purchase
FROM customers c
JOIN Orders o ON c.customerid = o.customerid
JOIN Order_details od ON o.orderid = od.orderid
JOIN Products p ON p.productid = od.productid
GROUP BY customerid
ORDER BY total_purchase DESC
LIMIT 1;


-- Q14. Display region-wise total completed payment amount
SELECT c.region , SUM(od.quantity * pd.unitprice) AS total_amount
FROM customers c
JOIN orders o ON o.customerid = c.customerid
JOIN order_details od ON o.orderid = od.orderid
JOIN Products pd ON od.productid = pd.productid
JOIN Payments p ON o.orderid = p.orderid
WHERE p.paymentstatus = 'completed'
GROUP BY c.region;


-- Q15. Find orders where payment date is before order date
SELECT o.orderid, o.orderdate, p.paymentdate
FROM orders o
JOIN payments p ON o.orderid = p.orderid
WHERE p.paymentdate < o.orderdate;


-- Q16. Identify customers who ordered but all their payments failed
SELECT c.customerid
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN payments p ON o.orderid = p.orderid
GROUP BY c.customerid
HAVING COUNT(*) = SUM(CASE WHEN p.paymentstatus = 'failed' THEN 1 ELSE 0 END);


-- Q17. Find products never ordered by any customer
SELECT p.productid
FROM Products p
LEFT JOIN Order_details od 
	ON p.productid = od.productid
WHERE od.productid IS NULL;


-- Q18. Display top 5 customers by completed payment amount
SELECT c.CustomerID, c.CustomerName, SUM(od.Quantity * p.UnitPrice) AS TotalPaymentAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments py ON o.OrderID = py.OrderID
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE py.PaymentStatus = 'Completed'
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalPaymentAmount DESC
LIMIT 5;


-- Q19. Find customers who ordered from more than 3 categories
SELECT c.customerid
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN order_details od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid
GROUP BY c.customerid
HAVING COUNT(DISTINCT p.category) > 3;


-- Q20.	Identify orders where quantity ordered > average quantity
SELECT orderid
FROM order_details
WHERE quantity > (SELECT AVG(quantity) FROM order_details);


-- Q21.	Display customers who have both cancelled and delivered orders
SELECT c.customerid
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY customerid
HAVING 
	SUM(CASE WHEN o.orderstatus = 'cancelled' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN o.orderstatus = 'delivered' THEN 1 ELSE 0 END) > 0;
    

-- Q22.	Find products contributing to 80% of revenue (Pareto logic)
WITH ProductRevenue AS (
    SELECT
        p.ProductID,
        p.ProductName,
        SUM(od.Quantity * p.UnitPrice) AS Revenue
    FROM Products p
    JOIN Order_Details od
        ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT ProductID,
       ProductName,
       Revenue
FROM (
    SELECT
        ProductID,
        ProductName,
        Revenue,
        SUM(Revenue) OVER (ORDER BY Revenue DESC) AS RunningRevenue,
        SUM(Revenue) OVER () AS TotalRevenue
    FROM ProductRevenue
) AS t
WHERE RunningRevenue <= TotalRevenue * 0.80;


-- Q23.	Identify duplicate payments for the same order
SELECT p.orderid
FROM payments p
GROUP BY p.orderid 
HAVING count(*) > 1;


-- Q24.	Find customers who ordered but payment mode was always Cash
SELECT c.customerid, c.customername
FROM customers c
JOIN orders o ON o.customerid = c.customerid
JOIN payments p ON p.orderid = o.orderid
GROUP BY c.customerid, c.customername
HAVING COUNT(*) = SUM(CASE WHEN paymentmode = 'cash' THEN 1 ELSE 0 END);

-- Q25.	Display month-wise revenue trend
SELECT month(orderdate) AS month,
	SUM(od.quantity * p.unitprice) AS revenue
FROM orders o
JOIN order_details od ON o.orderid = od.orderid
JOIN products p ON p.productid = od.productid
GROUP BY month(orderdate)
ORDER BY month;


-- Q26.	Identify orders with no order details
SELECT o.orderid, od.orderdetailid
FROM orders o
LEFT JOIN order_details od on o.orderid = od.orderid
WHERE od.orderdetailid IS NULL;


-- Q27.	Find customers whose average order value is above overall average
SELECT c.CustomerID, c.CustomerName, AVG(OrderValue) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN (
    SELECT od.OrderID, SUM(od.Quantity * p.UnitPrice) AS OrderValue
    FROM Order_Details od
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY od.OrderID
) ov ON o.OrderID = ov.OrderID
GROUP BY c.CustomerID, c.CustomerName
HAVING AVG(OrderValue) >
(
    SELECT AVG(OrderValue)
    FROM (
        SELECT od.OrderID, SUM(od.Quantity * p.UnitPrice) AS OrderValue
        FROM Order_Details od
        JOIN Products p ON od.ProductID = p.ProductID
        GROUP BY od.OrderID
    ) t
);


-- Q28. display products ordered only once
SELECT od.productid
FROM Order_details od 
GROUP BY od.productid
HAVING COUNT(*) = 1;


-- Q29. find orders with partial payments (multiple payment entries)
SELECT orderid, COUNT(paymentid) AS total_payments
FROM payments
GROUP BY orderid
HAVING COUNT(paymentid) > 1;


-- Q30. dentify inactive customers (no orders in last 6 months)
SELECT c.Customerid
FROM customers c
LEFT JOIN orders o ON o.customerid = c.customerid
		AND o.orderdate >= current_date - interval 6 month
where orderid IS NULL;


