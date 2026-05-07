# Amazon India — Customer Satisfaction & Pricing Analysis

> An end-to-end Business Analysis project exploring the relationship between discounting strategy, pricing, and customer satisfaction across 1,465 Amazon India products using Excel, MySQL, Power BI, and Tableau.

**Prepared by:** Diwanshu Sharma | MBA Marketing  
**Data Source:** Kaggle — Amazon Sales Dataset  
**Tools Used:** Microsoft Excel | MySQL | Power BI | Tableau  

---

## Live Dashboard & Story

| Tool | Link |
|---|---|
| Tableau Story | [View on Tableau Public](https://public.tableau.com/views/AmazonIndiaCustomerSatisfactionPricingAnalysis/Introduction) |
| Power BI Dashboard | See `/PowerBI/Amazon_Dashboard.pbix` |

---

## Project Overview

This project follows a complete Business Analyst workflow — from raw data ingestion to executive-level storytelling:

```
Raw CSV → Excel (Clean) → MySQL (Validate) → Power BI (Dashboard) → Tableau (Story)
```

Each tool serves a distinct, justified purpose:

| Tool | Purpose |
|---|---|
| Excel | Data cleaning, enrichment, and preliminary pivot analysis |
| MySQL | Data validation, cross-verification of insights via SQL queries |
| Power BI | Interactive business dashboard for stakeholder exploration |
| Tableau | Narrated story presentation for executive communication |

---

## Dataset

- **Source:** Kaggle Amazon India Sales Dataset
- **Size:** 1,465 rows | 16 original columns | 21 after enrichment
- **Categories:** 9 product categories
- **Key columns:** product_id, category, discounted_price, actual_price, discount_percentage, rating, rating_count

### Data Enrichment — Added Columns

| Column | Description |
|---|---|
| `main_category` | Extracted first level of category hierarchy |
| `price_band` | Price segments: Under Rs.200 / Rs.200-500 / Rs.500-1500 / Rs.1500+ |
| `discount_bucket` | Discount segments: 0-30% / 31-50% / 51-70% / 71%+ |
| `rating_tier` | Review volume: Low (<1k) / Medium (1k-10k) / High (10k+) |
| `reliability_flag` | Sample size flag: Reliable (50+) / Caution (10-50) / Small Sample (<10) |

---

## Key Findings

### Finding 1 — Heavy Discounting Hurts Customer Satisfaction

Products with 0-30% discount average **4.16 rating** vs **4.01** for 71%+ discount products. A clear downward trend exists — as discounting increases, customer satisfaction decreases consistently across all reliable categories.

### Finding 2 — Price Signals Quality

Premium products (Rs.1500+) average **4.13 rating** vs **4.05** for budget products (Under Rs.200). Higher priced products are also less discounted — suggesting a consistent quality positioning strategy at the premium end.

### Finding 3 — Office Products: The Benchmark Category

Office Products achieves the **highest rating (4.31)** with only **12% average discount** — far below the platform average of 48%. This category proves that quality and customer satisfaction do not require heavy discounting.

### Finding 4 — Hidden Gems Identified

Using SQL Query 5 and Tableau visualization, **10 products** were identified with ratings of 4.5+ but fewer than 500 reviews. Three products achieve **perfect 5.0 ratings** with under 25 reviews — representing significant promotion opportunities for Amazon India.

### Finding 5 — Data Quality Issue: Duplicate Reviews Detected

**114 duplicate product entries** were identified during SQL validation. All duplicates are concentrated in Computers&Accessories USB cable products — each appearing exactly 3 times, inflating review counts by up to 300%. Rating scores remain reliable. Review volume metrics were treated with caution.

---

## Project Structure

```
amazon-india-customer-satisfaction-analysis/
│
├── README.md
│
├── Data/
│   └── amazon_clean_mysql.csv
│
├── Excel/
│   └── Amazon_BA_Project_File.xlsx
│
├── SQL/
│   ├── amazon_queries.sql
│   └── Exports/
│       ├── query1_category_overview.csv
│       ├── query2_discount_vs_rating.csv
│       ├── query3_price_band_analysis.csv
│       ├── query4_review_tier_analysis.csv
│       ├── query5_hidden_gems.csv
│       └── query6_data_quality.csv
│
├── PowerBI/
│   └── Amazon_Dashboard.pbix
│
└── Tableau/
    └── Amazon_India_Analysis.twbx
```

---

## SQL Queries Summary

| Query | Business Question | Key Finding |
|---|---|---|
| Q1 | Category performance overview | Office Products leads at 4.31 avg rating |
| Q2 | Discount bucket vs rating | Rating drops consistently as discount increases |
| Q3 | Price band vs rating | Premium products rate highest at 4.13 |
| Q4 | Review tier vs rating | High review products rate 4.15 vs 3.99 for low review |
| Q5 | Hidden gems identification | 10 products rate 4.5+ with under 500 reviews |
| Q6 | Duplicate detection | 114 duplicate entries found in Computers&Accessories |

---

## Data Quality Notes

| Issue | Finding | Impact | Action Taken |
|---|---|---|---|
| Small sample categories | 5 of 9 categories have fewer than 10 products | Category comparisons unreliable | Flagged with reliability_flag. Core insights use 3 reliable categories only |
| Duplicate product entries | 114 products appear multiple times | Review counts inflated up to 3x | Identified via SQL Query 6. Review volume metrics treated with caution |
| Duplicate reviewer IDs | B098NS6PVG, B082LZGK39, B082LSVT4B share identical reviewers | Social proof artificially inflated | Documented in data quality note and Tableau slide 6 |

---

## Tools and Skills Demonstrated

| Skill | Evidence |
|---|---|
| Data Cleaning | Excel — removed encoding issues, standardized types, added 5 enrichment columns |
| Data Validation | MySQL — 6 cross-validation queries confirm Excel pivot findings |
| Pivot Analysis | Excel — 5 pivot tables across discount, price, review, and category dimensions |
| SQL Querying | MySQL — GROUP BY, HAVING, AVG, COUNT, COUNTD, subqueries, filtering |
| BI Dashboarding | Power BI — 4 charts, 4 KPI cards, 3 interactive slicers |
| Data Storytelling | Tableau — 6-slide narrated story with annotations and reference lines |
| Data Quality Awareness | Proactively identified and documented 2 separate data integrity issues |
| Business Communication | All insights framed as business findings with actionable recommendations |

---

## Business Recommendations

1. **Reduce discounts above 50%** — Heavy discounting is associated with lower rated products without proportionate quality gain. A discount rationalisation strategy could improve perceived platform quality.

2. **Promote Office Products model** — Office Products achieves the highest satisfaction with the lowest discounting. This category's pricing strategy should be studied and replicated where possible.

3. **Surface hidden gems** — 10 high quality products with under 500 reviews represent immediate promotion opportunities. Algorithmic boosting of these products could improve buyer satisfaction.

4. **Audit duplicate listings** — 114 duplicate product entries inflate review counts and mislead buyers. A deduplication audit of Computers&Accessories listings is recommended.

---

## Challenges and Solutions

| Challenge | Solution |
|---|---|
| CSV encoding errors blocked MySQL import | Used LOAD DATA INFILE with explicit UTF-8 charset and NULLIF handler for missing values |
| 5 categories had fewer than 10 products | Created reliability_flag column and restricted key insights to 3 statistically reliable categories |
| Duplicate product entries inflated review counts | Identified via SQL COUNT vs COUNTD. Used SUM/COUNT formula in Tableau to show actual vs reported review counts |
| Tableau Public required extract format | Converted live connection to .hyper extract before publishing |

---

*This project was built as part of a Business Analyst portfolio to demonstrate end-to-end data analysis capability across multiple industry-standard tools.*
