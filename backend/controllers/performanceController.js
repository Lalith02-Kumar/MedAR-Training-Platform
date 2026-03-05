const db = require('../config/db');

// Submit Performance
exports.submitPerformance = async (req, res) => {
    try {
        const { module_id, score, accuracy, time_taken, feedback } = req.body;
        const student_id = req.user.id;

        // Ensure numerics to prevent MySQL DECIMAL casting errors
        const parsedScore = parseFloat(score || 0).toFixed(2);
        const parsedAccuracy = parseFloat(accuracy || 0).toFixed(2);
        const parsedTime = parseInt(time_taken || 0);

        const [result] = await db.query(
            'INSERT INTO Performance (student_id, module_id, score, accuracy, time_taken, feedback) VALUES (?, ?, ?, ?, ?, ?)',
            [student_id, module_id, parsedScore, parsedAccuracy, parsedTime, feedback]
        );

        res.status(201).json({ message: 'Performance submitted successfully', performanceId: result.insertId });
    } catch (error) {
        console.error('Submit performance error details:', error.sqlMessage || error.message);
        res.status(500).json({ error: 'Server error recording performance', details: error.sqlMessage || error.message });
    }
};

// Get Performance by Student ID
exports.getStudentPerformance = async (req, res) => {
    try {
        const student_id = req.params.studentId || req.user.id;

        // Prevent users from viewing others' performance unless admin/instructor
        if (req.user.role === 'student' && parseInt(student_id) !== req.user.id) {
            return res.status(403).json({ error: 'Unauthorized to view this data' });
        }

        const [performances] = await db.query(`
            SELECT p.*, m.title as module_title 
            FROM Performance p 
            JOIN Modules m ON p.module_id = m.id 
            WHERE p.student_id = ?
            ORDER BY p.created_at DESC
        `, [student_id]);

        res.json(performances);
    } catch (error) {
        res.status(500).json({ error: 'Server error fetching performance data' });
    }
};

// Get Analytics overview (for Instructor/Admin Dashboard)
exports.getAnalytics = async (req, res) => {
    try {
        const [[{ total_users }]] = await db.query("SELECT COUNT(*) as total_users FROM Users WHERE role = 'student'");
        const [[{ total_modules }]] = await db.query("SELECT COUNT(*) as total_modules FROM Modules WHERE is_deleted = 0");
        const [[{ avg_score }]] = await db.query("SELECT AVG(score) as avg_score FROM Performance p JOIN Modules m ON p.module_id = m.id WHERE m.is_deleted = 0");

        res.json({
            total_students: total_users,
            total_modules,
            avg_network_score: avg_score ? parseFloat(avg_score).toFixed(2) : 0
        });
    } catch (error) {
        res.status(500).json({ error: 'Server error generating analytics' });
    }
};

// Get Global Leaderboard
exports.getLeaderboard = async (req, res) => {
    try {
        // Aggregate average scores per student
        const [leaderboard] = await db.query(`
            SELECT u.id, u.name, 
                   AVG(p.score) as avg_score, 
                   AVG(p.quiz_score) as avg_quiz_score,
                   COUNT(p.id) as modules_completed
            FROM Users u
            JOIN Performance p ON u.id = p.student_id
            JOIN Modules m ON p.module_id = m.id
            WHERE u.role = 'student' AND m.is_deleted = 0
            GROUP BY u.id, u.name
            ORDER BY avg_score DESC
            LIMIT 10
        `);

        // Format numbers
        const formatted = leaderboard.map(l => ({
            ...l,
            avg_score: parseFloat(l.avg_score).toFixed(1),
            avg_quiz_score: parseFloat(l.avg_quiz_score).toFixed(1)
        }));

        res.json(formatted);
    } catch (error) {
        console.error('Leaderboard error:', error);
        res.status(500).json({ error: 'Server error generating leaderboard' });
    }
};
