const db = require('../config/db');

// Get All Modules (Excluding deleted)
exports.getAllModules = async (req, res) => {
    try {
        const [modules] = await db.query('SELECT m.*, u.name as created_by_name FROM Modules m JOIN Users u ON m.created_by = u.id WHERE m.is_deleted = 0 ORDER BY m.created_at DESC');
        res.json(modules);
    } catch (error) {
        res.status(500).json({ error: 'Server error fetching modules' });
    }
};

// Get Single Module
exports.getModuleById = async (req, res) => {
    try {
        const { id } = req.params;
        const [modules] = await db.query('SELECT * FROM Modules WHERE id = ?', [id]);

        if (modules.length === 0) {
            return res.status(404).json({ error: 'Module not found' });
        }
        res.json(modules[0]);
    } catch (error) {
        res.status(500).json({ error: 'Server error fetching module' });
    }
};

// Create Module (Instructor / Admin only)
exports.createModule = async (req, res) => {
    try {
        const { title, description, difficulty, model_url, video_url, estimated_time, skill_level } = req.body;
        const created_by = req.user.id;

        const [result] = await db.query(
            'INSERT INTO Modules (title, description, difficulty, model_url, video_url, estimated_time, skill_level, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [title, description, difficulty, model_url, video_url || null, estimated_time || 10, skill_level || 'Novice', created_by]
        );

        res.status(201).json({ message: 'Module created successfully', moduleId: result.insertId });
    } catch (error) {
        console.error('Create module error:', error);
        res.status(500).json({ error: 'Server error creating module' });
    }
};
// Update Module (Instructor / Admin only)
exports.updateModule = async (req, res) => {
    try {
        const { id } = req.params;
        const { title, description, difficulty, model_url, video_url, estimated_time, skill_level } = req.body;

        const [result] = await db.query(
            'UPDATE Modules SET title = ?, description = ?, difficulty = ?, model_url = ?, video_url = ?, estimated_time = ?, skill_level = ? WHERE id = ?',
            [title, description, difficulty, model_url, video_url || null, estimated_time || 10, skill_level || 'Novice', id]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Module not found' });
        }

        res.json({ message: 'Module updated successfully' });
    } catch (error) {
        console.error('Update module error:', error);
        res.status(500).json({ error: 'Server error updating module' });
    }
};
