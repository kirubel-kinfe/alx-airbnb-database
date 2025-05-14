-- Query 1: Total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

-- Query 2: Rank properties based on the total number of bookings using ROW_NUMBER
SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id
) AS property_bookings;

-- Optional: Using RANK() instead of ROW_NUMBER() to handle ties
-- SELECT 
--     property_id,
--     total_bookings,
--     RANK() OVER (ORDER BY total_bookings DESC) AS rank
-- FROM (
--     SELECT 
--         p.property_id,
--         COUNT(b.booking_id) AS total_bookings
--     FROM 
--         Property p
--     LEFT JOIN 
--         Booking b ON p.property_id = b.property_id
--     GROUP BY 
--         p.property_id
-- ) AS property_bookings;




-- Ranking Properties by Number of Bookings (ROW_NUMBER)

SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id
) AS property_bookings;
