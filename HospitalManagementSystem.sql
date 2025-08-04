-- =======================
-- 1. Departments Table
-- =======================
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (department_name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics');

-- Alter 
ALTER table Departments 
ADD Location Varchar(100);

-- Update department name
UPDATE Departments
SET department_name = 'Emergency Medicine'
WHERE department_id = 1;

-- Delete a department
DELETE FROM Departments
WHERE department_id = 4;


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

INSERT INTO Doctors (name, specialization, contact_number, email, department_id) VALUES
('Dr. A Sharma', 'Cardiologist', '9876543210', 'asharma@hospital.com', 1),
('Dr. B Mehta', 'Neurologist', '9123456789', 'bmehta@hospital.com', 2),
('Dr. C Gupta', 'Orthopedic', '9998877665', 'cgupta@hospital.com', 3);

-- Update doctor specialization
UPDATE Doctors
SET specialization = 'Cardiothoracic Surgeon'
WHERE doctor_id = 1;

-- Delete a doctor
DELETE FROM Doctors
WHERE doctor_id = 3;


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

INSERT INTO Patients (name, date_of_birth, gender, contact_number, address) VALUES
('Ravi Kumar', '1990-04-15', 'Male', '9990001111', 'Delhi, India'),
('Neha Singh', '1985-09-23', 'Female', '8881112222', 'Mumbai, India');

-- Update patient contact info
UPDATE Patients
SET contact_number = '9876543211', address = 'New Delhi'
WHERE patient_id = 1;

-- Delete a patient
DELETE FROM Patients
WHERE patient_id = 2;


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

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason) VALUES
(1, 1, '2025-08-05', '10:00:00', 'Chest pain'),
(2, 2, '2025-08-06', '14:30:00', 'Migraine checkup');


-- Update appointment time
UPDATE Appointments
SET appointment_time = '11:30:00'
WHERE appointment_id = 1;

-- Delete an appointment
DELETE FROM Appointments
WHERE appointment_id = 2;



-- =======================
-- 5. Rooms Table
-- =======================
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('General', 'Private', 'ICU'),
    availability BOOLEAN DEFAULT TRUE
);

INSERT INTO Rooms (room_number, room_type, availability) VALUES
('101', 'Private', TRUE),
('102', 'ICU', FALSE);

-- Update availability status
UPDATE Rooms
SET availability = FALSE
WHERE room_id = 1;

-- Delete a room
DELETE FROM Rooms
WHERE room_id = 2;