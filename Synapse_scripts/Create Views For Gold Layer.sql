-- CREATE CALENDAR VIEW
------------------------
CREATE VIEW gold.calendar
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Calendar/',
            FORMAT = 'PARQUET'
        ) as QUERY1

-- CREATE PRODUCTS VIEW
------------------------
CREATE VIEW gold.products
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Products/',
            FORMAT = 'PARQUET'
        ) as QUERY2

-- CREATE RETURNS VIEW
------------------------
CREATE VIEW gold.returns
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Returns/',
            FORMAT = 'PARQUET'
        ) as QUERY3

-- CREATE CUSTOMERS VIEW
------------------------
CREATE VIEW gold.customers
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Customers/',
            FORMAT = 'PARQUET'
        ) as QUERY4

-- CREATE PRODUCT CATEGORIES VIEW
------------------------
CREATE VIEW gold.product_categories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Product_Categories/',
            FORMAT = 'PARQUET'
        ) as QUERY5

-- CREATE PRODUCT SUB_CATEGORIES VIEW
------------------------
CREATE VIEW gold.product_subcategories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/Product_Subcategories/',
            FORMAT = 'PARQUET'
        ) as QUERY6

-- CREATE TERRITORIES VIEW
------------------------
CREATE VIEW gold.territories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as QUERY7

-- CREATE SALES VIEW
------------------------
CREATE VIEW gold.sales
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://adventureworksshalz.dfs.core.windows.net/silver/AdventureWorks_Sales/',
            FORMAT = 'PARQUET'
        ) as QUERY8