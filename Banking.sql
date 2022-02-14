/*
 For each product, show the product name "Product" and the product type name "Type".
 */

SELECT NAME  AS 'Product', PRODUCT_TYPE_CD AS 'Type' FROM product;



/*
 For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch
*/

SELECT branch.NAME AS 'Branch Name', branch.CITY AS 'City', employee.LAST_NAME AS 'Last Name', employee.TITLE AS 'Title'  FROM branch 
JOIN employee ON BRANCH_ID;



/*
 Show a list of each unique employee title
*/

USE Banking;
SELECT UNIQUE title FROM employee;



/*
 Show the last name and title of each employee, along with the last name and title of that employee's boss
*/

USE Banking;
SELECT e.LAST_NAME AS "Employee's Name", e.TITLE "Employee's Title", m.LAST_NAME AS "Boss's Name", m.TITLE AS "Boss's Name"
FROM employee e
LEFT JOIN employee m  ON m.EMP_ID = e.SUPERIOR_EMP_ID;



/*
 For each account, show the name of the account's product, the available balance, and the customer's last name
*/

USE Banking;
SELECT p.NAME  AS 'Product Name', a.AVAIL_BALANCE AS 'Available Balance', i.LAST_NAME AS "Customer's LAST Name" FROM account a 
JOIN product p ON a.PRODUCT_CD = p.PRODUCT_CD 
JOIN individual i ON a.CUST_ID  = i.CUST_ID ;



/*
 List all account transaction details for individual customers whose last name starts with 'T'
*/

USE Banking;
SELECT at2.*, a.AVAIL_BALANCE AS "Balance", i.LAST_NAME AS "Last Name" FROM account a 
JOIN acc_transaction at2 ON a.ACCOUNT_ID = at2.ACCOUNT_ID 
JOIN individual i ON a.CUST_ID = i.CUST_ID 
WHERE i.LAST_NAME LIKE 'T%';









