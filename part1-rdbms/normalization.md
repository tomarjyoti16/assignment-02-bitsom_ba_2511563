## Anomaly Analysis

1. Insert Anomaly

Problem: We cannot insert some new data without adding unrelated data.

For Example:

If we want to add a new product:
Product: Tablet
Category: Electronics

But in the flat file, product data is tied to an order. Thus we cannot insert the product unless:
A customer places an order and Order details (order_id, customer, sales rep, etc.) are also filled

Thus, product info cannot exist independently → this is an Insert Anomaly in current data.


2. Update Anomaly

Same data is repeated in multiple rows thus if any update is required in one data it should be updated at multiple places.

For Example: Sales rep Raj Malhotra works in:"Delhi Office, Connaught Place"

If Raj appears in 10 different orders, his office address is repeated 10 times.

Now if the office address changes we must update all 10 rows. If we miss even one place it would result in inconsistent data

Thus, Same person, different office values = data inconsistency


3. Delete Anomaly

Deleting a record removes important unrelated data.

For Example:Suppose:Product Microwave (P104) appears in only one order (ORD1004)

If we delete that order, we would also lose Product information, Category info (if not stored elsewhere)

Thus though we only wanted to delete an order, we can accidentally lose product data