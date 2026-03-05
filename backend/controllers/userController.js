const bcrypt = require('bcrypt');
const db = require('../config/db');

// Update user profile fields (name, department, profile picture)
exports.updateProfile = async (req, res) => {
    try {
        const { name, department, profile_picture } = req.body;
        const userId = req.user.id; // extracted from verifyToken middleware

        // Build dynamic update query
        const updates = [];
        const values = [];

        if (name !== undefined) {
            updates.push('name = ?');
            values.push(name);
        }
        if (department !== undefined) {
            updates.push('department = ?');
            values.push(department);
        }
        if (profile_picture !== undefined) {
            updates.push('profile_picture = ?');
            values.push(profile_picture);
        }

        if (updates.length === 0) {
            return res.status(400).json({ error: 'No fields to update' });
        }

        values.push(userId);

        const query = `UPDATE Users SET ${updates.join(', ')} WHERE id = ?`;
        await db.query(query, values);

        res.json({ message: 'Profile updated successfully' });
    } catch (error) {
        console.error('Update Profile Error:', error);
        res.status(500).json({ error: 'Server error updating profile' });
    }
};

// Update user settings (language, theme, notification preferences)
exports.updateSettings = async (req, res) => {
    try {
        const { language, theme, email_notif, weekly_notif, achievement_notif, module_notif } = req.body;
        const userId = req.user.id;

        const updates = [];
        const values = [];

        if (language !== undefined) { updates.push('language = ?'); values.push(language); }
        if (theme !== undefined) { updates.push('theme = ?'); values.push(theme); }

        // Handle booleans
        if (email_notif !== undefined) { updates.push('email_notif = ?'); values.push(email_notif === true ? 1 : 0); }
        if (weekly_notif !== undefined) { updates.push('weekly_notif = ?'); values.push(weekly_notif === true ? 1 : 0); }
        if (achievement_notif !== undefined) { updates.push('achievement_notif = ?'); values.push(achievement_notif === true ? 1 : 0); }
        if (module_notif !== undefined) { updates.push('module_notif = ?'); values.push(module_notif === true ? 1 : 0); }

        if (updates.length > 0) {
            values.push(userId);
            const query = `UPDATE Users SET ${updates.join(', ')} WHERE id = ?`;
            await db.query(query, values);
        }

        res.json({ message: 'Settings updated successfully' });
    } catch (error) {
        console.error('Update Settings Error:', error);
        res.status(500).json({ error: 'Server error updating settings' });
    }
};

// Change user password securely
exports.changePassword = async (req, res) => {
    try {
        const { currentPassword, newPassword } = req.body;
        const userId = req.user.id;

        if (!currentPassword || !newPassword) {
            return res.status(400).json({ error: 'Both current password and new password are required' });
        }

        const [users] = await db.query('SELECT password FROM Users WHERE id = ?', [userId]);

        if (users.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }

        const user = users[0];

        // Confirm current password
        const isMatch = await bcrypt.compare(currentPassword, user.password);
        if (!isMatch) {
            return res.status(401).json({ error: 'Incorrect current password' });
        }

        // Hash and save new password
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        await db.query('UPDATE Users SET password = ? WHERE id = ?', [hashedPassword, userId]);

        res.json({ message: 'Password changed successfully' });
    } catch (error) {
        console.error('Change Password Error:', error);
        res.status(500).json({ error: 'Server error changing password' });
    }
};
// Delete own account (Self-service)
exports.deleteAccount = async (req, res) => {
    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();
        const userId = req.user.id;

        // 1. Cleanup personal data
        await connection.query('DELETE FROM Performance WHERE student_id = ?', [userId]);

        // 2. Delete user
        const [result] = await connection.query('DELETE FROM Users WHERE id = ?', [userId]);

        await connection.commit();
        res.json({ message: 'Account deleted successfully' });
    } catch (error) {
        await connection.rollback();
        console.error('Delete Account Error:', error);
        res.status(500).json({ error: 'Error deleting account' });
    } finally {
        connection.release();
    }
};
// Get current user profile details
exports.getProfile = async (req, res) => {
    try {
        const userId = req.user.id;
        const [users] = await db.query(
            'SELECT id, name, email, role, department, profile_picture, created_at FROM Users WHERE id = ?',
            [userId]
        );

        if (users.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }

        const user = users[0];
        res.json(user);
    } catch (error) {
        console.error('Get Profile Error:', error);
        res.status(500).json({ error: 'Server error fetching profile' });
    }
};
