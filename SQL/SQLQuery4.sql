-- SALES TREND ANALYSIS
-- Monthly wise sales trend over the stores, location for both year (2022 & 2023)

SELECT STORES.Store_Location, STORES.Store_City, YEAR(SALES.Date) AS Year, DATENAME(MONTH, SALES.Date) AS Month, COUNT(SALES.Sale_ID) AS Total_Sales
FROM SALES

INNER JOIN PRODUCTS
ON SALES.Product_ID = PRODUCTS.Product_ID

INNER JOIN INVENTORY
ON PRODUCTS.Product_ID = INVENTORY.Product_ID

INNER JOIN STORES
ON INVENTORY.Store_ID = STORES.Store_ID

GROUP BY STORES.Store_Location, STORES.Store_City, SALES.Date
ORDER BY Year, Month, Store_Location, Store_City