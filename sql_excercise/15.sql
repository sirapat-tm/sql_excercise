-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.

SELECT
  A.*,
  B.name,
  count(TrackId) as '# of tracks'
FROM playlist_track AS A,
playlists AS B
ON A.PlaylistId=B.PlaylistId
GROUP BY A.PlaylistId