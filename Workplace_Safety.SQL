USE [September 2025 Cohort]

SELECT *
FROM
	[Workplace Safety Data]

--How many incidents occurred at each plant?

SELECT
	Plant,
	COUNT(DATE) [Incident Count]
FROM
	[Workplace Safety Data]
GROUP BY
	Plant

--What is the total incident cost per department?

SELECT 
	Department,
	SUM([Incident Cost]) AS [Total Incident Cost]
FROM
	[Workplace Safety Data]
GROUP BY
	Department

--Which incident type resulted in the highest total days lost?

SELECT 
	[Incident Type],
	[Days Lost]
FROM
	[Workplace Safety Data]
ORDER BY 
	[Days Lost] DESC

--What is the distribution of incident types by shift?

SELECT 
	Shift,
	[Incident Type],
	COUNT(*) AS [Total Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	Shift,[Incident Type]

--What is the average incident cost for each injury location?

SELECT 
	[Injury Location],
	AVG([Incident Cost]) AS [Average Incident Cost]
FROM
	[Workplace Safety Data]
GROUP BY
	[Injury Location]

--Which age group has the highest number of incidents?

SELECT 
	[Age Group],
	COUNT(*) AS [Total Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	[Age Group]
ORDER BY
	[Total Incidents] DESC

--How many incidents were reported as 'Lost Time' by each plant?

SELECT 
	Plant,
	COUNT(*) AS [Lost Time]
FROM
	[Workplace Safety Data]
WHERE 
	[Report Type] = 'Lost Time'
GROUP BY
	Plant
ORDER BY [Lost Time] DESC

--Which department had the highest number of 'Crush & Pinch' incidents?

SELECT TOP 1
	Department,
	COUNT(*) AS [Count Of Incident]
FROM
	[Workplace Safety Data]
WHERE
	[Incident Type] = 'Crush & Pinch'
GROUP BY
	Department
ORDER BY
	[Count Of Incident]

--Which plants reported the most "Near Miss" incidents?

SELECT 
	Plant,
	COUNT(*) AS [Near Miss Incidents]
FROM
	[Workplace Safety Data]
WHERE
	[Report Type] = 'Near Miss'
GROUP BY
	Plant
ORDER BY
	[Near Miss Incidents] DESC

--What is the total number of incidents by year and month?

SELECT 
	Year,
	Month,
	COUNT(*) AS [Total Number of Incidents]
FROM
	[Workplace Safety Data]
GROUP BY 
	Year, Month
ORDER BY 
	Year, Month

--Which gender has the most reported incidents?

SELECT TOP 1
	Gender,
	COUNT(*) AS [Total Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	Gender
ORDER BY
	[Total Incidents] DESC

--What is the total cost of incidents per year?

SELECT 
	Year,
	SUM([Incident Cost]) AS [Total Cost of Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	Year

--Which incident resulted in the highest cost?

SELECT TOP 1
	[Incident Type],
	SUM([Incident Cost]) AS [Total Incident Cost] 
FROM
	[Workplace Safety Data]
GROUP BY 
	[Incident Type]
ORDER BY 
	[Total Incident Cost] DESC

--What is the total cost of incidents for each report type?

SELECT 
	[Report Type],
	SUM([Incident Cost]) AS [Total Cost of Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	[Report Type]

--Which departments had incidents with more than 2 days lost?

SELECT 
	Department,
	COUNT(*) [Total Days Lost]
FROM
	[Workplace Safety Data]
WHERE 
	[Days Lost] > 2
GROUP BY
	Department

--What is the distribution of incidents by shift (Day, Afternoon, Night)?

SELECT
	Shift,
	COUNT(*) AS [Count of Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	Shift

--Which months have the highest number of incidents?

SELECT 
	Month,
	COUNT(*) AS [Total Incidents]
FROM
	[Workplace Safety Data]
GROUP BY
	Month

SELECT 
    CASE [Month]
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS [Month Name],
    COUNT(*) AS [Total Incidents]
FROM 
    [Workplace Safety Data]
GROUP BY 
    [Month]

--What is the total cost of "Vehicle" related incidents?

SELECT 
	[Incident Type],
	SUM([Incident Cost]) AS [Total Cost]
FROM
	[Workplace Safety Data]
WHERE
	[Incident Type] = 'Vehicle'
GROUP BY
	[Incident Type]

--Which age group is most affected by "Falling Object" incidents?

SELECT TOP 1
	[Age Group],
	COUNT(*) AS [Count of Incident Type]
FROM
	[Workplace Safety Data]
WHERE 
	[Incident Type] = 'Falling Object'
GROUP BY
	[Age Group]
ORDER BY 
	[Count of Incident Type] DESC
