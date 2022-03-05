create database ras;
CREATE TABLE regions (
    region_id INT IDENTITY(1,1) PRIMARY KEY,
    region_name VARCHAR (25) DEFAULT NULL
);
 
CREATE TABLE countries (
    country_id CHAR (2) PRIMARY KEY,
    country_name VARCHAR (40) DEFAULT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE locations (
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    street_address VARCHAR (40) DEFAULT NULL,
    postal_code VARCHAR (12) DEFAULT NULL,
    city VARCHAR (30) NOT NULL,
    state_province VARCHAR (25) DEFAULT NULL,
    country_id CHAR (2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE jobs (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    job_title VARCHAR (35) NOT NULL,
    min_salary DECIMAL (8, 2) DEFAULT NULL,
    max_salary DECIMAL (8, 2) DEFAULT NULL
);
 
CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR (30) NOT NULL,
    location_id INT DEFAULT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR (20) DEFAULT NULL,
    last_name VARCHAR (25) NOT NULL,
    email VARCHAR (100) NOT NULL,
    phone_number VARCHAR (20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL (8, 2) NOT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    commission INT DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
 
CREATE TABLE dependents (
    dependent_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    relationship VARCHAR (25) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
/*Data for the table regions */
SET IDENTITY_INSERT regions ON;
  
INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');
 
SET IDENTITY_INSERT regions OFF;  
 
/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);
 
/*Data for the table locations */
SET IDENTITY_INSERT locations ON;
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
SET IDENTITY_INSERT locations OFF;
 
/*Data for the table jobs */
SET IDENTITY_INSERT jobs ON;
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);
SET IDENTITY_INSERT jobs OFF;
 
/*Data for the table departments */
SET IDENTITY_INSERT departments ON;
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);
SET IDENTITY_INSERT departments OFF;
 
 
/*Data for the table employees */
SET IDENTITY_INSERT employees ON;
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9,600);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9,900);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9,88);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6,898);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6,34);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6,32);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6,344);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6,232);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10,500);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10,232);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10,212);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10,343);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10,200);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10,200);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3,200);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3,200);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11,100);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id,commission) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11,100);
SET IDENTITY_INSERT employees OFF;
 
/*Data for the table dependents */
SET IDENTITY_INSERT dependents ON;
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (30,'Sandra','Taylor','Child',176);
SET IDENTITY_INSERT dependents OFF;


select * from employees;
select * from regions;
select * from dependents;
select * from departments;
select * from jobs;
 select employee_id+','+first_name+''+last_name+','+email+','+phone_number+','+hire_date+','+job_id+','+salary+','+manager_id+','+department_id from employees;
 select * from employees;
 select first_name ,salary from employees where salary >=24000;
 select hire_date,first_name+' '+last_name as E_Name from employees;
 select first_name+''+last_name+','+CAST(job_id as varchar)as E_name,first_name Title from employees;
 select * from employees;
 select CAST(employee_id as varchar)+','+first_name+','+last_name+','+email+','+phone_number+','+CAST(hire_date as varchar)+','+CAST( job_id as varchar)+','+CAST(salary as varchar)+','+CAST(manager_id as varchar)+','+CAST(department_id as varchar)as The_Output from employees;
 
 
 
 
 select * from employees;
 select first_name+' '+last_name as Name ,hire_date as dateofemployee from employees;
 select first_name+' '+last_name as Name ,hire_date as dateofemployee from employees order by hire_date asc;
 select first_name+' '+last_name as Name ,salary as salary from employees order by salary desc;
 select * from employees;
 
select * from departments;
select first_name+'-'+last_name as FirstName,hire_date as hireMonth from employees;
select MONTH as hireMonth from employees;
select * from employees

select employees.job_id, jobs.job_title, employees.first_name+ ' ' +employees.last_name as name from jobs inner join employees on employees.job_id = jobs.job_id;

