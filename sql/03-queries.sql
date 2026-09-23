-- ============================================================
-- FLEET API - SQL PRACTICE QUERIES
-- ============================================================


-- ============================================================
-- 01. SELECT
-- ============================================================

-- Get all fleets
SELECT *
FROM fleets;


-- Get all vehicles
SELECT *
FROM vehicles;


-- Select specific columns
SELECT
    registration_number,
    model,
    status
FROM vehicles;


-- Rename a column using an alias
SELECT
    registration_number AS vehicle_number,
    model AS vehicle_model
FROM vehicles;


-- ============================================================
-- 02. WHERE
-- ============================================================

-- Get only active vehicles
SELECT *
FROM vehicles
WHERE status = 'active';


-- Get vehicles belonging to fleet 2
SELECT *
FROM vehicles
WHERE fleet_id = 2;


-- Get vehicles that are NOT active
SELECT *
FROM vehicles
WHERE status != 'active';


-- Multiple conditions using AND
SELECT *
FROM vehicles
WHERE status = 'active'
  AND fleet_id = 2;


-- Multiple conditions using OR
SELECT *
FROM vehicles
WHERE status = 'inactive'
   OR status = 'maintenance';

-- ============================================================
-- 03. NULL
-- ============================================================

-- Find vehicles that do not have a fleet assigned
SELECT *
FROM vehicles
WHERE fleet_id IS NULL;


-- Find vehicles that have a fleet assigned
SELECT *
FROM vehicles
WHERE fleet_id IS NOT NULL;

-- ============================================================
-- 04. ORDER BY
-- ============================================================

-- Sort vehicles by model alphabetically
SELECT *
FROM vehicles
ORDER BY model ASC;


-- Sort vehicles by model in reverse alphabetical order
SELECT *
FROM vehicles
ORDER BY model DESC;


-- Sort vehicles by status
SELECT
    registration_number,
    model,
    status
FROM vehicles
ORDER BY status ASC;


-- Sort by multiple columns
-- First sort by status, then by model
SELECT
    registration_number,
    model,
    status
FROM vehicles
ORDER BY status ASC, model ASC;

SELECT
    registration_number,
    model,
    status
FROM vehicles
WHERE fleet_id = 2
ORDER BY model ASC;

-- ============================================================
-- 05. LIMIT / OFFSET
-- ============================================================

-- Return only the first 5 vehicles
SELECT *
FROM vehicles
LIMIT 5;


-- Skip the first 5 vehicles and return the next 5
SELECT *
FROM vehicles
LIMIT 5
OFFSET 5;


-- Get the first 3 active vehicles, sorted by model
SELECT
    registration_number,
    model,
    status
FROM vehicles
WHERE status = 'active'
ORDER BY model ASC
LIMIT 3;

-- ============================================================
-- 06. INNER JOIN
-- ============================================================

-- Get vehicles along with the fleet they belong to
SELECT
    v.registration_number,
    v.model,
    f.name AS fleet_name
FROM vehicles v
INNER JOIN fleets f
    ON v.fleet_id = f.id;


-- Include the fleet location
SELECT
    v.registration_number,
    v.model,
    f.name AS fleet_name,
    f.location
FROM vehicles v
INNER JOIN fleets f
    ON v.fleet_id = f.id;


-- Get only active vehicles with their fleet information
SELECT
    v.registration_number,
    v.model,
    f.name AS fleet_name
FROM vehicles v
INNER JOIN fleets f
    ON v.fleet_id = f.id
WHERE v.status = 'active';


-- Get vehicles belonging to the Pune fleet
SELECT
    v.registration_number,
    v.model,
    v.status
FROM vehicles v
INNER JOIN fleets f
    ON v.fleet_id = f.id
WHERE f.name = 'Pune Fleet';

-- ============================================================
-- 07. LEFT JOIN
-- ============================================================

-- Get all fleets and their vehicles
SELECT
    f.name AS fleet_name,
    v.registration_number,
    v.model
FROM fleets f
LEFT JOIN vehicles v
    ON f.id = v.fleet_id;


-- Get all fleets and their active vehicles
SELECT
    f.name AS fleet_name,
    v.registration_number,
    v.model
FROM fleets f
LEFT JOIN vehicles v
    ON f.id = v.fleet_id
   AND v.status = 'active';


-- Find fleets that currently have no vehicles
SELECT
    f.name AS fleet_name
FROM fleets f
LEFT JOIN vehicles v
    ON f.id = v.fleet_id
WHERE v.id IS NULL;

-- ============================================================
-- 08. GROUP BY
-- ============================================================

-- Count all vehicles
SELECT
    COUNT(*) AS total_vehicles
FROM vehicles;


-- Count vehicles in each fleet
SELECT
    fleet_id,
    COUNT(*) AS vehicle_count
FROM vehicles
GROUP BY fleet_id
ORDER BY fleet_id;


-- Count vehicles in each fleet with fleet names
SELECT
    f.name AS fleet_name,
    COUNT(v.id) AS vehicle_count
FROM fleets f
INNER JOIN vehicles v
    ON f.id = v.fleet_id
GROUP BY f.id, f.name
ORDER BY f.id;


-- Count vehicles by status
SELECT
    status,
    COUNT(*) AS vehicle_count
FROM vehicles
GROUP BY status
ORDER BY status;


-- Count active vehicles in each fleet
SELECT
    fleet_id,
    COUNT(*) AS active_vehicle_count
FROM vehicles
WHERE status = 'active'
GROUP BY fleet_id
ORDER BY fleet_id;

-- ============================================================
-- 09. HAVING
-- ============================================================

-- Find fleets that have more than 2 vehicles
SELECT
    fleet_id,
    COUNT(*) AS vehicle_count
FROM vehicles
GROUP BY fleet_id
HAVING COUNT(*) > 2
ORDER BY fleet_id;


-- Find vehicle statuses with more than 2 vehicles
SELECT
    status,
    COUNT(*) AS vehicle_count
FROM vehicles
GROUP BY status
HAVING COUNT(*) > 2
ORDER BY status;


-- Find fleets with more than 1 active vehicle
SELECT
    fleet_id,
    COUNT(*) AS active_vehicle_count
FROM vehicles
WHERE status = 'active'
GROUP BY fleet_id
HAVING COUNT(*) > 1
ORDER BY fleet_id;


-- Find fleets with more than 2 vehicles,
-- including the fleet name
SELECT
    f.name AS fleet_name,
    COUNT(v.id) AS vehicle_count
FROM fleets f
INNER JOIN vehicles v
    ON f.id = v.fleet_id
GROUP BY f.id, f.name
HAVING COUNT(v.id) > 2
ORDER BY vehicle_count DESC;