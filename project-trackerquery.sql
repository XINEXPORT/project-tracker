SELECT * FROM students;
SELECT * FROM projects;
SELECT * FROM grades;

CREATE TABLE students(
    github VARCHAR(30) NOT NULL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
    );
CREATE TABLE projects(
    title VARCHAR(30) NOT NULL PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    max_grade INTEGER);
CREATE TABLE grades(
    id SERIAL PRIMARY KEY,
    student_github VARCHAR(30),
    project_title VARCHAR(30),
    grade INTEGER,
    github VARCHAR(30) REFERENCES students(github),
    title VARCHAR(30) REFERENCES projects(title)
    );

INSERT INTO students (github,first_name,last_name) VALUES ('jacks', 'Jane', 'Hacker');
INSERT INTO students (github,first_name,last_name) VALUES ('sdevelops', 'Sarah', 'Developer');
INSERT INTO projects (title,description,max_grade) VALUES ('Logic100', 'Logic Generator for Computers', 20);
INSERT INTO projects (title,description,max_grade) VALUES ('Amazon', 'Online Marketplace', 100);
INSERT INTO projects (title,description,max_grade) VALUES ('Ebay', 'Online Marketplace for Used products', 500);
INSERT INTO projects (title,description,max_grade) VALUES ('Markov', 'Tweets generated from Markov chains', 50);
INSERT INTO projects (title,description,max_grade) VALUES ('Blockly', 'Programmatic Logic Puzzle Game', 100);

INSERT INTO grades (student_github, project_title, grade) VALUES ('jacks', 'Markov', 10);
INSERT INTO grades (student_github, project_title, grade) VALUES ('jacks', 'Blockly', 2);
INSERT INTO grades (student_github, project_title, grade) VALUES ('sdevelops', 'Ebay', 50);
INSERT INTO grades (student_github, project_title, grade) VALUES ('sdevelops', 'Amazon', 100);


SELECT last_name FROM students;
SELECT github, first_name FROM students;
SELECT * FROM students WHERE first_name = 'Sarah';
SELECT * FROM students WHERE github = 'sdevelops';
SELECT first_name, last_name FROM students WHERE github='jhacks';

SELECT title, max_grade FROM projects WHERE max_grade >50;
SELECT title, max_grade FROM projects WHERE max_grade BETWEEN 10 AND 60;
SELECT title, max_grade FROM projects WHERE max_grade < 25 OR max_grade > 75;
SELECT * FROM projects ORDER BY max_grade desc;

SELECT first_name, last_name FROM students WHERE github = 'jacks';

SELECT project_title, grade FROM grades WHERE student_github = 'jacks';

SELECT title, max_grade FROM projects;

SELECT
students.github,
students.first_name,
students.last_name,
student_github,
grades.grade,
grades.project_title,
grades.max_grade
FROM students
JOIN grades
JOIN projects
ON grades.project_title = projects.title;
ON students.github = grades.student_github;

SELECT * FROM students JOIN grades ON (students.github = grades.student_github);

SELECT first_name. last_name, project_title, grade FROM students JOIN project

SELECT first_name, last_name, project_title, grade, max_grade FROM students
JOIN grades ON students.github=grades.student_github
JOIN projects ON grades.project_title=projects.title
WHERE student_github='jacks';




