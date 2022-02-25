SELECT PLST.num_tracks,
    PLST.tracks
    FROM `alpine-beacon-336222.music.slices`,
        UNNEST(playlists) AS PLST;