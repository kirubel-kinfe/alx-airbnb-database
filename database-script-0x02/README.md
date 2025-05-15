# 🗃️ Airbnb Database Seeder

## 📦 Project Description

This script seeds the normalized Airbnb-style database with realistic test data including users, listings, bookings (reservations), and reviews. It's designed to simulate typical real-world interactions to test query performance, model relationships, and application features.

---

## 📋 Seed Data Summary

### Users
- 3 sample users with unique emails and hashed passwords.
- Represents both guests and hosts.

### Locations
- 3 distinct locations from different global cities.
- Includes latitude/longitude for possible map features.

### Listings
- 3 listings hosted by users in various locations.
- Each includes title, description, and nightly price.

### Reservations
- 3 bookings linking users to listings with realistic date ranges.
- Includes total prices for the stay.

### Reviews
- 3 reviews tied directly to reservations.
- Each review includes a rating and a text comment.

---

## 🚀 How to Run

Ensure you have run the schema creation script first (`schema.sql`). Then, execute this script with your MySQL client:

```bash
mysql -u root -p your_database_name < seed.sql
