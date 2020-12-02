-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT
  FirstName || ' ' || LastName AS Fullname,
  InvoiceId,
  InvoiceDate,
  BillingCountry
FROM invoices AS I
JOIN customers AS C
ON I.CustomerId = C.CustomerId
WHERE Country='Brazil'