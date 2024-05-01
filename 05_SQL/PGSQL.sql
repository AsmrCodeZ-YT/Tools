EXPLAIN ANALYZE
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE
    first_name = "omid"

-- ################################## CONDTION
EXPLAIN ANALYZE
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE
    LOWER(first_name) = LOWER("omid")

-- ################################## NOT=! AND, OR
EXPLAIN ANALYZE
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE
    LOWER(first_name) != LOWER("omid")

-- ################################## ASC,DESC
EXPLAIN ANALYZE
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
ORDER BY
    last_name ASC 

-- ################################## LIMIT
EXPLAIN ANALYZE
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE 
    last_name = "ebrahimi"
ORDER BY
    last_name ASC
LIMIT 1;

-- ################################## WITHOUT LIMIT : SLOW
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE 
    id = 1

-- ################################## WITH LIMIT : FASTER
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres
WHERE 
    id = 1
LIMIT 1;
-- ################################## OFFSET
SELECT 
    id,
    first_name,
    last_name,
    phone_number
FROM 
    posgres

LIMIT 5
OFFSET 5;
