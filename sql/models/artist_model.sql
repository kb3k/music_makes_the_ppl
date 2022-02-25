CREATE OR REPLACE MODEL `music.artist_model`
OPTIONS
  (model_type='logistic_reg',
  input_label_cols=['artist_name']) AS

SELECT 
    TRK.pos,
    TRK.artist_name,
    TRK.artist_uri,
FROM (
SELECT PLST.num_tracks,
    PLST.tracks
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(PLAYLISTS) AS PLST
    ), UNNEST(tracks) as TRK;