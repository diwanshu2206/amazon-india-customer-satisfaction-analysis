Amazon India — Customer Satisfaction & Pricing Analysis

An end-to-end Business Analysis project exploring the relationship between discounting strategy, pricing, and customer satisfaction across 1,465 Amazon India products using Excel, MySQL, Power BI, and Tableau.

Prepared by: Diwanshu Sharma | MBA Marketing
Data Source: Kaggle — Amazon Sales Dataset
Tools Used: Microsoft Excel | MySQL | Power BI | Tableau

Live Dashboard & Story
ToolLinkTableau StoryView on Tableau PublicPower BI DashboardSee /PowerBI/Amazon_Dashboard.pbix

Project Overview
This project follows a complete Business Analyst workflow — from raw data ingestion to executive-level storytelling:
Raw CSV → Excel (Clean) → MySQL (Validate) → Power BI (Dashboard) → Tableau (Story)
Each tool serves a distinct, justified purpose:
ToolPurposeExcelData cleaning, enrichment, and preliminary pivot analysisMySQLData validation, cross-verification of insights via SQL queriesPower BIInteractive business dashboard for stakeholder explorationTableauNarrated story presentation for executive communication

Dataset

Source: Kaggle Amazon India Sales Dataset
Size: 1,465 rows | 16 original columns | 21 after enrichment
Categories: 9 product categories
Key columns: product_id, category, discounted_price, actual_price, discount_percentage, rating, rating_count

Data Enrichment (added columns)
ColumnDescriptionmain_categoryExtracted first level of category hierarchyprice_bandPrice segments: Under Rs.200 / Rs.200-500 / Rs.500-1500 / Rs.1500+discount_bucketDiscount segments: 0-30% / 31-50% / 51-70% / 71%+rating_tierReview volume: Low (<1k) / Medium (1k-10k) / High (10k+)reliability_flagSample size flag: Reliable (50+) / Caution (10-50) / Small Sample (<10)

Key Findings
Finding 1 — Heavy Discounting Hurts Customer Satisfaction
Products with 0-30% discount average 4.16 rating vs 4.01 for 71%+ discount products. A clear downward trend exists — as discounting increases, customer satisfaction decreases consistently across all reliable categories.
Finding 2 — Price Signals Quality
Premium products (Rs.1500+) average 4.13 rating vs 4.05 for budget products (Under Rs.200). Higher priced products are also less discounted — suggesting a consistent quality positioning strategy at the premium end.
Finding 3 — Office Products: The Benchmark Category
Office Products achieves the highest rating (4.31) with only 12% average discount — far below the platform average of 48%. This category proves that quality and customer satisfaction do not require heavy discounting.
Finding 4 — Hidden Gems Identified
Using SQL Query 5 and Tableau visualization, 10 products were identified with ratings of 4.5+ but fewer than 500 reviews. Three products achieve perfect 5.0 ratings with under 25 reviews — representing significant promotion opportunities for Amazon India.
Finding 5 — Data Quality Issue: Duplicate Reviews Detected
114 duplicate product entries were identified during SQL validation. All duplicates are concentrated in Computers&Accessories USB cable products — each appearing exactly 3 times, inflating review counts by up to 300%. This was identified via SQL Query 6 and accounted for throughout the analysis. Rating scores remain reliable. Review volume metrics were treated with caution.

Project Structure
amazon-india-customer-satisfaction-analysis/
│
├── README.md
│
├── Data/
│   └── amazon_clean_mysql.csv          ← Cleaned dataset (21 columns, 1,465 rows)
│
├── Excel/
│   └── Amazon_BA_Project_File.xlsx     ← Data cleaning + 5 pivot tables
│
├── SQL/
│   ├── amazon_queries.sql              ← All 6 validated queries
│   └── Exports/
│       ├── query1_category_overview.csv
│       ├── query2_discount_vs_rating.csv
│       ├── query3_price_band_analysis.csv
│       ├── query4_review_tier_analysis.csv
│       ├── query5_hidden_gems.csv
│       └── query6_data_quality.csv
│
├── PowerBI/
│   └── Amazon_Dashboard.pbix           ← Interactive dashboard with slicers
│
└── Tableau/
    └── Amazon_India_Analysis.twbx      ← 6-slide narrated story

SQL Queries Summary
QueryBusiness QuestionKey FindingQ1Category performance overviewOffice Products leads at 4.31 avg ratingQ2Discount bucket vs ratingRating drops consistently as discount increasesQ3Price band vs ratingPremium products (Rs.1500+) rate highest at 4.13Q4Review tier vs ratingHigh review products rate 4.15 vs 3.99 for low reviewQ5Hidden gems identification10 products rate 4.5+ with under 500 reviewsQ6Duplicate detection114 duplicate entries found in Computers&Accessories

Data Quality Notes
IssueFindingImpactAction TakenSmall sample categories5 of 9 categories have <10 productsCategory-level comparisons unreliableFlagged with reliability_flag column. Core insights focus on 3 reliable categories onlyDuplicate product entries114 products appear multiple timesReview counts inflated up to 3xIdentified via SQL Query 6. Review volume metrics treated with caution throughoutDuplicate reviewer IDsProducts B098NS6PVG, B082LZGK39, B082LSVT4B share identical reviewersSocial proof artificially inflatedDocumented in data quality note and Tableau slide 6

Tools & Skills Demonstrated
SkillEvidenceData CleaningExcel — removed encoding issues, standardized types, added 5 enrichment columnsData ValidationMySQL — 6 cross-validation queries confirm Excel pivot findingsPivot AnalysisExcel — 5 pivot tables across discount, price, review, and category dimensionsSQL QueryingMySQL — GROUP BY, HAVING, AVG, COUNT, COUNTD, subqueries, filteringBI DashboardingPower BI — 4 charts, 4 KPI cards, 3 interactive slicersData StorytellingTableau — 6-slide narrated story with annotations and reference linesData Quality AwarenessProactively identified and documented 2 separate data integrity issuesBusiness CommunicationAll insights framed as business findings with actionable recommendations

Business Recommendations

Reduce discounts above 50% — Heavy discounting is associated with lower rated products without proportionate quality gain. A discount rationalisation strategy could improve perceived platform quality.
Promote Office Products model — Office Products achieves the highest satisfaction with the lowest discounting. This category's pricing strategy should be studied and replicated where possible.
Surface hidden gems — 10 high quality products with under 500 reviews represent immediate promotion opportunities. Algorithmic boosting of these products could improve buyer satisfaction.
Audit duplicate listings — 114 duplicate product entries inflate review counts and mislead buyers. A deduplication audit of Computers&Accessories listings is recommended.


Challenges & Solutions
ChallengeSolutionCSV encoding errors blocked MySQL importUsed LOAD DATA INFILE with explicit UTF-8 charset and NULLIF handler for missing values5 categories had <10 products making analysis unreliableCreated reliability_flag column and restricted key insights to 3 statistically reliable categoriesDuplicate product entries inflated review countsIdentified via SQL COUNT vs COUNTD comparison. Used SUM/COUNT formula in Tableau to show actual vs reported review countsTableau Public required extract formatConverted live connection to .hyper extract before publishing

This project was built as part of a Business Analyst portfolio to demonstrate end-to-end data analysis capability across multiple industry-standard tools.
