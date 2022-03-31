USE ProjectSchema;

DROP TABLE IF EXISTS Patient;

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Address VARCHAR(60),
    Phone_No VARCHAR(15),
    Birthday DATE,
    Gender VARCHAR(15),
    Marital_Status VARCHAR(12),
    Registration_Date DATE,
    Next_Of_Kin_Name VARCHAR(60),
    Next_Of_Kin_Relationship VARCHAR(25),
    Next_Of_Kin_Address VARCHAR(60),
    Next_Of_Kin_Phone_Number VARCHAR(15)
);

INSERT INTO Patient
VALUES (1234, 'NOAH', 'MICHAEL', '100 WHITEHOUS DR 55798 MN', '507-892-3456', '2000-12-25', 'MALE', 'MARRIED', '2022-01-23', 'NOAH MICHAEL', 'BROTHER', '200 WHITEHOUSE DR 56789 MN', '561-234-5678');

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff (
    Staff_Id INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Address VARCHAR(60),
    Phone_No VARCHAR(15),
    Birthday DATE,
    Gender VARCHAR(10),
    National_Insurance_Number INT
);

INSERT INTO Staff
VALUES(3456, 'Noah', 'Haile', '507 Bluejay Trail Mankato MN', '642-879-2234', '2000-11-25', 'Male', '4598');

DROP TABLE IF EXISTS StaffInquiry;
CREATE TABLE StaffInquiry (
    Inquiry_no INT PRIMARY KEY,
    FOREIGN KEY (Staff_Id)
        REFERENCES Staff (Staff_Id),
    Staff_Position VARCHAR(30),
    Salary VARCHAR(10),
    Salary_Scale VARCHAR(10),
    Qualification VARCHAR(300),
    Previous_Org VARCHAR(50),
    Previous_Pos VARCHAR(100),
    Start_Date DATE,
    End_Date DATE,
    Hours_worked INT,
    Payment_Schedule VARCHAR(30)
); 

INSERT INTO StaffInquiry
VAlUES(5678, 3456, '500000', '8','Works in clinics', 'Fairview', 'Lead Assistant', '2022-01-01', '2022-02-30', 35, 'Monthly');

DROP TABLE IF EXISTS Ward;
CREATE TABLE Ward (
    Ward_No INT PRIMARY KEY,
    Ward_Name VARCHAR(30),
    Ward_Location VARCHAR(100),
    No_Of_Beds INT,
    Phone_No VARCHAR(15)
);

INSERT INTO Ward
VALUES(3490, 'Ford Ward', 'Lousiana', 70, '507-234-1695');

DROP TABLE IF EXISTS Medication;
CREATE TABLE Medication (
    Med_No INT PRIMARY KEY,
    FOREIGN KEY (Patient_Id)
        REFERENCES Patient (Patient_Id),
    Units_Per_Day INT,
    Method VARCHAR(200),
    Start_Date DATE,
    End_Date DATE,
    Drug_Name VARCHAR(35),
    Drug_No INT
); 

INSERT INTO Medication
VALUES(8, 1234, 2, 'One dosage into the right arm vein', '2021-05-29','2022-05-29', 'Cocaine', 1);

DROP TABLE IF EXISTS Suppliers;
CREATE TABLE Suppliers (
    Sup_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Address VARCHAR(50),
    Phone_No VARCHAR(15),
    Fax_No VARCHAR(30)
);

INSERT INTO Suppliers
VALUES(2, 'Ashley', 'Johnson', '600 Timberwolf Dr 560001 MN', '651-239-0766', '555-123-4567');

DROP TABLE IF EXISTS Clinic;
CREATE TABLE Clinic (
    Doctor_Name VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Patient_Id)
        REFERENCES Patient (Patient_Id),
    Clinic_No INT,
    Clinic_Address VARCHAR(40),
    Clinic_Phone VARCHAR(15)
);

INSERT INTO Clinic
VALUES('Ryan Pinesol', 8, 10, '507 Warren St 56001 MN', '757-321-9087');

DROP TABLE IF EXISTS Appoitment;
CREATE TABLE Appoitment (
    App_Id INT PRIMARY KEY,
    FOREIGN KEY (Staff_Id)
        REFERENCES Staff (Staff_Id),
    FOREIGN KEY (Patient_Id)
        REFERENCES Patient (Patient_Id),
    FOREIGN KEY (Ward_No)
        REFERENCES Ward (Ward_No),
    App_Date DATE,
    App_Time TIME,
    Room_No INT,
    Result VARCHAR(100),
    Duration VARCHAR(100)
);

INSERT INTO Appoitment
VALUES(9, 3456, 4567, 8, '2022-01-25', '11:30:22', 64, 'They need to be in the clinic every 2 months' ,'2 Hours and 30 minutes');

DROP TABLE IF EXISTS Pharmaceutical;
CREATE TABLE Pharmaceutical (
    Drug_Id INT PRIMARY KEY,
    FOREIGN KEY (Supplier_Id)
        REFERENCES Supplier (Supplier_Id),
    Drug_Name VARCHAR(30),
    Drug_Desc VARCHAR(40),
    Dosage VARCHAR(70),
    Method VARCHAR(100),
    Quantity VARCHAR(20),
    Reorded_Lvl INT,
    Cost_Per_Unit INT
);

INSERT INTO Pharmaceutical
VALUES(10, 9, 'Advil', 'Relieves Pain', '2 a day', 'Drink with water and swallow', '5000000', 1, '15');

DROP TABLE IF EXISTS Item;
CREATE TABLE Item (
    Item_Id INT,
    Supplier_Id INT,
    Item_Name VARCHAR(50),
    Item_Description VARCHAR(100),
    Quantity INT,
    Reorder_Lvl INT,
    Cost_Per_Unit INT
);

INSERT INTO Item
VALUES(8, 3456, 'Trash bag', 'Need bag for trash can for easy dispoal', 5000, 7, 30);

DROP TABLE IF EXISTS WardRequsition;
CREATE TABLE WardRequsition (
    Requsition_No INT,
    FOREIGN KEY (Staff_Id)
        REFERENCES Staff (Staff_Id),
    FOREIGN KEY (Ward_No)
        REFERENCES Ward (Ward_No),
    FOREIGN KEY (Drug_Id)
        REFERENCES Pharmaceutical (Drug_Id),
    FOREIGN KEY (Item_Id)
        REFERENCES Item (Item_Id),
    Quantity VARCHAR(50),
    Order_Date DATE
); 

INSERT INTO WardRequsition
VALUES(9, 3456, 10, 22, 6, '10', '2022-10-23');


