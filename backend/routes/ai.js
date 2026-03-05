const express = require('express');
const router = express.Router();
const aiController = require('../controllers/aiController');
const { verifyToken } = require('../middleware/authMiddleware');

// Generate Mock AI Feedback
router.post('/', verifyToken, aiController.generateFeedback);

module.exports = router;
