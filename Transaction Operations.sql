-- TOPIC: TRANSACTIONS
CREATE TABLE groups (
	g_no text PRIMARY KEY,
	monitor integer NOT NULL REFERENCES students(s_id)
); -- NOT NULL constraint forbids using unrefined values

SELECT * FROM groups;

-- Inserting another field into students table
ALTER TABLE students
ADD g_no text REFERENCES groups(g_no);

SELECT * FROM students;

--Starting transaction
BEGIN;

-- Creating a group
INSERT INTO groups(g_no, monitor)
SELECT 'A-101', s_id
FROM students
WHERE name = 'Anna';

SELECT * FROM groups; 

-- Moving students to new group
UPDATE students SET g_no = 'A-101';

SELECT * FROM students;

-- Committing changes to complete transaction
COMMIT;

-- Viewing changes
SELECT * FROM groups;
SELECT * FROM students;

--Note: A transaction is executed either
-- completely or not at all


