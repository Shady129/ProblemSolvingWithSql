
--Write Solution to calculate the bonus of each employee
--The bonus of an employee is 100% of thir salary if the ID
--of the employee is an odd and the employees's name does not start with 'm'.
--the bonus of an employee is 0otherwise.

--SQL Schema:

SQL Schema:
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int)
Truncate table Employees
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000')
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800')
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400')
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100')
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700')




--Solution:


SELECT employee_id, name, salary,
CASE 
WHEN (employee_id % 2 <> 0) AND (name NOT like '%m%') THEN salary
ELSE 0
END AS Bonus
FROM Employees;














