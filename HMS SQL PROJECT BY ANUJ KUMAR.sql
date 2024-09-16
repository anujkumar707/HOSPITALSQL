use hospital;

CREATE TABLE Doctor (
    DoctorID varchar(10),
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    ContactEmail VARCHAR(100));
    
    -- Create the Patient table
    CREATE TABLE Patient (
    PatientID varchar(10),
    FName VARCHAR(100) NOT NULL,
    LName VARCHAR(100) NOT NULL,
    Age varchar(10),
    Contact VARCHAR(15));
    
    -- Create the Appointment table
    CREATE TABLE Appointment (
    AppointmentID varchar(10),
    PatientID varchar(10),
    DoctorID varchar(10),
    Date DATETIME,
    EndTime datetime,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled'
);

-- Create the PatientsAttendAppointments table
CREATE TABLE PatientsAttendAppointments (
    AppointmentID varchar(10),
    PatientID varchar(10)
);

-- Create the MedicalHistory table
CREATE TABLE MedicalHistory (
    HistoryID varchar(10),
    PatientID varchar(10),
    Surgeries VARCHAR(255),
    Conditions VARCHAR(255),
    Date DATETIME,
    Medication VARCHAR(100)
);

-- Create the PatientFillHistory table
CREATE TABLE PatientsFillHistory (
    HistoryID varchar(10),
    PatientID varchar(10),
    Description TEXT,
    DateFilled DATETIME
);

-- Create the MedicineCost table
CREATE TABLE Medicine_Cost (
    Medication VARCHAR(100) NOT NULL,
    Cost_in$ DECIMAL(10, 2) NOT NULL);

-- Insert initial data into the Patients table
INSERT INTO Patient (PatientID, Fname, Lname, Contact, Age)
VALUES
('P0001', 'John', 'Doe', '123-456-7890', 35),
('P0002', 'Jane', 'Smith', '987-654-3210', 25),
('P0003', 'Michael', 'Johnson', '555-555-5555', 62),
('P0004', 'David', 'Lee', '111-222-3333', 33),
('P0005', 'Sarah', 'Brown', '444-555-6666', 21),
('P0006', 'John', 'Doe', '777-888-9999', 28),
('P0007', 'Jane', 'Smith', '333-222-1111', 30),
('P0008', 'Michael', 'Johnson', '666-777-8888', 41),
('P0009', 'David', 'Lee', '999-888-7777', 41),
('P0010', 'Sarah', 'Brown', '222-333-4444', 60);

-- Insert initial data into the Doctor table
INSERT INTO Doctor (DoctorID, Fname, Lname, Specialty, ContactEmail) 
VALUES
('D0001', 'Dr. John', 'Doe', 'General Physician', 'john.doe@example.com'),
('D0002', 'Dr. Jane', 'Smith', 'Pediatrician', 'jane.smith@example.com'),
('D0003', 'Dr. Michael', 'Johnson', 'Cardiologist', 'michael.j@example.com');

-- Insert initial data into Appoinment table
INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, Date, EndTime, Status) 
VALUES
('A0001', 'P0001', 'D0001', '2023-11-07 10:00:00', '2023-11-07 11:15:00', 'Scheduled'),
('A0002', 'P0002', 'D0002', '2023-11-08 11:00:00', '2023-11-08 12:06:00', 'Completed'),
('A0003', 'P0003', 'D0003', '2023-11-09 12:00:00', '2023-11-09 13:21:00', 'Cancelled'),
('A0004', 'P0002', 'D0001', '2023-11-10 13:00:00', '2023-11-10 14:17:00', 'Scheduled'),
('A0005', 'P0005', 'D0002', '2023-11-11 14:00:00', '2023-11-11 15:45:00', 'Completed'),
('A0006', 'P0006', 'D0003', '2023-11-12 15:00:00', '2023-11-12 16:15:00', 'Cancelled'),
('A0007', 'P0007', 'D0001', '2023-11-13 16:00:00', '2023-11-13 17:09:00', 'Scheduled'),
('A0008', 'P0008', 'D0002', '2023-11-14 17:00:00', '2023-11-14 18:29:00', 'Completed'),
('A0009', 'P0004', 'D0003', '2023-11-15 18:00:00', '2023-11-15 19:11:00', 'Cancelled'),
('A0010', 'P0010', 'D0001', '2023-11-16 19:00:00', '2023-11-16 20:05:00', 'Scheduled');

