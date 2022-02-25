SELECT
    PLST.name,
    PLST.collaborative,
    PLST.pid,
    PLST.modified_at,
    PLST.num_tracks,
    PLST.num_albums,
    PLST.num_followers,
    PLST.num_edits,
    PLST.duration_ms,
    PLST.num_artists,
    PLST.description
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(PLAYLISTS) AS PLST;