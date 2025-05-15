-- Users
INSERT INTO users (full_name, email, password_hash)
VALUES
  ('Alice Johnson', 'alice@example.com', 'hashed_pw_1'),
  ('Bob Smith', 'bob@example.com', 'hashed_pw_2'),
  ('Charlie Lee', 'charlie@example.com', 'hashed_pw_3');

-- Locations
INSERT INTO locations (city, state, country, latitude, longitude)
VALUES
  ('New York', 'NY', 'USA', 40.7128, -74.0060),
  ('San Francisco', 'CA', 'USA', 37.7749, -122.4194),
  ('Paris', NULL, 'France', 48.8566, 2.3522);

-- Listings
INSERT INTO listings (title, description, price_per_night, host_id, location_id)
VALUES
  ('Cozy Manhattan Apartment', 'Close to Central Park and subways.', 150.00, 1, 1),
  ('Modern SF Condo', 'Near Golden Gate Bridge with ocean views.', 200.00, 2, 2),
  ('Charming Paris Loft', 'In the heart of Paris, near the Seine.', 180.00, 1, 3);

-- Reservations
INSERT INTO reservations (user_id, listing_id, check_in, check_out, total_price)
VALUES
  (2, 1, '2025-06-01', '2025-06-05', 600.00),
  (3, 2, '2025-07-10', '2025-07-15', 1000.00),
  (2, 3, '2025-08-01', '2025-08-03', 360.00);

-- Reviews
INSERT INTO reviews (reservation_id, rating, comment)
VALUES
  (1, 5, 'Fantastic stay in Manhattan!'),
  (2, 4, 'Great views, but a bit noisy.'),
  (3, 5, 'Loved the Paris experience! Would book again.');
