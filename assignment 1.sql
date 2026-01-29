-- 1️⃣ What is a VIEW in SQL?

-- View ek virtual table hota hai.
-- Ye khud data store nahi karta, balki SELECT query ka result dikhata hai.

-- 🔹 Use kyu karte hain?

-- Complex queries ko simple banane ke liye

-- Security (user ko sirf limited columns dikhane ke liye)

-- Reusability

-- 🔹 Syntax

-- CREATE VIEW emp_view AS
-- SELECT emp_id, emp_name, salary
-- FROM employees;


-- 👉 emp_view ab table ki tarah use ho sakta hai.

-- 2️⃣ Non-Materialized View (Normal View)

-- 👉 Default VIEW

-- 🔹 Data store nahi hota
-- 🔹 Har baar query run hoti hai
-- 🔹 Fast update, but slow read (large data me)

-- 🧠 Yaad rakhne ka trick:
-- "VIEW = Query ka mirror"

-- CREATE VIEW dept_view AS
-- SELECT dept_id, dept_name FROM departments;

-- 3️⃣ Materialized View

-- 👉 Physical table jaisa hota hai

-- 🔹 Data store hota hai
-- 🔹 Fast read
-- 🔹 Data old ho sakta hai (refresh karna padta hai)

-- 🧠 Yaad rakhne ka trick:
-- "Materialized = Data saved"

-- CREATE MATERIALIZED VIEW sales_mv AS
-- SELECT product_id, SUM(amount)
-- FROM sales
-- GROUP BY product_id;


-- 🔄 Refresh

-- REFRESH MATERIALIZED VIEW sales_mv;

-- 🔁 Materialized vs Non-Materialized (Quick Table)
-- Feature	View	Materialized View
-- Data store	❌ No	✅ Yes
-- Speed	Slow read	Fast read
-- Space	No space	Uses space
-- Refresh	Not needed	Needed
-- 4️⃣ How to Create a New User in SQL
-- CREATE USER rahul IDENTIFIED BY password123;


-- 👉 New user ban gaya ✅

-- 5️⃣ How to Assign DML Permissions to a User
-- DML = SELECT, INSERT, UPDATE, DELETE
-- GRANT SELECT, INSERT, UPDATE, DELETE
-- ON employees
-- TO rahul;


-- 👉 Ab rahul table pe kaam kar sakta hai.

-- ❌ Permission wapas lene ke liye:

-- REVOKE INSERT ON employees FROM rahul;

-- 🔥 Ultra-Short Revision (1 Line Each)

-- View → Virtual table, data store nahi

-- Materialized View → Data store hota hai

-- Create User → CREATE USER

-- DML Permission → GRANT SELECT, INSERT...