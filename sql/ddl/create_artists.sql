CREATE TABLE music.artists AS ( 
SELECT 
    TRK.pos,
    TRK.artist_name,
    TRK.artist_uri
FROM (
SELECT PLST.num_tracks,
    PLST.tracks
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(PLAYLISTS) AS PLST
    ), UNNEST(tracks) as TRK);