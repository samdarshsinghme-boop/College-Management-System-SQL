MariaDB [(none)]> create databases college_management;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'databases college_management' at line 1
MariaDB [(none)]> CREATE DATABASE college_management;
Query OK, 1 row affected (0.005 sec)

MariaDB [(none)]> use  college_management;
Database changed
MariaDB [college_management]> CREATE TABLE course(course_id int primary key,course_name varchar(50),fees int);
Query OK, 0 rows affected (0.020 sec)

MariaDB [college_management]> show tables;
+------------------------------+
| Tables_in_college_management |
+------------------------------+
| course                       |
+------------------------------+
1 row in set (0.004 sec)

MariaDB [college_management]> desc course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | int(11)     | NO   | PRI | NULL    |       |
| course_name | varchar(50) | YES  |     | NULL    |       |
| fees        | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.016 sec)

MariaDB [college_management]> CREATE TABLE students(students_id int primary key,name varchar(50),age int,city varchar(50),course_id int);
Query OK, 0 rows affected (0.057 sec)

MariaDB [college_management]> desc students
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| students_id | int(11)     | NO   | PRI | NULL    |       |
| name        | varchar(50) | YES  |     | NULL    |       |
| age         | int(11)     | YES  |     | NULL    |       |
| city        | varchar(50) | YES  |     | NULL    |       |
| course_id   | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.030 sec)

MariaDB [college_management]> CREATE TABLE teachers(teacher_id int primary key,teacher_name varchar(50),course_id int);
Query OK, 0 rows affected (0.053 sec)

MariaDB [college_management]> desc teachers;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| teacher_id   | int(11)     | NO   | PRI | NULL    |       |
| teacher_name | varchar(50) | YES  |     | NULL    |       |
| course_id    | int(11)     | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

MariaDB [college_management]> CREATE TABLE subjects(subject_id int primary key,subject_name varchar(50),course_id int);
Query OK, 0 rows affected (0.029 sec)

MariaDB [college_management]> desc subjects;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| subject_id   | int(11)     | NO   | PRI | NULL    |       |
| subject_name | varchar(50) | YES  |     | NULL    |       |
| course_id    | int(11)     | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.014 sec)

