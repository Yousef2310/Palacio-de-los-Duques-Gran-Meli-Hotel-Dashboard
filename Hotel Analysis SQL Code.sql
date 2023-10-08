-- 3 Years Data Combined 

WITH Hotel AS (
SELECT * FROM [2018]
UNION 
SELECT * FROM [2019]
UNION 
SELECT * FROM [2020]
) 
SELECT * FROM Hotel
ORDER BY arrival_date_year ASC

------------------------------------------------------------------------------

-- Is our hotel revenue growing ? Brokendown by hotel type.

WITH Hotel AS (
SELECT * FROM [2018]
UNION 
SELECT * FROM [2019]
UNION 
SELECT * FROM [2020]
) 

SELECT 
	arrival_date_year, Hotel, 
	CAST(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS MONEY) Revenue
FROM 
	Hotel
GROUP BY 
	arrival_date_year, hotel

------------------------------------------------------------------------------

-- Developing Final SQL Query for Visualizations 

WITH Hotel AS (
SELECT * FROM [2018]
UNION 
SELECT * FROM [2019]
UNION 
SELECT * FROM [2020]
) 
SELECT
	*
FROM
	Hotel H 
LEFT JOIN 
	market_segment MS
ON
	H.market_segment = MS.market_segment 
LEFT JOIN 
	meal_cost cost
ON 
	cost.meal = H.meal
