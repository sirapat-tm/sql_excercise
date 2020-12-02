-- 9. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

SELECT
  strftime('%Y',InvoiceDate) AS Year,
  count(invoiceid) AS number_of_invoice,
  sum(Total) AS Sales_Total
FROM invoices
WHERE (InvoiceDate Like '2009%' OR InvoiceDate Like '2011%')
GROUP BY strftime('%Y',InvoiceDate)
