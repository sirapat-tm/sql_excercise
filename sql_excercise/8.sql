-- 8. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT
  A.Total,
  B.FirstName || ' ' || B.LastName AS CustomerName,
  B.Country,
  C.FirstName || ' ' || C.LastName AS SalesAgentName

FROM invoices AS A
JOIN customers AS B
ON A.CustomerId = B.CustomerId
JOIN employees AS C
ON B.SupportRepId = C.EmployeeId
WHERE (c.title LIKE '%sales%' AND c.title LIKE '%agent')