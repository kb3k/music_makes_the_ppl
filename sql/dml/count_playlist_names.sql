SELECT 
    COUNT(*) AS count,
    PLST.name
FROM `alpine-beacon-336222.music.slices`,
UNNEST(playlists) AS PLST
GROUP BY PLST.name
ORDER BY COUNT(*) DESC;