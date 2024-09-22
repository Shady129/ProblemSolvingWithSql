
--Generating a Date Series From '2023 - 01 - 01' till '2023 - 01 - 31';



DECLARE @StartDate Date = '2023 - 01 - 01';
DECLARE @EndtDate Date = '2023 - 01 - 31';


With DateSeries AS(

	SELECT @StartDate AS DateValue

	UNION ALL


	SELECT DATEADD(DAY, 1, DateValue)
	FROM DateSeries

	WHERE DateValue < @EndtDate)

	SELECT DateValue FROM DateSeries;