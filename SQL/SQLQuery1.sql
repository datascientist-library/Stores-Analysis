-- INVENTORY HEALTH ANALYSIS
-- Find out the average inventory as per the store and product.

SELECT STORES.Store_ID, STORES.Store_Name, STORES.Store_Location, PRODUCTS.Product_Name, PRODUCTS.Product_Category, AVG(INVENTORY.Stock_On_Hand) AS Average_Stock
FROM INVENTORY

INNER JOIN PRODUCTS
ON INVENTORY.Product_ID = PRODUCTS.Product_ID

INNER JOIN STORES
ON PRODUCTS.Product_ID = INVENTORY.Product_ID

GROUP BY STORES.Store_ID ,STORES.Store_Name, STORES.Store_Location, PRODUCTS.Product_Name, PRODUCTS.Product_Category