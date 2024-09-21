use project1;

drop table Travel;
CREATE TABLE Travel(
	source text,
	destination text,
	distance int);

insert into Travel(source,destination,distance)
values
('Mumbai', 'Bangalore', 500),
('Bangalore','Mumbai', 500),
('Delhi','Mathura',150),
('Mathura','Delhi',150),
('Pune', 'Nagpur', 500),
('Nagpur','Pune',500);





select *,
    ROW_NUMBER() OVER(PARTITION BY distance ORDER BY source) AS Row_Num
    FROM Travel



DELETE FROM Travel
where distance IN(
SELECT distance FROM(
SELECT *, 
ROW_NUMBER()OVER(PARTITION BY distance ORDER BY source)as Row_Num
FROM Travel )AS x 
WHERE x.Row_Num NOT IN (1,4));





DELETE from Travel 
WHERE SOURCE IN(
SELECT source FROM(
SELECT *, 
ROW_NUMBER()OVER(PARTITION BY distance ORDER BY source)as Row_Num
FROM Travel )AS x 
WHERE x.Row_Num NOT IN (2,3));





DELETE FROM Travel
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM Travel
  GROUP BY MIN(source, destination), MAX(source, destination), distance
);

SELECT * FROM Travel;

SELECT MIN(ROWID) FROM Travel;

















































    














    
    