-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY]
SELECT
  InvoiceId,
  count(InvoiceLineId) AS Invoice_items_count
FROM invoice_items
GROUP BY InvoiceId;