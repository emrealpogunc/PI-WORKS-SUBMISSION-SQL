
CREATE DATABASE piworks;--Creating the database from here
USE piworks;--using the database

CREATE TABLE EmployeeTable(--creating the first table
    Employee_ID int ,
    FirstName Varchar(20),--First name of the employees
    LastName Varchar(30),--last name of the employees
    City Varchar(20),--city of the employee
    State Varchar(15),--resident state of the employee
    PRIMARY KEY (Employee_ID)--setting employee id as the primary key
);

CREATE TABLE PaymentsTable(--second table here
    Employee_ID int,
    SalaryDate DATE,--date type with YYYY-MM-DD Format
    MonthIDValue int, --int type
    FOREIGN KEY (Employee_ID) REFERENCES EmployeeTable(Employee_ID)--setting the foreign key
    --and referencing to the EmployeeTable's primary key
);

DESCRIBE EmployeeTable;--checking the stats
DESCRIBE PaymentsTable;
INSERT INTO EmployeeTable (Employee_ID,FirstName,LastName,City,State)--with this order we are going
--to enter the values
VALUES  (10330,'John','John','NY','NY'),
        (10449,'Sarah','Lebat','Melbourne','Bourke'),
        (11012,'Jon','Dallas','NY','NY'),
        (11013,'Gheorghe','Honey','NY','NY'),
        (11014,'Anton','Savar','NY','NY');

--same for PaymentTable
INSERT INTO PaymentsTable (Employee_ID,SalaryDate,MonthIDValue)
VALUES  (10330,'2022-06-06',128),
        (10330,'2022-07-07',158),
        (10330,'2022-08-08',133),
        (10330,'2022-09-09',120),
        (10330,'2022-10-10',188),
        (10330,'2022-11-11',160),
        (10330,'2022-12-12',105),
        (10449,'2022-09-09',150),
        (10449,'2022-10-10',158),
        (10449,'2022-11-11',160),
        (10449,'2022-12-12',180);

--checking if employeetable is working properly
SELECT * FROM EmployeeTable;
--Display all employees that have their names starting with the J letter.
SELECT * FROM EmployeeTable WHERE FirstName LIKE 'J%';

--checking if paymentstable is working properly
SELECT * FROM PaymentsTable;

--Write the SQL queries to display the total amount earned by each employee's name and surname.
SELECT employeetable.Employee_ID,employeetable.FirstName
,employeetable.LastName,sm.Total_Earnings as Total_Earnings 
FROM employeetable
JOIN (SELECT Employee_ID, SUM(MonthIDValue) AS Total_Earnings FROM PaymentsTable 
GROUP BY Employee_ID) sm
ON sm.Employee_ID=employeetable.Employee_ID;
--selecting what to display
--joining employeetable and paymentstable
--summing the values for the corresponding employees
--creating an alias bsed on this query
--we put on the corresponging columns