with result as (select last_name , row_number() over (order by job_id)as rownum from employees)select LOWER(left(last_name,1))+SUBSTRING(last_name,2 ,LEN(last_name))from result where rownum between 2 and 5;


select NameOfMonth=DATENAME(M,hire_date) from employees

select first_name from employees where first_name Like '_e%'

select month(hire_date) from employees;
select first_name,LPAD(TRIM(TO_CHAR(salary)),15,'$')as "Salary" from employees; 
select *from employees;
select (first_name+' '+last_name) as Name, REVERSE(first_name+' '+last_name)as Employee_name from employees order by Name ;




CREATE TABLE employee_Detail (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR (20) DEFAULT NULL,
    last_name VARCHAR (25) NOT NULL,
    salary DECIMAL (8, 2) NOT NULL,
    joing_date DATE NOT NULL,
    department VARCHAR (20) DEFAULT NULL,
    gender VARCHAR (100) NOT NULL,
    );
    
    
    
    CREATE TABLE project_Detail (
    projectDetail_id INT IDENTITY(1,1) PRIMARY KEY,
    employeeDetail_id INT  NOT NULL,
    project_name VARCHAR (25) NOT NULL,
    );
    
    
    /*Data for the table employees */
SET IDENTITY_INSERT employee_detail ON;
INSERT INTO employee_detail(C,first_name,last_name,salary,joing_date,department,gender) VALUES (1,'Vikas','Ahlawat',600000.00,'2013-2-15 11:16:28.290 ','IT','Male');
INSERT INTO employee_detail(employee_id,first_name,last_name,salary,joing_date,department,gender) VALUES (2,'Nikita','Jain',530000.00,'2014-1-09 17:31:07.793 ','HR','Female');
INSERT INTO employee_detail(employee_id,first_name,last_name,salary,joing_date,department,gender) VALUES (3,'Ashish','kumar',100000.00,'2014-1-09 10:05:07.793 ','IT','Male');
INSERT INTO employee_detail(employee_id,first_name,last_name,salary,joing_date,department,gender) VALUES (4,'Nikhil ','Sharma',480000.00,'2014-1-09 9:00:07.793 ','HR','Male');
INSERT INTO employee_detail(employee_id,first_name,last_name,salary,joing_date,department,gender) VALUES (5,'Anish','Kardian',500000.00,'2014-1-09 09:31:07.793 ','Payroll','Male');

SET IDENTITY_INSERT employee_detail OFF;
   select* from employee_Detail; 
   
SET IDENTITY_INSERT project_Detail ON;
  
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (1,1,'Task Track');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (2,1,'CLP');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (3,1,'Survey Management');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,+project_name) VALUES (4,2,'HR Management');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (5,3,'Task Track');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (6,3,'GRS');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (7,3,'DDS');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (8,4,'HR Management');
INSERT INTO project_Detail(projectDetail_id,employeeDetail_id,project_name) VALUES (9,6,'GL Management');

 
SET IDENTITY_INSERT project_Detail OFF;  
select* from project_Detail;
select * from employee_Detail;


/*Join a*/
select project_Detail.project_name,employee_Detail.first_name +' '+employee_Detail.last_name as Name from project_Detail inner join employee_Detail on employee_detail.employee_Id=project_Detail.employeeDetail_Id;
select project_Detail.project_name,employee_Detail.first_name +' '+employee_Detail.last_name as Name from project_Detail inner join employee_Detail on employee_detail.employee_Id=project_Detail.employeeDetail_Id order by Name where project;
select * from employee_Detail where first_name like '[^a-p]%';
select * from employee_Detail where gender like '__le';
select * from employee_Detail where first_name like 'A____';
select * from employee_Detail where first_name like '%[%]%'
select DISTINCT(department) from employee_Detail;
select MAX(salary)as MaxSalary from employee_Detail;
select CONVERT(varchar(20),joing_date,106)from employee_Detail;
select CONVERT(varchar(20),joing_date,111)from employee_Detail;
select CONVERT(varchar(20),joing_date,108)from employee_Detail;
select YEAR( joing_date) from employee_Detail;
select first_name as Name,joing_date as joining_date ,CURRENT_TIMESTAMP   from employee_Detail;
select joing_date,CURRENT_TIMESTAMP,DATEDIFF(MONTH, Joing_date, GETDATE()) as date from employee_Detail;
select *from employee_Detail where  YEAR( joing_date)=2013;
select * from employee_Detail where MONTH(joing_date)=1;
select * from employee_Detail where joing_date between '2013-01-01' and '2013-12-01';
select first_name,case when gender ='Male' then'M' when gender='Female' then 'F' else 'other'  end from employee_Detail ;
select employee_Detail.first_name, project_Detail.project_name 
from employee_Detail inner join  project_Detail 
on employee_Detail.employee_id=project_Detail.employeeDetail_id ;

