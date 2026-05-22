import db from './public/src/models/db.js';
const checkTables = async () => {
    try {
        const res = await db.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
        console.log('Tables in public schema:', res.rows.map(r => r.table_name));
    } catch (err) {
        console.error(err);
    } finally {
        await db.close();
    }
};
checkTables();