-- 6. Provide a query showing the invoices of customers who are from Brazil.
SELECT
  A.InvoiceId,
  B.FirstName || ' ' || B.LastName AS Fullname,
  B.Country
FROM invoices AS A
JOIN customers AS B
ON A.CustomerId=B.CustomerId
WHERE Country='Brazil'
	