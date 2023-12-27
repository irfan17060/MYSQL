
																	-- string functions
create database irfan;

use irfan;

SELECT DATABASE();

CREATE TABLE books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);
    
desc books;

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

SELECT 
    *
FROM
    books;


-- concat
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS full_name,
    released_year
FROM
    books;
    
SELECT 
    CONCAT_WS('-', title, author_fname, author_lname) AS full_name_with_title
FROM
    books;

-- substring
SELECT 
    SUBSTRING(author_fname, 1, 5) AS half_name
FROM
    books;
    
SELECT 
    SUBSTRING(author_fname, 1, 1) AS initial,
    author_fname AS first_name
FROM
    books;
    
SELECT 
    SUBSTR(CONCAT_WS('-', title, author_fname, author_lname),
        1,
        15) AS full_name_with_title
FROM
    books;


-- concat & substring
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM
    books;
    
SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS initial,
    CONCAT(author_fname, ' ', author_lname) AS full_name
FROM
    books;
    
-- replace

SELECT 
    *
FROM
    books;
SELECT 
    REPLACE(CONCAT(author_fname, ' ', author_lname),
        ' ',
        '-') AS full_name
FROM
    books;

-- reverse
SELECT 
    *
FROM
    books;
    
SELECT 
    CONCAT(author_lname, ' ', author_fname) AS full_name,
    REVERSE(CONCAT(author_lname, ' ', author_fname)) AS reverse_full_name
FROM
    books;

-- char_length

SELECT 
    *
FROM
    books;

SELECT 
    author_fname, CHAR_LENGTH(author_fname) AS len
FROM
    books;
    
-- upper and lower

select title as title,upper(title) from books;
select title as title,lcase(title) from books;

select UCASE(concat("I LOVE" " ", title , "!!!")) as title from books;

-- left & right

select LEFT(title, 5) as left_title from books;
select title,RIGHT(title, 5) as left_title from books;

-- TRIM
select TRIM(LEADING "...." from concat("....", title, "....",author_fname)) as test from books;

-- TRIM AND REPLACE
select replace(TRIM(LEADING "...." from concat("....", title, "....",author_fname)), "...."," ") as test from books;

-- Exercise
select * from books;

select concat(substr(title, 1,10), "...") as short_title, concat(author_lname," ",author_fname) as author, concat(stock_quantity, " in stock") as quantity  from books;





