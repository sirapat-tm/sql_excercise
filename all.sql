-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT
  FirstName || ' ' || LastName AS Fullname,
  CustomerId,
  Country
FROM customers
WHERE country <> 'USA';

-- 2. Provide a query only showing the Customers from Brazil.
SELECT
  FirstName || ' ' || LastName AS Fullname,
  CustomerId,
  Country
FROM customers
WHERE country ='Brazil';

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT
  FirstName || ' ' || LastName AS Fullname,
  InvoiceId,
  InvoiceDate,
  BillingCountry
FROM invoices AS I
JOIN customers AS C
ON I.CustomerId = C.CustomerId
WHERE Country='Brazil';

-- 4. Provide a query showing only the Employees who are Sales Agents.
SELECT
  *
FROM employees
WHERE (title LIKE '%sales%' AND title LIKE '%agent');

-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry
FROM invoices;

-- 6. Provide a query showing the invoices of customers who are from Brazil.
SELECT
  A.InvoiceId,
  B.FirstName || ' ' || B.LastName AS Fullname,
  B.Country
FROM invoices AS A
JOIN customers AS B
ON A.CustomerId=B.CustomerId
WHERE Country='Brazil';

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
ORDER BY C.EmployeeId;

-- 8. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT
  A.Total,
  B.FirstName || ' ' || B.LastName AS CustomerName,
  B.Country,
  C.FirstName || ' ' || C.LastName AS SalesAgentName

-- 9. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

FROM invoices AS A
JOIN customers AS B
ON A.CustomerId = B.CustomerId
JOIN employees AS C
ON B.SupportRepId = C.EmployeeId
WHERE (c.title LIKE '%sales%' AND c.title LIKE '%agent');


SELECT
  strftime('%Y',InvoiceDate) AS Year,
  count(invoiceid) AS number_of_invoice,
  sum(Total) AS Sales_Total
FROM invoices
WHERE (InvoiceDate Like '2009%' OR InvoiceDate Like '2011%')
GROUP BY strftime('%Y',InvoiceDate);

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT
  count(*) AS Invoice_items_count
FROM invoice_items 
WHERE InvoiceId=37;

-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY]
SELECT
  InvoiceId,
  count(InvoiceLineId) AS Invoice_items_count
FROM invoice_items
GROUP BY InvoiceId;

-- 12. Provide a query that includes the track name with each invoice line item.
SELECT
  A.*,
  B.name as Trackname
FROM invoice_items AS A
JOIN tracks AS B ON A.TrackId=B.TrackId;

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT
  A.*,
  B.name as Trackname,
  D.name as Artist
FROM invoice_items AS A
  JOIN tracks AS B ON A.TrackId=B.TrackId
  JOIN albums AS C ON B.AlbumId=C.AlbumId
  JOIN artists AS D ON C.ArtistId=D.ArtistId;

-- 14. Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
SELECT
  BillingCountry,
  Count(BillingCountry) as invoicepercountry
FROM invoices
GROUP BY BillingCountry

-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.

SELECT
  A.*,
  B.name,
  count(TrackId) as '# of tracks'
FROM playlist_track AS A,
playlists AS B
ON A.PlaylistId=B.PlaylistId
GROUP BY A.PlaylistId

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
SELECT
  A.name AS Track,
  B.title AS AlbumName,
  C.name AS MediaTypeId,
  D.name AS Genre
FROM tracks AS A
  JOIN albums AS B on A.AlbumId=B.AlbumId
  JOIN media_types AS C on A.MediaTypeId=C.MediaTypeId
  JOIN genres AS D on A.GenreId=D.GenreId
  
-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT
  A.*,
  count(B.InvoiceLineId) as '# of invoice line items'
FROM invoices AS A
JOIN invoice_items AS B
ON A.InvoiceId = B.InvoiceId
GROUP BY A.InvoiceId;

-- 18. Provide a query that shows total sales made by each sales agent.
SELECT 
  e.firstname || ' ' ||e.lastname as salesagent,
  count(i.invoiceid) as 'Total sales made'
FROM employees as e
  JOIN customers as c on c.SupportRepId = e.EmployeeId
  JOIN invoices as i on i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId


