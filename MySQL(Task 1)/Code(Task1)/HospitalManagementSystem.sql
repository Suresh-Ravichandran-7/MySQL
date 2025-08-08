-- =======================
-- 1. Departments Table
-- =======================
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
-- Alter 
ALTER table Departments 
ADD Location Varchar(100);
Select * from Departments;

-- =======================
-- 2. Doctors Table
-- =======================
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
Select * from Doctors;

-- =======================
-- 3. Patients Table
-- =======================
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(15),
    address TEXT
);
Select * from Patients;

-- ==========================================
-- 4. Appointments Table
-- ==========================================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

TRUNCATE TABLE Appointments;

Select * from Appointments;

-- =======================
-- 5. Rooms Table
-- =======================
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('General', 'Private', 'ICU'),
    availability BOOLEAN DEFAULT TRUE
);
Select * from Rooms;



