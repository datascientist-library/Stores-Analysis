-- PRODUCT PERFORMANCE ANALYSIS
-- Find out the report of Product and Store relationship towards sale.

SELECT STORES.Store_ID, STORES.Store_City, STORES.Store_Location, PRODUCTS.Product_Name, PRODUCTS.Product_Category, COUNT(SALES.Sale_ID) AS Total_Sales
FROM SALES

INNER JOIN PRODUCTS
ON SALES.Product_ID = PRODUCTS.Product_ID

INNER JOIN INVENTORY
ON PRODUCTS.Product_ID = INVENTORY.Product_ID

INNER JOIN STORES
ON INVENTORY.Store_ID = STORES.Store_ID

GROUP BY STORES.Store_ID, STORES.Store_City, STORES.Store_Location, PRODUCTS.Product_Name, PRODUCTS.Product_Category
ORDER BY Store_ID



-- Is there any category that outshines the rest? (High demanded product among all locations as per the sales).

SELECT PRODUCTS.Product_Category, PRODUCTS.Product_Name, STORES.Store_City, STORES.Store_Location, COUNT(SALES.Sale_ID) AS Total_Sales
FROM SALES

INNER JOIN PRODUCTS
ON SALES.Product_ID = PRODUCTS.Product_ID

INNER JOIN INVENTORY
ON PRODUCTS.Product_ID = INVENTORY.Product_ID

INNER JOIN STORES
ON INVENTORY.Store_ID = STORES.Store_ID

GROUP BY PRODUCTS.Product_Category, PRODUCTS.Product_Name, STORES.Store_City, STORES.Store_Location
ORDER BY Total_Sales DESC