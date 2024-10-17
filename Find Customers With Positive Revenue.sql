
-- Find Customers With Positive Revenue In Year 2021:



SELECT *
FROM Customers
WHERE revenue > 0
AND year = 2021;