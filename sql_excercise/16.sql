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