CREATE DATABASE InsuranceDB;
USE InsuranceDB;

CREATE TABLE users (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE policies (
    policyId INT PRIMARY KEY AUTO_INCREMENT,
    policyName VARCHAR(100) NOT NULL,
    policyType VARCHAR(50) NOT NULL,
    premiumAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE clients (
    clientId INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(100) NOT NULL,
    contactInfo VARCHAR(100) NOT NULL,
    policyId INT,
    FOREIGN KEY (policyId) REFERENCES policies(policyId)
);

CREATE TABLE claims (
    claimId INT PRIMARY KEY AUTO_INCREMENT,
    claimNumber VARCHAR(50) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    policyId INT,
    clientId INT,
    FOREIGN KEY (policyId) REFERENCES policies(policyId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId)
);

CREATE TABLE payments (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(10, 2) NOT NULL,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES clients(clientId)
);

INSERT INTO users (username, password, role)
VALUES 
('admin', 'admin123', 'Admin'),
('user1', 'password123', 'Client'),
('user2', 'password456', 'Client');

INSERT INTO policies (policyName, policyType, premiumAmount)
VALUES 
('Health Insurance', 'Health', 5000.00),
('Life Insurance', 'Life', 8000.00),
('Vehicle Insurance', 'Vehicle', 1500.00);

INSERT INTO clients (clientName, contactInfo, policyId)
VALUES 
('John Doe', 'john@example.com', 1),
('Jane Smith', 'jane@example.com', 2),
('Sam Wilson', 'sam@example.com', 3);

INSERT INTO claims (claimNumber, dateFiled, claimAmount, status, policyId, clientId)
VALUES 
('C001', '2025-03-10', 1000.00, 'Approved', 1, 1),
('C002', '2025-04-01', 5000.00, 'Pending', 2, 2),
('C003', '2025-04-05', 2000.00, 'Rejected', 3, 3);

INSERT INTO payments (paymentDate, paymentAmount, clientId)
VALUES 
('2025-03-12', 500.00, 1),
('2025-04-02', 800.00, 2),
('2025-04-07', 300.00, 3);
set @@foreign_key_checks=0;

select * from policies;

