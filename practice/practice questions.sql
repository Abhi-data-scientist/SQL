use regex;
-- -------------------------
-- Create table: events
-- -------------------------
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);



-- Find the total quantity sold per event_id.
select event_id, sum(qty) from ticket_sales group by event_id;

-- Find the total revenue per event_id
select event_id, sum(qty*price_per_ticket) from ticket_sales group by event_id;

-- Find monthly total revenue (group by month of sale_date).
select month(sale_date), sum(qty*price_per_ticket) from ticket_sales group by month(sale_date);

-- Find the maximum price_per_ticket per event_id.
select event_id, max(price_per_ticket) from ticket_sales group by event_id;

-- Find total revenue per month and ticket_type.
select month(sale_date), ticket_type, sum(qty*price_per_ticket) from ticket_sales group by month(sale_date),ticket_type;

-- List all sales with event_name and sale_date.
select sale_id, event_name, sale_date from events
join ticket_sales
on events.event_id = ticket_sales.event_id;

-- Show event_name, ticket_type, qty for each sale.
select e.event_name, t.ticket_type, t.qty from events as e
join ticket_sales as t
on e.event_id=t.event_id;

-- Show sales where the event city is Mumbai. sale_id event_name city sale_date
select sale_id, event_name, city, sale_date from events
join ticket_sales
on events.event_id = ticket_sales.event_id
where city = 'Mumbai';

-- Show all events and matching sales
select event_name, sale_id, sale_Date from events
left join ticket_sales
on events.event_id = ticket_sales.event_id;

-- Show distinct event names that have at least one sale. 
select distinct event_name from events
inner join ticket_sales
on events.event_id = ticket_sales.event_id;

-- Show each sale’s computed revenue with event name. 
select sale_id, event_name, qty*price_per_ticket as revenue from events
join ticket_sales
on events.event_id = ticket_sales.event_id;

-- Find total quantity per event_name.
select event_name, sum(qty) from events
join ticket_sales
on events.event_id = ticket_sales.event_id
group by event_name;

-- Find total VIP revenue per event_name. event_name vip_revenue
select event_name, sum(qty*price_per_ticket) from events
join ticket_sales
on events.event_id = ticket_sales.event_id
where ticket_type='VIP'
group by event_name
order by event_name;

-- Find monthly revenue per city.
select city, month(sale_date), sum(qty*price_per_ticket) from events
join ticket_sales
on events.event_id = ticket_sales.event_id
group by city, month(sale_date)
order by sum(qty*price_per_ticket) desc;

-- Find total quantity per city and ticket_type.
-- city ticket_type total_qty
-- Bengaluru Regular 3
-- Bengaluru VIP 1
-- Delhi Regular 5
-- Delhi VIP 2
-- Mumbai Regular 7
-- Mumbai VIP 1

-- Find sales that happened on the latest sale_date in the table.
select * from ticket_sales where sale_date=(select max(sale_date) from ticket_sales);
-- sale_id event_id sale_date ticket_type qty price_per_ticket
-- 106 3 2025-03-15 VIP 2 2500

-- Find sales where revenue is greater than the overall average sale revenue. 
select sale_id, event_id, qty*price_per_ticket from ticket_sales
where qty*price_per_ticket>(select avg(qty*price_per_ticket) from ticket_sales);

-- doubt Find events that have at least one VIP sale.
select * from events;
select * from ticket_sales;
select event_id, event_name from events
join ticket_sales
on events.event_id = ticket_sales.event_id
where 1< (select count(ticket_type) from ticket_sales where ticket_type='VIP');

-- event_id event_name
-- 1 Music Fest
-- 2 Tech Summit
-- 3 Food Carnival

-- Find events in cities that have at least one VIP sale. Hint: subquery will use the joins

-- event_id event_name city
-- 1 Music Fest Mumbai
-- 2 Tech Summit Bengaluru
-- 3 Food Carnival Delhi
-- 4 Startup Meetup Mumbai

-- Find events that have at least one sale in February 2025. event_id event_name city
-- 2 Tech Summit Bengaluru
-- 4 Startup Meetup Mumbai

-- For each event, return the highest price_per_ticket sale row. Hint: read the question twice
-- sale_id event_id sale_date ticket_type qty price_per_ticket
-- 102 1 2025-01-10 VIP 1 5000
-- 104 2 2025-02-10 VIP 1 6000
-- 106 3 2025-03-15 VIP 2 2500
-- 107 4 2025-01-20 Regular 4 1200
-- 108 4 2025-02-05 Regular 1 1200

-- Show monthly total revenue and monthly total quantity, but only include months
-- where total revenue is at least 10,000.
select month(sale_date),sum(qty), sum(qty*price_per_ticket) from ticket_sales
group by month(sale_date) having sum(qty*price_per_ticket)>=10000;
--  sale_month total_qty total_revenue
-- 1 7 18800
-- 2 5 13200

-- doubt => Show month-wise count of sales rows, but only include months that have at least 3
select * from events;
select * from ticket_sales;

-- sales rows. sale_month sales_rows
-- 2 3

-- Show average revenue per sale row per month, but only include months where
-- average sale revenue is above 4000. sale_month avg_sale_revenue
select month(sale_date), avg(qty*price_per_ticket) from ticket_sales
group by month(sale_date) having avg(qty*price_per_ticket)>4000;
-- sale_month avg_sale_revenue
-- 1 6266.6667
-- 2 4400

-- Show revenue per month and ticket_type, but only include groups where total
-- revenue is at least 5000.
select month(sale_date), ticket_type, sum(qty*price_per_ticket) from ticket_sales
group by month(sale_date),ticket_type
having sum(qty*price_per_ticket)>=5000;
-- sale_month ticket_type total_revenue
-- 1 Regular 7800
-- 1 VIP 11000
-- 2 Regular 7200
-- 2 VIP 6000
-- 3 VIP 5000
