use regex1;
CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- -------------------------
-- Create table: trips  (DATE column included)
-- -------------------------
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- -------------------------
-- Insert data: drivers (4 rows)
-- -------------------------
INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- -------------------------
-- Insert data: trips (10 rows)
-- -------------------------
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

-- Quick check
SELECT * FROM drivers ORDER BY driver_id;
SELECT * FROM trips ORDER BY trip_id;



-- For each trip_date, show number of trips, total fare, and average rating.
SELECT trip_date, COUNT(trip_id) AS trips_count, SUM(fare) AS total_fare, AVG(rating) AS avg_rating
FROM Trips
GROUP BY trip_date;

-- By base_area, show total trips, total fare, and average distance.
SELECT d.base_area, COUNT(t.trip_id) AS trips, SUM(t.fare) AS total_fare, AVG(t.distance_km) AS avg_distance
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
GROUP BY d.base_area;

-- Rating buckets count (>=4.8 as “High”, else “Other”)
SELECT CASE WHEN rating >= 4.8 THEN 'High' ELSE 'Other' END AS rating_bucket, COUNT(*) AS trips
FROM Trips
GROUP BY CASE WHEN rating >= 4.8 THEN 'High' ELSE 'Other' END;

-- Days where total fare >= 800 (GROUP BY + HAVING)
SELECT trip_date, SUM(fare) AS total_fare
FROM Trips
GROUP BY trip_date
HAVING SUM(fare) >= 800;

-- Base-area average rating, only areas with avg rating >= 4.7 (HAVING)
SELECT d.base_area, AVG(t.rating) AS avg_rating
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
GROUP BY d.base_area
HAVING AVG(t.rating) >= 4.7;

-- Trips with fare greater than the overall average fare (single-row subquery)
SELECT trip_id, driver_id, fare
FROM Trips
WHERE fare > (SELECT AVG(fare) FROM Trips);

-- Drivers who have at least one trip rated 4.9 (multi-row IN subquery)
SELECT driver_id, driver_name
FROM Drivers
WHERE driver_id IN (SELECT driver_id FROM Trips WHERE rating = 4.9);

-- Drivers whose total fare is greater than the average total fare per driver
SELECT d.driver_id, d.driver_name, SUM(t.fare) AS total_fare
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
GROUP BY d.driver_id, d.driver_name
HAVING SUM(t.fare) >
(
    SELECT AVG(driver_total_fare)
    FROM (SELECT SUM(fare) AS driver_total_fare FROM Trips GROUP BY driver_id) sub
);

-- Latest trip per driver
SELECT driver_id, trip_id, trip_date, fare
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY trip_date DESC, trip_id DESC) AS rn
    FROM Trips
) t
WHERE rn = 1;

-- Row number of trips per driver ordered by date (then trip_id)
SELECT driver_id, trip_id, trip_date,
ROW_NUMBER() OVER(PARTITION BY driver_id ORDER BY trip_date, trip_id) AS rn
FROM Trips;

-- Running total fare per driver over time
SELECT driver_id, trip_id, trip_date, fare,
SUM(fare) OVER(PARTITION BY driver_id ORDER BY trip_date, trip_id) AS running_fare
FROM Trips;

-- Rank trips by fare within each driver (highest fare rank 1)
SELECT driver_id, trip_id, fare,
RANK() OVER(PARTITION BY driver_id ORDER BY fare DESC) AS fare_rank
FROM Trips;

-- Show each trip’s fare minus the driver’s average fare (window AVG)
SELECT driver_id, trip_id, fare,
fare - AVG(fare) OVER(PARTITION BY driver_id) AS diff_from_avg
FROM Trips;

-- For each driver, show the previous trip’s fare (LAG) ordered by date
SELECT driver_id, trip_id, trip_date, fare,
LAG(fare) OVER(PARTITION BY driver_id ORDER BY trip_date, trip_id) AS prev_fare
FROM Trips;



