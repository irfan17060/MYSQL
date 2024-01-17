CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);
 
 
CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;

select * from papers;

select first_name,title,grade from students
 inner join papers on students.id=papers.student_id order by grade desc;

select first_name,title,grade from students 
left join papers on students.id=papers.student_id;

select first_name,ifnull(avg(grade),0) as average from students left join papers on 
students.id=papers.student_id group by students.first_name order by average desc;

select first_name,ifnull(avg(grade),0) as average,
case when ifnull(avg(grade),0) >75 then 'PASSING'
else 'FAILING'
end as 'passing_status'
from students left join papers on 
students.id=papers.student_id group by students.first_name order by average desc;