/*join b*/
select * from project_Detail;
select *from employee_Detail;

select employee_Detail.first_name,project_Detail.project_name from employee_Detail inner join project_Detail on employee_Detail.employee_id=project_Detail.employeeDetail_id;
select employee_Detail.first_name,project_Detail.project_name from employee_Detail inner join project_Detail on employee_Detail.employee_id =project_Detail.employeeDetail_id  ;


select project_Detail.project_name,employee_Detail.first_name 
from employee_Detail inner join project_Detail on
 employee_detail.employee_id=project_detail.employeeDetail_id  
where employee_Detail.first_name in (select employee_id from workon GROUP BY employee_id HAVING COUNT(employee_id)> 1)

select * from employees;


/*String a*/

with result as(select last_name ,ROW_NUMBER() Over(order by (select Null)) as 'Row' from employees)
select last_name from result where Row between 2 and 5;

select first_name+' '+last_name as Name, Month(hire_date) as joining_date from employees;

select last_name ,salary from employees;


/*Basic query*/
select * from employees;
select * from jobs;
select hire_date, first_name from employees;
select first_name+' '+CAST(job_id as varchar(20)) as EmployeeAndTitle from employees;
select CAST(employee_id as varchar(20))+','+first_name+','+last_name+','+email+','+phone_number as THE_OUTPUT from employees;
select employees.hire_date,employees.first_name,employees.department_id from employees inner join jobs on employees.job_id=jobs.job_id  where  jobs.job_title LIKE '%clerk%' ;
select first_name,salary from employees where salary>2000;
select first_name ,hire_date from employees order by hire_date Asc;
select first_name+' '+last_name as Name,hire_date as Start_date from employees;
select first_name+' '+last_name as Name,salary as salary from employees ;
select employees.last_name, jobs.job_title from employees inner join jobs on employees.job_id=jobs.job_id where not  jobs.job_title like '%manager%' ;
select employees.last_name,jobs.job_title,employees.salary from employees inner join jobs on employees.job_id=jobs.job_id where (jobs.job_id=16) AND employees.salary>1000 ;


/*Aggregators A*/
select * from employees;
select* from departments;
select * from jobs;
alter table employees add commission int;
select departments.department_id,employees.salary,employees.commission from departments inner join employees on employees.department_id=departments.department_id order by department_id;
select   COUNT(employees.first_name) as Number_OfEmployee,departments.department_name from employees left join departments on employees.department_id=departments.department_id group by departments.department_name;
select departments.department_name,employees.salary from employees inner join departments on departments.department_id=employees.department_id;
select first_name,commission from employees order by 2;
select employees.first_name,departments.department_id,employees.commission from employees inner join departments on employees.department_id=departments.department_id where employees.commission=null ;


select employee_Detail.first_name, project_Detail.project_name from employee_Detail inner join project_Detail on employee_Detail.employee_id=project_Detail.employeeDetail_id order by employee_Detail.first_name
 
with result as( select employee_Detail.first_name, project_Detail.project_name from employee_Detail inner join project_Detail on employee_Detail.employee_id=project_Detail.employeeDetail_id and case when

select YEAR()
select * from result


 
