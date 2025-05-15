# 🏡 alx-airbnb-database

## 📘 Project Description

This project defines the database schema for an Airbnb-like platform. The schema is designed with proper normalization, indexing, and relational constraints to support core functionalities such as user management, listing properties, bookings, and reviews.

---

## 🎯 Objectives

- Define a relational schema using SQL DDL
- Apply normalization principles (up to 3NF)
- Ensure referential integrity via foreign keys
- Add indexing for performance optimization

---

## 🗃️ Database Schema Overview

### 1. `users`
Stores registered users and hosts.

| Column       | Type          | Constraints             |
|--------------|---------------|--------------------------|
| id           | INT           | Primary Key, Auto Inc.   |
| full_name    | VARCHAR(100)  | NOT NULL                 |
| email        | VARCHAR(100)  | UNIQUE, NOT NULL         |
| password_hash| VARCHAR(255)  | NOT NULL                 |
| created_at   | TIMESTAMP     | Defaults to NOW()        |

---

### 2. `locations`
Stores location metadata for listings.

| Column     | Type         | Constraints          |
|------------|--------------|----------------------|
| id         | INT          | Primary Key          |
| city       | VARCHAR(100) | NOT NULL             |
| state      | VARCHAR(100) |                      |
| country    | VARCHAR(100) | NOT NULL             |
| latitude   | DECIMAL      |                      |
| longitude  | DECIMAL      |                      |

---

### 3. `listings`
Details about properties hosted by users.

| Column        | Type         | Constraints                    |
|---------------|--------------|--------------------------------|
| id            | INT          | Primary Key                    |
| title         | VARCHAR(255) | NOT NULL                       |
| description   | TEXT         |                                |
| price_per_night | DECIMAL    | NOT NULL                       |
| host_id       | INT          | Foreign Key → users(id)        |
| location_id   | INT          | Foreign Key → locations(id)    |
| created_at    | TIMESTAMP    | Defaults to NOW()              |

---

### 4. `reservations`
Stores user bookings of listings.

| Column      | Type         | Constraints                        |
|-------------|--------------|------------------------------------|
| id          | INT          | Primary Key                        |
| user_id     | INT          | Foreign Key → users(id)            |
| listing_id  | INT          | Foreign Key → listings(id)         |
| check_in    | DATE         | NOT NULL                           |
| check_out   | DATE         | NOT NULL                           |
| total_price | DECIMAL      | NOT NULL                           |
| created_at  | TIMESTAMP    | Defaults to NOW()                  |

---

### 5. `reviews`
User-submitted reviews for reservations.

| Column         | Type     | Constraints                              |
|----------------|----------|------------------------------------------|
| id             | INT      | Primary Key                              |
| reservation_id | INT      | Foreign Key → reservations(id)           |
| rating         | INT      | CHECK rating BETWEEN 1 AND 5             |
| comment        | TEXT     |                                          |
| created_at     | TIMESTAMP | Defaults to NOW()                        |

---

## 🔐 Constraints & Indexes

- All foreign keys support `ON DELETE CASCADE` or `SET NULL` for relational integrity.
- Indexes are added on frequently searched columns like email, location, and foreign keys.
- Reviews are linked directly to reservations (not listings) to ensure only booked users can review.

---

## 🚀 Future Enhancements

- Add support for listing availability calendar.
- Add payment transaction tracking.
- Track host response rates and average ratings.

---

## 🧪 How to Use

1. Load this schema using any MySQL-compatible client:

```bash
mysql -u root -p database_name < schema.sql
