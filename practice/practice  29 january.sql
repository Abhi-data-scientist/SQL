use regex;

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
SELECT * FROM drivers;
SELECT * FROM trips;

select distinct driver_id,total_fare from 
(select driver_id, sum(fare) over(partition by driver_id) as total_fare,
		avg(fare) over(partition by driver_id) as avg_fare from trips) a where total_fare>avg_fare ;


select driver_id, trip_id, trip_date, row_number() over(partition by driver_id order by trip_date) 
from trips ;
select driver_id, trip_id, trip_date, fare,
 sum(fare) over(partition by driver_id order by trip_date) from trips;


select driver_id, trip_id, fare, rank() over(partition by driver_id order by fare desc) from trips;


select d.driver_id, trip_id, fare, round(fare-(avg(fare) over(partition by d.driver_id)),2) from drivers as d
join trips as t
on t.driver_id=d.driver_id; 


select d.driver_id, trip_id, trip_date, fare, lag(fare) over() from drivers as d
join trips as t
on t.driver_id=d.driver_id; 


select base_area, count(trip_id), sum(fare), avg(distance_km) from drivers as d
join trips as t
on t.driver_id=d.driver_id
group by base_area order by base_area;
select trip_date, count(trip_id), sum(fare), avg(rating) from trips group by trip_date;
