/*Question 3: Patient Admission Analysis
Description: Create a data warehouse schema for analyzing patient admissions,
with dimensions for time, patient, patient origin, doctor, hospital, hospital location, and department.
Measures should include admission count, total charge, and profit.*/

CREATE DATABASE Patient_Admission_Analysis

CREATE TABLE DimTime
(
	Time_id INT PRIMARY KEY IDENTITY,
	Day_of_week VARCHAR(10),
	Month VARCHAR(10),
	Quarter INT,
	Year INT
)
CREATE TABLE DimPatientOrigin
(
	origin_id INT PRIMARY KEY IDENTITY,
	State VARCHAR(15)
	
)

CREATE TABLE DimPatient
(
	Patient_id INT PRIMARY KEY IDENTITY,
	origin_id INT ,
	Name VARCHAR(100),
	Phone VARCHAR(15),
	Gender VARCHAR(10),

	FOREIGN KEY (origin_id) REFERENCES DimPatientOrigin(origin_id)
)

CREATE TABLE DimDepartment
(
Departmint_id INT PRIMARY KEY IDENTITY,
Departmint_name VARCHAR(100)
)
CREATE TABLE DimDoctor
(
	Doctor_id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(100),
	Phone VARCHAR(15),
	GENDER VARCHAR(10),
	Departmint_id INT,
	FOREIGN KEY (Departmint_id) REFERENCES DimDepartment(Departmint_id)
)

CREATE TABLE DimHospitalLocation
(
Hospital_location_id INT PRIMARY KEY IDENTITY,
Address VARCHAR(100),
State VARCHAR(50),
City VARCHAR(50)
)
CREATE TABLE DimHospital
(
	Hospital_id INT PRIMARY KEY IDENTITY,
	Hospital_Name VARCHAR(100),
	Hospital_location_id INT,

	FOREIGN KEY (Hospital_location_id) REFERENCES DimHospitalLocation(Hospital_location_id)
)

CREATE TABLE FactPatientAdmission
(
	Admission_id INT PRIMARY KEY IDENTITY,
	Time_id INT, 
	Patient_id INT,
	Doctor_id INT,
	Hospital_id INT,
	

	Count INT,
	Charge MONEY,
	Profit MONEY,

	FOREIGN KEY (Time_id) REFERENCES DimTime(Time_id),
	FOREIGN KEY (Patient_id) REFERENCES DimPatient(Patient_id),
	FOREIGN KEY (Doctor_id) REFERENCES DimDoctor(Doctor_id),
	FOREIGN KEY (Hospital_id) REFERENCES DimHospital(Hospital_id)

)

