CREATE DATABASE Clinic_Booking_Db;

USE Clinic_Booking_Db;

-- 1. Patients
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    dob DATE
);

-- 2. Doctors
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

-- 3. Specializations
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Doctor_Specialization (Many-to-Many)
CREATE TABLE Doctor_Specialization (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id) ON DELETE CASCADE
);

-- 5. Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

-- 6. Treatments
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 7. Patient_Treatments (Many-to-Many)
CREATE TABLE Patient_Treatments (
    patient_id INT,
    treatment_id INT,
    treatment_date DATE,
    PRIMARY KEY (patient_id, treatment_id, treatment_date),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id) ON DELETE CASCADE
);

-- Sample Data

-- Insert Patients
INSERT INTO Patients (first_name, last_name, email, phone, dob)
VALUES 
('Alice', 'Wanjiru', 'alice.wanjiru@example.com', '0712345678', '1990-04-12'),
('Brian', 'Mutua', 'brian.mutua@example.com', '0723456789', '1985-07-20');

-- Insert Doctors
INSERT INTO Doctors (first_name, last_name, email, phone)
VALUES
('Dr. James', 'Ouma', 'james.ouma@clinic.com', '0791122334'),
('Dr. Faith', 'Kamau', 'faith.kamau@clinic.com', '0788123456');

-- Insert Specializations
INSERT INTO Specializations (name)
VALUES
('Cardiology'),
('Dermatology'),
('Pediatrics');

-- Link Doctors to Specializations
INSERT INTO Doctor_Specialization (doctor_id, specialization_id)
VALUES 
(1, 1), -- Dr. James: Cardiology
(2, 2), -- Dr. Faith: Dermatology
(2, 3); -- Dr. Faith: Pediatrics

-- Insert Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason)
VALUES
(1, 1, '2025-05-08 09:00:00', 'Chest pains'),
(2, 2, '2025-05-08 10:30:00', 'Skin rash');

-- Insert Treatments
INSERT INTO Treatments (name, description)
VALUES
('ECG', 'Electrocardiogram for heart monitoring'),
('Antibiotic Cream', 'Topical treatment for skin infections');

-- Link Patient to Treatments
INSERT INTO Patient_Treatments (patient_id, treatment_id, treatment_date)
VALUES
(1, 1, '2025-05-08'),
(2, 2, '2025-05-08');
