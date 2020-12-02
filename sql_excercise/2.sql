-- 2. Provide a query only showing the Customers from Brazil.
SELECT
  FirstName || ' ' || LastName AS Fullname,
  CustomerId,
  Country
FROM customers
WHERE country ='Brazil';