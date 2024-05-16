--Retrieve the complete data.

SELECT * FROM [dbo].[ Car Dataset]

--Identitfy the null values in dataset

SELECT * FROM [dbo].[ Car Dataset]
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL


--Delete all the null values.

DELETE FROM dbo.[ Car Dataset]
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL

--Find the top selling car brand by price.

select top 1 Car_make,sum(Price) As total_sales
FROM dbo.[ Car Dataset]
group by Car_make
order by total_sales desc

--Find the top selling car brand by unit_sold

SELECT TOP 1 Car_make,
SUM(Sales_Figures_Units_Sold) AS Quantity_sold
FROM dbo.[ Car Dataset]
group by Car_make
order by Quantity_sold desc;


--Find the Sales Performance Analysis.

SELECT TOP 10 Car_Make,
Car_Model,
Year,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[ Car Dataset]
GROUP BY Car_Make,
Car_Model,
Year
ORDER BY unit_sold DESC;

 --Show the customer preferences for the car brand.

 SELECT TOP 10 Car_Make,
Car_Model, Body_Type,
Color_Options,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[ Car Dataset]
GROUP BY 
Car_Make,
Car_Model,
Body_Type,
Color_Options
ORDER BY unit_sold DESC;

--Find the Fuel efficiency impact 

SELECT TOP 10
Car_Make,
Car_Model,
Mileage_MPG,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[ Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Mileage_MPG
ORDER BY unit_sold DESC

--Price sensitivity 


SELECT TOP 10
Car_Make,
Car_Model,
SUM(Price) AS total_sales,
AVG(TRY_CAST(LEFT(Customer_Ratings , 3) AS FLOAT)) AS avg_rating
FROM dbo.[ Car Dataset]
GROUP BY
Car_Make,
Car_Model
ORDER BY
total_sales DESC;

--Safety and featuers impact 


SELECT TOP 10
Car_Make,
Car_Model,
SUM(Price) AS total_sales,
AVG(TRY_CAST(LEFT(Customer_Ratings , 3) AS FLOAT)) AS avg_rating,
Safety_Features,
Entertainment_Features
FROM dbo.[ Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Safety_Features,
Entertainment_Features
ORDER BY
total_sales DESC

--Market trend analysis 

SELECT TOP 10 
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year,
SUM(Sales_Figures_Units_Sold) AS unit_sold
FROM dbo.[ Car Dataset]
GROUP BY
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year
ORDER BY 
unit_sold DESC
