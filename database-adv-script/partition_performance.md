# Booking Table Partitioning Report

## Goal
Optimize query performance on the large `Booking` table by partitioning it based on the `start_date` column.

## Approach
- Used `RANGE` partitioning on `start_date`.
- Created partitions for each year: `Booking_2023`, `Booking_2024`.
- Copied existing records from the original `Booking` table into the new partitioned table.

## Performance Observation
Using `EXPLAIN ANALYZE`, we observed that:

- Queries targeting a specific date range scanned **only the relevant partition**, not the entire table.
- This significantly reduced the number of rows scanned and improved execution time.
- Partition pruning was effectively utilized by PostgreSQL.

## Conclusion
Partitioning by `start_date` is a powerful optimization for time-bound queries, improving query response time and overall system efficiency in large datasets.
