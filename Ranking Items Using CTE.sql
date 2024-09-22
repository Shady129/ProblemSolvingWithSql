-- Ranking sales employees in a company.

CREATE TABLE SalesRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO SalesRecords (EmployeeID, SaleAmount, SaleDate) VALUES
(1, 1200.50, '2023-01-10'),
(2, 800.00, '2023-01-11'),
(1, 600.25, '2023-01-15'),
(3, 950.75, '2023-01-20'),
(2, 400.00, '2023-01-21'),
(1, 300.00, '2023-01-25'),
(3, 1200.00, '2023-01-30'),
(2, 750.00, '2023-02-05'),
(1, 500.00, '2023-02-10'),
(3, 850.00, '2023-02-15'),
(4, 3000.75, '2023-02-15');



SELECT * FROM SalesRecords;



--Ranking Items

WITH TotalSalesAmount AS
(SELECT EmployeeID, SUM(SaleAmount) As TotalSales
FROM SalesRecords
GROUP BY EmployeeID),

RankSales As(
	SELECT *,
	RANK()OVER(ORDER BY TotalSales DESC) As Sales_Rank
	FROM TotalSalesAmount)
	SELECT * FROM RankSales;

