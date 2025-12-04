-- STORES PERFORMANCE ANALYSIS
-- Find the sales trend over the different Stores and find the best and least five stores as per the performance in one query.

SELECT STORES.Store_Location, STORES.Store_City, COUNT(SALES.Sale_ID) AS Total_Sales
FROM SALES

INNER JOIN PRODUCTS
ON SALES.Product_ID = PRODUCTS.Product_ID

INNER JOIN INVENTORY
ON PRODUCTS.Product_ID = INVENTORY.Product_ID

INNER JOIN STORES
ON INVENTORY.Store_ID = STORES.Store_ID

GROUP BY STORES.Store_City, STORES.Store_Location
ORDER BY Total_Sales DESC, Store_Location


-- Best and least 5 stores according to performance.

SELECT * FROM
(
    SELECT TOP 5 
        STORES.Store_Location, 
        STORES.Store_City, 
        COUNT(SALES.Sale_ID) AS Total_Sales
    FROM SALES
    INNER JOIN PRODUCTS
        ON SALES.Product_ID = PRODUCTS.Product_ID
    INNER JOIN INVENTORY
        ON PRODUCTS.Product_ID = INVENTORY.Product_ID
    INNER JOIN STORES
        ON INVENTORY.Store_ID = STORES.Store_ID
    GROUP BY STORES.Store_City, STORES.Store_Location
    ORDER BY Total_Sales DESC

    UNION ALL

    SELECT TOP 5 
        STORES.Store_Location, 
        STORES.Store_City, 
        COUNT(SALES.Sale_ID) AS Total_Sales
    FROM SALES
    INNER JOIN PRODUCTS
        ON SALES.Product_ID = PRODUCTS.Product_ID
    INNER JOIN INVENTORY
        ON PRODUCTS.Product_ID = INVENTORY.Product_ID
    INNER JOIN STORES
        ON INVENTORY.Store_ID = STORES.Store_ID
    GROUP BY STORES.Store_City, STORES.Store_Location
    ORDER BY Total_Sales ASC
) AS CombinedResults;
