const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const { verifyToken } = require('../middleware/authMiddleware');

// User Profile and Settings Management Routes
router.get('/profile', verifyToken, userController.getProfile);
router.put('/update-profile', verifyToken, userController.updateProfile);
router.put('/settings', verifyToken, userController.updateSettings);
router.put('/change-password', verifyToken, userController.changePassword);
router.delete('/delete-account', verifyToken, userController.deleteAccount);

module.exports = router;
