const db = require('../config/db');

// --- 1. Soft Delete a Module ---
exports.deleteModule = async (req, res) => {
    try {
        const { id } = req.params;
        const [result] = await db.query('UPDATE Modules SET is_deleted = 1 WHERE id = ?', [id]);
        if (result.affectedRows === 0) return res.status(404).json({ error: 'Module not found' });
        res.json({ message: 'Module soft-deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Server error deleting module' });
    }
};

// --- 2. Get Advanced Instructor Analytics ---
exports.getAnalytics = async (req, res) => {
    try {
        // Total Modules (excluding deleted)
        const [[{ total_modules }]] = await db.query('SELECT COUNT(*) as total_modules FROM Modules WHERE is_deleted = 0');

        // Active Students (Students with at least 1 performance record)
        const [[{ active_students }]] = await db.query('SELECT COUNT(DISTINCT student_id) as active_students FROM Performance');

        // Total Completions
        const [[{ total_completions }]] = await db.query('SELECT COUNT(*) as total_completions FROM Performance p JOIN Modules m ON p.module_id = m.id WHERE m.is_deleted = 0');

        // Average Global Completion Rate (Mock implementation assuming enrolled vs complete, using avg score proxy for now)
        const [[{ avg_score }]] = await db.query('SELECT AVG((score + quiz_score) / 2) as avg_score FROM Performance');

        res.json({
            total_modules,
            active_students,
            total_completions,
            avg_score: avg_score ? parseFloat(avg_score).toFixed(1) : 0
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching analytics' });
    }
};

// --- 3. Get Student Module Completion Overview ---
exports.getStudentProgress = async (req, res) => {
    try {
        // Build a pivoted complex query to get student breakdowns by difficulty
        const query = `
            SELECT 
                u.id as student_id,
                u.name,
                COUNT(CASE WHEN m.difficulty = 'beginner' THEN 1 END) as beginner_completed,
                COUNT(CASE WHEN m.difficulty = 'intermediate' THEN 1 END) as intermediate_completed,
                COUNT(CASE WHEN m.difficulty = 'advanced' THEN 1 END) as advanced_completed,
                COUNT(p.id) as total_completed,
                AVG((p.score + p.quiz_score) / 2) as avg_score
            FROM Users u
            LEFT JOIN Performance p ON u.id = p.student_id
            LEFT JOIN Modules m ON p.module_id = m.id AND m.is_deleted = 0
            WHERE u.role = 'student'
            GROUP BY u.id
            ORDER BY total_completed DESC, avg_score DESC
        `;
        const [students] = await db.query(query);
        res.json(students);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching student progress' });
    }
};

// --- 4. Get chronological Activity Log ---
exports.getActivityLog = async (req, res) => {
    try {
        // Fetch recent module completions
        const [performances] = await db.query(`
            SELECT p.created_at, 'completion' as type, u.name as student_name, m.title as module_name, p.score
            FROM Performance p
            JOIN Users u ON p.student_id = u.id
            JOIN Modules m ON p.module_id = m.id
            WHERE m.is_deleted = 0
            ORDER BY p.created_at DESC LIMIT 10
        `);

        // Fetch recent module creations
        const [modules] = await db.query(`
            SELECT m.created_at, 'creation' as type, u.name as inst_name, m.title as module_name
            FROM Modules m
            JOIN Users u ON m.created_by = u.id
            WHERE m.is_deleted = 0
            ORDER BY m.created_at DESC LIMIT 5
        `);

        // Combine, sort by date desc, and format
        const combined = [...performances, ...modules].sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
        res.json(combined.slice(0, 15));
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching activity log' });
    }
};
// --- 5. Export Student Progress as CSV ---
exports.exportStudentProgressCSV = async (req, res) => {
    try {
        const query = `
            SELECT 
                u.name as 'Student Name',
                COUNT(p.id) as 'Total Modules Completed',
                AVG((p.score + p.quiz_score) / 2) as 'Average Score (%)',
                MAX(p.created_at) as 'Last Activity'
            FROM Users u
            LEFT JOIN Performance p ON u.id = p.student_id
            LEFT JOIN Modules m ON p.module_id = m.id AND m.is_deleted = 0
            WHERE u.role = 'student'
            GROUP BY u.id
            ORDER BY \`Total Modules Completed\` DESC
        `;
        const [students] = await db.query(query);

        if (students.length === 0) {
            return res.status(404).send("No student data available to export.");
        }

        // Generate CSV string
        const header = Object.keys(students[0]).join(',');
        const rows = students.map(student => {
            return Object.values(student).map(val => {
                // Formatting values for CSV safety
                if (val === null || val === undefined) return '0';
                if (val instanceof Date) return `"${val.toISOString().split('T')[0]}"`;
                return `"${String(val).replace(/"/g, '""')}"`;
            }).join(',');
        });

        const csvContent = [header, ...rows].join('\n');

        res.setHeader('Content-Type', 'text/csv');
        res.setHeader('Content-Disposition', 'attachment; filename=medar_student_progress.csv');
        res.status(200).send(csvContent);

    } catch (error) {
        console.error("Export Error:", error);
        res.status(500).json({ error: 'Error generating CSV export' });
    }
};
// --- 6. Get All Users (Admin Only) ---
exports.getAllUsers = async (req, res) => {
    try {
        const [users] = await db.query('SELECT id, name, email, role, created_at FROM Users ORDER BY created_at DESC');
        res.json(users);
    } catch (error) {
        console.error("Get Users Error:", error);
        res.status(500).json({ error: 'Error fetching users' });
    }
};

// --- 7. Delete User (Admin Only) ---
exports.deleteUser = async (req, res) => {
    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();
        const { id } = req.params;

        // 1. Delete performance records (cascading cleanup)
        await connection.query('DELETE FROM Performance WHERE student_id = ?', [id]);

        // 2. Delete the user
        const [result] = await connection.query('DELETE FROM Users WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            await connection.rollback();
            return res.status(404).json({ error: 'User not found' });
        }

        await connection.commit();
        res.json({ message: 'User and all associated data deleted successfully' });
    } catch (error) {
        await connection.rollback();
        console.error("Delete User Error:", error);
        res.status(500).json({ error: 'Error deleting user' });
    } finally {
        connection.release();
    }
};
