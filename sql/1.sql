CREATE TABLE IF NOT EXISTS track_media (
    auto_inc INT,
    mediaid CHAR(1),
    modified DATE
);


INSERT track_media
VALUES
    (1, 'x', '2001-02-01'),
    (2, 'x', '2001-01-31'),
    (3, 'y', '2001-01-31'),
    (4, 'y', '2001-02-01'),
    (5, 'y', '2001-01-30'),
    (6, 'z', '2001-01-26');

# SELF JOIN
SELECT
    m.mediaid,
    m.auto_inc
FROM track_media m
    JOIN (
        SELECT
            mediaid,
            MAX(modified) AS max_modified
        FROM track_media
        GROUP BY mediaid) m2 ON m.mediaid = m2.mediaid
                            AND m.modified = m2.max_modified;

# WINDOW FUNCTION
SELECT
    mediaid,
    auto_inc
FROM (SELECT
        mediaid,
        auto_inc,
        ROW_NUMBER() OVER (PARTITION BY mediaid ORDER BY modified DESC) as RN
    FROM track_media) m
WHERE RN = 1;



