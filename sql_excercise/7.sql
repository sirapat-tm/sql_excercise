-- 7. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT
  A.InvoiceId,
  B.FirstName || ' ' || B.LastName AS CustomerName,
  C.FirstName || ' ' || C.LastName AS SalesAgentName

FROM invoices AS A
JOIN customers AS B
ON A.CustomerId = B.CustomerId
JOIN employees AS C
ON B.SupportRepId = C.EmployeeId
WHERE (c.title LIKE '%sales%' AND c.title LIKE '%agent')
ORDER BY C.EmployeeId