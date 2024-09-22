USE problem_solving;

-- How to find a user's third transaction using SQL window functions?


CREATE TABLE transactions (
  user_id INT,
  spend DECIMAL(10,2),
  transaction_date DATETIME
);

INSERT INTO transactions (user_id, spend, transaction_date)
VALUES
  (111, 100.50, '2022-01-08 12:00:00'),
  (111, 55, '2022-01-10 12:00:00'),
  (121, 36, '2022-01-18 12:00:00'),
  (145, 24.99, '2022-01-26 12:00:00'),
  (111, 89.60, '2022-02-05 12:00:00'); 
  
  
  WITH Cte as(
  SELECT user_id, spend, transaction_date,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date)AS Row_num
  FROM transactions)
  SELECT user_id, spend, transaction_date 
  FROM Cte
  WHERE Row_num = 3;
  
  
  
  SELECT user_id, spend, transaction_date
  FROM(SELECT user_id, spend, transaction_date,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date)AS Row_num
  FROM transactions)as x
  WHERE x.Row_num = 3;
  
  
  
  
  
  
  
  
  
  
  
  