CREATE OR REPLACE MODEL `music.classification_model2`
OPTIONS
  (model_type='AUTOML_CLASSIFIER',
  input_label_cols=['name']) AS
SELECT 
    name,
    collaborative,
    artist_name,
    track_name,
    album_name,
    num_edits,
    description,
    num_artists,
    modified_at
FROM (
SELECT *
    FROM `alpine-beacon-336222.music.relevants`,
    UNNEST(tracks) as TRK
)
LIMIT 1000;