# Hospital Management System (MySQL)

This project is a **Hospital Management System** built using **MySQL**. It covers key modules like Departments, Doctors, Patients, Appointments, and Rooms with full DDL operations.

---

## 📁 Tables Overview

### 1. Departments
Stores hospital departments.

- `department_id` (Primary Key)
- `department_name`
- `location`

### 2. Doctors
Stores doctor details linked to departments.

- `doctor_id` (Primary Key)
- `name`
- `specialization`
- `contact_number`
- `email`
- `department_id` (Foreign Key)

### 3. Patients
Stores patient information.

- `patient_id` (Primary Key)
- `name`
- `date_of_birth`
- `gender`
- `contact_number`
- `address`

### 4. Appointments
Stores appointments between patients and doctors.

- `appointment_id` (Primary Key)
- `patient_id` (Foreign Key)
- `doctor_id` (Foreign Key)
- `appointment_date`
- `appointment_time`
- `reason`

### 5. Rooms
Stores hospital room details.

- `room_id` (Primary Key)
- `room_number` (Unique)
- `room_type`
- `availability`

---

## 🧾 Operations Performed

- `CREATE TABLE` – Table creation with constraints
- `ALTER TABLE` – Add columns to existing tables
- `INSERT INTO` – Add sample data
- `UPDATE` – Modify existing records
- `DELETE` – Remove records
- `FOREIGN KEY` – Enforce referential integrity

---

## 🔗 Relationships

- Each doctor belongs to a department
- Each appointment is linked to one doctor and one patient

---

## ⚙️ Tools Required

- MySQL Server
- MySQL Workbench or phpMyAdmin

---

## 🚀 How to Run

1. Install MySQL and any preferred GUI (Workbench/phpMyAdmin).
2. Copy the SQL code from the script.
3. Execute the script to set up the database and tables.
4. Run `SELECT` queries to verify data insertion.

---

## 📄 License

This project is open for educational and non-commercial use.
