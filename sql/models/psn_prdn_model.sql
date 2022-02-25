CREATE OR REPLACE MODEL `music.psn_prdn_model`
OPTIONS
  (model_type='linear_reg',
  input_label_cols=['pos']) AS
SELECT 
    collaborative,
    TRK.pos,
    TRK.artist_name,
    TRK.track_name,
    TRK.duration_ms,
    TRK.album_name
FROM (
SELECT *
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(playlists) AS PLST
    ), UNNEST(tracks) as TRK;