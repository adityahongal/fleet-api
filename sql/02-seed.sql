-- ============================================================
-- FLEET API - SEED DATA
-- ============================================================

-- ------------------------------------------------------------
-- FLEETS
-- ------------------------------------------------------------

INSERT INTO fleets (name, location)
VALUES
    ('Mumbai Fleet', 'Mumbai'),
    ('Pune Fleet', 'Pune'),
    ('Bangalore Fleet', 'Bangalore'),
    ('Hyderabad Fleet', 'Hyderabad');


-- ------------------------------------------------------------
-- VEHICLES
-- ------------------------------------------------------------

INSERT INTO vehicles (
    registration_number,
    model,
    fleet_id,
    status
)
VALUES
    ('MH12AB1234', 'Tata Nexon',      1, 'active'),
    ('MH12CD5678', 'Mahindra XUV700', 1, 'active'),
    ('MH14EF9012', 'Hyundai Creta',   2, 'active'),
    ('MH14GH3456', 'Tata Punch',      2, 'inactive'),
    ('MH14JK7890', 'Kia Seltos',      2, 'maintenance'),
    ('KA01LM1111', 'Toyota Innova',   3, 'active'),
    ('KA01NO2222', 'Hyundai Verna',   3, 'active'),
    ('KA01PQ3333', 'Tata Harrier',    3, 'maintenance'),
    ('TS09RS4444', 'Kia Carens',      4, 'active'),
    ('TS09TU5555', 'Tata Safari',     4, 'inactive');