const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');
require('dotenv').config();

async function runSeed() {
    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            multipleStatements: true
        });

        // 0. Ensure DB exists and select it
        console.log('Ensuring DB exists...');
        await connection.query(`CREATE DATABASE IF NOT EXISTS medar_trainer;`);
        await connection.query(`USE medar_trainer;`);

        // 1. Drop existing tables to enforce schema update
        console.log('Dropping existing tables to reapply schema...');
        await connection.query('SET FOREIGN_KEY_CHECKS = 0');
        await connection.query('DROP TABLE IF EXISTS Quizzes, Performance, Modules, Users, Analytics');
        await connection.query('SET FOREIGN_KEY_CHECKS = 1');

        // 1. Run Schema
        console.log('Running Schema...');
        const schemaPath = path.join(__dirname, 'schema.sql');
        const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
        await connection.query(`CREATE DATABASE IF NOT EXISTS medar_trainer; USE medar_trainer;`);
        await connection.query(schemaSQL);
        console.log('Schema executed.');

        // 2. Run Seed
        console.log('Running Seed...');
        const seedPath = path.join(__dirname, 'seed.sql');
        const seedSQL = fs.readFileSync(seedPath, 'utf8');
        await connection.query(seedSQL);
        console.log('Seed executed.');

        await connection.end();
        console.log('Database updated successfully!');
    } catch (error) {
        console.error('Error seeding database:', error);
    }
}

runSeed();
