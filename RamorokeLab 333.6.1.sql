-- LAB 333.6.1
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT * 
FROM customers;

SELECT * 
FROM employees;
--  Problem Statement one:
SELECT c.customerName AS 'Customer Name', 
CONCAT(e.lastName, ', ', e.firstName) AS 'Sales Rep'
FROM customers c JOIN employees e 
ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY c.customerName ASC;

--  Problem Statement two:
SELECT p.productName as 'Product Name', sum(odr.quantityOrdered) as 'Total # Ordered',
 SUM(odr.quantityOrdered * odr.priceEach) as 'Total Sale'
FROM products p LEFT JOIN orderdetails odr 
ON p.productCode=odr.productCode
GROUP BY p.productName, p.buyPrice
ORDER BY 3 DESC;

--  Problem Statement three:
SELECT status AS 'Order Status', COUNT(status) AS 'Total orders'
FROM orders
GROUP BY 1
ORDER BY 2;

--  Problem Statement four

SELECT p.productline AS 'Product Line', SUM(odr.quantityOrdered) AS 'Total Sold'
FROM products p JOIN orderdetails odr
ON p.productCode = odr.productCode
GROUP BY p.productLine
ORDER BY 2 DESC;

-- Problem Statement five:
SELECT monthname(paymentDate) AS 'Month',
YEAR(paymentDate) AS 'Year',
FORMAT(SUM(amount),2) AS 'Payment Received'
FROM payments
GROUP BY year(paymentDate), monthname(paymentDate)
ORDER BY paymentDate;

-- Problem Statement Six:

SELECT productName AS Name, productLine AS 'Product Line', productScale AS Scale,productVendor AS Vendor
FROM products
WHERE productLine IN ('Classic Cars', 'Vintage Cars')
ORDER BY productLine DESC, productName ASC;











