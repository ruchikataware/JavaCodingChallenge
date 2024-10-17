create database JobBoard;
use JobBoard;

CREATE TABLE Companies (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Applicants (
    ApplicantID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Resume VARCHAR(255)
);

CREATE TABLE JobListings (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255) NOT NULL,
    JobDescription TEXT NOT NULL,
    JobLocation VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    JobType VARCHAR(50) NOT NULL,
    PostedDate DATETIME NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES Companies (CompanyID));
    
CREATE TABLE JobApplications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME NOT NULL,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES JobListings(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

INSERT INTO Companies (CompanyName, Location) VALUES
('TechCorp', 'New York'),
('Innovative Solutions', 'San Francisco'),
('BlueCloud Technologies', 'Austin'),
('GreenLeaf Corp', 'Chicago'),
('HealthTech Inc.', 'Boston');

INSERT INTO Applicants (FirstName, LastName, Email, Phone, Resume) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'resume1.pdf'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321', 'resume2.pdf'),
('Robert', 'Johnson', 'robert.johnson@example.com', '123-123-1234', 'resume3.pdf'),
('Emily', 'Davis', 'emily.davis@example.com', '321-321-4321', 'resume4.pdf'),
('Michael', 'Brown', 'michael.brown@example.com', '456-456-4567', 'resume5.pdf');

INSERT INTO JobListings (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(1, 'Software Developer', 'Develop and maintain software applications.', 'New York', 85000.00, 'Full-time', NOW()),
(2, 'Data Scientist', 'Analyze data and build predictive models.', 'San Francisco', 95000.00, 'Full-time', NOW()),
(3, 'System Administrator', 'Manage company’s IT infrastructure.', 'Austin', 75000.00, 'Full-time', NOW()),
(4, 'Product Manager', 'Oversee product development lifecycle.', 'Chicago', 105000.00, 'Full-time', NOW()),
(5, 'Marketing Specialist', 'Develop marketing campaigns.', 'Boston', 65000.00, 'Part-time', NOW());

INSERT INTO JobApplications (JobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(1, 1, NOW(), 'I am excited to apply for the Software Developer position at TechCorp. My skills in Java and problem-solving would be a great fit.'),
(2, 2, NOW(), 'I am highly interested in the Data Scientist role at Innovative Solutions. I bring expertise in data analysis and machine learning.'),
(3, 3, NOW(), 'I would like to apply for the System Administrator role at BlueCloud Technologies. My IT infrastructure skills would contribute greatly.'),
(4, 4, NOW(), 'I am applying for the Product Manager position at GreenLeaf Corp. I have experience overseeing product development and would love to contribute.'),
(5, 5, NOW(), 'I am excited to apply for the Marketing Specialist role at HealthTech Inc. My marketing experience would be a great asset to your team.');

desc Companies;
desc Applicants;
desc JobListings;
desc JobApplications;

select * from Companies;
select * from Applicants;
select * from JobListings;
select * from JobApplications;
