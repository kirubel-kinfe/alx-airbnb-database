-- Analyze the performance of a query retrieving bookings along with user, property, and payment details

-- Step 1: Use EXPLAIN to analyze the query
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
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
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed'
    AND p.location = 'Addis Ababa'
    AND pay.payment_method = 'credit_card';
