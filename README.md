# Horse Racing Management System

A robust desktop application designed to manage horse racing events, participant data, and race results. This project was developed as part of the Database Systems) course at **KFUPM**

## 🚀 Features
- **Administrative Control:** Full CRUD (Create, Read, Update, Delete) operations for managing horses, trainers, and race schedules.
- **Guest Access:** Dedicated read only interface for viewing race results and upcoming schedules.
- **Database Connectivity:** Secure connection management using JDBC to interact with a MySQL database.
- **Relational Data Integrity:** Implements complex SQL schemas with primary/foreign key relationships to ensure data consistency.


## 📊 Database Architecture
The system relies on a relational schema defined in `HorseRacing.sql`, which includes tables for:
- **Horses:** Tracking lineage and performance stats.
- **Trainers:** Managing professional profiles.
- **Races:** Scheduling and venue management.
- **Results:** Recording final standings and timings.

## 💻 How to Run
1. **Database Setup:** Import the `HorseRacing.sql` file into your MySQL server.
2. **Configuration:** Update the connection strings in `TestDBConnection.java` with your local database credentials.
3. **Compile & Run:** Compile the Java files and run `Main.java` to launch the application.

## Academic Context
This project demonstrates proficiency in:
- Designing normalized relational databases.
- Writing optimized SQL queries for data retrieval and manipulation.
- Building functional Graphical User Interfaces (GUIs) in Java.
