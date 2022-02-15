USE classicmodels;
 /*
  Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible for that customer’s orders. 
  The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. The output should be sorted alphabetically by customer name. 
  */


SELECT c.customerName AS 'Customer Name', CONCAT(e.lastName, ', ', e.firstName) AS 'Sales Rep' FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY c.customerName ASC;



 /*
  Determine which products are most popular with our customers. 
  For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product. 
  The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. List the products by Total Sale descending. 
  */


SELECT p.productName AS "Product Name",SUM(o.quantityOrdered) AS "Toatal # Ordered", sum(o.priceEach*o.quantityOrdered)  AS "Total Sale" FROM orderdetails o 
JOIN products p ON o.productCode = p.productCode 
GROUP BY p.productName;


 /*
  Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” and “# Orders”. Sort alphabetically by status.
  */

-- order.status AS "Order Status"
-- orderdetails.quantityOrdered AS "# Orders"

SELECT DISTINCT o.status AS "Order Status", o2.quantityOrdered  AS "# Orders"
FROM orders o 
LEFT JOIN orderdetails o2 ON o.orderNumber = o2.orderNumber 
GROUP BY o.status ASC ;



/*
Write a query to list, for each product line, the total # of products sold from that product line. 
The first column should be “Product Line” and the second should be “# Sold”. Order by the second column descending.
*/

SELECT productLine AS 'Product Line', SUM(quantityOrdered) AS '# Sold' 
FROM ( SELECT p.productCode, p.productName, od.quantityOrdered, p.productLine FROM products p 
RIGHT JOIN orderdetails od ON p.productCode = od.productCode) AS x GROUP BY productLine
ORDER BY 2 DESC;


/*
Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. 
Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month. 
The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. 
Values in the third column should be formatted as numbers with two decimals – for example: 694,292.68.
*/

SELECT  MONTHNAME(paymentDate) AS 'Month', YEAR(paymentDate) AS 'Year', FORMAT(SUM(amount), 2) AS 'Payments Recieved' FROM payments
GROUP BY 2 ,1
ORDER BY paymentDate;
