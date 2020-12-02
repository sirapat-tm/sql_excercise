-- 12. Provide a query that includes the track name with each invoice line item.
SELECT
  A.*,
  B.name as Trackname
FROM invoice_items AS A
JOIN tracks AS B ON A.TrackId=B.TrackId;
