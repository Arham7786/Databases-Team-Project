
CREATE TABLE Customer ( 
customerID int AUTO_INCREMENT, 
customerEmail varchar(50),
 customerPostCode char(7), 
 customerTelephone int, 
 CONSTRAINT PRIMARY KEY (customerID) ); 
 
CREATE TABLE Enquiry ( 
enquiryID int AUTO_INCREMENT,
 customerID int,
 enquiryDetails LONGTEXT, 
 CONSTRAINT PRIMARY KEY (enquiryID), 
 FOREIGN KEY (customerID) REFERENCES Customer(customerID) );

CREATE TABLE Reservation(
reservationID INT AUTO_INCREMENT PRIMARY KEY,
customerID INT,
CONSTRAINT customerID_FK  FOREIGN KEY (customerID) REFERENCES Customer (customerID));

CREATE TABLE Rental_Record(
rentalID INT AUTO_INCREMENT PRIMARY KEY,
boatID VARCHAR(25),
rentalDate DATETIME DEFAULT CURDATE(),
rentalDuePeriod DATETIME DEFAULT CURDATE(),
rentalDueBack DATETIME DEFAULT CURDATE(),
rentalDueBack DATETIME DEFAULT CURDATE(),
rentalTotalPrice DECIMAL(5,2),
customerID INT,
reservationID INT,
CONSTRAINT reservationID_FK  FOREIGN KEY (reservationID) REFERENCES Reservation (customerID),
CONSTRAINT customerID_FK  FOREIGN KEY (customerID) REFERENCES Customer (customerID));

CREATE TABLE Dealer ( 
dealerID INT PRIMARY KEY AUTO_INCREMENT, 
dealerName VARCHAR(50), 
dealerTeleNo VARCHAR(50), 
dealerAddress VARCHAR(50), 
dealerEmail VARCHAR(20) ); 

    CREATE TABLE ManufacturerAndSupplier( 
    mAnds_ID INT PRIMARY KEY AUTO_INCREMENT, 
    #FOREIGN KEY (orderlineID) REFERENCES Orderline(orderlineID), 
    mAnds_name VARCHAR(50),
    mAnds_teleNo INT,
    mAnds_address VARCHAR(50),
    mAnds_email VARCHAR(50)); 
 
 CREATE TABLE Boat_Record ( boatID INT PRIMARY KEY AUTO_INCREMENT,
 FOREIGN KEY (manufactureID) REFERENCES ManfacturerAndSupplier(mAnds_id),
 FOREIGN KEY (disposal_ID) REFERENCES Disposal_Record(disposal_ID),
 boatInitialPrice INT,
 boatPurchaseDate DECIMAL(10,2), 
 boatLastService DATE, 
 boatClassification VARCHAR(30),
 boatSize VARCHAR(20) );
 
 CREATE TABLE Disposal_Record ( 
disposalID INT PRIMARY KEY AUTO_INCREMENT,
 FOREIGN KEY (boat_ID) REFERENCES Boat_Record(boat_ID),
 FOREIGN KEY (dealer_ID) REFERENCES Dealer(dealer_ID),
 disposalDate DATE,
 disposalSalePrice DECIMAL(10,2) ); 
 
CREATE TABLE Parts_Stock( 
 partsID INT PRIMARY KEY AUTO_INCREMENT,
 partName VARCHAR(50),
 partsQuantity INT );
 
 CREATE TABLE Parts_Required( 
partsRequestID INT AUTO_INCREMENT PRIMARY KEY,
 partQuantity INT,
 quantityRequired INT, 
 CONSTRAINT FK_partsID FOREIGN KEY (partsID) REFERENCES Parts_Stock(partsID) );

CREATE TABLE Maintenance( 
referanceNum INT AUTO_INCREMENT PRIMARY KEY,
 faultDetails LONGTEXT,
 faultDate DATE DEFAULT CURDATE(),
 actionTaken LONGTEXT, 
 actionDate DATE DEFAULT CURDATE(),
 maintenance_priority VARCHAR(50),
 CONSTRAINT FK_partsRequiredID FOREIGN KEY (partsRequiredID) REFERENCES Parts_Required(partsRequestID),
 CONSTRAINT FK_boatID FOREIGN KEY (boatID) REFERENCES Boat_Record(boatID) ); 

    CREATE TABLE Orderr(
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    FOREIGN KEY (partsID) REFERENCES Parts_Stock(partsID) );
    
    DROP TABLE
    