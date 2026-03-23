## ETL Decisions
Decision 1 — Date Standardization

Problem:
The raw dataset contained inconsistent date formats (e.g., DD-MM-YYYY, MM/DD/YYYY, and text-based formats like Jan 5, 2024). This inconsistency makes it difficult to join with a date dimension and perform time-based analysis (monthly, quarterly trends).

Resolution:
All dates were converted into a single standardized format: YYYY-MM-DD. During transformation, invalid or ambiguous dates were corrected using consistent parsing rules. A surrogate key (date_id) was then generated for each unique date and mapped to the dim_date table to ensure referential integrity and efficient querying.

Decision 2 — Category Normalization

Problem:
Product categories in the raw data had inconsistent casing and naming variations (e.g., electronics, ELECTRONICS, Electronics, elec). This would lead to fragmented reporting where the same category appears multiple times.

Resolution:
All category values were standardized into a consistent format using proper case (e.g., Electronics, Apparel). Additionally, known variations and abbreviations were mapped to a single canonical category name using transformation rules (e.g., elec → Electronics). This ensured accurate aggregation and reporting in the dim_product table.

Decision 3 — Handling Missing and NULL Values

Problem:
The dataset contained NULL or missing values in important fields such as store details, quantity, and product information. These could break foreign key relationships or result in incomplete analytics.

Resolution:

Missing store or product attributes were replaced with default placeholders such as 'Unknown' to maintain dimension integrity.
NULL quantity values were either replaced with 0 (if logically representing no sale) or excluded if the record was invalid.
Records with critical missing identifiers were filtered out to avoid corrupting the fact table.

This ensured data completeness while preserving the integrity of relationships across the star schema.