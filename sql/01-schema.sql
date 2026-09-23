-- ============================================================
-- FLEET API - DATABASE SCHEMA
-- ============================================================

-- ------------------------------------------------------------
-- FLEETS
-- ------------------------------------------------------------

CREATE TABLE fleets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ------------------------------------------------------------
-- VEHICLES
-- ------------------------------------------------------------

CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    model VARCHAR(100) NOT NULL,
    fleet_id INTEGER REFERENCES fleets(id),
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);