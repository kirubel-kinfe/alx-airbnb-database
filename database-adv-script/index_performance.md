# Index Performance Report – Airbnb Advanced SQL

This document outlines how indexing improves query performance in our simulated Airbnb database. It includes justification for chosen indexes and a comparison of performance before and after applying them.

---

## 🔍 Why These Indexes?

### 1. `User(email)`
**Use Case**: Email is often used during login and user verification.  
**Query Types**: `SELECT * FROM User WHERE email = 'user@example.com';`  
**Benefit**: Allows fast lookup for authentication or filtering.

### 2. `Booking(user_id)`
**Use Case**: Frequently used in JOINs with User and in filters like `WHERE user_id = 'some-uuid'`.  
**Query Types**:
```sql
SELECT * FROM Booking WHERE user_id = 'abc-123';
