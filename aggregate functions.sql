use irfan;


DELETE FROM books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT 
    *
FROM
    books
ORDER BY pages DESC;

SELECT 
    COUNT(*) AS count
FROM
    books;

SELECT 
    COUNT(title)
FROM
    books
WHERE
    title LIKE '%the%';

SELECT 
    author_lname, COUNT(*) AS count
FROM
    books
GROUP BY author_lname
ORDER BY count DESC;

SELECT 
    released_year, COUNT(*) AS count
FROM
    books
GROUP BY released_year
ORDER BY count DESC;

SELECT 
    *
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

SELECT 
    title
FROM
    books
WHERE
    released_year = (SELECT 
            MIN(released_year)
        FROM
            books);
            
            
-- grouping by multiple columns 
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS count
FROM
    books
GROUP BY author;

-- find the year each author published their first book.
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MIN(released_year) AS earliest,
    MAX(released_year) as latest,
    MAX(pages) as longest_page_count,
    count(*) as books_written
FROM
    books
GROUP BY author ORDER BY books_written;         

-- sum
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MIN(released_year) AS earliest,
    MAX(released_year) as latest,
    MAX(pages) as longest_page_count,
    count(*) as books_written,
    sum(pages) as total_pages
FROM
    books
GROUP BY author; 


-- calculate the average stock quantity for the books released in the same year
SELECT 
    released_year, AVG(stock_quantity) AS average
FROM
    books
GROUP BY released_year
ORDER BY average;

-- print out how many books were released in each year
SELECT 
    released_year, COUNT(*) AS total_books
FROM
    books
GROUP BY released_year
ORDER BY total_books DESC;

-- find avg released year for each author
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year) AS average
FROM
    books
GROUP BY author;

-- find the full name of the author who wrote the longest book
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS pages
FROM
    books
GROUP BY author
ORDER BY pages DESC
LIMIT 1;
-- OR using sub query 
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

-- no of books released every year and avg pages 

SELECT 
    released_year AS year,
    COUNT(*) AS books,
    AVG(pages) AS avg_pages
FROM
    books
GROUP BY released_year
ORDER BY year;