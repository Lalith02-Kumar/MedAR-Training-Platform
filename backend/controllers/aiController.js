// Mock AI logic to evaluate performance
exports.generateFeedback = async (req, res) => {
    try {
        const { timeTaken, stepsCompleted, totalSteps } = req.body;

        // Simple logic to mock an AI response
        let accuracy = (stepsCompleted / totalSteps) * 100;
        let score = accuracy;
        let pScore = 100;

        if (timeTaken > 300) { // 5 mins
            pScore -= 20;
        } else if (timeTaken > 120) {
            pScore -= 10;
        }

        score = (score + pScore) / 2;

        let feedback = "";
        let tips = [];

        if (accuracy === 100 && timeTaken < 120) {
            feedback = "Excellent! Perfect precision and fast response.";
            tips.push("Try advanced modules next.");
        } else if (accuracy >= 80) {
            feedback = "Good precision but improve speed.";
            tips.push("Practice incision placement", "Reduce hesitation");
        } else {
            feedback = "Needs improvement. Review anatomical markers.";
            tips.push("Study 3D models longer", "Focus on accuracy over speed first");
        }

        res.json({
            score: Math.round(score),
            accuracy: Math.round(accuracy),
            feedback,
            improvement_tips: tips
        });

    } catch (error) {
        console.error('AI logic error', error);
        res.status(500).json({ error: 'Error generating AI feedback' });
    }
};