-- Insert initial data into PatientsAttendAppointments table
INSERT INTO PatientsAttendAppointments (PatientID, AppointmentID) 
VALUES
('P0001', 'A0001'),
('P0002', 'A0002'),
('P0003', 'A0003'),
('P0004', 'A0004'),
('P0005', 'A0005'),
('P0006', 'A0006'),
('P0007', 'A0007'),
('P0008', 'A0008'),
('P0009', 'A0009'),
('P0010', 'A0010'),
('P0001', 'A0004'),
('P0002', 'A0005'),
('P0003', 'A0006');

-- Insert initial data into PatientsAttendAppointments table
INSERT INTO MedicalHistory (HistoryID, PatientID, Date, Conditions, Surgeries, Medication)
VALUES
('H0001', 'P0001', '2023-11-01 08:00:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0002', 'P0002', '2023-11-02 09:00:00', 'Diabetes', 'None', 'Metformin'),
('H0003', 'P0003', '2023-11-03 10:00:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0004', 'P0004', '2023-11-04 11:00:00', 'Migraine', 'Appendectomy', 'Ibuprofen'),
('H0005', 'P0005', '2023-11-05 12:00:00', 'Diabetes', 'None', 'Insulin'),
('H0006', 'P0006', '2023-11-06 13:00:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0007', 'P0007', '2023-11-07 14:00:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0008', 'P0008', '2023-11-08 15:00:00', 'Diabetes', 'None', 'Metformin'),
('H0009', 'P0009', '2023-11-09 16:00:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0010', 'P0010', '2023-11-10 17:00:00', 'Migraine', 'Appendectomy', 'Ibuprofen');

-- Insert initial data into PatientsFillHistory table
INSERT INTO PatientsFillHistory (PatientID, HistoryID, DateFilled)
VALUES
('P0001', 'H0001', '2023-11-04 08:30:00'),
('P0002', 'H0002', '2023-11-05 09:45:00'),
('P0003', 'H0003', '2023-11-06 10:30:00'),
('P0004', 'H0004', '2023-11-07 11:15:00'),
('P0005', 'H0005', '2023-11-08 12:45:00'),
('P0006', 'H0006', '2023-11-09 13:30:00'),
('P0007', 'H0007', '2023-11-10 14:15:00'),
('P0008', 'H0008', '2023-11-11 15:45:00'),
('P0009', 'H0009', '2023-11-12 16:30:00'),
('P0010', 'H0010', '2023-11-13 17:15:00');

-- Insert initial data into MedicineCost table
INSERT INTO Medicine_Cost (Medication, Cost_in$)
VALUES
('Lisinopril', 10),
('Metformin', 15),
('Albuterol', 12),
('Ibuprofen', 8),
('Insulin', 20);

-- Query1
-- Find the names of patients who have attended appointments scheduled by Dr. John Doe.
SELECT p.Fname, p.Lname
FROM Patient p
INNER JOIN Appointment a ON p.PatientID = a.PatientID
WHERE a.DoctorID = 'D0001'
LIMIT 0, 1000;
-- This query inner joins the Patients and Appointment tables to retrieve the first and last names of patients who have attended appointments scheduled by Dr. John Doe.

-- Query2
-- Calculate the average age of all patients.
Select AVG(Age) AS 'Average Age'
from Patient;
-- This query calculates the average age of all patients by using the AVG function on the Age column in the Patients tablel

