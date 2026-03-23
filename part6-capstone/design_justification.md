## Storage Systems

To meet the four goals of the hospital system, a combination of specialized storage solutions can be used instead of a single database.

For predicting patient readmission risk, a Data Lake (e.g., AWS S3) stores raw historical data such as EHR records, lab reports, and treatment history. 
This is useful because it can handle large, unstructured, and semi-structured data at low cost. Processed and cleaned data is then stored in a feature store / ML-ready database (like a NoSQL database such as MongoDB or a columnar store) to support model training and inference efficiently.

For doctor queries in plain English, a Patient History Database (OLTP system) such as PostgreSQL or MySQL cab be used. This database stores structured, up-to-date patient records with strong consistency. 
Additionally, a vector database (e.g., Pinecone or FAISS) is used to enable semantic search for natural language queries, allowing the system to interpret questions like “Has this patient had a cardiac event before?”

For monthly management reports, an Analytics Data Warehouse (e.g., Amazon Redshift, Snowflake, or BigQuery) can be used.
This system stores aggregated, structured data optimized for complex queries and reporting (OLAP workloads). 
It supports queries on bed occupancy, cost analysis, and department performance.

For real-time ICU vitals, a streaming platform (e.g., Apache Kafka) can br used to ingest data continuously from monitoring devices. 
This data is processed using stream processing tools (e.g., Apache Flink or Spark Streaming) and stored in a time-series database (e.g., InfluxDB) for fast retrieval and monitoring of patient vitals.

---

## OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system includes the Patient History Database and real-time ICU data storage. 
These systems handle day-to-day operations such as updating patient records, storing vitals, and supporting real-time doctor queries. 
They prioritize low latency, high availability, and data consistency.

The OLAP (Online Analytical Processing) system begins after the ETL (Extract, Transform, Load) process. 
Data from OLTP systems and the Data Lake is cleaned, transformed, and loaded into the Analytics Data Warehouse. 
This warehouse is used for reporting, dashboards, and machine learning model training.

Thus, the boundary lies at the ETL/stream processing layer. 
Before this layer, systems are transactional and operational. 
After this layer, systems are analytical and optimized for insights, aggregations, and long-running queries.

---

## Trade-offs

A major trade-off in this design is data latency vs consistency. 
Real-time systems (like ICU monitoring and OLTP databases) require immediate data availability, while analytical systems (data warehouse and ML models) rely on batch-processed, cleaned data, which introduces delays.

This means that reports or predictions may not always reflect the absolute latest data. 
For example, a readmission risk model trained on slightly outdated data may miss recent patient changes.

To mitigate this, a hybrid approach can be used:

* Implement micro-batching or near real-time ETL pipelines to reduce delay.
* Use streaming analytics for critical use cases (e.g., ICU alerts).
* Maintain incremental updates in the data warehouse instead of full batch loads.
* Clearly define use cases where real-time accuracy is critical vs where slight delay is acceptable.

This balance ensures both system performance and data reliability without overcomplicating the architecture.
