import db from './src/models/db.js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const setupDatabase = async () => {
    try {
        const sqlPath = path.join(__dirname, 'src', 'setup.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');
        
        console.log('Running database setup...');
        await db.query(sql);
        console.log('Database setup completed successfully.');
    } catch (err) {
        console.error('Error during database setup:', err);
    } finally {
        if (db.close) {
            await db.close();
        } else if (db.end) {
            await db.end();
        }
    }
};
setupDatabase();