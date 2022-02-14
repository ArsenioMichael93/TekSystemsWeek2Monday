/*
Write a query to display the name, product line, and buy price of all products. 
The output columns should display as “Name”, “Product Line”, and “Buy Price”.
The output should display the most expensive items first.
*/

USE classicmodels;
SELECT productName AS 'Name', productLine AS 'Product Line', buyPrice AS 'Buy Price'  FROM  products
ORDER BY buyPrice DESC ;



/* 
 Write a query to display the first name, last name, and city for all customers from Germany. 
 Columns should display as “First Name”, “Last Name”, and “City”. The output should be sorted by the customer’s last name (ascending).
*/

USE classicmodels;
SELECT contactFirstName AS 'First Name', contactLastName AS 'Last Name', city AS 'City'  FROM customers
WHERE country LIKE  'Germany'
ORDER BY contactLastName ASC 



/* 
 Write a query to display each of the unique values of the status field in the orders table. The output should be sorted alphabetically increasing. Hint: the output should show exactly 6 rows. 
*/

USE classicmodels;
SELECT UNIQUE status FROM orders
ORDER BY status ASC;



/* 
 Select all fields from the payments table for payments made on or after January 1, 2005. Output should be sorted by increasing payment date.
*/

USE classicmodels;
SELECT * FROM payments
WHERE paymentDate >= "2005-01-01"
ORDER BY paymentDate;



/*
 Write a query to display all Last Name, First Name, Email and Job Title of all employees working out of the San Francisco office. Output should be sorted by last name.
 */

USE classicmodels;
SELECT lastName AS 'Last Name', firstName AS 'First Name', email AS 'Email', jobTitle AS 'Job Title' FROM employees
WHERE officeCode = 1
ORDER BY lastName;



/*
 Write a query to display the Name, Product Line, Scale, and Vendor of all of the car products – both classic and vintage.
 The output should display all vintage cars first (sorted alphabetically by name), and all classic cars last (also sorted alphabetically by name).
*/

USE classicmodels;
SELECT `productName` AS 'Name', `productLine` AS 'Product Line', `productScale` AS 'Scale', `productVendor` AS 'Vendor' FROM products 
WHERE `productLine` LIKE '% Cars' 
ORDER BY `productLine` DESC, SUBSTRING(productName, 6) ASC;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 