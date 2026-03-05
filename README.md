# MedAR Trainer - Augmented Reality Medical Platform

MedAR Trainer is a next-gen web platform where medical students can explore AR-based medical modules, interact with 3D anatomical models, and receive AI-based feedback. 

## Features
- **Student Dashboard**: Track progress, view enrolled modules, and view the global leaderboard.
- **AR Training**: Interactive 3D WebGL anatomical model explorer powered by Three.js.
- **AI Feedback Engine**: Evaluates time taken, accuracy, and procedure completion to provide structured feedback and improvement tips.
- **Instructor Panel**: Deploy new 3D models and modules.
- **Admin Panel**: Manage users and view platform-wide analytics.
- **Modern UI**: Fully responsive, dark/light theme, glassmorphism design.

## Tech Stack
- **Frontend**: HTML5, CSS3 (Custom Variables, Glassmorphism), Vanilla JS, Three.js, Chart.js
- **Backend**: Node.js, Express.js
- **Database**: MySQL
- **Auth**: JWT (JSON Web Tokens) with bcrypt

## Setup Instructions

### 1. Database Setup
1. Ensure MySQL is running on your machine.
2. The server will automatically create the database `medar_trainer` and the required tables if they do not exist when you run the schema script or you can import it manually using `backend/config/schema.sql`.

### 2. Backend Setup
1. Navigate to the `backend` directory: `cd backend`
2. Install dependencies: `npm install`
3. Configure your `.env` file (one is provided with default dev credentials).
   ```
   PORT=5000
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=medar_trainer
   JWT_SECRET=supersecretmedar_key_2026
   ```
4. Run the backend server: `node server.js`

### 3. Frontend Setup
1. The frontend relies only on `index.html` and static files. 
2. You can serve the `frontend` directory using any static file server like `Live Server` in VSCode, or simply run `npx serve frontend`.
3. Open `index.html` to view the application.

## Usage
- Register as an Admin, Instructor, or Student carefully using the role selector to experience different dashboards.
- Launch a module as a student to interact with the Three.js 3D viewer.
- View real-time analytics on the dashboard.

## Security
- Passwords hashed using bcrypt.
- JWT secured REST APIs with role-based middleware (`checkRole`).
- Parameterized SQL queries via `mysql2` to prevent SQL Injection.
