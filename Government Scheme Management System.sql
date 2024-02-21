CREATE database SCHEME;
USE SCHEME;
-- Create Scheme table
CREATE TABLE Scheme (
    SchemeID INT PRIMARY KEY AUTO_INCREMENT,
    SchemeName VARCHAR(255) NOT NULL,
    Description TEXT,
    Budget DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    IsActive BOOLEAN
);

-- Insert data into Scheme table
INSERT INTO Scheme (SchemeName, Description, Budget, StartDate, EndDate, IsActive)
VALUES 
    ('Employment Scheme', 'Assistance for employment seekers', 50000.00, '2022-01-01', '2022-12-31', TRUE),
    ('Housing Scheme', 'Assistance for housing needs', 70000.00, '2022-02-01', '2022-12-31', TRUE),
    ('Healthcare Scheme', 'Assistance for healthcare services', 100000.00, '2022-03-01', '2022-12-31', TRUE),
    ('Education Scheme', 'Assistance for educational expenses', 80000.00, '2022-04-01', '2022-12-31', TRUE),
    ('Agricultural Scheme', 'Assistance for agricultural development', 60000.00, '2022-05-01', '2022-12-31', TRUE);
SELECT * FROM SCHEME;
-- Create Beneficiary table
CREATE TABLE Beneficiary (
    BeneficiaryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Email VARCHAR(255),
    ContactNo VARCHAR(15)
);

-- Insert data into Beneficiary table
INSERT INTO Beneficiary (Name, Address, Email, ContactNo)
VALUES 
    ('John Doe', '123 Main St', 'john@example.com', '1234567890'),
    ('Jane Smith', '456 Elm St', 'jane@example.com', '9876543210'),
    ('Alice Johnson', '789 Oak St', 'alice@example.com', '4567891230'),
    ('Bob Williams', '101 Pine St', 'bob@example.com', '7891234560'),
    ('David Brown', '202 Maple St', 'david@example.com', '3216549870');
SELECT * FROM BENEFICIARY;
-- Create Document table
CREATE TABLE Document (
    DocumentID INT PRIMARY KEY AUTO_INCREMENT,
    DocumentName VARCHAR(255) NOT NULL,
    Description TEXT,
    UploadDate DATE,
    SchemeID INT,
    FOREIGN KEY (SchemeID) REFERENCES Scheme(SchemeID)
);

-- Insert data into Document table
INSERT INTO Document (DocumentName, Description, UploadDate, SchemeID)
VALUES 
    ('Employment Guidelines', 'Guidelines for employment assistance', '2022-01-05', 1),
    ('Housing Application Form', 'Application form for housing scheme', '2022-02-10', 2),
    ('Healthcare Policy', 'Policy document for healthcare assistance', '2022-03-15', 3),
    ('Education Grants Information', 'Information booklet for education grants', '2022-04-20', 4),
    ('Agricultural Subsidies Manual', 'Manual for agricultural subsidy program', '2022-05-25', 5);
SELECT * FROM DOCUMENT;
-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BeneficiaryID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (BeneficiaryID) REFERENCES Beneficiary(BeneficiaryID)
);

-- Insert data into Payment table
INSERT INTO Payment (BeneficiaryID, Amount, PaymentDate, PaymentStatus)
VALUES 
    (1, 1000.00, '2022-03-15', 'Completed'),
    (2, 1500.00, '2022-04-20', 'Pending'),
    (3, 2000.00, '2022-05-25', 'Completed'),
    (4, 2500.00, '2022-06-30', 'Pending'),
    (5, 3000.00, '2022-07-05', 'Completed');
SELECT * FROM PAYMENT;
-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    BeneficiaryID INT,
    Rating INT,
    Comments TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (BeneficiaryID) REFERENCES Beneficiary(BeneficiaryID)
);

-- Insert data into Feedback table
INSERT INTO Feedback (BeneficiaryID, Rating, Comments, FeedbackDate)
VALUES 
    (1, 4, 'Good service', '2022-03-20'),
    (2, 3, 'Satisfactory experience', '2022-04-25'),
    (3, 5, 'Excellent support', '2022-05-30'),
    (4, 2, 'Could be better', '2022-06-05'),
    (5, 4, 'Very helpful', '2022-07-10');
    SELECT * FROM FEEDBACK;
    -- Update the budget of a scheme
UPDATE Scheme
SET Budget = 75000.00
WHERE SchemeID = 1;
SELECT * FROM SCHEME;
-- Update the payment status
UPDATE Payment
SET PaymentStatus = 'Completed'
WHERE BeneficiaryID = 2;
SELECT * FROM PAYMENT;
SELECT SchemeName, StartDate, Budget
FROM Scheme;
SELECT COUNT(DISTINCT BeneficiaryID) AS TotalBeneficiaries
FROM Payment;
SELECT SUM(Amount) AS TotalAmountPaid
FROM Payment;
SELECT BeneficiaryID, Rating
FROM Feedback;
SELECT Name, Address, Email, ContactNo
FROM Beneficiary;
SELECT SchemeName, DocumentName, UploadDate
FROM Scheme
JOIN Document ON Scheme.SchemeID = Document.SchemeID;
SELECT SUM(Budget) AS TotalBudget
FROM Scheme;
SELECT COUNT(DISTINCT BeneficiaryID) AS TotalBeneficiariesWithFeedback
FROM Feedback;
SELECT b.Name, b.Address, b.Email, b.ContactNo, f.Rating
FROM Beneficiary b
JOIN Feedback f ON b.BeneficiaryID = f.BeneficiaryID
WHERE f.Rating = 5;
SELECT *
FROM Document
WHERE UploadDate > '2022-05-01';
SELECT SchemeName, COUNT(DocumentID) AS NumDocuments
FROM Scheme
LEFT JOIN Document ON Scheme.SchemeID = Document.SchemeID
GROUP BY SchemeName;
SELECT b.Name, b.Address, b.Email, b.ContactNo
FROM Beneficiary b
LEFT JOIN Payment p ON b.BeneficiaryID = p.BeneficiaryID
WHERE p.BeneficiaryID IS NULL;
SELECT Name, Address, Email, ContactNo
FROM Beneficiary
ORDER BY Name ASC;
SELECT SchemeName, COUNT(DocumentID) AS NumDocuments
FROM Scheme
LEFT JOIN Document ON Scheme.SchemeID = Document.SchemeID
GROUP BY SchemeName
ORDER BY NumDocuments DESC;
SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2022-07-01' AND '2022-08-01';
SELECT COUNT(*)
FROM Payment
WHERE Amount > 1000 OR PaymentStatus = 'Pending';
SELECT *
FROM Payment
WHERE Amount < 500 OR PaymentStatus = 'Completed';