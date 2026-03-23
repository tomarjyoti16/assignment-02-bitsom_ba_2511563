## Database Recommendation

I would strongly recommend MySQL for the main patient management system.

Reasons for choosing MySQL:

1. ACID guarantees (critical in healthcare)

Healthcare data must be 100% consistent and reliable.

Atomicity → A patient record update either fully succeeds or fails
Consistency → No invalid states (e.g., mismatched prescriptions)
Isolation → Concurrent updates don’t corrupt data
Durability → Once saved, data is not lost

For Example: Updating a patient's diagnosis + billing + prescription must all succeed together — partial updates are unacceptable.

2. Structured & relational data

Healthcare data is highly structured:

Patients
Doctors
Appointments
Prescriptions
Billing records

These relationships are naturally modeled using foreign keys and joins.

3. CAP Theorem perspective

MySQL leans toward Consistency  and Availability 
Less emphasis on partition tolerance compared to NoSQL systems

In healthcare, Consistency is more important than Availability
It’s better to delay a response than return incorrect patient data.

4. Regulatory compliance

Healthcare systems often require:

* Audit trails
* Strong data integrity
* Compliance (HIPAA-like standards)

Relational databases handle this more naturally.

Drawback of using MongoDB for core application

MongoDB follows a BASE model:

Basically Available
Soft state
Eventually consistent

Thus, Eventual consistency can lead to temporary incorrect patient data which is Not acceptable in clinical workflows.

If Fraud Detection Module is added in that condition the best approach will be Hybrid architecture.

MySQL → Core patient management (system of record)
MongoDB → Fraud detection / analytics module

MongoDB works well for fraud detection as Fraud detection Works on patterns, probabilities, heuristics thus Can tolerate slight delays or inconsistencies
For Example: 1. Detecting unusual billing patterns
2. Flagging suspicious insurance claims

Also fraud systems often use Logs, Clickstreams, Behavioral data, Device metadata.
MongoDB excels at Flexible schemas, Rapid ingestion of large datasets

MongoDB favors Availability, Partition Tolerance, Eventual Consistency.

Thus, ideal for Real-time analytics and Distributed systems.