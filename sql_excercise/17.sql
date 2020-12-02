-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT
  A.*,
  count(B.InvoiceLineId) as '# of invoice line items'
FROM invoices AS A
JOIN invoice_items AS B
ON A.InvoiceId = B.InvoiceId
GROUP BY A.InvoiceId