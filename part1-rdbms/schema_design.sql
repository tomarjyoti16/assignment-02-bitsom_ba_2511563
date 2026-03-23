/*
Tables in 3NF:

Customers
Products
Categories
Orders
Order_Items
Sales_Reps
Offices

 */


-- 1. Categories

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 2. Products
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Customers

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    customer_email VARCHAR(150) NOT NULL,
    customer_city VARCHAR(100) NOT NULL
);

-- 4. Offices
CREATE TABLE Offices (
    office_id INT PRIMARY KEY,
    office_address VARCHAR(255) NOT NULL
);

-- 5. Sales Representatives

CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(150) NOT NULL,
    sales_rep_email VARCHAR(150) NOT NULL,
    office_id INT NOT NULL,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id)
);

-- 6. Orders

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

-- 7. Order Items (handles multiple products per order)

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--Insert Queries

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Furniture');

INSERT INTO Products VALUES
('P101', 'Smartphone', 1, 15000),
('P102', 'Laptop', 1, 55000),
('P103', 'T-Shirt', 2, 500),
('P104', 'Microwave', 3, 8000),
('P105', 'Chair', 5, 2000);

INSERT INTO Customers VALUES
('C101', 'Amit Sharma', 'amit@gmail.com', 'Delhi'),
('C102', 'Neha Singh', 'neha@gmail.com', 'Mumbai'),
('C103', 'Rahul Verma', 'rahul@gmail.com', 'Pune'),
('C104', 'Priya Mehta', 'priya@gmail.com', 'Delhi'),
('C105', 'Karan Gupta', 'karan@gmail.com', 'Bangalore');

INSERT INTO Offices VALUES
(1, 'Delhi Office, Connaught Place, New Delhi - 110001'),
(2, 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
(3, 'Bangalore Office, MG Road'),
(4, 'Pune Office, Hinjewadi'),
(5, 'Chennai Office, T Nagar');

INSERT INTO Sales_Reps VALUES
('S101', 'Raj Malhotra', 'raj@gmail.com', 1),
('S102', 'Simran Kaur', 'simran@gmail.com', 2),
('S103', 'Arjun Nair', 'arjun@gmail.com', 3),
('S104', 'Vikas Rao', 'vikas@gmail.com', 4),
('S105', 'Anjali Das', 'anjali@gmail.com', 5);

INSERT INTO Orders VALUES
('ORD1001', 'C101', '2026-03-01', 'S101'),
('ORD1002', 'C102', '2026-03-02', 'S102'),
('ORD1003', 'C103', '2026-03-03', 'S103'),
('ORD1004', 'C104', '2026-03-04', 'S104'),
('ORD1005', 'C105', '2026-03-05', 'S105');


INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
('ORD1001', 'P101', 2),
('ORD1002', 'P102', 1),
('ORD1003', 'P103', 3),
('ORD1004', 'P104', 1),
('ORD1005', 'P105', 4);
