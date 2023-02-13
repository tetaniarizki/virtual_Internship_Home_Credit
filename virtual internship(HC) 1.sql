create database home_credit;
use home_credit;

create table studentcourse (
	ROLL_NO INT,
    NAMA VARCHAR(255),
    ADDRESS VARCHAR(255),
    AGE INT,
    PRIMARY KEY(ROLL_NO)
) ENGINE=INNODB;
desc studentcourse;
INSERT INTO studentcourse(ROLL_NO,NAMA,ADDRESS,AGE)
VALUES(1, 'HARSH', 'DELHI',19),
		(2,'PRATIK','BIHAR',18),
        (3,'RIYANKA','SILIGURI',17),
        (4,'DEEP','RAMNAGAR',18),
        (5,'SAPTARHI','KOLKATA',19),
        (6,'DHANRAJ','BARABAJAR',20),
        (7,'ROHIT','BALURGHAT',17),
        (8,'NIRAJ','ALIPUR',18);
SELECT*FROM studentcourse;

CREATE TABLE student(
	COURSE_ID INT,
    ROLL_NO INT,
    PRIMARY KEY(ROLL_NO)
) ENGINE=INNODB;

INSERT INTO student(COURSE_ID, ROLL_NO)
VALUES	(1,1),
		(2,2),
        (2,3),
        (3,4),
        (1,5),
        (4,9),
        (5,10),
        (4,11);
    
#try INNER JOIN
SELECT student.COURSE_ID, studentcourse.NAMA, studentcourse.AGE
FROM studentcourse
INNER JOIN student
ON studentcourse.ROLL_NO = student.ROLL_NO;

# try left join
SELECT studentcourse.NAMA, student.COURSE_ID
FROM studentcourse
LEFT JOIN student
ON studentcourse.ROLL_NO = student.ROLL_NO; 

# try right join
SELECT studentcourse.NAMA, student.COURSE_ID
FROM studentcourse
RIGHT JOIN student
ON studentcourse.ROLL_NO = student.ROLL_NO; 

# try full join
SELECT studentcourse.NAMA, student.COURSE_ID
FROM student
FULL JOIN studentcourse
ON student.ROLL_NO = studentcourse.ROLL_NO; 


# =================================================
CREATE TABLE EMPLOYEE(
	EMPLOYEEID INT,
    NAME VARCHAR(25),
    GENDER VARCHAR(20),
    SALARY INT,
    DEPARTMENT VARCHAR(20),
    EXPERIENCE VARCHAR(20)
) ENGINE=INNODB;

INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, GENDER, SALARY, DEPARTMENT, EXPERIENCE)
VALUES	(1,'RACHIT','M', 50000,'ENGINEERING','6 YEARS'),
		(2, 'SHOBIT','M',37000,'HR','3YEARS'),
        (3,'ISHA','F',50000,'SALES','7 YEARS'),
        (4,'DEVI','F',43000, 'MANAGEMENT','4 YEARS'),
        (5,'SKHIL','M',90000,'ENGINEERING', '15 YEARS');
        
SELECT * FROM EMPLOYEE;

SELECT DEPARTMENT, SUM(SALARY) AS SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;    

# ``` Now if we need to display the departments where the sum of salaries is 50,000 or
# more. In this condition, we will use HAVING Clause. ```

SELECT DEPARTMENT, SUM(SALARY) AS SALARY 
FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING SUM(SALARY) >=50000;

# ``` we have an error input form in experience data for second employeeID, experience= '3 YEARS'. '''
ALTER TABLE EMPLOYEE
ADD PRIMARY KEY(EMPLOYEEID);

UPDATE EMPLOYEE 
SET EXPERIENCE = '3 YEARS'
WHERE EMPLOYEEID=2;

SELECT*FROM EMPLOYEE;

#==============================
CREATE TABLE STUDENTT (
	STUDENT_NAME VARCHAR(20),
    PERCENTAGE INT
) ENGINE=INNODB;


INSERT INTO STUDENTT (STUDENT_NAME,PERCENTAGE)
VALUES	('ISHA PATEL',98),
		('HARSH DASH',94),
        ('RACHIT SHA',93),
        ('SUMEDHA',98),
        ('RAHAT ALI',98);
        
SELECT * FROM STUDENTT;

# ```Names of students who have a percentage value of more than 95. ```
SELECT * FROM STUDENTT
GROUP BY STUDENT_NAME, PERCENTAGE
HAVING PERCENTAGE > 95;

# ```Further, we can also filter rows on multiple values using the HAVING clause. The HAVING clause 
# also permits filtering rows using more than one aggregate condition.```
# ```This query returns the students who have more percentage than 95 and the sum of
# percentage is less than 1000.```
INSERT INTO STUDENTT(STUDENT_NAME, PERCENTAGE) VALUES('RARA',94),
													('FANIA',96),
                                                    ('RICHARD',95);
SELECT*fROM STUDENTT;

SELECT STUDENT_NAME FROM STUDENTT
WHERE PERCENTAGE > 90
GROUP BY STUDENT_NAME, PERCENTAGE
HAVING SUM(PERCENTAGE) < 1000 AND AVG(PERCENTAGE) > 95;

# ```insert duplicate data.```
INSERT INTO STUDENTT(STUDENT_NAME,PERCENTAGE) VALUES('RARA',90);
SELECT*FROM STUDENTT;
# ```if we want to take student_name data with unduplicate.```
SELECT DISTINCT STUDENT_NAME FROM STUDENTT;

#=========================================
# ```we use table studentcourse again.```

SELECT*FROM studentcourse;
#```To fetch records of students where ROLL_NO is between 1 and 3 (inclusive)```
SELECT*FROM studentcourse WHERE ROLL_NO BETWEEN 1 AND 3;
#```To fetch records of students where NAME starts with letter R.```
SELECT*FROM studentcourse WHERE NAMA LIKE 'R%';
#```To fetch NAME and ADDRESS of students where Age is 18 or 20.```
SELECT NAMA, ADDRESS FROM studentcourse WHERE AGE IN(18,20); 
#```To fetch all the records from the Student table where NAME is DEEP or NAME is NIRAJ.```
SELECT*FROM studentcourse WHERE NAMA='DEEP' OR NAMA='NIRAJ'; 
#```If suppose we want to fetch all the records from the Student table where Age is 18
#and ADDRESS is Delhi. then the query will be:```
INSERT INTO studentcourse(ROLL_NO, NAMA,ADDRESS,AGE)
VALUES	(9, 'KHAN','DELHI',19);
SELECT * FROM studentcourse WHERE AGE=19 AND ADDRESS='DELHI';

SELECT*FROM studentcourse ORDER BY ROLL_NO DESC;

show tables;