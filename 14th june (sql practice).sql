CREATE DATABASE DOCTOR;
USE  DOCTOR;
-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    wallet_balance DECIMAL(10, 2),
    login VARCHAR(50),
    password VARCHAR(100), 
    member_since DATE
);

-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    wallet_balance DECIMAL(10, 2),
    login VARCHAR(50),
    password VARCHAR(100),
    member_since DATE
);

-- Create Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    booking_date DATE,
    booking_time TIME,
    status ENUM('confirmed', 'canceled', 'pending'),
    consultation_fee DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Consultations Table
CREATE TABLE Consultations (
    consultation_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    consultation_date DATE,
    consultation_notes TEXT,
    prescription TEXT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Create Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
SHOW TABLES;
