--CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'create_your_own_pswd';

-- creation of credentials
--CREATE DATABASE SCOPED CREDENTIAL 'create_your_own_creds'
--WITH
    --IDENTITY = 'Managed Identity'

-- creation of external datasource for silver
CREATE EXTERNAL DATA SOURCE source_silver
WITH
    (
        LOCATION = 'https://adventureworksshalz.dfs.core.windows.net/silver',
        CREDENTIAL = 'create_your_own_creds'
    )

-- creation of external datasource for gold
CREATE EXTERNAL DATA SOURCE source_gold
WITH
    (
        LOCATION = 'https://adventureworksshalz.dfs.core.windows.net/gold',
        CREDENTIAL = 'create_your_own_creds'
    )

-- creation of external file format
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
    (
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
    )

--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTSALES

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.sales

SELECT * FROM gold.sales;

--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTCUST

CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.customers


--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTPROD

CREATE EXTERNAL TABLE gold.extproducts
WITH
(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.products


--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTRETURNS

CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.returns


--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTTERRITORIES

CREATE EXTERNAL TABLE gold.extterritories
WITH
(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.territories


--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTPRODUCT_CATEGORIES

CREATE EXTERNAL TABLE gold.extproduct_categories
WITH
(
    LOCATION = 'extproduct_categories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.product_categories

--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXTPRODUCT_SUBCATEGORIES

CREATE EXTERNAL TABLE gold.extproduct_subcategories
WITH
(
    LOCATION = 'extproduct_subcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.product_subcategories

--------------------------------------------------------------------------------
--- CREATE EXTERNAL TABLE EXT_CALENDAR

CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.calendar