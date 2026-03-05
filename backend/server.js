const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json()); // Parses incoming JSON requests
app.use(express.urlencoded({ extended: true }));

// Test Route
app.get('/api/health', (req, res) => {
    res.json({ status: 'success', message: 'API is running' });
});

// Import Routes
const authRoutes = require('./routes/auth');
const moduleRoutes = require('./routes/modules');
const performanceRoutes = require('./routes/performance');
const adminRoutes = require('./routes/admin');
const aiRoutes = require('./routes/ai');
const quizRoutes = require('./routes/quizzes');
const userRoutes = require('./routes/user');
const performanceController = require('./controllers/performanceController');
const { verifyToken } = require('./middleware/authMiddleware');

// Use Routes
app.use('/api', authRoutes); // Auth APIs: /api/register, /api/login, /api/profile
app.use('/api/modules', moduleRoutes); // /api/modules
app.use('/api/performance', performanceRoutes); // /api/performance
app.use('/api/admin', adminRoutes); // Admin & Instructor tasks
app.use('/api/user', userRoutes); // User management: profile, settings, password
app.use('/api/ai-feedback', aiRoutes); // /api/ai-feedback
app.use('/api/quiz', quizRoutes); // /api/quiz/submit

// Leaderboard standalone route
app.get('/api/leaderboard', verifyToken, performanceController.getLeaderboard);

// Error Handling Middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Something went wrong!' });
});

// Start Server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
