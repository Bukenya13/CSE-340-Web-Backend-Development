import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';
import { testConnection } from './public/src/models/db.js';
import { getAllOrganizations } from './public/src/models/organizations.js';
import { getAllProjects } from './public/src/models/projects.js';
import { getAllCategories } from './public/src/models/categories.js';

// Load environment variables
dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'development';
const PORT = process.env.PORT || 3000;

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'public', 'src', 'views'));
app.set('view cache', false);

app.use(express.static(path.join(__dirname, 'public')));

// 1. Home Route
app.get('/', (req, res) => {
    res.render('home', { title: 'Home' });
});

// 2. Organizations Route
app.get('/organizations', async (req, res) => {
    const organizations = await getAllOrganizations();
    const title = 'Our Partner Organizations';
    res.render('organizations', { title, organizations });
});

// 3. Projects Route
app.get('/projects', async (req, res) => {
    const projects = await getAllProjects();
    const title = 'Service Projects';
    res.render('projects', { title, projects });
});

// 4. Categories Route
app.get('/categories', async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Categories';
    res.render('categories', { title, categories });
});

// 5. Server Listener & DB Connection
app.listen(PORT, async () => {
    try {
        await testConnection();
        console.log(`Server is running at http://127.0.0.1:${PORT}`);
        console.log(`Environment: ${NODE_ENV}`);
    } catch (error) {
        console.error('Failed to connect to the database:', error);
        process.exit(1); // Exit with a failure code
    }
});