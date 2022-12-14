#CREATE database groupA13_G5;

CREATE TABLE Customer ( 
customerID int AUTO_INCREMENT,
customerFirstName varchar(50),
customerLastName varchar(50),  
customerEmail varchar(50),
 customerPostCode char(8), 
 customerTelephone varchar(20), 
 CONSTRAINT PRIMARY KEY (customerID) ); 
 
DROP TABLE Customer;

CREATE TABLE Customer ( 
customerID int AUTO_INCREMENT, 
customerFirstName varchar(50),
customerLastName varchar(50), 
customerEmail varchar(50),
 customerPostCode char(8), 
 customerTelephone varchar(20), 
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
rentalID INT PRIMARY KEY,
boatID VARCHAR(25),
rentalDate DATE,
rentalDuePeriod varchar(10),
rentalDueBack DATE,
rentalDueBackActual DATE,
rentalTotalPrice DECIMAL(5,2),
customerID INT,
reservationID INT,
CONSTRAINT reservationID_FK  FOREIGN KEY (reservationID) REFERENCES Reservation (reservationID),
CONSTRAINT customerID_FKFK FOREIGN KEY (customerID) REFERENCES Customer (customerID));

CREATE TABLE Dealer ( 
dealerID INT PRIMARY KEY AUTO_INCREMENT, 
dealerName VARCHAR(50), 
dealerTeleNo VARCHAR(20), 
dealerAddress VARCHAR(100), 
dealerEmail VARCHAR(50) ); 


CREATE TABLE ManufacturerAndSupplier( 
    mAnds_ID INT PRIMARY KEY AUTO_INCREMENT, 
    orderlineID_FK INT,
    mAnds_name VARCHAR(50),
    mAnds_teleNo VARCHAR(20),
    mAnds_address VARCHAR(100),
    mAnds_email VARCHAR(50)); 


CREATE TABLE Disposal_Record ( 
disposalID INT PRIMARY KEY AUTO_INCREMENT,
 dealerID INT,
 CONSTRAINT dealerID_FK FOREIGN KEY (dealerID) REFERENCES Dealer(dealerID),
 disposalDate DATE,
 disposalSalePrice DECIMAL(10,2) );     
    
CREATE TABLE Boat_Record ( boatID INT PRIMARY KEY AUTO_INCREMENT,
mAnds_ID INT,
CONSTRAINT manufactureID_FK  FOREIGN KEY (mAnds_ID) REFERENCES ManufacturerAndSupplier(mAnds_ID),
disposalID INT,
CONSTRAINT disposal_ID_FK  FOREIGN KEY (disposalID) REFERENCES Disposal_Record(disposalID),
 boatInitialPrice DECIMAL(10,2),
 boatPurchaseDate Date, 
 boatLastService DATE, 
 boatClassification VARCHAR(30),
 boatSize VARCHAR(20),
 boatModel VARCHAR(20));
 
 
 
CREATE TABLE Parts_Stock( 
 partsID INT PRIMARY KEY AUTO_INCREMENT,
 partName VARCHAR(50),
 partsQuantity INT );
 

CREATE TABLE Parts_Required( 
partsRequestID INT AUTO_INCREMENT PRIMARY KEY,
 partQuantity INT,
 quantityRequired INT, 
 partsID INT,
 CONSTRAINT partsID_FK FOREIGN KEY (partsID) REFERENCES Parts_Stock(partsID) );


CREATE TABLE Maintenance( 
referanceNum INT AUTO_INCREMENT PRIMARY KEY,
 faultDetails LONGTEXT,
 faultDate DATE,
 actionTaken LONGTEXT, 
 actionDate DATE,
 maintenance_priority VARCHAR(50),
 partsRequiredID INT,
 boatID INT,
 CONSTRAINT FK_partsRequiredID FOREIGN KEY (partsRequiredID) REFERENCES Parts_Required(partsRequestID),
 CONSTRAINT FK_boatID FOREIGN KEY (boatID) REFERENCES Boat_Record(boatID) ); 
 
CREATE TABLE Orderr(
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    partsID INT,
    CONSTRAINT partsID_FKFK FOREIGN KEY (partsID) REFERENCES Parts_Stock(partsID) );
    
CREATE TABLE Orderline(
orderlineID INT PRIMARY KEY AUTO_INCREMENT, 
orderID INT,
CONSTRAINT orderID_FK FOREIGN KEY (orderID) REFERENCES Orderr(orderID) );

#DROP TABLE IF EXISTS Orderline,Orderr,Maintenance,Parts_Required,Parts_Stock,Boat_Record,Rental_Record,ManufacturerAndSupplier,Dealer,Reservation,Enquiry,Customer;


ALTER TABLE ManufacturerAndSupplier ADD CONSTRAINT orderlineID_FKFK FOREIGN KEY (orderlineID_FK) REFERENCES Orderline(orderlineID);

