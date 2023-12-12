CREATE TABLE courses (
	c_no text PRIMARY KEY,
	title text,
	hours integer
);

INSERT INTO courses (c_no, title, hours)
VALUES ('CS301', 'Databases', 30),
	   ('CS305', 'Networks', 60);

-- Inserting content into the courses
-- table
INSERT INTO courses (c_no, title, hours)
VALUES ('CS303', 'Information Systems', 40),
	   ('CS306', 'Programming ', 80);
	   
--View the content of the table
SELECT * FROM courses

--Creating students table
CREATE TABLE students (
	s_id integer PRIMARY KEY,
	name text,
	start_year integer
);

--inserting data into students table
INSERT INTO students (s_id, name, start_year)
VALUES (1451, 'Anna', 2014),
	   (1432, 'Victor', 2014),
	   (1556, 'Nina', 2015),
	   (1621, 'Kwaku', 2016),
	   (1958, 'Hanson', 2017);
	   
SELECT * FROM students;

--Creating exams table
CREATE TABLE exams (
	s_id integer REFERENCES students (s_id),
	c_no text REFERENCES courses (c_no),
	score integer,
	CONSTRAINT pk PRIMARY KEY (s_id, c_no)
);

INSERT INTO exams(s_id, c_no, score)
VALUES (1451, 'CS301', 5),
	   (1556, 'CS301', 5),
       (1451, 'CS305', 5),
	   (1621, 'CS303', 4),
	   (1958, 'CS306', 5),
       (1432, 'CS305', 4);

SELECT * FROM exams;

SELECT title AS course_title, hours 
FROM courses;

SELECT start_year FROM students;

SELECT DISTINCT start_year FROM students;

--omitting the FROM clause 
--results in single-rowed table
SELECT 2+2 AS result;


SELECT * FROM courses WHERE hours > 45;
--Joins or Cartesian product of tables
SELECT * FROM courses, exams;

--Matching scores for all courses
SELECT courses.title, exams.s_id, exams.score
FROM courses, exams
WHERE courses.c_no = exams.c_no

--Using the 'JOIN' keyword
SELECT students.name, exams.score
FROM  students
JOIN exams
  ON students.s_id = exams.s_id
  AND exams.c_no = 'CS305';
  
SELECT students.name, exams.score
FROM students
LEFT JOIN exams
  ON students.s_id = exams.s_id
  AND exams.c_no = 'CS305'
  
SELECT students.name, exams.score
FROM students
LEFT JOIN exams ON students.s_id = exams.s_id
WHERE exams.c_no = 'CS305';

--Subqueries
SELECT name, (
	SELECT score
	FROM exams
	WHERE exams.s_id = students.s_id
	AND exams.c_no = 'CS305')
FROM students;

SELECT * 
FROM exams 
WHERE (SELECT start_year
	   FROM students
	   WHERE students.s_id = exams.s_id)>2014;

-- NOT IN to return the opposite
SELECT name, start_year
FROM students
WHERE s_id NOT IN (SELECT s_id
				   FROM exams
				   WHERE score < 5);

-- EXISTS predicate
SELECT name, start_year
FROM students
WHERE NOT EXISTS (SELECT s_id
				 FROM exams
				 WHERE exams.s_id = students.s_id
				 AND score < 5);
				 
SELECT s.name, e.score
FROM students s, courses c, exams e
WHERE c.c_no = e.c_no
AND c.title = 'Databases'
AND s.s_id = e.s_id;

--Sorting
SELECT * FROM exams
ORDER BY score, s_id, c_no DESC;

--Grouping Operations -> Aggregate functions
SELECT count(*), count(DISTINCT s_id),
avg(score)
FROM exams;

SELECT c_no, count(*),
count(DISTINCT s_id), avg(score)
FROM exams
GROUP BY c_no;

SELECT students.name
FROM students, exams
WHERE students.s_id = exams.s_id AND exams.score = 5
GROUP BY students.name
HAVING count(*) > 1;

-- Changing and Deleting Data
UPDATE courses
SET hours = hours * 2
WHERE c_no = 'CS301';

DELETE FROM exams WHERE score < 5;

SELECT * FROM exams;