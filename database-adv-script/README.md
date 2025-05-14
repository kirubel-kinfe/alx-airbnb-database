# Join Queries – Airbnb Advanced SQL

This section contains SQL join queries that retrieve meaningful insights from a simulated Airbnb database. These queries demonstrate various join techniques and showcase how relationships between entities like Users, Properties, Bookings, and Reviews are used in real-world applications.

## 1. INNER JOIN – Retrieve All Bookings and Their Associated Users
## 2. LEFT JOIN – Retrieve All Properties and Their Reviews (Including Properties Without Reviews)
## 3. FULL OUTER JOIN – Retrieve All Users and All Bookings (Including Users Without Bookings and Bookings Without Linked Users)




# Subqueries – Airbnb Advanced SQL

## Non-Correlated Subquery: Properties with Average Rating > 4.0
This query finds all properties with an average rating greater than 4.0. The subquery calculates the average rating for each property in the `Review` table, and the outer query retrieves full property details.

## Correlated Subquery: Users with More Than 3 Bookings
This query identifies users who have made more than 3 bookings. It uses a correlated subquery that counts bookings per user by referencing `user_id` from the outer `User` query.
