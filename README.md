# 🎓 College Management System (SQL)

This project is a College Management System developed using SQL to manage student, course, teacher, and subject data efficiently.

## 🔹 Overview
The system is designed to handle academic data using relational database concepts such as tables, relationships, joins, and views.

## 🔹 Database Structure
The database consists of the following tables:

- **course** → Stores course details (course_id, course_name, fees)  
- **students** → Stores student information (id, name, age, city, course_id)  
- **teachers** → Stores teacher details linked with courses  
- **subjects** → Stores subject details linked with courses  

## 🔹 Key Features
- Creation of relational database using SQL  
- Implementation of Primary Keys and Foreign Keys  
- Establishing relationships between tables  
- Insert, Update, and Delete operations  
- Data retrieval using SELECT queries  
- Use of JOIN operations for combining data  
- Aggregate functions (COUNT, GROUP BY)  
- Creation of VIEW for simplified data access  

## 🔹 Sample Queries Implemented

### 📊 Student-Course Details
```sql
SELECT students.name, course.course_name, course.fees
FROM students
JOIN course ON students.course_id = course.course_id;
