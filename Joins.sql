-- TOPIC: TRANSACTIONS
SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM exams;

-- Inner Join
SELECT * FROM students 
INNER JOIN exams
ON students.s_id = exams.s_id;

-- Alternative
--SELECT * FROM students, exams 
--WHERE students.s_id = exams.s_id;

--Inner Join / Natural Join
SELECT * FROM students NATURAL JOIN exams;

-- Left Outer Join
-- produces a complete set of records 
-- from Table A, with matching records in Table B.
-- If there's no match, the right side will contain null
SELECT * FROM students 
LEFT OUTER JOIN exams
ON students.s_id = exams.s_id;

-- Right Outer Join
-- Produces a complete set of records 
-- from TableB, with matching records in Table A
-- If there's no match, the left side will contain null
SELECT * FROM students 
RIGHT OUTER JOIN exams
ON students.s_id = exams.s_id;

-- Full Outer Join
-- Produces a complete set of records 
-- from Table A and Table B, with matching records from both sides 
-- If there's no match, the missing side will contain null
SELECT * FROM students 
FULL OUTER JOIN exams
ON students.s_id = exams.s_id;

-- Left Join Excluding Inner Join
-- Returns all records in left table 
--that do not match any records in the right table
SELECT * FROM students LEFT JOIN exams
ON students.s_id = exams.s_id
WHERE exams.s_id IS NULL;

-- Right Join Excluding Inner Join
-- Returns all records in the right table
-- that do not match any records in the left table
SELECT * FROM exams RIGHT JOIN students
ON exams.s_id = students.s_id
WHERE students.s_id IS NULL;

-- Full Outer Excluding Inner Join
-- Returns all records in Table A and Table B
-- that do not have a matching record in the other 
-- table
SELECT * FROM students FULL OUTER JOIN exams
ON students.s_id IS NULL OR
exams.s_id IS NULL; --ERROR:  FULL JOIN is only supported 
-- with merge-joinable or hash-joinable join conditions

--Cross Join
-- Cartesian Product join
-- combines all records in Tables A and B
SELECT * FROM students CROSS JOIN exams;

SELECT * FROM students, exams;