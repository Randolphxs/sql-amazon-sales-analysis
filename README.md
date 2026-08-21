# Amazon Sales Analysis

## Project Overview

This project focuses on analyzing e-commerce sales data using SQL and SQLite.

The goal of the project is to clean the dataset, explore sales performance, analyze customers and products, identify trends, and generate actionable business insights.

## Dataset

The dataset contains e-commerce sales information including orders, products, categories, sales amounts, customer locations, order status, and other attributes.

## Data Cleaning

- Handled NULL values
- Checked for duplicate records
- Corrected inappropriate data types
- Standardized inconsistent categories
- Validated date values
- Removed unnecessary columns

## Exploratory Analysis

- Total revenue
- Total orders
- Total customers
- Average order value
- Best-selling products
- Order status rate
- Sales by date
- Revenue and units_sold by category
- Top products by revenue
- Sales by state
- Top cities by revenue
- Promotion analysis
- B2B vs non-B2B

##     (Results Summary)

### Key KPIs

- **Total revenue:** 71,673,394.0
- **Total orders:** 120,378
- **Average order value (AOV):** 694.56
- **Cancellation rate:** 14.21%

### Order status breakdown

- **Shipped:** 110,643
- **Cancelled:** 18,332
- **All (including other/unknown statuses):** 128,975

### Time highlights

- **Highest daily sales:** 2022-04-05 — 1,105,587
- **Lowest daily sales:** 2022-03-31 — 94,810
- **Monthly revenue:**
    - 2022-03 — 94,810.0
    - 2022-04 — 26,234,520.0
    - 2022-05 — 23,953,534.0
    - 2022-06 — 21,390,530.0

### Fulfillment channel performance

- **Amazon:** 73,199 orders — 50,593,039 revenue
- **Merchant:** 29,994 orders — 21,080,355 revenue

### Geography highlights

- **Top state by revenue:** Maharashtra
- **Lowest state by revenue:** Punjab/Mohali/Zirakpur

## Customer Analysis

- **How many unique customers are there?** 168
- **Which customers generate the most revenue?** 
    1. MULBERRIES BOUTIQUE — 2,094,070.5  
    2. AMANI CONCEPT TRADING LLC (KAPDA) — 930,451.0  
    3. VAHARSHA BOUTIQUE — 588,760.0  
    4. GALAXY GROUP OF COMPANIES PVT. LTD — 445,058.0  
    5. RIVAAN LLC — 443,042.0  
    6. BHANU SALEINE NAUNITHAM — 429,098.0  
    7. SURE FASHIONS LLC — 403,253.0  
    8. COTTON CLOSET LTD — 345,265.0  
    9. VISHA DEVAN — 321,028.0  
    10. NIRUSAH TAILORING — 316,470.0
- **What is the average spending per customer?** - 97,592.85
- **What is the average number of orders per customer?** - 221.49
- **How is revenue distributed across top customers?**
    | # | CUSTOMER | customer_revenue | revenue_percentage |
| --- | --- | --- | --- |
| 1 | MULBERRIES BOUTIQUE | 2094070.5 | 12.77 |
| 2 | AMANI CONCEPT TRADING LLC (KAPDA) | 930451.0 | 5.68 |
| 3 | VAHARSHA BOUTIQUE | 588760.0 | 3.59 |
| 4 | GALAXY GROUP OF COMPANIES PVT. LTD | 445058.0 | 2.71 |
| 5 | RIVAAN LLC | 443042.0 | 2.7 |
| 6 | BHANU SALEINE NAUNITHAM | 429098.0 | 2.62 |
| 7 | SURE FASHIONS LLC | 403253.0 | 2.46 |
| 8 | COTTON CLOSET LTD | 345265.0 | 2.11 |
| 9 | VISHA DEVAN | 321028.0 | 1.96 |
| 10 | NIRUSAH TAILORING | 316470.0 | 1.93 |

### Summary
Customer base size: The dataset contains 168 unique customers.
Top revenue customers: A small subset of customers generates the highest share of revenue (shown in the “top customers by revenue” chart), indicating revenue concentration among leading accounts.
Average spend per customer: Customers spend an average of 97,592.85 (currency not specified) over the observed period.
Average orders per customer: Each customer places an average of 221.49 orders, suggesting frequent repeat purchasing behavior.
Revenue distribution: The revenue distribution chart shows that revenue is not evenly spread across customers—it is skewed, with higher revenue contributions coming from a smaller number of customers.

## Product Analysis

- Best and worst-performing products
- Category performance
- Revenue by category

## Time Analysis

- Monthly revenue
- Monthly orders
- Growth and decline trends
- Seasonal patterns

## Business Recommendations

Key findings and actionable recommendations will be added after completing the analysis.

## Tools Used

- SQLite
- SQL
- GitHub