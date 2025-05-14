# Database Performance Monitoring and Refinement Report

## Objective

Continuously monitor and refine the performance of critical SQL queries within the Airbnb-like database system by using analysis tools such as `EXPLAIN ANALYZE`, and implement schema/index improvements.

---

## 1. Performance Monitoring Using EXPLAIN ANALYZE

### Query 1: Retrieve confirmed bookings for properties in Addis Ababa

```sql
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
WHERE
    b.status = 'confirmed'
    AND p.location = 'Addis Ababa';
