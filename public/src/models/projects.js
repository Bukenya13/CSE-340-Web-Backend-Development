import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT p.project_id, p.title, p.description, p.location, p.date, p.organization_id, o.name as organization_name
        FROM public.project p
        JOIN public.organization o ON p.organization_id = o.organization_id
        ORDER BY p.date;
    `;

    const result = await db.query(query);

    return result.rows;
};

export { getAllProjects };