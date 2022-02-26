CREATE TABLE music.relevants AS (
    SELECT 
        *
    FROM `alpine-beacon-336222.music.slices`,
    UNNEST(playlists) AS PLST
    WHERE name IN(
     'Country',
     'Christmas',
     'Chill',
     'Rap',
     'Rock',
     'chill',
     'country',
     'throwback',
     'ClassicRock',
     'Workout',
     '����',
     'lit',
     'workout',
     '2017',
     'calm',
     'party',
     'Sleep',
     'Oldies',
     '❤️',
     'november'
    )
);