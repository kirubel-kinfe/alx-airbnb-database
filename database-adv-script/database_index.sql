-- Index on email in User table for faster login and lookup
CREATE INDEX idx_user_email ON User(email);

-- Index on user_id in Booking table for faster JOINs and filtering by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id in Booking table for JOIN performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on host_id in Property table for retrieving all properties by a host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on location in Property table for location-based filtering
CREATE INDEX idx_property_location ON Property(location);

-- Optional: Index on created_at in Booking table for sorting or date range filtering
CREATE INDEX idx_booking_created_at ON Booking(created_at);