-- Query3
-- Create a stored procedure to get the total number of appointments for a givenpatient.
DELIMITER //

CREATE PROCEDURE GetTotalAppointments(IN PatientID VARCHAR(10))
BEGIN
    -- Selecting the count of appointments for the specified patient
    SELECT COUNT(*) AS TotalAppointments
    FROM PatientsAttendAppointments
    WHERE PatientID = PatientID;
END //

DELIMITER ;
CALL GetTotalAppointments('P0004');
-- This stored procedure accepts a PatientID parameter and returns the total number of appointments for that patient by counting the number of rows in the PatientsAttendAppointments table where the PatientID matches the provided parameter.

-- Query4
-- Create a trigger to update the appointment status to 'Completed' when the appointment date has passed
DELIMITER //

CREATE TRIGGER UpdateAppointmentStatus
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
    UPDATE Appointment
    SET Status = 'Completed'
    WHERE EndTime < NOW() AND Status = 'Scheduled';
END //

DELIMITER ;
-- This trigger is executed after an update operation on the Appointment table. It updates the Status column to 'Completed' for all appointments where the EndTime is in the past and the current Status is 'Scheduled'

-- Query5
-- Find the names of patients along with their appointment details and the corresponding doctor's name.
SELECT 
    p.Fname AS PatientFirstName, 
    p.Lname AS PatientLastName, 
    a.AppointmentID, 
    a.Date, 
    a.EndTime, 
    d.Fname AS DoctorFirstName, 
    d.Lname AS DoctorLastName
FROM 
    Patient p
JOIN 
     PatientsAttendAppointments pa ON p.PatientID = pa.PatientID
JOIN 
    Appointment a ON pa.AppointmentID = a.AppointmentID
JOIN 
     Doctor d ON a.DoctorID = d.DoctorID;
     
-- Query6
-- Find the patients who have a medical history of diabetes and their next appointment is scheduled within the next 7 days.
SELECT 
    p.Fname, 
    p.Lname, 
    a.Date, 
    a.EndTime 
FROM 
    Patient p 
JOIN 
    PatientsAttendAppointments pa ON p.PatientID = pa.PatientID 
JOIN 
    Appointment a ON pa.AppointmentID = a.AppointmentID 
JOIN 
    PatientsFillHistory pf ON p.PatientID = pf.PatientID 
JOIN 
    MedicalHistory mh ON pf.HistoryID = mh.HistoryID 
WHERE 
    LOWER(mh.Conditions) = 'diabetes';
    -- This query joins multiple tables (Patients, PatientsAttendAppointments, Appointment, PatientFillHistory, and MedicalHistory) to find patients who have a medical history of diabetes and have an upcoming appointment within the next 7 days.
    -- It filters the results based on the condition 'Diabetes' in the MedicalHistory table and checks if the appointment date falls within the next 7 days from the current date.The results are ordered by the appointment date.
    
-- Query7
-- Find patients who have multiple appointments scheduled.
SELECT 
    p.Fname, 
    p.Lname
FROM 
    Patient  p
JOIN 
     PatientsAttendAppointments pa ON p.PatientID = pa.PatientID
GROUP BY 
    p.PatientID, p.Fname, p.Lname 
HAVING 
    COUNT(pa.AppointmentID) > 1;
    
-- Query8
-- Calculate the average duration of appointments for each doctor.
SELECT 
    d.Fname, 
    d.Lname, 
    AVG(TIMESTAMPDIFF(MINUTE, a.Date, a.EndTime)) AS 'Average Duration (Minutes)'  -- Calculating the average duration in minutes
FROM 
    Doctor d
JOIN 
    Appointment a ON d.DoctorID = a.DoctorID
GROUP BY 
    d.Fname, d.Lname;
    
