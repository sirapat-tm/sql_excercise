-- 18. Provide a query that shows total sales made by each sales agent.
SELECT 
  e.firstname || ' ' ||e.lastname as salesagent,
  count(i.invoiceid) as 'Total sales made'
FROM employees as e
  JOIN customers as c on c.SupportRepId = e.EmployeeId
  JOIN invoices as i on i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId
