
-- Select users that can be found in the "Reviews" table (Subqueries)

SELECT 
    r.first_name, r.last_name
FROM
    reviewers r
WHERE
    r.id IN (SELECT 
            ri.reviewer_id
        FROM
            reviews ri);
            
 -- Subquery with EXISTS clause, quicker in retrieving large amounts of data vs IN clause           
            
SELECT 
    r.first_name, r.last_name
FROM
    reviewers r
WHERE
    EXISTS( SELECT 
            *
        FROM
            reviews ri
        WHERE
            ri.reviewer_id = r.id);
            

-- Retrieve the titles of all series with an average rating greater than 8.0

SELECT 
    s.title
FROM
    series s
WHERE
    s.id IN (SELECT 
            r.series_id
        FROM
            reviews r
        GROUP BY r.series_id
        HAVING AVG(r.rating) > 8.0);
        
        
        
-- Find the names of all reviewers who have reviewed either a drama or comedy series(Nested in WHERE clause)


SELECT 
    CONCAT(r.first_name, ' ', r.last_name) AS reviewer_name
FROM
    reviewers r
WHERE
    r.id IN (
		SELECT 
            rv.reviewer_id
        FROM
            reviews rv
        WHERE
            rv.series_id IN (
				SELECT 
                    s.id
                FROM
                    series s
                WHERE
                    genre = 'Drama' 
				UNION ALL 
				SELECT 
                    s.id
                FROM
                    series s
                WHERE
                    genre = 'Comedy'));


