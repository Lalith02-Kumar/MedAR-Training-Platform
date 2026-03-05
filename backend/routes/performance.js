const express = require('express');
const router = express.Router();
const performanceController = require('../controllers/performanceController');
const { verifyToken, checkRole } = require('../middleware/authMiddleware');

// Submit performance
router.post('/', verifyToken, performanceController.submitPerformance);

// Get specific student performance (Instructor/Admin can pass ID, student gets their own)
// In newer express versions, optional parameters may need explicit regex or separate routes
router.get('/:studentId', verifyToken, performanceController.getStudentPerformance);
router.get('/', verifyToken, performanceController.getStudentPerformance);

// Analytics Overview
router.get('/overview/analytics', verifyToken, checkRole(['instructor', 'admin']), performanceController.getAnalytics);

module.exports = router;
