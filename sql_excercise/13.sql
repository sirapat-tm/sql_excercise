-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT
  A.*,
  B.name as Trackname,
  D.name as Artist
FROM invoice_items AS A
  JOIN tracks AS B ON A.TrackId=B.TrackId
  JOIN albums AS C ON B.AlbumId=C.AlbumId
  JOIN artists AS D ON C.ArtistId=D.ArtistId
