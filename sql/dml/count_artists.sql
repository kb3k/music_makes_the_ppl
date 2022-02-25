SELECT count(*), TRK.ARTIST_NAME
FROM (
select PLST.num_tracks,
    PLST.tracks
    from `alpine-beacon-336222.music.slices`,
    UNNEST(playlists) AS PLST
    ), UNNEST(tracks) as TRK
group by TRK.ARTIST_NAME
ORDER BY count(*) DESC;