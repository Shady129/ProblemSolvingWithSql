
-- Find Customers With Positive Revenue In Year 2021:




SELECT customer_id 
FROM Customers
WHERE year = 2021 
AND revenue > 0;
