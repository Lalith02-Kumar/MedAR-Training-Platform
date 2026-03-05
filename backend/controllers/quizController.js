const db = require('../config/db');

// Get quizzes for a specific module
exports.getModuleQuizzes = async (req, res) => {
    try {
        const { id } = req.params;

        // Ensure module exists first
        const [moduleCheck] = await db.query('SELECT id FROM Modules WHERE id = ?', [id]);
        if (moduleCheck.length === 0) {
            return res.status(404).json({ error: 'Module not found' });
        }

        // Don't send the correct_answer or explanation to the frontend!
        const [quizzes] = await db.query(
            'SELECT id, module_id, question, option_a, option_b, option_c, option_d FROM Quizzes WHERE module_id = ? ORDER BY id ASC',
            [id]
        );

        // Safe to return an empty array if no quizzes generated yet
        res.json(quizzes);
    } catch (error) {
        console.error('Quiz fetch error:', error);
        res.status(500).json({ error: 'Server error fetching quizzes' });
    }
};

// Submit quiz answers and calculate score
exports.submitQuiz = async (req, res) => {
    try {
        const { module_id, answers, time_taken } = req.body; // answers: { "quiz_id": "A/B/C/D" }
        const student_id = req.user.id;

        if (!module_id || !answers || typeof answers !== 'object') {
            return res.status(400).json({ error: 'Invalid submission format' });
        }

        const exactTimeTaken = time_taken || 0;

        // Get actual answers
        const [quizzes] = await db.query('SELECT id, correct_answer, explanation FROM Quizzes WHERE module_id = ?', [module_id]);

        if (quizzes.length === 0) {
            return res.status(404).json({ error: 'No quizzes found for this module' });
        }

        let correctCount = 0;
        let results = [];

        quizzes.forEach(quiz => {
            const studentAns = answers[quiz.id];
            const isCorrect = studentAns === quiz.correct_answer;
            if (isCorrect) correctCount++;

            results.push({
                quiz_id: quiz.id,
                is_correct: isCorrect,
                correct_answer: quiz.correct_answer,
                student_answer: studentAns || null,
                explanation: quiz.explanation
            });
        });

        const score = Math.round((correctCount / quizzes.length) * 100);

        // Try to update existing performance for this session or create a new one
        const [recentPerf] = await db.query(
            `SELECT id FROM Performance 
            WHERE student_id = ? AND module_id = ? 
            ORDER BY created_at DESC LIMIT 1`,
            [student_id, module_id]
        );

        if (recentPerf.length > 0) {
            await db.query(
                'UPDATE Performance SET quiz_score = ?, score = ((accuracy + ?) / 2), time_taken = time_taken + ? WHERE id = ?',
                [score, score, exactTimeTaken, recentPerf[0].id]
            );
        } else {
            // Fallback if they took the quiz without AR (just insert a basic perf record)
            await db.query(
                'INSERT INTO Performance (student_id, module_id, score, accuracy, time_taken, quiz_score, feedback) VALUES (?, ?, ?, ?, ?, ?, ?)',
                [student_id, module_id, score, score, exactTimeTaken, score, "Quiz only attempt"]
            );
        }

        res.json({
            score: score,
            correct_count: correctCount,
            total: quizzes.length,
            results: results
        });

    } catch (error) {
        console.error('Quiz submit error:', error);
        res.status(500).json({ error: 'Server error processing quiz submission' });
    }
};
