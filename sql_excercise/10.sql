-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT
  count(*) AS Invoice_items_count
FROM invoice_items 
WHERE InvoiceId=37