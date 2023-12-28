INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
use irfan;

SELECT DATABASE();

SELECT 
    *
FROM
    books;

SELECT DISTINCT
    (CONCAT(author_lname, ' ', author_fname)) AS full_name
FROM
    books;
    
    
SELECT 
    CONCAT(author_lname, ' ', author_fname) AS full_name, pages
FROM
    books
ORDER BY pages DESC
LIMIT 10;


SELECT 
    author_fname, author_lname, title
FROM
    books
WHERE
    title LIKE '%ca%';


SELECT DISTINCT
    title
FROM
    books
WHERE
    title LIKE '%stories%';

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;


SELECT DISTINCT
    author_lname, title
FROM
    books
WHERE
    author_lname LIKE '% %';

SELECT DISTINCT
    (title), released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity
LIMIT 3;


SELECT DISTINCT
    (title), author_lname
FROM
    books
ORDER BY author_lname , title;


SELECT 
    UCASE(CONCAT('MY FAVORITE AUTHOR IS',
                    ' ',
                    author_fname,
                    ' ',
                    author_lname)) AS yell
FROM
    books
ORDER BY author_lname;