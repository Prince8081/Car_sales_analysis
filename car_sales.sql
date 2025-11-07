create database car_sales_db ; 
use car_sales_db ;

select * from car_sales ;

-- Total Car Sales -- 

SELECT 
    SUM(sales) AS total_sales
FROM
    car_sales; 
    
    
 -- Top 5 Best-Selling Models --
 
SELECT 
    Make, Model, SUM(sales) AS total_sales
FROM
    car_sales
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 5;


 -- Sales by Brand (Make) -- 
 
 SELECT 
    Make, SUM(sales) AS total_sales
FROM
    car_sales
GROUP BY 1
ORDER BY 2 DESC;

-- Sales by Segment -- 

SELECT 
    segment, SUM(sales) AS total_sales
FROM
    car_sales
GROUP BY 1
ORDER BY 2 DESC;


-- Sales by Body Type -- 
 
SELECT 
    `body type`, SUM(sales) AS total_sales
FROM
    car_sales
GROUP BY 1
ORDER BY 2 DESC;


 -- Monthly Sales Trend -- 
 
SELECT 
    Month , SUM(sales) AS total_sales
FROM
    car_sales
GROUP BY 1 ;


-- Average MoM% and YoY% Growth by boby type -- 

SELECT 
    `Body type`,
    ROUND(AVG(`MoM %`), 2) AS Avg_MoM_Growth,
    ROUND(AVG(`YoY %`), 2) AS Avg_YoY_Growth
FROM
    car_sales
GROUP BY 1;

-- Segment with Highest YoY Growth -- 
 
SELECT 
    segment, ROUND(AVG(`YoY %`), 2) AS Avg_YoY_Growth
FROM
    car_sales
GROUP BY 1
ORDER BY 2 DESC;


-- Electric vs Non-Electric Models -- 

SELECT 
    CASE
        WHEN model LIKE 'e-%' OR model LIKE '%EV%' THEN 'Electronic'
        ELSE 'Non-electronic'
    END AS car_type,
    SUM(sales) as total_sales 
FROM
    car_sales
GROUP BY 1;





