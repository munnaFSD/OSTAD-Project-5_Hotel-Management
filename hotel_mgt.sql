-- Creating Department Table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Inserting Data into Department Table
INSERT INTO Department (Department_ID, Name, Location) VALUES
(1, 'Cardiology', 'Dhaka, Block A, Floor 2'),
(2, 'Neurology', 'Chittagong, Block B, Floor 3'),
(3, 'Orthopedics', 'Sylhet, Block C, Floor 1'),
(4, 'Pediatrics', 'Khulna, Block D, Floor 4'),
(5, 'Dermatology', 'Barishal, Block A, Floor 1'),
(6, 'Gastroenterology', 'Rajshahi, Block B, Floor 2'),
(7, 'Endocrinology', 'Mymensingh, Block C, Floor 3'),
(8, 'Psychiatry', 'Rangpur, Block D, Floor 2'),
(9, 'Ophthalmology', 'Dhaka, Block A, Floor 3'),
(10, 'General Medicine', 'Chittagong, Block B, Floor 4');

-- Creating Doctor Table
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Department_ID INT,
    CONSTRAINT FK_Doctor_Department FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- Inserting Data into Doctor Table
INSERT INTO Doctor (Doctor_ID, Name, Specialization, Phone, Department_ID) VALUES
(1, 'Dr. Rafiq Hasan', 'Cardiologist', '01711-123456', 1),
(2, 'Dr. Sharmeen Ahmed', 'Neurologist', '01812-234567', 2),
(3, 'Dr. Farid Hossain', 'Orthopedic Surgeon', '01913-345678', 3),
(4, 'Dr. Nabila Rahman', 'Pediatrician', '01714-456789', 4),
(5, 'Dr. Asif Chowdhury', 'Dermatologist', '01815-567890', 5),
(6, 'Dr. Mahbub Alam', 'Gastroenterologist', '01916-678901', 6),
(7, 'Dr. Sumaiya Sultana', 'Endocrinologist', '01717-789012', 7),
(8, 'Dr. Tanvir Khan', 'Psychiatrist', '01818-890123', 8),
(9, 'Dr. Jahanara Begum', 'Ophthalmologist', '01919-901234', 9),
(10, 'Dr. Shahidul Islam', 'General Practitioner', '01710-012345', 10);

-- Creating Patient Table
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(20),
    Phone VARCHAR(30)
);

-- Inserting Data into Patient Table
INSERT INTO Patient (Patient_ID, Name, Age, Gender, Phone) VALUES
(101, 'Abdullah Al Mamun', 35, 'Male', '01720-123456'),
(102, 'Tasnim Jahan', 29, 'Female', '01821-234567'),
(103, 'Kazi Monirul Islam', 42, 'Male', '01922-345678'),
(104, 'Fatema Akter', 38, 'Female', '01723-456789'),
(105, 'Rafiul Karim', 50, 'Male', '01824-567890'),
(106, 'Sharmin Akter', 60, 'Female', '01925-678901'),
(107, 'Mohiuddin Ahmed', 30, 'Male', '01726-789012'),
(108, 'Salma Sultana', 40, 'Female', '01827-890123'),
(109, 'Arif Hossain', 55, 'Male', '01928-901234'),
(110, 'Rubina Chowdhury', 36, 'Female', '01729-012345');

-- Creating Appointment Table
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Status VARCHAR(50),
    Doctor_ID INT,
    Patient_ID INT,
    CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (Doctor_ID)
    REFERENCES Doctor(Doctor_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT FK_Appointment_Patient FOREIGN KEY (Patient_ID)
    REFERENCES Patient(Patient_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Inserting Data into Appointment Table
INSERT INTO Appointment (Appointment_ID, Date, Time, Status, Doctor_ID, Patient_ID) VALUES
(1, '2024-12-20', '09:00:00', 'Scheduled', 1, 101),
(2, '2024-12-20', '10:30:00', 'Scheduled', 2, 102),
(3, '2024-12-21', '11:00:00', 'Completed', 3, 103),
(4, '2024-12-21', '14:00:00', 'Scheduled', 4, 104),
(5, '2024-12-22', '15:30:00', 'Completed', 5, 105),
(6, '2024-12-22', '08:30:00', 'Scheduled', 6, 106),
(7, '2024-12-23', '13:00:00', 'Canceled', 7, 107),
(8, '2024-12-23', '11:30:00', 'Scheduled', 8, 108),
(9, '2024-12-24', '16:00:00', 'Completed', 9, 109),
(10, '2024-12-24', '09:30:00', 'Scheduled', 10, 110);
