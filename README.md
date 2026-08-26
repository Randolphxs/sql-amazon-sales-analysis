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
1) MULBERRIES BOUTIQUE — 2,094,070.5  
2) AMANI CONCEPT TRADING LLC (KAPDA) — 930,451.0  
3) VAHARSHA BOUTIQUE — 588,760.0  
4) GALAXY GROUP OF COMPANIES PVT. LTD — 445,058.0  
5) RIVAAN LLC — 443,042.0  
6) BHANU SALEINE NAUNITHAM — 429,098.0  
7) SURE FASHIONS LLC — 403,253.0  
8) COTTON CLOSET LTD — 345,265.0  
9) VISHA DEVAN — 321,028.0  
10) NIRUSAH TAILORING — 316,470.0
- **What is the average spending per customer?** - 97,592.85
- **What is the average number of orders per customer?** - 221.49
- **How is revenue distributed across top customers?**
1) MULBERRIES BOUTIQUE — Revenue: 2,094,070.5 (12.77%)  
2) AMANI CONCEPT TRADING LLC (KAPDA) — Revenue: 930,451.0 (5.68%)  
3) VAHARSHA BOUTIQUE — Revenue: 588,760.0 (3.59%)  
4) GALAXY GROUP OF COMPANIES PVT. LTD — Revenue: 445,058.0 (2.71%)  
5) RIVAAN LLC — Revenue: 443,042.0 (2.70%)  
6) BHANU SALEINE NAUNITHAM — Revenue: 429,098.0 (2.62%)  
7) SURE FASHIONS LLC — Revenue: 403,253.0 (2.46%)  
8) COTTON CLOSET LTD — Revenue: 345,265.0 (2.11%)  
9) VISHA DEVAN — Revenue: 321,028.0 (1.96%)  
10) NIRUSAH TAILORING — Revenue: 316,470.0 (1.93%)

### Summary
Customer base size: The dataset contains 168 unique customers.

Top revenue customers: A small subset of customers generates the highest share of revenue (shown in the “top customers by revenue” chart), indicating revenue concentration among leading accounts.

Average spend per customer: Customers spend an average of 97,592.85 (currency not specified) over the observed period.

Average orders per customer: Each customer places an average of 221.49 orders, suggesting frequent repeat purchasing behavior.

Revenue distribution: The revenue distribution chart shows that revenue is not evenly spread across customers—it is skewed, with higher revenue contributions coming from a smaller number of customers.

## Product Analysis

- **Best-selling products**
1) JNE3797-KR-L | 647  
2) JNE3797-KR-M | 555  
3) JNE3797-KR-S | 489  
4) JNE3405-KR-L | 452  
5) J0230-SKD-M | 435  
6) JNE3797-KR-XL | 407  
7) J0230-SKD-S | 401  
8) JNE3405-KR-S | 380  
9) JNE3797-KR-XS | 371  
10) JNE3797-KR-XXL | 352

- **Worst-selling products**
1) JNE3475-KR-K-XS | 0
2) AN201-RED-XXL | 1
3) AN202-ORANGE-XXL | 1
4) AN203-MAROON-XXL | 1
5) AN204-PURPLE-M | 1
6) AN204-PURPLE-S | 1
7) AN205-YELLOW-XXL | 1
8) AN206-GREEN-M | 1
9) AN206-GREEN-S | 1
10) AN206-GREEN-XL | 1

- **Category performance by both units_sold and revenue**
1) Set | 43033 | 35731673.0 |
2) kurta | 42792 | 19425870.0 |
3) Western Dress | 13418 | 10209590.0 |
4) Top | 9368 | 4904066.0 |
5) Ethnic Dress | 1016 | 732744.0 |
6) Blouse | 831 | 418389.0 |
7) Bottom | 384 | 135453.0 |
8) Saree | 147 | 114694.0 |
9) Dupatta | 3 | 915.0 |

- **Average selling price by category**
1) Set | 831.686109749551
2) Saree | 781.475524475524
3) Western Dress | 761.118707457551
4) Ethnic Dress | 722.235932872655
5) Top | 523.686696658098
6) Blouse | 516.456575682382
7) Kurta | 454.733243967828
8) Bottom | 353.90765171504
9) Dupatta | 305.0

- **Products generating the most revenue**
1) J0230-SKD-M | 483611.0 |
2) JNE3797-KR-L | 470083.0 |
3) J0230-SKD-S | 448825.0 |
4) JNE3797-KR-M | 403850.0 |
5) JNE3797-KR-S | 360194.0 |
6) JNE3797-KR-XL | 302519.0 |
7) J0230-SKD-L | 277678.0 |
8) JNE3797-KR-XS | 274609.0 |
9) SET268-KR-NP-XL | 260156.0 |
10) JNE3797-KR-XXL | 253211.0 |

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