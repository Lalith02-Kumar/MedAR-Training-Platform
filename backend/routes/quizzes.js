const express = require('express');
const router = express.Router();
const quizController = require('../controllers/quizController');
const { verifyToken } = require('../middleware/authMiddleware');

// Submit quiz
router.post('/submit', verifyToken, quizController.submitQuiz);

module.exports = router;