INSERT INTO Customer(customerFirstName, customerLastName, customerEmail, customerPostCode, customerTelephone) #Appendix D - List of customers
VALUES
	('Dion','Brodnecke','dbroes1d@who.int',null,'07174826351'),
	('Scarlett','Galley','scargr1c@imgur.com',null,'03260476982'),
    ('Sissy','Gadson','sgadson1b@ucoz.com',null,'04924556740'),
    ('Tabby','Minichi','minitabc@imgur.com',null,'07795213673'),
    ('Nellie','Greenmon','nelliegreen12@patch.com',null,'03816078215'),
    ('Hanny','Marsters','hmarsters@netlog.com',null,'07075576685'),
    ('Oswell','Aspinell','OsAspinell@digg.com',null,'09931348133'),
    ('Florance','Baston','FloBar@dirtg.com',null,'07315082134'),
    ('Candice','Tumilson','canditum15@bloomberg.com',null,'01639824657'),
    ('Clair','Bavin','clairBav@sprog.it',null,'06245985897');

#Appendix D - List of Manufacturers
INSERT INTO ManufacturerAndSupplier(mAnds_name,mAnds_teleNo,mAnds_address,mAnds_email)
VALUES('SuperBoat', '01772459666', 'Unit 7 Centurion Court, Leyland, LE10 2DJ', 'admin@superboat.co.uk'),
      ('Explorer Boats UK','01704807654','Meadow Lane, Burscough, BU56 8GH','admin@explorerboats.co.uk'),
      ('The Northwich Boat Company', '01270160160', 'Unit 1 Kings Lock Boatyard Booth Lane, Middlewich, MW67 7GY', 'admin@northwichboats.co.uk'),
      ('Collingwood Boat Builders', '01513742985', '29 Townsend Street, Collingwood, CL27 2DU', 'admin@collingwoodboats.co.uk'),
      ('Elton Moss Boat Builders', '01270760160', 'Unit 4 Kings Lock Boatyard Booth Lane, Middlewich, MW63 8TY', 'admin@eltonmossboats.co.uk'),
      ('Aintree Boat Company Ltd ', '01515239000', 'Brookfield Drive, Liverpool, L1 6GU ', 'admin@aintreeboats.co.uk'),
      ('Braidbar Boats Ltd', '01625873471', 'Lord Vernons Wharf Lyme Road Higher, Poynton, PY12 9TS', 'admin@braidbarboats.co.uk'),
      ('Bourne Boat Builders Ltd', '01785714692', 'Teddesley Road, Penkridge, PE8 7SU', 'admin@bourneboats.co.uk'),
      ('Stoke on Trent Boat Building Co Ltd', '01782813831', 'Longport Wharf Station Street, Stoke-on-Trent, ST6 9GU', 'admin@stokeboats.co.uk'),
      ('MGM Boats Narrowboat Builders', '01162640009', '27 Mill Lane, Leicester, LE6 9FY', 'admin@mgmboats.co.uk');
      
#Appendix D - List of dealers
INSERT INTO Dealer(dealerName, dealerTeleNo, dealerAddress, dealerEmail)
VALUES("Dalis Vannoort", '07574137463', "77 A828, Appin, AP7 6GU",  "dvannoort0@salon.com"),
("Joe's Junk", '07365534221', "15 Back Lane, Buxton, BX7 5FY J",  "JoesJunk@zdnet.com"),
("Hoebart Kubera", '07874051869', "4 Finedon House, Marine Parade, Littlestone, LS4 6GU",  "hkubera2@who.int"),
("Eva Iacomettii", '07880072148', "8 9 Hartlands, Onslow Road, Newent, NW5 8TU",  "eiacomettii3@admin.ch"),
("Alley Pate", '07822040557', "07610 Arizona Alley, A67 8GU",  "apate4@gnu.org"),
('Korrie Legge', '07380018233', '1076 Evesham Road, Astwood Bank, DT5 8JO', 'klegge5@reference.com'),
('Minne Hinkens' ,'07978390430', '53 Balby Road, Balby, B7 8HK' ,'mhinkens6@smh.com.au'),
('Inigo MacAllaster', '07893419552' ,'1910 Farwell Plaza, G56 9FT', 'imacallaster7@blogspot.com'),
('Linell Skeeles', '07532931207', '57 Great Russell Street, London, NW1 8TU', 'lskeeles8@goo.gl'),
('Sioux Drogan', '07417098738' ,'75 Thomas Parsons Square, Ely, EL6 9GU' ,'sdrogan9@dropbox.com');

INSERT INTO Disposal_Record (dealerID,disposalDate,disposalSalePrice)
VALUES( 1,'2020-11-30',1500.00);
SELECT *
FROM Disposal_Record;

INSERT INTO Boat_Record(mAnds_ID,disposalID,boatInitialPrice ,boatPurchaseDate , boatLastService, boatClassification,boatSize,boatModel )
VALUES(1,1,3910.00,'2010-11-22','2020-10-22','motorboat','standard', "Explorer");
SELECT *
FROM  Boat_Record;