-- Query9
-- Find Patients with Most Appointments
SELECT 
    p.Fname, 
    p.Lname, 
    COUNT(pa.AppointmentID) AS 'Total Appointments'
FROM 
    Patient p
JOIN 
    PatientsAttendAppointments pa ON p.PatientID = pa.PatientID
GROUP BY 
    p.PatientID, p.Fname, p.Lname
ORDER BY 
    COUNT(pa.AppointmentID) DESC;
    
-- Query10
-- Calculate the total cost of medication for each patient.
SELECT 
    p.Fname, 
    p.Lname, 
    SUM(mc.Cost_in$) AS 'Total Medication Cost'
FROM 
    Patient p
JOIN 
     PatientsFillHistory pf ON p.PatientID = pf.PatientID
JOIN 
     MedicalHistory mh ON pf.HistoryID = mh.HistoryID
JOIN 
    Medicine_Cost mc ON mh.Medication = mc.Medication
GROUP BY 
    p.PatientID, p.Fname, p.Lname;
    
-- Query11
-- Create a stored procedure named CalculatePatientBill that calculates the total bill for a patient based on their medical history and medication costs.
-- The procedure should take the PatientID as a parameter and calculate the total cost by summing up the medication costs and applying a charge of $50 for each surgery in the patient's medical history.
-- If the patient has no medical history, the procedure should still return a basic charge of $50.
DELIMITER //

CREATE PROCEDURE CalculatePatientBill(IN PatientID VARCHAR(10))
BEGIN
    DECLARE TotalBill DECIMAL(10, 2);
    DECLARE BaseCharge DECIMAL(10, 2) DEFAULT 50.00;
    
    -- Initialize TotalBill with BaseCharge
    SET TotalBill = BaseCharge;
    
    -- Calculate medication costs and add to TotalBill
    SELECT SUM(mc.Cost_in$) INTO @MedicationCost
    FROM PatientsFillHistory pf
    JOIN MedicalHistory mh ON pf.HistoryID = mh.HistoryID
    JOIN Medicine_Cost mc ON mh.Medication = mc.Medication
    WHERE pf.PatientID = PatientID;
    
    SET TotalBill = TotalBill + COALESCE(@MedicationCost, 0);
    
    -- Add surgery charges
    SELECT COUNT(*) INTO @SurgeryCount
    FROM MedicalHistory mh
    JOIN PatientsFillHistory pf ON mh.HistoryID = pf.HistoryID
    WHERE pf.PatientID = PatientID AND mh.Surgeries IS NOT NULL;
    
    SET TotalBill = TotalBill + (@SurgeryCount * 50);
    
    -- Return the total bill
    SELECT TotalBill AS 'Total Bill';
END //

DELIMITER ;

SHOW CREATE PROCEDURE CalculatePatientBill;

-- This stored procedure calculates the total bill for a patient based on their medical history and medication costs.
-- It takes a PatientID parameter and performs the following steps:Initializes the @TotalBill variable with a base charge of $50.
-- Calculates the medication costs by joining the PatientFillHistory, MedicalHistory, and MedicineCost tables, and summing the Cost_in$ column from the MedicineCost table for the given PatientID

-- Adds surgery charges by counting the number of surgeries in the MedicalHistory table for -- the given PatientID and multiplying it by $50.Returns the final @TotalBill value

-- Conclusion (Summary):In this project, we have explored various SQL_Query queries and stored procedures to retrieve and manipulate data from a Hospital Management System (HMS) database.
-- These queries cover a wide range of functionalities, including filtering and joining data from multiple tables, aggregating data using functions like AVG, COUNT, and SUM, and creating stored procedures and triggers to automate specific tasks.
-- The provided solutions demonstrate how SQL_Query can be used effectively to manage and analyze data in a healthcare setting, such as retrieving patient information, appointment details, medical histories, and calculating medication costs and patient bills.
-- These queries and stored procedures can be further extended and customized to meet additional requirements or integrate with other systems within the HMS






