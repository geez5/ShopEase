CREATE DATABASE ShopEase;
use ShopEase;
-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    FullName VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    CategoryID INT,
    ImageURL VARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Discounts Table
CREATE TABLE Discounts (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    DiscountCode VARCHAR(50) UNIQUE,
    DiscountAmount DECIMAL(10, 2),
    MinimumOrderAmount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE
);
-- Insert Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Books');

-- Insert Products
INSERT INTO Products (Name, Description, Price, StockQuantity, CategoryID, ImageURL) VALUES
('Laptop', 'High-performance laptop with 16GB RAM', 999.99, 50, 1, 'laptop.jpg'),
('T-shirt', 'Cotton T-shirt with logo print', 19.99, 100, 2, 'tshirt.jpg'),
('Java Programming Book', 'Comprehensive guide to Java programming', 39.99, 30, 3, 'javabook.jpg');

-- Insert Users
INSERT INTO Users (Username, Password, Email, FullName, Address, PhoneNumber) VALUES
('user1', 'password1', 'user1@example.com', 'John Doe', '123 Main St, City', '123-456-7890'),
('user2', 'password2', 'user2@example.com', 'Jane Smith', '456 Elm St, Town', '987-654-3210');

-- Insert Orders
INSERT INTO Orders (UserID, TotalAmount) VALUES
(1, 999.99),
(2, 59.98);

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 999.99),
(2, 2, 2, 39.98);

-- Insert Payments
INSERT INTO Payments (OrderID, PaymentMethod, Amount) VALUES
(1, 'Credit Card', 999.99),
(2, 'PayPal', 59.98);

-- Insert Reviews
INSERT INTO Reviews (UserID, ProductID, Rating, Comment) VALUES
(1, 1, 5, 'Great laptop! Fast delivery.'),
(2, 3, 4, 'Good book, covers a lot of topics.');

-- Insert Discounts
INSERT INTO Discounts (DiscountCode, DiscountAmount, MinimumOrderAmount, StartDate, EndDate) VALUES
('SAVE10', 10.00, 50.00, '2024-01-01', '2024-12-31');

INSERT INTO Products (Name, Description, Price, StockQuantity, CategoryID, ImageURL) VALUES
('Smartphone', 'Latest smartphone with dual cameras', 699.99, 50, 1, 'smartphone.jpg'),
('Jeans', 'Slim-fit denim jeans', 49.99, 200, 2, 'jeans.jpg'),
('Python Programming Book', 'Complete guide to Python programming', 49.99, 20, 3, 'pythonbook.jpg');

-- Insert more users
INSERT INTO Users (Username, Password, Email, FullName, Address, PhoneNumber) VALUES
('user3', 'password3', 'user3@example.com', 'Alice Johnson', '789 Oak St, Village', '555-123-4567'),
('user4', 'password4', 'user4@example.com', 'Bob Williams', '321 Pine St, Town', '555-987-6543');

-- Insert more orders
INSERT INTO Orders (UserID, TotalAmount) VALUES
(3, 699.99),
(4, 99.98);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(3, 1, 1, 699.99),
(4, 3, 1, 49.99),
(4, 6, 2, 99.98);

-- Insert more payments
INSERT INTO Payments (OrderID, PaymentMethod, Amount) VALUES
(3, 'Credit Card', 699.99),
(4, 'PayPal', 99.98);

INSERT INTO Reviews (UserID, ProductID, Rating, Comment) VALUES
(3, 1, 4, 'Great phone, but battery life could be better.'),
(4, 6, 5, 'Fantastic book, highly recommended!');

-- Insert more discounts
INSERT INTO Discounts (DiscountCode, DiscountAmount, MinimumOrderAmount, StartDate, EndDate) VALUES
('SPRING20', 20.00, 100.00, '2024-04-01', '2024-04-30');