INSERT INTO Maintenance(referanceNum,faultDetails, faultDate, actionTaken, actionDate, boatID)
VALUES(1,"Chipped propeller","2015-02-15",'Replaced propeller','2015-02-27',1),
(2,"Bilge pumps gone","2015-07-10",'New bilge pumps', '2015-08-27',1),
(3,null,null,"New head pumps",'2015-08-15',1),
(4,null,null,"Normal service",'2016-03-20',1),
(5,'Cutless bearing worn through','2016-12-02', "Fit new bearing", "2017-01-27",1);
SELECT *
FROM  Maintenance
WHERE boatID = 1;

INSERT INTO Rental_Record(rentalID, rentalDate, rentalDuePeriod, rentalDueBack, rentalTotalPrice ,rentalDueBackActual)
VALUES(4734,'2019-05-02',"HD",'2019-05-02',125.00,'2019-05-02'),
(4745,'2019-05-03',"HD",'2019-05-03',125.00,'2019-05-03'),
(4812,'2019-05-04',"2D",'2019-05-05',400.00,'2019-05-06'),
(4875,'2019-05-06',"FD",'2019-05-06',200.00,'2019-05-06');
SELECT *
FROM Rental_Record;

INSERT INTO Boat_Record(mAnds_ID,disposalID,boatInitialPrice ,boatPurchaseDate , boatLastService, boatClassification,boatSize)
VALUES(2,3,3240.00,'2015-10-12','2020-01-27','Sail Boat','large');
SELECT *
FROM  Boat_Record;

INSERT INTO Maintenance(referanceNum,faultDetails, faultDate, actionTaken, actionDate, boatID)
VALUES(1,"Damaged mast","2016-04-17",'Repair mast','2016-04-27',3),
(2,"Bent Forestay","2017-07-10",'Replace Forestay', '2017-08-22',3),
(3,"Shot Boom","2018-05-18","Replace Boom",'2018-06-06',3),
(4,"Rudderstock Chipped","2019-07-07","Repair Rudderstock",'2019-07-08',3),
(5,null,null, "Normal Service", "2020-01-27",3),
(6,"Rudderblade busted", "2020-10-19", null, null);
SELECT *
FROM  Maintenance
WHERE boatID = 3;

INSERT INTO Boat_Record(mAnds_ID,boatInitialPrice ,boatPurchaseDate , boatLastService, boatClassification,boatSize,boatModel)
VALUES(2,3840,"2009-10-12","2019-10-08","Sail Boat","Very Large","TurboSail"),
(2,3240,"2015-10-15","2020-10-12", "Sail Boat", "Large","MasterSail"),
(3,2040,"2015-11-12","2020-10-14","Sail Boat", "Small", "SmallSailor"),
(3,2040,"2015-11-12","2020-10-14","Sail Boat", "Small", "SmallSailor"),
(5,5440,"2015-01-14","2020-10-15", "Motorboat", "Large", "Grande"),
(5,5440,"2015-01-14","2020-09-13", "Motorboat", "Large", "Grande"),
(2, 5440.00, "2015-1-14", "2020-09-13", "MotorBoat","Standard", "Turbo Mid"),
(3, 440.00, "2015-1-12", "2020-08-10", "RowingBoat","Large", "RowStream"),
(4, 320.00, "2015-1-12", "2020-09-22", "RowingBoat","Standard", "RowerX"),
(1, 3320.00, "2016-1-10", "2020-03-03", "SailBoat","Large", "Explorer"),
(1, 3320, "2016-1-10", "2020-4-3", "Sail Boat", "Standard", "Navigator"),
(2, 4440, "2018-2-14", "2020-9-14", "Motor Boat", "Standard", "Turbo Mid"),
(2, 4440, "2018-2-14", "2020-9-13", "Motor Boat", "Standard", "Turbo Mid"),
(7, 5440, "2018-1-14", "2019-10-14", "Motor Boat", "Large", "MasterBlaster"),
(8, 340, "2018-1-10", "2020-10-2", "Rowing Boat", "Large", "HappyRower"),
(8, 340, "2018-1-10", "2020-10-2", "Rowing Boat", "Small", "HappyRower"),
(3, 640, "2017-1-9", "2020-10-7", "Rowing Boat", "Very Large", "Streamer"),
(4,650 ,'2019-01-19' , '2020-09-12', 'Rowing boat','Very Large','Great Row'),
(7,7440 ,'2018-01-14' , '2020-08-07', 'MotorBoat','Very Large','SuperBlaster'),
(6,340 ,'2017-01-09' , '2020-10-04', 'Rowing boat','Standard','Lizard'),
(5,5440 ,'2018-02-14' , '2020-09-13', 'MotorBoat','Large','Grenade'),
(2,3240 ,'2015-10-12' , '2020-01-27', 'Sail boat','Large','MasterSail');



INSERT INTO Disposal_Record (dealerID,disposalDate,disposalSalePrice)
VALUES(2,'2019-10-10',1500.00);
SELECT *
FROM Disposal_Record;

SELECT *
FROM Boat_Record;


