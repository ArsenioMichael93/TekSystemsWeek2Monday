USE mock_sba_db;


/* Create a query to return all orders made by users with the first name of “Marion”  */

SELECT o.ORDER_ID, u.USER_ID, o.STORE_ID  FROM orders o
JOIN users u 
WHERE u.USER_ID = 3


/*Create a query to select all users that have not made an order */

SELECT u.USER_ID, u.LAST_NAME, u.FIRST_NAME, u.CITY FROM users u 
LEFT JOIN  orders o  ON u.USER_ID  = o.USER_ID 
WHERE o.USER_ID  IS NULL;

/*Create a Query to select the names and prices of all items that have been part of 2 or 
more separate orders.*/


SELECT  i.NAME , count(DISTINCT oi.ITEM_ID) AS `uniques`, i.PRICE  FROM order_items oi 
JOIN items i  ON oi.ITEM_ID  = i.ITEM_ID  
GROUP BY i.ITEM_ID 
HAVING `uniques`


/*Create a query to return the Order Id, Item name, Item Price, and Quantity from orders 
made at stores in the city “New York”. Order by Order Id in ascending order. */

SELECT oi.ORDER_ID  , i.NAME, i.PRICE, oi.QUANTITY  FROM order_items oi
JOIN orders o ON oi.ORDER_ID = o.ORDER_ID 
JOIN items i ON i.ITEM_ID = oi.ITEM_ID 
JOIN stores s ON s.STORE_ID = o.STORE_ID 
WHERE s.CITY LIKE 'New York'
ORDER BY o.ORDER_ID ASC;



/*Your boss would like you to create a query that calculates the total revenue generated 
by each item. Revenue for an item can be found as (Item Price * Total Quantity 
Ordered). Please return the first column as ‘ITEM_NAME’ and the second column as 
‘REVENUE’. */

SELECT i.NAME AS 'Item Name', SUM(oi.QUANTITY * i.PRICE) AS 'Revenue' FROM order_items oi 
JOIN items i ON i.ITEM_ID = oi.ITEM_ID 
GROUP BY i.NAME 
ORDER BY `Revenue` DESC ;

/*Create a query with the following output: 
a. Column 1 - Store Name 
i. The name of each store 
b. Column 2 - Order Quantity 
i. The number of times an order has been made in this store 
c. Column 3 - Sales Figure 
i. If the store has been involved in more than 3 orders, mark as ‘High’ 
ii. If the store has been involved in less than 3 orders but more than 1 order, 
mark as ‘Medium’ 
iii. If the store has been involved with 1 or less orders, mark as ‘Low’ 
d. Should be ordered by the Order Quantity in Descending Order */



