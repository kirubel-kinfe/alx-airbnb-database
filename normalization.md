📘 Database Normalization: alx_travel_app
🎯 Objective
To ensure that the database schema used in the alx_travel_app project is well-structured, efficient, and adheres to Third Normal Form (3NF) by removing redundancy and avoiding update anomalies.

🧩 Step-by-Step Normalization Process
✅ Step 1: First Normal Form (1NF)
1NF Requirements:

Atomic columns (no repeating groups or arrays).

Each column contains unique values of the same type.

Each row is uniquely identifiable.

Analysis:
Our listings table has atomic fields such as:

title (string)

description (text)

location (string)

price (decimal)

created_at (timestamp)

✅ This satisfies 1NF: all attributes contain atomic, indivisible values and each row is uniquely identified by a primary key.

✅ Step 2: Second Normal Form (2NF)
2NF Requirements:

Must satisfy 1NF.

No partial dependency of non-prime attributes on a composite primary key.

Analysis:

The table has a single-column primary key (id).

No partial dependencies since there's no composite key.

✅ This satisfies 2NF.

✅ Step 3: Third Normal Form (3NF)
3NF Requirements:

Must satisfy 2NF.

No transitive dependencies (non-key attributes depending on other non-key attributes).

Potential Violation:

Let’s assume we expand the listings table like this:

id	title	description	price	location	city	state	country

In this scenario:

city, state, and country are likely dependent on location, creating a transitive dependency (non-key → non-key).

Solution:
Split into separate tables:

Refactored Schema in 3NF:
Table: locations
id	city	state	country

Table: listings
| id | title | description | price | location_id (FK to locations.id) | created_at |

This structure:

Removes transitive dependencies.

Improves reusability and consistency of location data.

Reduces update anomalies (e.g., changing country for many listings).

✅ Now the schema satisfies 3NF.

🗂️ Final Tables Overview
1. listings
Stores travel listings information.

Column	Type	Description
id	INT (PK)	Unique identifier
title	VARCHAR	Listing title
description	TEXT	Detailed description
price	DECIMAL	Price of listing
location_id	INT (FK)	Foreign key to locations table
created_at	TIMESTAMP	Auto-generated on creation

2. locations
Stores normalized location data.

Column	Type	Description
id	INT (PK)	Unique identifier
city	VARCHAR	City name
state	VARCHAR	State name
country	VARCHAR	Country name

✅ Benefits of 3NF Normalization
Reduces Data Redundancy: Avoids repeated storage of location data across listings.

Improves Data Integrity: Centralized location updates.

Supports Scalability: Easier to index, cache, and expand.

Promotes Maintainability: Clean, modular schema design.

📌 Conclusion
By identifying potential transitive dependencies and separating related data into normalized tables, we achieved Third Normal Form (3NF). This normalization ensures that our database is efficient, maintainable, and ready for large-scale application use.