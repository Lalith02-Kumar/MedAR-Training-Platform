const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const { verifyToken, checkRole } = require('../middleware/authMiddleware');

// Mount on /api/admin
router.get('/analytics', verifyToken, checkRole(['admin', 'instructor']), adminController.getAnalytics);
router.get('/students/progress', verifyToken, checkRole(['admin', 'instructor']), adminController.getStudentProgress);
router.get('/activity', verifyToken, checkRole(['admin', 'instructor']), adminController.getActivityLog);
router.delete('/modules/:id', verifyToken, checkRole(['admin', 'instructor']), adminController.deleteModule);
router.get('/users', verifyToken, checkRole(['admin']), adminController.getAllUsers);
router.delete('/users/:id', verifyToken, checkRole(['admin']), adminController.deleteUser);

module.exports = router;
