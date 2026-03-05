CREATE DATABASE IF NOT EXISTS medar_trainer;
USE medar_trainer;

CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'instructor', 'admin') NOT NULL,
    department VARCHAR(255),
    profile_picture VARCHAR(500),
    language VARCHAR(50) DEFAULT 'English',
    theme VARCHAR(50) DEFAULT 'dark',
    email_notif BOOLEAN DEFAULT TRUE,
    weekly_notif BOOLEAN DEFAULT TRUE,
    achievement_notif BOOLEAN DEFAULT TRUE,
    module_notif BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Modules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    difficulty ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    model_url VARCHAR(500) NOT NULL,
    video_url VARCHAR(500),
    estimated_time INT DEFAULT 10 COMMENT 'Estimated time in minutes',
    skill_level VARCHAR(100) DEFAULT 'Novice',
    created_by INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    module_id INT NOT NULL,
    question TEXT NOT NULL,
    option_a VARCHAR(500) NOT NULL,
    option_b VARCHAR(500) NOT NULL,
    option_c VARCHAR(500) NOT NULL,
    option_d VARCHAR(500) NOT NULL,
    correct_answer CHAR(1) NOT NULL COMMENT 'A, B, C, or D',
    explanation TEXT,
    FOREIGN KEY (module_id) REFERENCES Modules(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    module_id INT NOT NULL,
    score DECIMAL(5, 2) NOT NULL,
    accuracy DECIMAL(5, 2) NOT NULL,
    time_taken INT NOT NULL COMMENT 'Time taken in seconds',
    quiz_score INT DEFAULT 0 COMMENT 'Score out of 100 for the quiz',
    feedback TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES Modules(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Analytics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total_users INT DEFAULT 0,
    total_modules INT DEFAULT 0,
    avg_score DECIMAL(5, 2) DEFAULT 0
);
