const express = require('express');
const router = express.Router();
const moduleController = require('../controllers/moduleController');
const quizController = require('../controllers/quizController');
const { verifyToken, checkRole } = require('../middleware/authMiddleware');

// Get all modules (Accessible to students, instructors, admins)
router.get('/', verifyToken, moduleController.getAllModules);

// Get single module
router.get('/:id', verifyToken, moduleController.getModuleById);

// Get quizzes for a specific module
router.get('/:id/quiz', verifyToken, quizController.getModuleQuizzes);

// Create module (Instructors and Admins only)
router.post('/', verifyToken, checkRole(['instructor', 'admin']), moduleController.createModule);

// Update module (Instructors and Admins only)
router.put('/:id', verifyToken, checkRole(['instructor', 'admin']), moduleController.updateModule);

module.exports = router;
