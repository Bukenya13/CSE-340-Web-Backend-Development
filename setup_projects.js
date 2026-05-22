import db from './public/src/models/db.js';
const setupProjects = async () => {
    try {
        await db.query(`
            CREATE TABLE IF NOT EXISTS project (
                project_id SERIAL PRIMARY KEY,
                organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
                title VARCHAR(255) NOT NULL,
                description TEXT NOT NULL,
                location VARCHAR(255) NOT NULL,
                date DATE NOT NULL
            );
        `);
        await db.query(`
            INSERT INTO project (organization_id, title, description, location, date) VALUES
                (1, 'Community Center Build', 'Help construct a new community center for local residents.', 'Downtown Area', '2024-06-15'),
                (1, 'Park Bench Installation', 'Install new benches in Riverside Park.', 'Riverside Park', '2024-06-20'),
                (1, 'School Garden Project', 'Build garden beds for elementary school students.', 'Lincoln Elementary', '2024-07-01'),
                (2, 'Urban Farm Volunteer Day', 'Help plant and harvest vegetables at the community farm.', 'Green City Farm', '2024-06-18'),
                (2, 'Seed Library Setup', 'Organize and label seed packets for community distribution.', 'Community Center', '2024-06-25'),
                (2, 'Composting Workshop', 'Learn and teach composting techniques to neighbors.', 'Eco Hub', '2024-07-05'),
                (3, 'Food Bank Sorting', 'Sort and organize donated food items.', 'Local Food Bank', '2024-06-16'),
                (3, 'Senior Center Lunch Service', 'Serve lunch to seniors and provide companionship.', 'Sunset Senior Living', '2024-06-22'),
                (3, 'Neighborhood Cleanup', 'Pick up litter and beautify local streets.', 'Oakwood District', '2024-07-10');
        `);
        console.log('Project table created and seeded.');
    } catch (err) {
        console.error(err);
    } finally {
        await db.close();
    }
};
setupProjects();