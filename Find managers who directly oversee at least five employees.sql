
 /*Task: Write a SQL query to find managers who directly oversee at least five employees within the same department.
 We'll also retrieve the department name and the total number of direct reports per manager,
 but only for departments with more than 10 employees.*/


CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId) VALUES 
(1, 'John', 'HR', NULL),
(2, 'Bob', 'HR', 1),
(3, 'Olivia', 'HR', 1),
(4, 'Emma', 'Finance', NULL),
(5, 'Sophia', 'HR', 1),
(6, 'Mason', 'Finance', 4),
(7, 'Ethan', 'HR', 1),
(8, 'Ava', 'HR', 1),
(9, 'Lucas', 'HR', 1),
(10, 'Isabella', 'Finance', 4),
(11, 'Harper', 'Finance', 4),
(12, 'Hemla', 'HR', 3),
(13, 'Aisha', 'HR', 2),
(14, 'Himani', 'HR', 2),
(15, 'Lily', 'HR', 2);



SELECT * FROM Employee;



-- Solution:

SELECT e1.name, e1.department, COUNT(e1.id)
FROM Employee AS e1
JOIN Employee AS e2
ON e1.managerId = e2.managerId
AND e1.department = e2.department


JOIN 


(SELECT department, COUNT(id) AS TotalEmployees
FROM Employee 
GROUP BY department
HAVING COUNT(id) > 10) d
ON e1.department = d.department
GROUP BY e1.id, e1.name, e1.department
HAVING COUNT(e1.id) >= 5; 





