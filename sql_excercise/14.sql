-- 14. Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
SELECT
  BillingCountry,
  Count(BillingCountry) as invoicepercountry
FROM invoices
GROUP BY BillingCountry