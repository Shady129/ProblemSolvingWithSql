-- Find Customers Who Never Order:


--SQL Schema:
--Create table If Not Exists Customers (id int, name varchar(255))
--Create table If Not Exists Orders (id int, customerId int)

--insert into Customers (id, name) values ('1', 'Joe')
--insert into Customers (id, name) values ('2', 'Henry')
--insert into Customers (id, name) values ('3', 'Sam')
--insert into Customers (id, name) values ('4', 'Max')
--Truncate table Orders
--insert into Orders (id, customerId) values ('1', '3')
--insert into Orders (id, customerId) values ('2', '1


--First Solution

SELECT  name
FROM Customers
WHERE id Not IN
(SELECT  c.id
FROM Customers AS c
JOIN Orders o
ON o.customerId = c.id);



--Second Solution

SELECT c.id, c.name
FROM Customers AS c
left join Orders o
ON c.id = o.customerId
WHERE o.customerId is NULL;