-- Clean setup: drop existing tables in correct order
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS organization;
DROP TABLE IF EXISTS category;

-- Organization table creation
CREATE TABLE organization (
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

-- Category table creation
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);

-- Sample data for categories
INSERT INTO category (name, description) VALUES
    ('Construction', 'Building and repairing community structures.'),
    ('Agriculture', 'Projects related to farming, gardening, and food production.'),
    ('Community Service', 'General volunteer work and community support.');

-- Project table creation
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    category_id INTEGER NOT NULL REFERENCES category(category_id),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

-- Sample data for projects
INSERT INTO project (organization_id, category_id, title, description, location, date) VALUES
    (1, 1, 'Community Center Build', 'Help construct a new community center for local residents.', 'Downtown Area', '2026-06-15'),
    (1, 1, 'Park Bench Installation', 'Install new benches in Riverside Park.', 'Riverside Park', '2026-12-20'),
    (1, 1, 'School Garden Project', 'Build garden beds for elementary school students.', 'Lincoln Elementary', '2027-07-01'),
    (2, 2, 'Urban Farm Volunteer Day', 'Help plant and harvest vegetables at the community farm.', 'Green City Farm', '2026-06-18'),
    (2, 2, 'Seed Library Setup', 'Organize and label seed packets for community distribution.', 'Community Center', '2026-12-25'),
    (2, 2, 'Composting Workshop', 'Learn and teach composting techniques to neighbors.', 'Eco Hub', '2027-07-05'),
    (3, 3, 'Food Bank Sorting', 'Sort and organize donated food items.', 'Local Food Bank', '2026-06-16'),
    (3, 3, 'Senior Center Lunch Service', 'Serve lunch to seniors and provide companionship.', 'Sunset Senior Living', '2026-12-22'),
    (3, 3, 'Neighborhood Cleanup', 'Pick up litter and beautify local streets.', 'Oakwood District', '2027-07-10');
