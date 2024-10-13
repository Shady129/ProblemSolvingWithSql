--Find Duplicate Records By 3 Ways:

-- Dataset

--('Jersey', 30, 'New Yourk'),
--('Kimi', 25, 'Los Angeles'),
--('Jersey', 30, 'New Yourk'),
--('Charlie', 22, 'Chicago'),
--('Kimi', 25, 'Los Angeles');



-- First Way: Using DISTINCT Function. 

SELECT DISTINCT *
FROM Persons;



--Seccond Way: Using Cte + Row_Number Window Function. 

WITH Cte_Duplicates AS(
SELECT Name, Age, City,
ROW_NUMBER() OVER(PARTITION BY Name, Age, City ORDER BY Age)AS Row_Num
FROM Persons)
SELECT * FROM Cte_Duplicates
WHERE Row_Num = 1;




--Third Way: Using Group By Function.

SELECT Name, Age, City
FROM Persons 
GROUP BY Name, Age, City;