MariaDB [college_management]> ALTER TABLE students ADD FOREIGN KEY(course_id) REFERENCES course(course_id);
Query OK, 0 rows affected (0.066 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [college_management]> ALTER TABLE teachers ADD FOREIGN KEY(course_id) REFERENCES course(course_id);
Query OK, 0 rows affected (0.069 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [college_management]> ALTER TABLE subjects ADD FOREIGN KEY(course_id) REFERENCES course(course_id);
Query OK, 0 rows affected (0.068 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [college_management]> show tables;
+------------------------------+
| Tables_in_college_management |
+------------------------------+
| course                       |
| students                     |
| subjects                     |
| teachers                     |
+------------------------------+
4 rows in set (0.001 sec)

MariaDB [college_management]> insert into course values(1,'BCA',30000),(2,'BBA',25000),(3,'MCA',40000);
Query OK, 3 rows affected (0.016 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [college_management]> insert into students values(101,'Rahul',20,'Delhi',1),
    -> (102,'Aman',21,'Jaipur',2),
    -> (103,'Rohit',22,'Agra',1),
    -> (104,'Sohan',23,'Delhi',3);
Query OK, 4 rows affected (0.015 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [college_management]> insert into teachers values(1,'Rajput',1),(2,'Sharma',2),(3,'Verma',3);
Query OK, 3 rows affected (0.015 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [college_management]> insert into subjects values(1,'C programming',1),(2,'Management',2),(3,'Java',3);
Query OK, 3 rows affected (0.016 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [college_management]> select students.name,course.course_name,course.fees from students join course on students.course_id = course.course_id;
+-------+-------------+-------+
| name  | course_name | fees  |
+-------+-------------+-------+
| Rahul | BCA         | 30000 |
| Aman  | BBA         | 25000 |
| Rohit | BCA         | 30000 |
| Sohan | MCA         | 40000 |
+-------+-------------+-------+
4 rows in set (0.014 sec)

MariaDB [college_management]> select name,course.course_name,teacher_name from students join course on students.course_id = course.course_id join teachers on teachers.course_id = course.course_id;
+-------+-------------+--------------+
| name  | course_name | teacher_name |
+-------+-------------+--------------+
| Rahul | BCA         | Rajput       |
| Aman  | BBA         | Sharma       |
| Rohit | BCA         | Rajput       |
| Sohan | MCA         | Verma        |
+-------+-------------+--------------+
4 rows in set (0.037 sec)

MariaDB [college_management]> select course_id, count(*) as total_students from students group by course_id;
+-----------+----------------+
| course_id | total_students |
+-----------+----------------+
|         1 |              2 |
|         2 |              1 |
|         3 |              1 |
+-----------+----------------+
3 rows in set (0.036 sec)

MariaDB [college_management]> create view student_course_view AS select s.name, c.course_name, c.fees from students s join course c on s.course_id = c.course_id;
Query OK, 0 rows affected (0.020 sec)

MariaDB [college_management]> select * from student_course_view;
+-------+-------------+-------+
| name  | course_name | fees  |
+-------+-------------+-------+
| Rahul | BCA         | 30000 |
| Aman  | BBA         | 25000 |
| Rohit | BCA         | 30000 |
| Sohan | MCA         | 40000 |
+-------+-------------+-------+
4 rows in set (0.014 sec)

MariaDB [college_management]> select*from students order by age desc;
+-------------+-------+------+--------+-----------+
| students_id | name  | age  | city   | course_id |
+-------------+-------+------+--------+-----------+
|         104 | Sohan |   23 | Delhi  |         3 |
|         103 | Rohit |   22 | Agra   |         1 |
|         102 | Aman  |   21 | Jaipur |         2 |
|         101 | Rahul |   20 | Delhi  |         1 |
+-------------+-------+------+--------+-----------+
4 rows in set (0.012 sec)

MariaDB [college_management]> select count(*) from students;
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.001 sec)

MariaDB [college_management]> select*from students where city='Delhi';
+-------------+-------+------+-------+-----------+
| students_id | name  | age  | city  | course_id |
+-------------+-------+------+-------+-----------+
|         101 | Rahul |   20 | Delhi |         1 |
|         104 | Sohan |   23 | Delhi |         3 |
+-------------+-------+------+-------+-----------+
2 rows in set (0.012 sec)

MariaDB [college_management]> select*from students;
+-------------+-------+------+--------+-----------+
| students_id | name  | age  | city   | course_id |
+-------------+-------+------+--------+-----------+
|         101 | Rahul |   20 | Delhi  |         1 |
|         102 | Aman  |   21 | Jaipur |         2 |
|         103 | Rohit |   22 | Agra   |         1 |
|         104 | Sohan |   23 | Delhi  |         3 |
+-------------+-------+------+--------+-----------+
4 rows in set (0.001 sec)

MariaDB [college_management]> update students
    -> set city='Mumbai'
    -> where students_id=101;
Query OK, 1 row affected (0.019 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [college_management]> select*from students;
+-------------+-------+------+--------+-----------+
| students_id | name  | age  | city   | course_id |
+-------------+-------+------+--------+-----------+
|         101 | Rahul |   20 | Mumbai |         1 |
|         102 | Aman  |   21 | Jaipur |         2 |
|         103 | Rohit |   22 | Agra   |         1 |
|         104 | Sohan |   23 | Delhi  |         3 |
+-------------+-------+------+--------+-----------+
4 rows in set (0.001 sec)

MariaDB [college_management]> delete from students
    -> where students_id=104;
Query OK, 1 row affected (0.017 sec)

MariaDB [college_management]> select*from students;
+-------------+-------+------+--------+-----------+
| students_id | name  | age  | city   | course_id |
+-------------+-------+------+--------+-----------+
|         101 | Rahul |   20 | Mumbai |         1 |
|         102 | Aman  |   21 | Jaipur |         2 |
|         103 | Rohit |   22 | Agra   |         1 |
+-------------+-------+------+--------+-----------+
3 rows in set (0.001 sec)