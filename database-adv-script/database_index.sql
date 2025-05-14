-- EXPLAIN ANALYZE BEFORE adding index on user_id in Booking
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';

-- Create index on user_id for faster user-based lookup
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- EXPLAIN ANALYZE AFTER adding index on user_id
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';


-- EXPLAIN ANALYZE BEFORE adding index on email in User
EXPLAIN ANALYZE
SELECT * FROM User
WHERE email = 'guest@example.com';

-- Create index on email for faster login/user lookup
CREATE INDEX idx_user_email ON User(email);

-- EXPLAIN ANALYZE AFTER adding index on email
EXPLAIN ANALYZE
SELECT * FROM User
WHERE email = 'guest@example.com';


-- EXPLAIN ANALYZE BEFORE adding index on property_id in Booking
EXPLAIN ANALYZE
SELECT COUNT(*) FROM Booking
WHERE property_id = '789e1234-e89b-12d3-a456-426614174999';

-- Create index on property_id for performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- EXPLAIN ANALYZE AFTER adding index on property_id
EXPLAIN ANALYZE
SELECT COUNT(*) FROM Booking
WHERE property_id = '789e1234-e89b-12d3-a456-426614174999';


-- EXPLAIN ANALYZE BEFORE adding index on host_id in Property
EXPLAIN ANALYZE
SELECT * FROM Property
WHERE host_id = '456e7890-e89b-12d3-a456-426614174abc';

-- Create index on host_id for efficient host filtering
CREATE INDEX idx_property_host_id ON Property(host_id);

-- EXPLAIN ANALYZE AFTER adding index on host_id
EXPLAIN ANALYZE
SELECT * FROM Property
WHERE host_id = '456e7890-e89b-12d3-a456-426614174abc';
