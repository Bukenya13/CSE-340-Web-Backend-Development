-- Organization table creation
CREATE TABLE IF NOT EXISTS organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- Sample data for organizations
INSERT INTO organization (name, description, contact_email, logo_filename) VALUES
    ('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
    ('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
    ('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- Project table creation
CREATE TABLE IF NOT EXISTS project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

-- Sample data for projects
INSERT INTO project (organization_id, title, description, location, date) VALUES
    (1, 'Community Center Build', 'Help construct a new community center for local residents.', 'Downtown Area', '2026-06-15'),
    (1, 'Park Bench Installation', 'Install new benches in Riverside Park.', 'Riverside Park', '2026-12-20'),
    (1, 'School Garden Project', 'Build garden beds for elementary school students.', 'Lincoln Elementary', '2027-07-01'),
    (2, 'Urban Farm Volunteer Day', 'Help plant and harvest vegetables at the community farm.', 'Green City Farm', '2026-06-18'),
    (2, 'Seed Library Setup', 'Organize and label seed packets for community distribution.', 'Community Center', '2026-12-25'),
    (2, 'Composting Workshop', 'Learn and teach composting techniques to neighbors.', 'Eco Hub', '2027-07-05'),
    (3, 'Food Bank Sorting', 'Sort and organize donated food items.', 'Local Food Bank', '2026-06-16'),
    (3, 'Senior Center Lunch Service', 'Serve lunch to seniors and provide companionship.', 'Sunset Senior Living', '2026-12-22'),
    (3, 'Neighborhood Cleanup', 'Pick up litter and beautify local streets.', 'Oakwood District', '2027-07-10');