CREATE TABLE music.tracks AS (SELECT 
    TRK.pos,
    TRK.artist_name,
    TRK.track_uri,
    TRK.artist_uri,
    TRK.track_name,
    TRK.album_uri,
    TRK.duration_ms,
    TRK.album_name
FROM (
SELECT PLST.num_tracks,
    PLST.tracks
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(playlists) AS PLST
    ), UNNEST(tracks) as TRK);