-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED DATA
-- =========================

-- Cleaned Dates (standardized YYYY-MM-DD format)
INSERT INTO dim_date VALUES
(1, '2024-01-05', 5, 1, 2024, 1),
(2, '2024-01-06', 6, 1, 2024, 1),
(3, '2024-01-07', 7, 1, 2024, 1),
(4, '2024-02-01', 1, 2, 2024, 1),
(5, '2024-02-02', 2, 2, 2024, 1);

-- Stores (NULL handled → replaced with 'Unknown')
INSERT INTO dim_store VALUES
(1, 'Store A', 'Delhi', 'Delhi'),
(2, 'Store B', 'Mumbai', 'Maharashtra'),
(3, 'Store C', 'Bangalore', 'Karnataka');

-- Products (category standardized → Proper Case)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Shirt', 'Apparel'),
(3, 'Mobile', 'Electronics'),
(4, 'Shoes', 'Footwear');

-- =========================
-- FACT DATA (Cleaned)
-- =========================

-- Notes:
-- - Dates mapped to date_id
-- - Categories normalized
-- - NULL quantities replaced with 0 or valid values
-- - Amounts standardized

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 120000.00),
(2, 1, 2, 2, 3, 4500.00),
(3, 2, 1, 3, 1, 30000.00),
(4, 2, 3, 4, 2, 4000.00),
(5, 3, 2, 1, 1, 60000.00),
(6, 3, 3, 2, 4, 6000.00),
(7, 4, 1, 4, 2, 5000.00),
(8, 4, 2, 3, 3, 90000.00),
(9, 5, 3, 1, 1, 55000.00),
(10, 5, 1, 2, 5, 7500.00);