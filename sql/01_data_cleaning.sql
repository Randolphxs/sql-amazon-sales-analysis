-- Data Cleaning

--The Unnamed: 22 column was completely removed from the dataset.

-- NULL Values

UPDATE asr
SET "promotion-ids" = 'No Promotion'
WHERE "promotion-ids" IS NULL;

-- NULL values were interpreted as orders where no promotion was applied, and this is why we replaced them.

UPDATE asr
SET "Courier Status" = 'Not Applicable'
WHERE "Courier Status" IS NULL;

--NULL values were replaced with "Not Applicable", because cancelled orders did not proceed to the courier stage.

--About NULL values in currency and amount columns:
--NULL values were found exclusively in cancelled orders. No non-cancelled orders had missing financial information. Since cancelled orders did not result in a completed sale, the NULL values were retained rather than replaced with artificial values.


-- Duplicates

WITH duplicates AS (
    SELECT
        "Order ID",
        "Date",
        "Status",
        "Fulfilment",
        "Sales Channel",
        "ship-service-level",
        "Style",
        "SKU",
        "Category",
        "Size",
        "ASIN",
        "Courier Status",
        "Qty",
        "currency",
        "Amount",
        "ship-city",
        "ship-state",
        "ship-postal-code",
        "ship-country",
        "promotion-ids",
        "B2B",
        "fulfilled-by"
    FROM asr
    GROUP BY
        "Order ID",
        "Date",
        "Status",
        "Fulfilment",
        "Sales Channel",
        "ship-service-level",
        "Style",
        "SKU",
        "Category",
        "Size",
        "ASIN",
        "Courier Status",
        "Qty",
        "currency",
        "Amount",
        "ship-city",
        "ship-state",
        "ship-postal-code",
        "ship-country",
        "promotion-ids",
        "B2B",
        "fulfilled-by"
    HAVING COUNT(*) > 1
)
SELECT *
FROM duplicates;

--The dataset was checked for exact duplicate rows across all columns.
--No exact duplicate rows were found.
--Repeated values such as Order ID, SKU, ASIN, Style, etc. were not treated as duplicates, since these values can legitimately appear in multiple records.
--Therefore, no rows were removed during duplicate cleaning.

-- Incorrect Data Types

SELECT *
FROM asr;

PRAGMA table_info(asr);

SELECT
    CAST("Amount" AS REAL) AS "Amount",
    CAST("ship-postal-code" AS TEXT) AS "ship-postal-code"
FROM asr;

--Data Type Correction: 
--Amount was converted from TEXT to REAL,
--While ship-postal-code was converted from REAL to INTEGER to ensure appropriate data types for analysis.


--Inconsistent Categories

SELECT 
    "ship-city",
    COUNT(*) AS count
FROM asr
WHERE "ship-city" GLOB '[.,]*'
GROUP BY "ship-city"
ORDER BY count DESC;

--ship-city: 
--5 records contained unnecessary leading punctuation (. or ,). 
--These were identified as formatting inconsistencies.

UPDATE asr
SET "ship-city" = LTRIM("ship-city", '.,')
WHERE "ship-city" GLOB '[.,]*';

--The five formatting inconsistencies were standardized by removing unnecessary leading punctuation. 
--No other part of the city values was modified.

SELECT DISTINCT "ship-state"
FROM asr
ORDER BY "ship-state";

--The ship-state column contains multiple types of inconsistencies, including inconsistent capitalization, spelling variations, abbreviations, and potentially non-standard location values.
--Standardized Arunachal Pradesh variations to ARUNACHAL PRADESH.
UPDATE asr
SET "ship-state" = 'ARUNACHAL PRADESH'
WHERE LOWER("ship-state") = 'arunachal pradesh';


-- Standardize Rajasthan misspellings
UPDATE asr
SET "ship-state" = 'RAJASTHAN'
WHERE LOWER("ship-state") IN ('rajshthan', 'rajsthan');

-- Standardize Orissa to Odisha
UPDATE asr
SET "ship-state" = 'ODISHA'
WHERE LOWER("ship-state") = 'orissa';

-- Standardize Pondicherry/Puducherry
UPDATE asr
SET "ship-state" = 'PUDUCHERRY'
WHERE LOWER("ship-state") IN ('pondicherry', 'puducherry');

--Standardize Sikkim/SIKKIM
UPDATE asr
SET "ship-state" = 'SIKKIM'
WHERE LOWER("ship-state") = 'sikkim';

UPDATE asr
SET "ship-state" = UPPER("ship-state")
WHERE "ship-state" IN (
    'Arunachal Pradesh',
    'Arunachal pradesh',
    'Bihar',
    'Chandigarh',
    'Delhi',
    'Goa',
    'Gujarat',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Puducherry',
    'bihar',
    'delhi',
    'goa',
    'orissa',
    'punjab',
    'rajasthan',
    'rajsthan'
);

--State names were standardized to uppercase for consistency.

UPDATE asr
SET "ship-state" = 'RAJASTHAN'
WHERE "ship-state" = 'RJ';

UPDATE asr
SET "ship-state" = 'NAGALAND'
WHERE "ship-state" = 'NL';

UPDATE asr
SET "ship-state" = 'PUNJAB'
WHERE "ship-state" = 'PB';

UPDATE asr
SET "ship-state" = 'ARUNACHAL PRADESH'
WHERE "ship-state" = 'AR';

SELECT DISTINCT "ship-country"
FROM asr
ORDER BY "ship-country";

--No inconsistent country categories were found. NULL values were identified as missing data

SELECT DISTINCT "B2B"
FROM asr
ORDER BY "B2B";

--The values are consistent Boolean categories. No inconsistencies were identified.

SELECT DISTINCT "fulfilled-by"
FROM asr
ORDER BY "fulfilled-by";

--No inconsistent categories were identified. NULL values were recorded as missing data.

-- Invalid Dates

SELECT COUNT(*) AS null_dates
FROM asr
WHERE "Date" IS NULL;

SELECT DISTINCT "Date"
FROM asr
WHERE 
	CAST(SUBSTR("Date", 1, 2) AS INTEGER) NOT BETWEEN 1 AND 12
	OR 
	CAST(SUBSTR("Date", 4, 2) AS INTEGER) NOT BETWEEN 1 AND 31
ORDER BY "Date";

--No invalid dates were identified. The Date column requires no further cleaning.