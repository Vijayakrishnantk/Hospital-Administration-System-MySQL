CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female'),
    phone VARCHAR(20)
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status ENUM('Completed', 'Pending', 'Cancelled') NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    amount INT,
    bill_date DATE,
    payment_status ENUM('Paid', 'Unpaid') NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Departments ( department_name) VALUES
('Cardiology'), ('Neurology'), 
('Orthopedics'), ('General Medicine');

INSERT INTO Doctors (doctor_name, specialization, department_id, phone) VALUES
('Dr. Anil Kumar', 'Cardiologist', 1, '9876543210'),
('Dr. Meera Nair', 'Neurologist', 2, '9876543222'),
('Dr. John Thomas', 'Orthopedic', 3, '9876543233');

INSERT INTO Patients (patient_name, age, gender, phone) VALUES
('Rahul Menon', 35, 'Male', '9123456780'),
('Anjali Devi', 28, 'Female', '9123456791'),
('Suresh Kumar', 52, 'Male', '9123456792');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES 
(1, 1, '2025-01-05', '10:30:00', 'Completed'),
(2, 2, '2025-01-06', '11:00:00', 'Pending'),
(3, 1, '2025-01-06', '12:00:00', 'Cancelled');

INSERT INTO Billing (patient_id, amount, bill_date, payment_status) VALUES 
(1, 2500, '2025-01-05', 'Paid'),
(2, 4000, '2025-01-06', 'Unpaid'),
(3, 1500, '2025-01-06', 'Paid');

SELECT * FROM Departments;
SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Billing;

-- BUSINESS REQUIREMENT QUERIES--
-- Display all patients along with their doctor's name and specialization
SELECT Patients.patient_name, Doctors.doctor_name, Doctors.specialization FROM Patients
JOIN Appointments ON Patients.patient_id = Appointments.patient_id
JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id;

-- Show all appointments scheduled for today
SELECT * FROM Appointments WHERE appointment_date = CURDATE();

-- List doctors working in a specific department
SELECT  Departments.Department_name, Doctors.Doctor_Name FROM Departments 
LEFT JOIN Doctors ON Doctors.Department_id = Departments.Department_id;

-- Find the total revenue collected from paid bills
SELECT SUM(amount) as total_revenue FROM Billing WHERE payment_status = 'Paid';

-- Display patients who have unpaid bills
SELECT Patients.Patient_id, Patients.Patient_name, Billing.Payment_status FROM Patients
INNER JOIN Billing ON Patients.Patient_id = Billing.Patient_id WHERE Payment_status = 'Unpaid';

-- Count total appointments handled by each doctor
SELECT Doctors.Doctor_name, COUNT(Appointments.Patient_id) FROM Doctors
INNER JOIN Appointments ON Doctors.Doctor_id = Appointments.Doctor_id GROUP BY Doctors.Doctor_name;

-- Show department-wise doctor count
SELECT Departments.Department_name, COUNT(Doctors.Doctor_id) FROM Departments 
LEFT JOIN Doctors ON Departments.Department_id = Doctors.Department_id GROUP BY Department_name;

-- Update appointment status from Pending to Completed
UPDATE Appointments SET status = 'Completed' WHERE status = 'Pending';
SELECT * FROM Appointments;

-- Delete appointments that are cancelled
DELETE FROM Appointments WHERE status = 'Cancelled';
SELECT * FROM Appointments;

-- Update billing status once payment is done
UPDATE Billing SET payment_status = 'Paid' WHERE payment_status = 'Unpaid';
SELECT * FROM Billing;

-- Advanced SQL 
-- Use a subquery to find patients whose bill amount is above average
SELECT Patients.Patient_id,  Patients.Patient_Name, Billing.Amount FROM Patients 
JOIN Billing ON Patients.Patient_id = Billing.Patient_id WHERE Billing.Amount >(SELECT AVG(Amount) FROM Billing);

-- Use GROUP BY & HAVING to find doctors who handled more than one appointment
SELECT Doctors.Doctor_id, Doctors.Doctor_Name, COUNT(Appointments.Appointment_id) AS No_of_Appointments FROM Doctors
INNER JOIN Appointments ON Doctors.Doctor_id = Appointments.Doctor_id 
GROUP BY Doctors.Doctor_Name, Doctors.Doctor_id HAVING COUNT(Appointments.Doctor_id)>1;

-- Display the highest bill amount paid
SELECT Patients.Patient_Name, Billing.Amount AS Maximum_Bill_Amount FROM Billing
JOIN Patients ON Billing.Patient_id = Patients.Patient_id 
WHERE Billing.Amount = (SELECT MAX(Amount)FROM Billing WHERE Payment_status = 'Paid');
