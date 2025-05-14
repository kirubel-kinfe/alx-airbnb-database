# Optimization Report – Query Performance Improvement

## 1. Initial Query

The original query retrieved **all columns** from the `Booking`, `User`, `Property`, and `Payment` tables using **four joins**. The query was useful for getting all details, but as the data grows, its performance can degrade significantly, especially when joining large tables.

### Initial Query:
```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pay ON b.booking_id = pay.booking_id;
