-- Step 1: Create a partitioned version of the Booking table
DROP TABLE IF EXISTS Booking_Partitioned CASCADE;

CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status TEXT CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year (example for 2023 and 2024)
CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 3: Insert sample data (adapt or expand based on your dataset)
INSERT INTO Booking_Partitioned (
    booking_id, property_id, user_id, start_date, end_date, total_price, status
)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status
FROM Booking;

-- Step 4: Analyze performance using EXPLAIN ANALYZE for a date range query
EXPLAIN ANALYZE
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30'
  AND status = 'confirmed';
