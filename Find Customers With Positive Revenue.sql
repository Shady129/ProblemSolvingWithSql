
--Find Customers With Positive Revenue In Year 2021:


--SQL Schema:
--Create table If Not Exists Customers (customer_id int, year int, revenue int)

--insert into Customers (customer_id, year, revenue) values ('1', '2018', '50')
--insert into Customers (customer_id, year, revenue) values ('1', '2021', '30')
--insert into Customers (customer_id, year, revenue) values ('1', '2020', '70')
--insert into Customers (customer_id, year, revenue) values ('2', '2021', '-50')
--insert into Customers (customer_id, year, revenue) values ('3', '2018', '10')
--insert into Customers (customer_id, year, revenue) values ('3', '2016', '50')



SELECT *
FROM Customers
WHERE revenue > 0
AND year = 2021;
