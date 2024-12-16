-- Tables Creation
Drop database IF EXISTS ORDA;

CREATE database IF NOT EXISTS ORDA;
use ORDA;

-- table structures

-- Table structure for table 'Address'

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Address` (
  `AddressID` varchar(6) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `State` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `Building` varchar(50) DEFAULT NULL,
  `ZIP` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Review'

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Review` (
  `ReviewID` varchar(6) NOT NULL,
  `Rating` INT(1), status ENUM ('0', '1', '2', '3', '4', '5') DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Discount'

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Discount` (
  `DiscountID` varchar(6) NOT NULL,
  `Discountrate` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`DiscountID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Category'

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Category` (
  `CategoryID` varchar(6) NOT NULL,
  `Category` varchar(25) DEFAULT NULL,
  `SubCategory` varchar(25) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table 'Payment'

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Payment` (
  `PaymentID` varchar(6) NOT NULL,
  `Paymentmethod` ENUM ('CreditCard', 'Cash', 'DebitCard') DEFAULT NULL,
  `Paymentdate` TIMESTAMP,
  `Amount` DECIMAL(10,2) DEFAULT 0,
  PRIMARY KEY (`PaymentID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Customer'

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Customer` (
  `CustomerID` varchar(6) NOT NULL,
  `CustomerFirstName` varchar(25) DEFAULT NULL,
  `CustomerLastName` varchar(25) DEFAULT NULL,
  `DOB` datetime,
  `Gender` varchar(1) DEFAULT NULL,
  `AddressID` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `AddressID` (`AddressID`),
CONSTRAINT `Customer_FK00` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table 'Employee'

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Employee` (
  `EmployeeID` varchar(6) NOT NULL,
  `EmpFirstName` varchar(25) DEFAULT NULL,
  `EmpLastName` varchar(25) DEFAULT NULL,
  `DOB` datetime,
  `Gender` varchar(1) DEFAULT NULL,
  `Reportsto` varchar(6) DEFAULT NULL,
  `AddressID` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `AddressID` (`AddressID`),
CONSTRAINT `Employee_FK00` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Department'

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Department` (
  `DepartmentID` varchar(6) NOT NULL,
  `DepartmentName` varchar(25) DEFAULT NULL,
  `EmployeeID` varchar(6) NOT NULL,
  `Manager` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
 CONSTRAINT `Department_FK00` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Supplier'

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Supplier` (
  `SupplierID` varchar(6) NOT NULL,
  `SupplierName` varchar(25) DEFAULT NULL,
  `EmployeeID` varchar(6) DEFAULT NULL,
  `AddressID` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `AddressID` (`AddressID`),
CONSTRAINT `Supplier_FK00` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`),
CONSTRAINT `Supplier_FK01` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Admin'

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Admin` (
  `UserID` varchar(6) NOT NULL,
  `CustomerID` varchar(6) DEFAULT NULL,
  `SupplierID` varchar(6) DEFAULT NULL,
  `EmployeeID` varchar(6) DEFAULT NULL,
  `Password` varchar(25) DEFAULT NULL,
  `Usertype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `EmployeeID` (`EmployeeID`),
CONSTRAINT `Admin_FK00` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
CONSTRAINT `Admin_FK01` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`),
CONSTRAINT `Admin_FK02` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Warehouse'

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Warehouse` (
  `WarehouseID` varchar(6) NOT NULL,
  `AddressID` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`),
  KEY `AddressID` (`AddressID`),
 CONSTRAINT `Warehouse_FK00` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Store'

DROP TABLE IF EXISTS `Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Store` (
  `StoreID` varchar(6) NOT NULL,
  `StoreName` varchar(6) DEFAULT NULL,
  `EmployeeID` varchar(6) DEFAULT NULL,
  `AddressID` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`StoreID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `AddressID` (`AddressID`),
CONSTRAINT `Store_FK00` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`),
CONSTRAINT `Store_FK01` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Inventory'

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Inventory` (
  `InventoryID` varchar(6) NOT NULL,
  `WarehouseID` varchar(6) DEFAULT NULL,
  `StoreID` varchar(6) DEFAULT NULL,
  `Amount` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`InventoryID`),
  KEY `WarehouseID` (`WarehouseID`),
  KEY `StoreID` (`StoreID`),
CONSTRAINT `Inventory_FK00` FOREIGN KEY (`WarehouseID`) REFERENCES `Warehouse` (`WarehouseID`),
CONSTRAINT `Inventory_FK01` FOREIGN KEY (`StoreID`) REFERENCES `Store` (`StoreID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for the table 'Product'

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Product` (
  `ProductID` varchar(6) NOT NULL,
  `CategoryID` varchar(6) DEFAULT NULL,
  `Itemname` varchar(255) DEFAULT NULL,
  `Price` varchar(25) DEFAULT NULL,
  `SupplierID` varchar(6) DEFAULT NULL,
  `InventoryID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `InventoryID` (`InventoryID`),
CONSTRAINT `Product_FK00` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`),
CONSTRAINT `Product_FK01` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`),
CONSTRAINT `Product_FK02` FOREIGN KEY (`InventoryID`) REFERENCES `Inventory` (`InventoryID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Shipment'

DROP TABLE IF EXISTS `Shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Shipment` (
  `ShipmentID` varchar(6) NOT NULL,
  `WarehouseID` varchar(6) DEFAULT NULL,
  `CustomerID` varchar(6) DEFAULT NULL,
  `Shipdate` TIMESTAMP,
  `Deliverydate` TIMESTAMP,
  PRIMARY KEY (`ShipmentID`),
  KEY `WarehouseID` (`WarehouseID`),
  KEY `CustomerID` (`CustomerID`),
CONSTRAINT `Shipment_FK00` FOREIGN KEY (`WarehouseID`) REFERENCES `Warehouse` (`WarehouseID`),
CONSTRAINT `Shipment_FK01` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--  table structure for table subscription 

DROP TABLE IF EXISTS Subscription;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE IF NOT EXISTS Subscription (
    SubscriptionID VARCHAR(10) PRIMARY KEY, 
    CustomerID VARCHAR(10) NOT NULL, 
    SubscriptionType ENUM('Basic', 'Standard', 'Premium') NOT NULL, 
    StartDate DATE NOT NULL,
    EndDate DATE,
    Status ENUM('Active', 'Paused', 'Cancelled') DEFAULT 'Active', 
    RenewalPeriod ENUM('Monthly', 'Quarterly', 'Annually') NOT NULL, 
    Cost DECIMAL(10, 2) NOT NULL,
    
    -- Foreign Key Constraint
    CONSTRAINT FK_Customer_Subscription FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Table structure for table 'Order'

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` varchar(6) NOT NULL,
  `ShipmentID` varchar(6) DEFAULT NULL,
  `CustomerID` varchar(6) DEFAULT NULL, 
  `DiscountID` varchar(6) DEFAULT NULL,
  `EmployeeID` varchar(6) DEFAULT NULL,
  `PaymentID` varchar(6) DEFAULT NULL,
  `PriceBeforeDiscount` Decimal(10,2) DEFAULT 0,
  `FinalPrice` varchar(6) DEFAULT NULL,
  `Order_Date` TIMESTAMP,
  PRIMARY KEY (OrderID),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `ShipmentID` (`ShipmentID`),
  KEY `DiscountID` (`DiscountID`),
CONSTRAINT `Order_FK00` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
CONSTRAINT `Order_FK01` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
CONSTRAINT `Order_FK02` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`),
CONSTRAINT `Order_FK03` FOREIGN KEY (`ShipmentID`) REFERENCES `Shipment` (`ShipmentID`),
CONSTRAINT `Order_FK04` FOREIGN KEY (`DiscountID`) REFERENCES `Discount` (`DiscountID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table 'Order Items'

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `OrderItems` (
  `OrderID` varchar(6) NOT NULL,
  `ProductID` varchar(6) NOT NULL,
  `Quantity` INT(10) DEFAULT 0,
  `ReviewID` varchar(6) NOT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`),
  KEY `ProductID` (`ProductID`),
  KEY `OrderID` (`OrderID`),
CONSTRAINT `OrderItem_FK00` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
CONSTRAINT `OrderItem_FK01` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
CONSTRAINT `OrderItem_FK02` FOREIGN KEY (`ReviewID`) REFERENCES `Review` (`ReviewID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table 'Updatelog'

DROP TABLE IF EXISTS `update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `update_log` (
  `UpdatelogID` INT(6) AUTO_INCREMENT NOT NULL,
  `Tablename` varchar(25) NOT NULL,
  `Record_id` varchar(25) NOT NULL, 
  `Column_name` VARCHAR(255) NOT NULL,
  `Old_value` VARCHAR(255),
  `New_value` VARCHAR(255),
  `Updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UpdatelogID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table email list

DROP TABLE IF EXISTS Email_List;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE IF NOT EXISTS Email_List(
    RefNo INT PRIMARY KEY AUTO_INCREMENT,
    ToCustomer VARCHAR(10) NOT NULL, 
    Subject VARCHAR(250) NOT NULL, 
    Body LONGTEXT NOT NULL, 
    SendDate DATE NOT NULL,
    KEY `ToCustomer` (`ToCustomer`),
        
    -- Foreign Key Constraint
	CONSTRAINT FK_To_Customer FOREIGN KEY (`ToCustomer`) REFERENCES Customer(`CustomerID`)
);



-- Dump data 

-- Insert data into 'Address'
LOCK TABLES `Address` WRITE;
INSERT INTO Address (AddressID, Country, State, City, Street, Building, ZIP) VALUES
('ADD001', 'USA', 'California', 'Los Angeles', 'Sunset Blvd', 'Building 101', '90001'),
('ADD002', 'USA', 'California', 'San Francisco', 'Market St', 'Building 202', '94103'),
('ADD003', 'USA', 'Texas', 'Dallas', 'Main St', 'Suite 300', '75201'),
('ADD004', 'USA', 'New York', 'New York', 'Broadway', 'Building 400', '10001'),
('ADD005', 'USA', 'Illinois', 'Chicago', 'Wacker Dr', 'Building 500', '60601'),
('ADD006', 'USA', 'Florida', 'Miami', 'Ocean Dr', 'Building 601', '33139'),
('ADD007', 'Canada', 'Ontario', 'Toronto', 'Yonge St', 'Building 101', 'M5B1M1'),
('ADD008', 'Canada', 'British Columbia', 'Vancouver', 'Granville St', 'Building 201', 'V6Z1E4'),
('ADD009', 'Canada', 'Quebec', 'Montreal', 'Saint-Catherine St', 'Building 301', 'H3B1A7'),
('ADD010', 'Canada', 'Alberta', 'Calgary', 'Stephen Ave', 'Building 401', 'T2P1B3'),
('ADD011', 'UK', 'England', 'London', 'Oxford St', 'Building 102', 'W1D1LL'),
('ADD012', 'UK', 'Scotland', 'Edinburgh', 'Princes St', 'Building 202', 'EH22DF'),
('ADD013', 'UK', 'Wales', 'Cardiff', 'Queen St', 'Building 302', 'CF101BA'),
('ADD014', 'Germany', 'Berlin', 'Berlin', 'Unter den Linden', 'Building 500', '10117'),
('ADD015', 'Germany', 'Bavaria', 'Munich', 'Maximilianstrasse', 'Building 600', '80333'),
('ADD016', 'Germany', 'Hamburg', 'Hamburg', 'Reeperbahn', 'Building 700', '20359'),
('ADD017', 'France', 'Ile-de-France', 'Paris', 'Champs-Élysées', 'Building 102', '75008'),
('ADD018', 'France', 'Provence', 'Marseille', 'La Canebière', 'Building 202', '13001'),
('ADD019', 'France', 'Nouvelle-Aquitaine', 'Bordeaux', 'Rue Sainte-Catherine', 'Building 302', '33000'),
('ADD020', 'Italy', 'Lazio', 'Rome', 'Via del Corso', 'Building 401', '00186'),
('ADD021', 'Italy', 'Lombardy', 'Milan', 'Corso Buenos Aires', 'Building 501', '20124'),
('ADD022', 'Spain', 'Catalonia', 'Barcelona', 'La Rambla', 'Building 601', '08002'),
('ADD023', 'Spain', 'Madrid', 'Madrid', 'Gran Via', 'Building 701', '28013'),
('ADD024', 'Australia', 'New South Wales', 'Sydney', 'George St', 'Building 102', '2000'),
('ADD025', 'Australia', 'Victoria', 'Melbourne', 'Collins St', 'Building 202', '3000'),
('ADD026', 'Australia', 'Queensland', 'Brisbane', 'Queen St', 'Building 302', '4000'),
('ADD027', 'India', 'Maharashtra', 'Mumbai', 'Marine Drive', 'Building 101', '400001'),
('ADD028', 'India', 'Delhi', 'New Delhi', 'Connaught Place', 'Building 201', '110001'),
('ADD029', 'India', 'Karnataka', 'Bangalore', 'MG Road', 'Building 301', '560001'),
('ADD030', 'Japan', 'Tokyo', 'Tokyo', 'Shibuya Crossing', 'Building 401', '150-0002'),
('ADD031', 'Japan', 'Osaka', 'Osaka', 'Dotonbori', 'Building 501', '542-0071'),
('ADD032', 'China', 'Beijing', 'Beijing', 'Wangfujing', 'Building 102', '100006'),
('ADD033', 'China', 'Shanghai', 'Shanghai', 'Nanjing Road', 'Building 202', '200003'),
('ADD034', 'China', 'Guangdong', 'Guangzhou', 'Tianhe Road', 'Building 302', '510620'),
('ADD035', 'Brazil', 'Sao Paulo', 'Sao Paulo', 'Paulista Ave', 'Building 401', '01310-000'),
('ADD036', 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Building 501', '22020-010'),
('ADD037', 'Mexico', 'Mexico City', 'Mexico City', 'Paseo de la Reforma', 'Building 102', '06600'),
('ADD038', 'Mexico', 'Jalisco', 'Guadalajara', 'Avenida Vallarta', 'Building 202', '44110'),
('ADD039', 'South Africa', 'Gauteng', 'Johannesburg', 'Nelson Mandela Square', 'Building 301', '2196'),
('ADD040', 'South Africa', 'Western Cape', 'Cape Town', 'Long St', 'Building 401', '8001'),
('ADD041', 'UAE', 'Dubai', 'Dubai', 'Sheikh Zayed Road', 'Building 102', '00000'),
('ADD042', 'UAE', 'Abu Dhabi', 'Abu Dhabi', 'Corniche Road', 'Building 202', '00000'),
('ADD043', 'Singapore', 'Singapore', 'Singapore', 'Orchard Road', 'Building 101', '238801'),
('ADD044', 'New Zealand', 'Auckland', 'Auckland', 'Queen St', 'Building 201', '1010'),
('ADD045', 'Russia', 'Moscow', 'Moscow', 'Tverskaya St', 'Building 301', '125009'),
('ADD046', 'Russia', 'Saint Petersburg', 'Saint Petersburg', 'Nevsky Prospekt', 'Building 401', '191025'),
('ADD047', 'Netherlands', 'North Holland', 'Amsterdam', 'Damrak', 'Building 101', '1012'),
('ADD048', 'Netherlands', 'South Holland', 'Rotterdam', 'Coolsingel', 'Building 201', '3011'),
('ADD049', 'Sweden', 'Stockholm', 'Stockholm', 'Drottninggatan', 'Building 301', '11144'),
('ADD050', 'Norway', 'Oslo', 'Oslo', 'Karl Johans gate', 'Building 401', '0164'),
('ADD051', 'Denmark', 'Copenhagen', 'Copenhagen', 'Strøget', 'Building 102', '1552'),
('ADD052', 'Belgium', 'Brussels', 'Brussels', 'Rue Neuve', 'Building 202', '1000'),
('ADD053', 'Austria', 'Vienna', 'Vienna', 'Mariahilfer Strasse', 'Building 302', '1070'),
('ADD054', 'Switzerland', 'Zurich', 'Zurich', 'Bahnhofstrasse', 'Building 402', '8001'),
('ADD055', 'Greece', 'Attica', 'Athens', 'Ermou St', 'Building 501', '10563'),
('ADD056', 'Turkey', 'Istanbul', 'Istanbul', 'Istiklal Avenue', 'Building 601', '34433'),
('ADD057', 'Argentina', 'Buenos Aires', 'Buenos Aires', 'Florida St', 'Building 101', 'C1005'),
('ADD058', 'Chile', 'Santiago', 'Santiago', 'Avenida Libertador', 'Building 202', '8340518'),
('ADD059', 'Colombia', 'Bogota', 'Bogota', 'Carrera 7', 'Building 301', '110311'),
('ADD060', 'Peru', 'Lima', 'Lima', 'Avenida Arequipa', 'Building 401', '15046'),
('ADD061', 'Malaysia', 'Kuala Lumpur', 'Kuala Lumpur', 'Jalan Bukit Bintang', 'Building 102', '55100'),
('ADD062', 'Indonesia', 'Jakarta', 'Jakarta', 'Jalan MH Thamrin', 'Building 202', '10310'),
('ADD063', 'Thailand', 'Bangkok', 'Bangkok', 'Sukhumvit Road', 'Building 302', '10110'),
('ADD064', 'Vietnam', 'Hanoi', 'Hanoi', 'Nguyen Hue', 'Building 401', '100000'),
('ADD065', 'Philippines', 'Manila', 'Manila', 'Roxas Blvd', 'Building 501', '1000'),
('ADD066', 'South Korea', 'Seoul', 'Seoul', 'Gangnam-daero', 'Building 601', '06060'),
('ADD067', 'Taiwan', 'Taipei', 'Taipei', 'Zhongxiao East Road', 'Building 101', '11051'),
('ADD068', 'Hong Kong', 'Hong Kong', 'Central', 'Queens Road Central', 'Building 201', '00000'),
('ADD069', 'Egypt', 'Cairo', 'Cairo', 'Tahrir Square', 'Building 301', '11511'),
('ADD070', 'Saudi Arabia', 'Riyadh', 'Riyadh', 'Olaya St', 'Building 401', '12241'),
('ADD071', 'Israel', 'Tel Aviv', 'Tel Aviv', 'Dizengoff St', 'Building 501', '63117'),
('ADD072', 'Pakistan', 'Sindh', 'Karachi', 'Shahrah-e-Faisal', 'Building 601', '75530'),
('ADD073', 'Bangladesh', 'Dhaka', 'Dhaka', 'Gulshan Avenue', 'Building 101', '1212'),
('ADD074', 'Nigeria', 'Lagos', 'Lagos', 'Awolowo Road', 'Building 201', '101233'),
('ADD075', 'Kenya', 'Nairobi', 'Nairobi', 'Moi Avenue', 'Building 301', '00100'),
('ADD076', 'Ghana', 'Accra', 'Accra', 'Oxford St', 'Building 401', '00233'),
('ADD077', 'Morocco', 'Casablanca', 'Casablanca', 'Boulevard Zerktouni', 'Building 501', '20000'),
('ADD078', 'Algeria', 'Algiers', 'Algiers', 'Didouche Mourad', 'Building 601', '16000'),
('ADD079', 'Tunisia', 'Tunis', 'Tunis', 'Avenue Habib Bourguiba', 'Building 101', '1000'),
('ADD080', 'Portugal', 'Lisbon', 'Lisbon', 'Avenida da Liberdade', 'Building 201', '1250-144'),
('ADD081', 'Ireland', 'Dublin', 'Dublin', 'O Connell St', 'Building 301', 'D01'),
('ADD082', 'Finland', 'Helsinki', 'Helsinki', 'Mannerheimintie', 'Building 401', '00100'),
('ADD083', 'Poland', 'Warsaw', 'Warsaw', 'Nowy Świat', 'Building 501', '00-497'),
('ADD084', 'Czech Republic', 'Prague', 'Prague', 'Wenceslas Square', 'Building 601', '11000'),
('ADD085', 'Hungary', 'Budapest', 'Budapest', 'Andrássy Avenue', 'Building 101', '1061'),
('ADD086', 'Romania', 'Bucharest', 'Bucharest', 'Calea Victoriei', 'Building 201', '010082'),
('ADD087', 'Slovakia', 'Bratislava', 'Bratislava', 'Štúrova Street', 'Building 301', '81102'),
('ADD088', 'Bulgaria', 'Sofia', 'Sofia', 'Vitosha Boulevard', 'Building 401', '1000'),
('ADD089', 'Croatia', 'Zagreb', 'Zagreb', 'Ilica Street', 'Building 501', '10000'),
('ADD090', 'Serbia', 'Belgrade', 'Belgrade', 'Knez Mihailova', 'Building 601', '11000'),
('ADD091', 'Slovenia', 'Ljubljana', 'Ljubljana', 'Čop Street', 'Building 101', '1000'),
('ADD092', 'Estonia', 'Tallinn', 'Tallinn', 'Viru Street', 'Building 201', '10111'),
('ADD093', 'Latvia', 'Riga', 'Riga', 'Brīvības Street', 'Building 301', '1010'),
('ADD094', 'Lithuania', 'Vilnius', 'Vilnius', 'Gedimino Avenue', 'Building 401', '01103'),
('ADD095', 'Iceland', 'Reykjavik', 'Reykjavik', 'Laugavegur', 'Building 501', '101'),
('ADD096', 'Luxembourg', 'Luxembourg', 'Luxembourg', 'Grand Rue', 'Building 601', 'L-1011'),
('ADD097', 'Monaco', 'Monaco', 'Monaco', 'Avenue de Monte-Carlo', 'Building 101', '98000'),
('ADD098', 'Liechtenstein', 'Vaduz', 'Vaduz', 'Städtle', 'Building 201', '9490'),
('ADD099', 'Malta', 'Valletta', 'Valletta', 'Republic Street', 'Building 301', 'VLT 1112'),
('ADD100', 'Andorra', 'Andorra la Vella', 'Andorra la Vella', 'Avinguda Meritxell', 'Building 401', 'AD500');
UNLOCK TABLES;

-- Insert data into 'Customer'
LOCK TABLES `Customer` WRITE;
INSERT INTO Customer (CustomerID, CustomerFirstName, CustomerLastName, DOB, Gender, AddressID) VALUES
('CU001', 'Alice', 'Johnson', '1985-04-15 00:00:00', 'F', 'ADD041'),
('CU002', 'Bob', 'Williams', '1987-08-23 00:00:00', 'M', 'ADD042'),
('CU003', 'Charlie', 'Brown', '1990-05-10 00:00:00', 'M', 'ADD043'),
('CU004', 'David', 'Smith', '1992-11-02 00:00:00', 'M', 'ADD044'),
('CU005', 'Eve', 'Miller', '1994-07-18 00:00:00', 'F', 'ADD045'),
('CU006', 'Frank', 'Moore', '1986-09-25 00:00:00', 'M', 'ADD046'),
('CU007', 'Grace', 'Taylor', '1991-03-12 00:00:00', 'F', 'ADD047'),
('CU008', 'Henry', 'Anderson', '1988-06-30 00:00:00', 'M', 'ADD048'),
('CU009', 'Isla', 'Thomas', '1993-01-22 00:00:00', 'F', 'ADD049'),
('CU010', 'Jack', 'Jackson', '1984-10-05 00:00:00', 'M', 'ADD050'),
('CU011', 'Karen', 'White', '1995-12-15 00:00:00', 'F', 'ADD051'),
('CU012', 'Liam', 'Harris', '1983-02-18 00:00:00', 'M', 'ADD052'),
('CU013', 'Mia', 'Martin', '1992-04-09 00:00:00', 'F', 'ADD053'),
('CU014', 'Noah', 'Garcia', '1989-09-29 00:00:00', 'M', 'ADD054'),
('CU015', 'Olivia', 'Martinez', '1990-11-11 00:00:00', 'F', 'ADD055'),
('CU016', 'Paul', 'Davis', '1993-08-17 00:00:00', 'M', 'ADD056'),
('CU017', 'Quinn', 'Rodriguez', '1987-12-03 00:00:00', 'M', 'ADD057'),
('CU018', 'Rose', 'Martinez', '1994-02-22 00:00:00', 'F', 'ADD058'),
('CU019', 'Sam', 'Clark', '1986-07-07 00:00:00', 'M', 'ADD059'),
('CU020', 'Tina', 'Lewis', '1991-05-29 00:00:00', 'F', 'ADD060');
UNLOCK TABLES;

-- Sample data for email list
 INSERT INTO Email_List (ToCustomer, Subject, Body, SendDate) VALUES 
-- Renewal Reminders 
('CU001', 'Your Subscription Renewal is Coming Up', 'It’s time to renew your subscription to continue enjoying our services.', '2024-01-10'), 
('CU002', 'Your Subscription Renewal is Coming Up', 'It’s time to renew your subscription to continue enjoying our services.', '2024-02-15'), 
('CU003', 'Your Subscription Renewal is Coming Up', 'It’s time to renew your subscription to continue enjoying our services.', '2024-03-20'), 
('CU004','Your Subscription Renewal is Coming Up', 'It’s time to renew your subscription to continue enjoying our services.', '2024-04-01'), 
('CU005', 'Your Subscription Renewal is Coming Up', 'It’s time to renew your subscription to continue enjoying our services.', '2024-05-05'), 
-- Birthday Greetings 
('CU006', 'Happy Birthday from All of Us!', 'We hope you have a wonderful day filled with joy and happiness!', '2024-06-10'), 
('CU007', 'Happy Birthday from All of Us!', 'We hope you have a wonderful day filled with joy and happiness!', '2024-07-15'), 
('CU008', 'Happy Birthday from All of Us!', 'We hope you have a wonderful day filled with joy and happiness!', '2024-08-20'), 
('CU009', 'Happy Birthday from All of Us!', 'We hope you have a wonderful day filled with joy and happiness!', '2024-09-01'), 
('CU010','Happy Birthday from All of Us!', 'We hope you have a wonderful day filled with joy and happiness!', '2024-10-05'), 
-- Re-engagement Emails for Customers Inactive for a Long Time 
('CU011',  'We’ve Missed You!', 'We’d love to welcome you back with an exclusive offer just for you.', '2024-01-10'), 
('CU012', 'We’ve Missed You!', 'We’d love to welcome you back with an exclusive offer just for you.', '2024-02-15'), 
('CU013',  'We’ve Missed You!', 'We’d love to welcome you back with an exclusive offer just for you.', '2024-03-20'), 
('CU014', 'We’ve Missed You!', 'We’d love to welcome you back with an exclusive offer just for you.', '2024-04-01'), 
('CU015', 'We’ve Missed You!', 'We’d love to welcome you back with an exclusive offer just for you.', '2024-05-05');

-- Sample insert values for Subscription table
INSERT INTO Subscription (SubscriptionID, CustomerID, SubscriptionType, StartDate, EndDate, Status, RenewalPeriod, Cost) VALUES
('SUB001', 'CU001', 'Basic', '2023-01-15', '2024-01-15', 'Active', 'Annually', 120.00),
('SUB002', 'CU002', 'Standard', '2023-03-01', NULL, 'Active', 'Monthly', 15.00),
('SUB003', 'CU003', 'Premium', '2023-02-10', '2024-02-10', 'Paused', 'Annually', 200.00),
('SUB004', 'CU004', 'Basic', '2023-05-20', NULL, 'Active', 'Quarterly', 30.00),
('SUB005', 'CU005', 'Standard', '2023-07-01', '2024-07-01', 'Cancelled', 'Annually', 150.00),
('SUB006', 'CU006', 'Premium', '2023-08-15', NULL, 'Active', 'Monthly', 25.00),
('SUB007', 'CU007', 'Basic', '2023-09-05', NULL, 'Active', 'Monthly', 10.00),
('SUB008', 'CU008', 'Standard', '2023-06-15', '2023-12-15', 'Cancelled', 'Quarterly', 45.00),
('SUB009', 'CU009', 'Premium', '2023-11-01', NULL, 'Active', 'Monthly', 40.00),
('SUB010', 'CU010', 'Basic', '2023-04-10', NULL, 'Paused', 'Quarterly', 20.00);

-- Insert data into 'Review'
LOCK TABLES `Review` WRITE;
INSERT INTO `Review` (ReviewID, Rating, status, Comment) VALUES
('RV001', 5, '5', 'Excellent product, highly recommended!'),
('RV002', 4, '4', 'Great quality, but a bit expensive.'),
('RV003', 3, '3', 'Average, could be better.'),
('RV004', 5, '5', 'Fantastic service and fast shipping.'),
('RV005', 2, '2', 'Not satisfied, the product was damaged.'),
('RV006', 1, '1', 'Terrible, would not recommend.'),
('RV007', 4, '4', 'Good overall, but shipping was slow.'),
('RV008', 5, '5', 'Loved it! Will definitely buy again.'),
('RV009', 3, '3', 'Decent product for the price.'),
('RV010', 4, '4', 'Very good, meets expectations.'),
('RV011', 5, '5', 'Amazing quality, exceeded expectations!'),
('RV012', 2, '2', 'Disappointed, didn’t match the description.'),
('RV013', 3, '3', 'Okay product, but room for improvement.'),
('RV014', 1, '1', 'Very poor quality, not worth it.'),
('RV015', 4, '4', 'Solid product, would recommend.'),
('RV016', 5, '5', 'Absolutely love this! Great value.'),
('RV017', 2, '2', 'Product was broken upon arrival.'),
('RV018', 1, '1', 'Horrible experience, will not order again.'),
('RV019', 4, '4', 'Good quality but could be cheaper.'),
('RV020', 5, '5', 'Top-notch, will recommend to friends.');
UNLOCK TABLES;

-- Insert data into 'Discount'
LOCK TABLES `Discount` WRITE;
INSERT INTO `Discount` (DiscountID, Discountrate) VALUES
('DIS001',  0.10),
('DIS002',  0.15),
('DIS003',  0.20),
('DIS004',  0.05),
('DIS005',  0.25);
UNLOCK TABLES;

-- Dump Data into table 'Category'
LOCK TABLES `Category` WRITE;
INSERT INTO Category (CategoryID, Category, SubCategory, Description) VALUES
('CAT001', 'Smartphones', 'Mobile Devices', 'Latest smartphones with advanced features.'),
('CAT002', 'Laptops', 'Computers', 'High-performance laptops for professionals.'),
('CAT003', 'Audio Devices', 'Electronics', 'Quality headphones and speakers.'),
('CAT004', 'Kitchen Appliances', 'Home Goods', 'Essential appliances for cooking.'),
('CAT005', 'Wearables', 'Electronics', 'Smartwatches and fitness trackers.'),
('CAT006', 'Cleaning Appliances', 'Home Goods', 'Efficient vacuums and cleaning tools.'),
('CAT007', 'Microwaves', 'Kitchen Appliances', 'Quick cooking solutions.'),
('CAT008', 'Coffee Machines', 'Kitchen Appliances', 'Brew your favorite coffee at home.'),
('CAT009', 'Kettles', 'Kitchen Appliances', 'Electric kettles for boiling water.'),
('CAT010', 'Air Conditioners', 'Home Appliances', 'Cool your space efficiently.'),
('CAT011', 'Refrigerators', 'Home Appliances', 'Keep your food fresh.'),
('CAT012', 'Televisions', 'Electronics', 'High-definition TVs for entertainment.'),
('CAT013', 'Gaming Consoles', 'Entertainment', 'Latest gaming devices for fun.'),
('CAT014', 'Networking Devices', 'Electronics', 'Routers and modems for connectivity.'),
('CAT015', 'Tablets', 'Computers', 'Portable devices for work and play.'),
('CAT016', 'Washing Machines', 'Home Appliances', 'Efficient laundry solutions.'),
('CAT017', 'Hair Dryers', 'Personal Care', 'Quick-drying solutions for hair.'),
('CAT018', 'Printers', 'Office Supplies', 'High-quality printers for home and office.'),
('CAT019', 'Cameras', 'Photography', 'Capture your moments with quality cameras.'),
('CAT020', 'Fitness Trackers', 'Wearables', 'Monitor your health and fitness.');
UNLOCK TABLES;

-- Insert data into 'Payment'
LOCK TABLES `Payment` WRITE;
INSERT INTO `Payment` (PaymentID, Paymentmethod, Paymentdate) VALUES
('PAY001', 'CreditCard', '2024-01-01 09:30:00'),
('PAY002', 'Cash', '2024-01-02 11:00:00'),
('PAY003', 'DebitCard', '2024-01-03 14:15:00'),
('PAY004', 'CreditCard', '2024-01-04 16:45:00'),
('PAY005', 'Cash', '2024-01-05 08:30:00'),
('PAY006', 'DebitCard', '2024-02-06 10:00:00'),
('PAY007', 'CreditCard', '2024-02-07 12:30:00'),
('PAY008', 'Cash', '2024-02-08 15:45:00'),
('PAY009', 'DebitCard', '2024-02-09 13:00:00'),
('PAY010', 'CreditCard', '2024-02-10 17:15:00'),
('PAY011', 'Cash', '2024-03-11 09:45:00'),
('PAY012', 'DebitCard', '2024-03-12 11:30:00'),
('PAY013', 'CreditCard', '2024-03-13 13:00:00'),
('PAY014', 'Cash', '2024-03-14 10:15:00'),
('PAY015', 'DebitCard', '2024-03-15 14:00:00'),
('PAY016', 'CreditCard', '2024-04-16 16:30:00'),
('PAY017', 'Cash', '2024-04-17 09:00:00'),
('PAY018', 'DebitCard', '2024-04-18 12:45:00'),
('PAY019', 'CreditCard', '2024-05-19 15:00:00'),
('PAY020', 'Cash', '2024-05-20 16:30:00');
UNLOCK TABLES;

-- Insert data into 'Employee'
LOCK TABLES `Employee` WRITE;
INSERT INTO Employee (EmployeeID, EmpFirstName, EmpLastName, DOB, Gender, Reportsto, AddressID) VALUES
('EMP001', 'John', 'Doe', '1985-04-12 00:00:00', 'M', NULL, 'ADD021'),
('EMP002', 'Jane', 'Smith', '1990-06-24 00:00:00', 'F', 'EMP001', 'ADD022'),
('EMP003', 'Mark', 'Johnson', '1983-03-15 00:00:00', 'M', 'EMP001', 'ADD023'),
('EMP004', 'Lucy', 'Brown', '1992-08-19 00:00:00', 'F', 'EMP002', 'ADD024'),
('EMP005', 'Mike', 'Davis', '1987-12-05 00:00:00', 'M', 'EMP003', 'ADD025'),
('EMP006', 'Emily', 'Clark', '1995-09-12 00:00:00', 'F', 'EMP003', 'ADD026'),
('EMP007', 'David', 'Wilson', '1989-07-01 00:00:00', 'M', 'EMP004', 'ADD027'),
('EMP008', 'Sarah', 'Lewis', '1993-11-18 00:00:00', 'F', 'EMP005', 'ADD028'),
('EMP009', 'Tom', 'Walker', '1986-02-09 00:00:00', 'M', 'EMP006', 'ADD029'),
('EMP010', 'Anna', 'Hall', '1991-05-27 00:00:00', 'F', 'EMP007', 'ADD030'),
('EMP011', 'James', 'King', '1984-10-16 00:00:00', 'M', 'EMP008', 'ADD031'),
('EMP012', 'Grace', 'Scott', '1988-01-03 00:00:00', 'F', 'EMP009', 'ADD032'),
('EMP013', 'Henry', 'Adams', '1990-08-08 00:00:00', 'M', 'EMP010', 'ADD033'),
('EMP014', 'Sophia', 'Evans', '1994-03-21 00:00:00', 'F', 'EMP011', 'ADD034'),
('EMP015', 'Paul', 'Baker', '1982-09-09 00:00:00', 'M', 'EMP012', 'ADD035'),
('EMP016', 'Laura', 'Mitchell', '1991-12-28 00:00:00', 'F', 'EMP013', 'ADD036'),
('EMP017', 'Brian', 'Roberts', '1987-04-06 00:00:00', 'M', 'EMP014', 'ADD037'),
('EMP018', 'Emma', 'Turner', '1993-07-15 00:00:00', 'F', 'EMP015', 'ADD038'),
('EMP019', 'Chris', 'Garcia', '1992-11-23 00:00:00', 'M', 'EMP016', 'ADD039'),
('EMP020', 'Eva', 'Martinez', '1985-05-11 00:00:00', 'F', 'EMP017', 'ADD040');
UNLOCK TABLES;

-- Insert data into 'Department'
LOCK TABLES `Department` WRITE;
INSERT INTO Department (DepartmentID, DepartmentName, EmployeeID, Manager) VALUES
('DEP001', 'Sales', 'EMP001', 'EMP001'), -- Manager
('DEP001', 'Sales', 'EMP006', 'EMP001'),
('DEP001', 'Sales', 'EMP011', 'EMP001'),
('DEP001', 'Sales', 'EMP016', 'EMP001'),

('DEP002', 'HR', 'EMP002', 'EMP002'), -- Manager
('DEP002', 'HR', 'EMP007', 'EMP002'),
('DEP002', 'HR', 'EMP012', 'EMP002'),
('DEP002', 'HR', 'EMP017', 'EMP002'),

('DEP003', 'IT', 'EMP003', 'EMP003'), -- Manager
('DEP003', 'IT', 'EMP008', 'EMP003'),
('DEP003', 'IT', 'EMP013', 'EMP003'),
('DEP003', 'IT', 'EMP018', 'EMP003'),

('DEP004', 'Marketing', 'EMP004', 'EMP004'), -- Manager
('DEP004', 'Marketing', 'EMP009', 'EMP004'),
('DEP004', 'Marketing', 'EMP014', 'EMP004'),
('DEP004', 'Marketing', 'EMP019', 'EMP004'),

('DEP005', 'Finance', 'EMP005', 'EMP005'), -- Manager
('DEP005', 'Finance', 'EMP010', 'EMP005'),
('DEP005', 'Finance', 'EMP015', 'EMP005'),
('DEP005', 'Finance', 'EMP020', 'EMP005');
UNLOCK TABLES;

-- Insert data into 'Supplier'
LOCK TABLES `Supplier` WRITE;
INSERT INTO Supplier (SupplierID, SupplierName, EmployeeID, AddressID) VALUES
('SUP001', 'TechGear', 'EMP001', 'ADD001'),
('SUP002', 'GizmoPro', 'EMP002', 'ADD002'),
('SUP003', 'EcoElectro', 'EMP003', 'ADD003'),
('SUP004', 'SmartHomeCo', 'EMP004', 'ADD004'),
('SUP005', 'FitTech', 'EMP005', 'ADD005'),
('SUP006', 'CleanSweep', 'EMP006', 'ADD006'),
('SUP007', 'KitchenMaster', 'EMP007', 'ADD007'),
('SUP008', 'BrewEssentials', 'EMP008', 'ADD008'),
('SUP009', 'QuickBoil', 'EMP009', 'ADD009'),
('SUP010', 'CoolBreeze', 'EMP010', 'ADD010'),
('SUP011', 'FreshFridge', 'EMP011', 'ADD011'),
('SUP012', 'VisionWorld', 'EMP012', 'ADD012'),
('SUP013', 'GameSphere', 'EMP013', 'ADD013'),
('SUP014', 'ConnectNet', 'EMP014', 'ADD014'),
('SUP015', 'TabUniverse', 'EMP015', 'ADD015'),
('SUP016', 'WashMate', 'EMP016', 'ADD016'),
('SUP017', 'StyleBlow', 'EMP017', 'ADD017'),
('SUP018', 'PrintSmart', 'EMP018', 'ADD018'),
('SUP019', 'CaptureMoments', 'EMP019', 'ADD019'),
('SUP020', 'HealthTrack', 'EMP020', 'ADD020');
UNLOCK TABLES;

-- Insert data into 'Admin'
LOCK TABLES `Admin` WRITE;
-- Customer Admins
INSERT INTO Admin (UserID, CustomerID, SupplierID, EmployeeID, Password, Usertype) VALUES
('ADM001', 'CU001', NULL, NULL, 'P@ssw0rd01!', 'Customer'),
('ADM002', 'CU002', NULL, NULL, 'XyZ9kLm#23', 'Customer'),
('ADM003', 'CU003', NULL, NULL, 'R@nd0mP@ss3', 'Customer'),
('ADM004', 'CU004', NULL, NULL, 'Secur3P@ssw4', 'Customer'),
('ADM005', 'CU005', NULL, NULL, 'AbCdEfG5@2!', 'Customer'),
('ADM006', 'CU006', NULL, NULL, 'Passw!rd88$k', 'Customer'),
('ADM007', 'CU007', NULL, NULL, 'Myp@ssw0rd77!', 'Customer'),
('ADM008', 'CU008', NULL, NULL, 'B3tterP@ss55!', 'Customer'),
('ADM009', 'CU009', NULL, NULL, 'C0mpl3xP@ss66', 'Customer'),
('ADM010', 'CU010', NULL, NULL, 'D3f@ultP@ss90', 'Customer'),
('ADM011', 'CU011', NULL, NULL, 'Unbr3ak@ble33', 'Customer'),
('ADM012', 'CU012', NULL, NULL, 'G00dP@ssw22!', 'Customer'),
('ADM013', 'CU013', NULL, NULL, 'R@nd!mT0ken99', 'Customer'),
('ADM014', 'CU014', NULL, NULL, 'Cust@1234Pass', 'Customer'),
('ADM015', 'CU015', NULL, NULL, 'ZyXwV4p@r', 'Customer'),
('ADM016', 'CU016', NULL, NULL, 'F@5tF0xC0d3', 'Customer'),
('ADM017', 'CU017', NULL, NULL, 'Qw3Rt9x#1!2', 'Customer'),
('ADM018', 'CU018', NULL, NULL, 'Cust#Secur#P2', 'Customer'),
('ADM019', 'CU019', NULL, NULL, 'L@xyM9ty#4P', 'Customer'),
('ADM020', 'CU020', NULL, NULL, 'RandT@kenP@ss!', 'Customer'),

-- Supplier Admins
('ADM021', NULL, 'SUP001', NULL, 'SuppL1erP@ss99', 'Supplier'),
('ADM022', NULL, 'SUP002', NULL, 'TrusT3dSupP@22', 'Supplier'),
('ADM023', NULL, 'SUP003', NULL, 'EasyP@ssW0rkz', 'Supplier'),
('ADM024', NULL, 'SUP004', NULL, 'BestS@pplier55!', 'Supplier'),
('ADM025', NULL, 'SUP005', NULL, 'S@plyP@55Mst99', 'Supplier'),
('ADM026', NULL, 'SUP006', NULL, 'Sup#KeyP@ss88!', 'Supplier'),
('ADM027', NULL, 'SUP007', NULL, 'WareHous3#33!', 'Supplier'),
('ADM028', NULL, 'SUP008', NULL, 'N3tw0rkSup#Pass', 'Supplier'),
('ADM029', NULL, 'SUP009', NULL, 'Partn3rPass!77', 'Supplier'),
('ADM030', NULL, 'SUP010', NULL, 'G00dsSup!#123', 'Supplier'),
('ADM031', NULL, 'SUP011', NULL, 'S@f3Guard77$', 'Supplier'),
('ADM032', NULL, 'SUP012', NULL, 'M@rk3tingS@p77', 'Supplier'),
('ADM033', NULL, 'SUP013', NULL, 'V3ndorP@ss44#', 'Supplier'),
('ADM034', NULL, 'SUP014', NULL, 'Link3dSupP@33', 'Supplier'),
('ADM035', NULL, 'SUP015', NULL, 'SuppMngr99#0', 'Supplier'),
('ADM036', NULL, 'SUP016', NULL, '3xt3rnalSup2!', 'Supplier'),
('ADM037', NULL, 'SUP017', NULL, 'LogisTicP@ss33', 'Supplier'),
('ADM038', NULL, 'SUP018', NULL, 'V3ndP@55Y@99', 'Supplier'),
('ADM039', NULL, 'SUP019', NULL, 'Inv3nt0ryPass!', 'Supplier'),
('ADM040', NULL, 'SUP020', NULL, 'SupFinalX#33!', 'Supplier'),

-- Employee Admins
('ADM041', NULL, NULL, 'EMP001', 'EmpPassWord!44', 'Employee'),
('ADM042', NULL, NULL, 'EMP002', 'XxT0k3nL!nk33', 'Employee'),
('ADM043', NULL, NULL, 'EMP003', 'WrkzM@rk3tPass', 'Employee'),
('ADM044', NULL, NULL, 'EMP004', 'Org@P@ssTr44k', 'Employee'),
('ADM045', NULL, NULL, 'EMP005', 'Adm!Pass88Key', 'Employee'),
('ADM046', NULL, NULL, 'EMP006', 'WrkP@ssw0rd45!', 'Employee'),
('ADM047', NULL, NULL, 'EMP007', 'OffcT@skP@33', 'Employee'),
('ADM048', NULL, NULL, 'EMP008', '3mpl0yeePass!@', 'Employee'),
('ADM049', NULL, NULL, 'EMP009', 'W3llSecur3P@ss', 'Employee'),
('ADM050', NULL, NULL, 'EMP010', 'InTern@lAdm@99', 'Employee'),
('ADM051', NULL, NULL, 'EMP011', 'D@ilyTaskP@ss44', 'Employee'),
('ADM052', NULL, NULL, 'EMP012', 'Proj3ctT@sk!66', 'Employee'),
('ADM053', NULL, NULL, 'EMP013', 'D@ilyWrkT@sk22', 'Employee'),
('ADM054', NULL, NULL, 'EMP014', 'WrkAdm#Pass66', 'Employee'),
('ADM055', NULL, NULL, 'EMP015', 'T3amL3ader#Pass', 'Employee'),
('ADM056', NULL, NULL, 'EMP016', 'R@p0rt3rP@ss98!', 'Employee'),
('ADM057', NULL, NULL, 'EMP017', 'Perf0rm3rAdm22!', 'Employee'),
('ADM058', NULL, NULL, 'EMP018', 'T@rg3tAdminKey!', 'Employee'),
('ADM059', NULL, NULL, 'EMP019', 'MngmntP@ssTsk12', 'Employee'),
('ADM060', NULL, NULL, 'EMP020', 'WrkF0rc3P@ss99!', 'Employee');
UNLOCK TABLES;


-- Insert data into 'Warehouse'
LOCK TABLES `Warehouse` WRITE;
INSERT INTO Warehouse (WarehouseID, AddressID) VALUES
('WA001', 'ADD061'),
('WA002', 'ADD062'),
('WA003', 'ADD063'),
('WA004', 'ADD064'),
('WA005', 'ADD065'),
('WA006', 'ADD066'),
('WA007', 'ADD067'),
('WA008', 'ADD068'),
('WA009', 'ADD069'),
('WA010', 'ADD070'),
('WA011', 'ADD071'),
('WA012', 'ADD072'),
('WA013', 'ADD073'),
('WA014', 'ADD074'),
('WA015', 'ADD075'),
('WA016', 'ADD076'),
('WA017', 'ADD077'),
('WA018', 'ADD078'),
('WA019', 'ADD079'),
('WA020', 'ADD080');
UNLOCK TABLES;

-- Insert data into 'Store'
LOCK TABLES `Store` WRITE;
INSERT INTO Store (StoreID, StoreName, EmployeeID, AddressID) VALUES
('ST001', 'StoreA', 'EMP001', 'ADD081'),
('ST002', 'StoreB', 'EMP006', 'ADD082'),
('ST003', 'StoreC', 'EMP011', 'ADD083'),
('ST004', 'StoreD', 'EMP016', 'ADD084'),
('ST005', 'StoreE', 'EMP001', 'ADD085'),
('ST006', 'StoreF', 'EMP006', 'ADD086'),
('ST007', 'StoreG', 'EMP011', 'ADD087'),
('ST008', 'StoreH', 'EMP016', 'ADD088'),
('ST009', 'StoreI', 'EMP001', 'ADD089'),
('ST010', 'StoreJ', 'EMP006', 'ADD090'),
('ST011', 'StoreK', 'EMP011', 'ADD091'),
('ST012', 'StoreL', 'EMP016', 'ADD092'),
('ST013', 'StoreM', 'EMP001', 'ADD093'),
('ST014', 'StoreN', 'EMP006', 'ADD094'),
('ST015', 'StoreO', 'EMP011', 'ADD095'),
('ST016', 'StoreP', 'EMP016', 'ADD096'),
('ST017', 'StoreQ', 'EMP001', 'ADD097'),
('ST018', 'StoreR', 'EMP006', 'ADD098'),
('ST019', 'StoreS', 'EMP011', 'ADD099'),
('ST020', 'StoreT', 'EMP016', 'ADD100');
UNLOCK TABLES;

-- Insert data into 'Inventory'
LOCK TABLES `Inventory` WRITE;
INSERT INTO Inventory (InventoryID, WarehouseID, StoreID, Amount) VALUES
('INV001', 'WA001', 'ST001', '100'),
('INV002', 'WA001', 'ST002', '200'),
('INV003', 'WA001', 'ST003', '150'),
('INV004', 'WA002', 'ST001', '120'),
('INV005', 'WA002', 'ST004', '250'),
('INV006', 'WA002', 'ST005', '300'),
('INV007', 'WA003', 'ST002', '80'),
('INV008', 'WA003', 'ST006', '180'),
('INV009', 'WA003', 'ST007', '220'),
('INV010', 'WA004', 'ST003', '90'),
('INV011', 'WA004', 'ST008', '210'),
('INV012', 'WA005', 'ST004', '170'),
('INV013', 'WA005', 'ST009', '190'),
('INV014', 'WA006', 'ST005', '130'),
('INV015', 'WA006', 'ST010', '260'),
('INV016', 'WA007', 'ST006', '140'),
('INV017', 'WA007', 'ST011', '110'),
('INV018', 'WA008', 'ST007', '300'),
('INV019', 'WA008', 'ST012', '160'),
('INV020', 'WA009', 'ST008', '200');
UNLOCK TABLES;

-- Insert data into 'Product'
LOCK TABLES `Product` WRITE;
INSERT INTO Product (ProductID, CategoryID, Itemname, Price, SupplierID, InventoryID) VALUES
('PD001', 'CAT001', 'Galaxy S30 Ultra Smartphone', '131.52', 'SUP001', 'INV001'),
('PD002', 'CAT002', 'MacBook Pro M1 Laptop', '167.37', 'SUP002', 'INV002'),
('PD003', 'CAT003', 'Noise Cancelling Headphones X5', '54.69', 'SUP003', 'INV003'),
('PD004', 'CAT004', 'Ninja Professional Blender', '12.01', 'SUP004', 'INV004'),
('PD005', 'CAT005', 'Fitbit Sense Smartwatch', '86.63', 'SUP001', 'INV005'),
('PD006', 'CAT006', 'Dyson V15 Vacuum Cleaner', '233.14', 'SUP005', 'INV006'),
('PD007', 'CAT007', 'Samsung Smart Microwave Oven', '251.38', 'SUP004', 'INV007'),
('PD008', 'CAT008', 'Keurig K-Duo Coffee Maker', '171.02', 'SUP006', 'INV008'),
('PD009', 'CAT009', 'Hamilton Beach Electric Kettle', '55.19', 'SUP007', 'INV009'),
('PD010', 'CAT010', 'LG Dual Inverter Air Conditioner', '173.93', 'SUP008', 'INV010'),
('PD011', 'CAT011', 'Whirlpool Double Door Refrigerator', '467.95', 'SUP008', 'INV011'),
('PD012', 'CAT012', 'Sony 55-inch 4K Television', '449.25', 'SUP009', 'INV012'),
('PD013', 'CAT013', 'PlayStation 5 Gaming Console', '325.89', 'SUP009', 'INV013'),
('PD014', 'CAT014', 'Netgear Nighthawk Router', '36.73', 'SUP010', 'INV014'),
('PD015', 'CAT015', 'iPad Pro 12.9-inch Tablet', '195.26', 'SUP002', 'INV015'),
('PD016', 'CAT016', 'LG Turbo Washing Machine', '140.73', 'SUP011', 'INV016'),
('PD017', 'CAT017', 'Revlon One-Step Hair Dryer', '198.60', 'SUP012', 'INV017'),
('PD018', 'CAT018', 'HP Envy Wireless Printer', '57.39', 'SUP013', 'INV018'),
('PD019', 'CAT019', 'Canon EOS R5 Mirrorless Camera', '360.39', 'SUP013', 'INV019'),
('PD020', 'CAT020', 'Garmin Venu 2 Fitness Tracker', '431.64', 'SUP014', 'INV020');
UNLOCK TABLES;

-- Insert data into 'Shipment'
LOCK TABLES `Shipment` WRITE;

INSERT INTO Shipment (ShipmentID, WarehouseID, CustomerID, Shipdate, Deliverydate) 
VALUES 
('SH001', 'WA001', 'CU001', '2024-01-05 09:00:00', '2024-01-07 16:00:00'),
('SH002', 'WA001', 'CU002', '2024-01-06 10:15:00', '2024-01-08 14:30:00'),
('SH003', 'WA002', 'CU003', '2024-01-07 11:30:00', '2024-01-09 17:00:00'),
('SH004', 'WA002', 'CU004', '2024-01-08 14:45:00', '2024-01-11 10:00:00'),
('SH005', 'WA003', 'CU005', '2024-01-09 16:00:00', '2024-01-11 14:30:00'),
('SH006', 'WA003', 'CU006', '2024-01-10 09:30:00', '2024-01-12 12:00:00'),
('SH007', 'WA004', 'CU007', '2024-01-11 12:45:00', '2024-02-13 16:30:00'),
('SH008', 'WA004', 'CU008', '2024-01-12 08:00:00', '2024-02-14 10:45:00'),
('SH009', 'WA005', 'CU009', '2024-01-13 13:15:00', '2024-02-15 15:30:00'),
('SH010', 'WA005', 'CU010', '2024-01-14 15:30:00', '2024-02-17 12:00:00'),
('SH011', 'WA006', 'CU011', '2024-01-15 10:00:00', '2024-02-17 09:15:00'),
('SH012', 'WA006', 'CU012', '2024-01-16 11:45:00', '2024-03-18 14:00:00'),
('SH013', 'WA007', 'CU013', '2024-01-17 14:00:00', '2024-03-19 17:30:00'),
('SH014', 'WA007', 'CU014', '2024-01-18 09:00:00', '2024-03-20 11:45:00'),
('SH015', 'WA008', 'CU015', '2024-01-19 10:30:00', '2024-03-21 13:30:00'),
('SH016', 'WA008', 'CU016', '2024-01-20 13:00:00', '2024-03-22 15:00:00'),
('SH017', 'WA009', 'CU017', '2024-01-21 15:15:00', '2024-03-24 10:45:00'),
('SH018', 'WA009', 'CU018', '2024-01-22 08:45:00', '2024-04-24 14:30:00'),
('SH019', 'WA001', 'CU019', '2024-01-23 11:00:00', '2024-04-25 13:45:00'),
('SH020', 'WA001', 'CU020', '2024-01-24 12:30:00', '2024-04-26 09:30:00');

UNLOCK TABLES;

-- Insert data into 'Order'
LOCK TABLES `Orders` WRITE;
INSERT INTO `Orders` (OrderID, ShipmentID, CustomerID, DiscountID, EmployeeID, PaymentID, FinalPrice, Order_Date) VALUES
('ORD001', 'SH001', 'CU001', 'DIS001', 'EMP001', 'PAY001', '450.00', '2024-02-01 10:00:00'),
('ORD002', 'SH002', 'CU002', 'DIS002', 'EMP002', 'PAY002', '600.00', '2024-02-02 11:00:00'),
('ORD003', 'SH003', 'CU003', 'DIS003', 'EMP003', 'PAY003', '520.00', '2024-02-03 12:00:00'),
('ORD004', 'SH004', 'CU004', 'DIS004', 'EMP004', 'PAY004', '690.00', '2024-02-04 13:00:00'),
('ORD005', 'SH005', 'CU005', 'DIS005', 'EMP005', 'PAY005', '250.00', '2024-02-05 14:00:00'),
('ORD006', 'SH006', 'CU006', 'DIS001', 'EMP001', 'PAY006', '450.00', '2024-03-06 15:00:00'),
('ORD007', 'SH007', 'CU007', 'DIS002', 'EMP002', 'PAY007', '550.00', '2024-03-07 16:00:00'),
('ORD008', 'SH008', 'CU008', 'DIS003', 'EMP003', 'PAY008', '500.00', '2024-03-08 17:00:00'),
('ORD009', 'SH009', 'CU009', 'DIS004', 'EMP004', 'PAY009', '700.00', '2024-03-09 18:00:00'),
('ORD010', 'SH010', 'CU010', 'DIS005', 'EMP005', 'PAY010', '820.00', '2024-04-10 19:00:00'),
('ORD011', 'SH011', 'CU011', 'DIS001', 'EMP001', 'PAY011', '430.00', '2024-04-11 10:30:00'),
('ORD012', 'SH012', 'CU012', 'DIS002', 'EMP002', 'PAY012', '540.00', '2024-04-12 11:30:00'),
('ORD013', 'SH013', 'CU013', 'DIS003', 'EMP003', 'PAY013', '640.00', '2024-04-13 12:30:00'),
('ORD014', 'SH014', 'CU014', 'DIS004', 'EMP004', 'PAY014', '320.00', '2024-04-14 13:30:00'),
('ORD015', 'SH015', 'CU015', 'DIS005', 'EMP005', 'PAY015', '480.00', '2024-05-15 14:30:00'),
('ORD016', 'SH016', 'CU016', 'DIS001', 'EMP001', 'PAY016', '560.00', '2024-05-16 15:30:00'),
('ORD017', 'SH017', 'CU017', 'DIS002', 'EMP002', 'PAY017', '590.00', '2024-02-17 16:30:00'),
('ORD018', 'SH018', 'CU018', 'DIS003', 'EMP003', 'PAY018', '630.00', '2024-02-18 17:30:00'),
('ORD019', 'SH019', 'CU019', 'DIS004', 'EMP004', 'PAY019', '340.00', '2024-02-19 18:30:00'),
('ORD020', 'SH020', 'CU020', 'DIS005', 'EMP005', 'PAY020', '750.00', '2024-02-20 19:30:00');
UNLOCK TABLES;

-- Insert data into 'OrderItems'
LOCK TABLES `OrderItems` WRITE;
INSERT INTO `OrderItems` (OrderID, ProductID, Quantity, ReviewID) VALUES
-- Order 1
('ORD001', 'PD001', '2', 'RV001'),
('ORD001', 'PD005', '1', 'RV001'),
('ORD001', 'PD010', '3', 'RV001'),
-- Order 2
('ORD002', 'PD003', '1', 'RV002'),
('ORD002', 'PD008', '2', 'RV002'),
('ORD002', 'PD013', '1', 'RV002'),
-- Order 3
('ORD003', 'PD004', '2', 'RV003'),
('ORD003', 'PD007', '1', 'RV003'),
('ORD003', 'PD012', '2', 'RV003'),
-- Order 4
('ORD004', 'PD002', '1', 'RV004'),
('ORD004', 'PD009', '1', 'RV004'),
('ORD004', 'PD018', '3', 'RV004'),
-- Order 5
('ORD005', 'PD001', '1', 'RV005'),
('ORD005', 'PD014', '2', 'RV005'),
('ORD005', 'PD016', '2', 'RV005'),
-- Order 6
('ORD006', 'PD003', '3', 'RV006'),
('ORD006', 'PD017', '1', 'RV006'),
('ORD006', 'PD019', '2', 'RV006'),
-- Order 7
('ORD007', 'PD006', '2', 'RV007'),
('ORD007', 'PD009', '1', 'RV007'),
('ORD007', 'PD011', '1', 'RV007'),
-- Order 8
('ORD008', 'PD002', '1', 'RV008'),
('ORD008', 'PD004', '1', 'RV008'),
('ORD008', 'PD015', '2', 'RV008'),
-- Order 9
('ORD009', 'PD007', '1', 'RV009'),
('ORD009', 'PD013', '2', 'RV009'),
('ORD009', 'PD020', '1', 'RV009'),
-- Order 10
('ORD010', 'PD005', '2', 'RV010'),
('ORD010', 'PD008', '3', 'RV010'),
('ORD010', 'PD012', '1', 'RV010'),
-- Order 11
('ORD011', 'PD001', '3', 'RV011'),
('ORD011', 'PD014', '1', 'RV011'),
('ORD011', 'PD018', '2', 'RV011'),
-- Order 12
('ORD012', 'PD004', '2', 'RV012'),
('ORD012', 'PD011', '1', 'RV012'),
('ORD012', 'PD019', '3', 'RV012'),
-- Order 13
('ORD013', 'PD006', '1', 'RV013'),
('ORD013', 'PD009', '2', 'RV013'),
('ORD013', 'PD017', '1', 'RV013'),
-- Order 14
('ORD014', 'PD002', '2', 'RV014'),
('ORD014', 'PD008', '1', 'RV014'),
('ORD014', 'PD020', '1', 'RV014'),
-- Order 15
('ORD015', 'PD001', '1', 'RV015'),
('ORD015', 'PD003', '1', 'RV015'),
('ORD015', 'PD012', '2', 'RV015'),
-- Order 16
('ORD016', 'PD005', '1', 'RV016'),
('ORD016', 'PD007', '3', 'RV016'),
('ORD016', 'PD013', '2', 'RV016'),
-- Order 17
('ORD017', 'PD006', '1', 'RV017'),
('ORD017', 'PD010', '2', 'RV017'),
('ORD017', 'PD019', '1', 'RV017'),
-- Order 18
('ORD018', 'PD002', '3', 'RV018'),
('ORD018', 'PD004', '1', 'RV018'),
('ORD018', 'PD016', '1', 'RV018'),
-- Order 19
('ORD019', 'PD005', '2', 'RV019'),
('ORD019', 'PD008', '1', 'RV019'),
('ORD019', 'PD018', '1', 'RV019'),
-- Order 20
('ORD020', 'PD001', '1', 'RV020'),
('ORD020', 'PD009', '1', 'RV020'),
('ORD020', 'PD020', '2', 'RV020');
UNLOCK TABLES;


-- Triggers 
-- --Trigger on Order Items table that notifies the number of items removed from the table/cart---
-- This trigger captures the Quantity as a string, handles the deletion event, and notifies you of the removed items  

DELIMITER //

CREATE TRIGGER NotifyItemRemoval
AFTER DELETE ON OrderItems
FOR EACH ROW
BEGIN
    -- Declare variables with default values in case of NULLs
    DECLARE orderID VARCHAR(10) DEFAULT 'Unknown';
    DECLARE productID VARCHAR(10) DEFAULT 'Unknown';
    DECLARE quantity INT DEFAULT 0;

    SET orderID = IFNULL(OLD.OrderID, 'Unknown');
    SET productID = IFNULL(OLD.ProductID, 'Unknown');
    SET quantity = IFNULL(OLD.Quantity, 0);

    -- Use SIGNAL to raise a custom error message
    SET @alert_message = CONCAT('Removed ', quantity, ' items from OrderID: ', orderID, ', ProductID: ', productID);

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = @alert_message;
END //

DELIMITER ;

-- Trigger ensures that you'll receive a notification when any product's quantity falls below 10 after an update in the Inventory table.
ALTER TABLE Inventory
ADD COLUMN ProductID VARCHAR(6) DEFAULT NULL,
ADD COLUMN ProductQuantity VARCHAR(10) DEFAULT NULL;


ALTER TABLE inventory
ADD COLUMN ExpiryDate DATE DEFAULT NULL;

-- By using a user-defined variable to store the concatenated message, you can avoid the error and effectively signal a low stock alert when the ProductQuantity falls below 10.
-- This approach keeps the trigger logic clean and compliant with MySQL’s restrictions on SIGNAL statements.

DELIMITER //

CREATE TRIGGER NotifyLowStock
AFTER UPDATE ON Inventory
FOR EACH ROW
BEGIN
    -- Ensure that any NULL values are replaced with default values
    DECLARE productID VARCHAR(10) DEFAULT 'Unknown';
    DECLARE inventoryID VARCHAR(10) DEFAULT 'Unknown';
    DECLARE productQuantity VARCHAR(10) DEFAULT '0';

    SET productID = IFNULL(NEW.ProductID, 'Unknown');
    SET inventoryID = IFNULL(NEW.InventoryID, 'Unknown');
    SET productQuantity = IFNULL(NEW.ProductQuantity, '0');

    IF CAST(productQuantity AS SIGNED) < 10 THEN
        SET @alert_message = CONCAT('Low stock alert: ProductID ', productID, 
                                     ' in InventoryID ', inventoryID, 
                                     ' has only ', productQuantity, 
                                     ' items remaining. Restock needed.');

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = @alert_message;
    END IF;
END //

DELIMITER ;

-- Trigger checks after any update if the product's ExpiryDate has passed.
-- If the current date is beyond the ExpiryDate, the trigger raises an alert with a message,notifying that the product in the specific InventoryID has expired.

DELIMITER //

CREATE TRIGGER CheckProductExpiry
AFTER UPDATE ON Inventory
FOR EACH ROW
BEGIN
    -- Check if the ExpiryDate is not null and if the current date is past the ExpiryDate
    IF NEW.ExpiryDate IS NOT NULL AND NEW.ExpiryDate < CURDATE() THEN
		SET @alert_message = CONCAT('The product in InventoryID: ', NEW.InventoryID, ' has expired.');
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = @alert_message;
    END IF;
END //

DELIMITER ;

-- Trigger for Updatelog_address
DELIMITER //

CREATE TRIGGER Address_update
AFTER UPDATE ON Address
FOR EACH ROW
BEGIN
    -- Log the 'Country' column change
    IF OLD.Country != NEW.Country THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'Country', OLD.Country, NEW.Country);
    END IF;

    -- Log the 'State' column change
    IF OLD.State != NEW.State THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'State', OLD.State, NEW.State);
    END IF;

    -- Log the 'City' column change
    IF OLD.City != NEW.City THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'City', OLD.City, NEW.City);
    END IF;

    -- Log the 'Street' column change
    IF OLD.Street != NEW.Street THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'Street', OLD.Street, NEW.Street);
    END IF;

    -- Log the 'Building' column change
    IF OLD.Building != NEW.Building THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'Building', OLD.Building, NEW.Building);
    END IF;

    -- Log the 'ZIP' column change
    IF OLD.ZIP != NEW.ZIP THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Address', OLD.AddressID, 'ZIP', OLD.ZIP, NEW.ZIP);
    END IF;
END//

DELIMITER ;

-- Trigger for Updatelog_admin
DELIMITER //

CREATE TRIGGER Admin_update
AFTER UPDATE ON Admin
FOR EACH ROW
BEGIN
    -- Log the 'Password' column change
    IF OLD.Password != NEW.Password THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Admin', OLD.UserID, 'Password', OLD.Password, NEW.Password);
    END IF;

    -- Log the 'Usertype' column change
    IF OLD.Usertype != NEW.Usertype THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Admin', OLD.UserID, 'Usertype', OLD.Usertype, NEW.Usertype);
    END IF;

END//

DELIMITER ;

-- Trigger for Updatelog_Product
DELIMITER //

CREATE TRIGGER Product_update
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
    -- Log the 'Price' column change
    IF OLD.Price != NEW.Price THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Product', OLD.ProductID, 'Price', OLD.Price, NEW.Price);
    END IF;

    -- Log the 'Itemname' column change
    IF OLD.Itemname != NEW.Itemname THEN
        INSERT INTO update_log (Tablename, Record_id, Column_name, Old_value, New_value)
        VALUES ('Product', OLD.ProductID, 'Itemname', OLD.Itemname, NEW.Itemname);
    END IF;

END//

DELIMITER ;

-- Update records in Address table
UPDATE `Address` SET `City` = 'New York' WHERE `AddressID` = 'ADD001';
UPDATE `Address` SET `City` = 'Los Angeles' WHERE `AddressID` = 'ADD002';
UPDATE `Address` SET `City` = 'Chicago' WHERE `AddressID` = 'ADD003';
UPDATE `Address` SET `City` = 'Houston' WHERE `AddressID` = 'ADD004';
UPDATE `Address` SET `City` = 'Phoenix' WHERE `AddressID` = 'ADD005';
UPDATE `Address` SET `Street` = '5th Avenue' WHERE `AddressID` = 'ADD006';
UPDATE `Address` SET `Street` = 'Sunset Blvd' WHERE `AddressID` = 'ADD007';
UPDATE `Address` SET `Building` = 'Empire State Building' WHERE `AddressID` = 'ADD008';
UPDATE `Address` SET `Building` = 'Sears Tower' WHERE `AddressID` = 'ADD009';
UPDATE `Address` SET `ZIP` = '12345' WHERE `AddressID` = 'ADD010';


-- Update passwords in Admin table
UPDATE `Admin` SET `Password` = 'NewPassword123' WHERE `UserID` = 'ADM001';
UPDATE `Admin` SET `Password` = 'SecurePass456' WHERE `UserID` = 'ADM002';
UPDATE `Admin` SET `Password` = 'AdminPass789' WHERE `UserID` = 'ADM003';
UPDATE `Admin` SET `Password` = 'StrongPass101' WHERE `UserID` = 'ADM004';
UPDATE `Admin` SET `Password` = 'SuperSecret202' WHERE `UserID` = 'ADM005';


-- Update item names in Product table
UPDATE `Product` SET `Itemname` = 'Galaxy S30 Ultra Smartphone Pro' WHERE `ProductID` = 'PD001';
UPDATE `Product` SET `Itemname` = 'MacBook Pro M1 Advanced' WHERE `ProductID` = 'PD002';
UPDATE `Product` SET `Itemname` = 'Noise Cancelling Headphones X7' WHERE `ProductID` = 'PD003';
UPDATE `Product` SET `Itemname` = 'Ninja Professional Blender 2024' WHERE `ProductID` = 'PD004';
UPDATE `Product` SET `Itemname` = 'Fitbit Sense Smartwatch 2' WHERE `ProductID` = 'PD005';


-- Trigger to update email list when subscription is about to end

DELIMITER // 
CREATE TRIGGER AddRenewalEmail 
AFTER UPDATE ON Subscription 
FOR EACH ROW 
BEGIN 
DECLARE emailSubject VARCHAR(250); 
DECLARE emailBody LONGTEXT; 

SET emailSubject = 'Your Subscription Renewal is Coming Up'; 
SET emailBody = 'Your subscription is about to expire. Please renew to continue enjoying our services.'; 

IF NEW.EndDate <= CURDATE() + INTERVAL 7 DAY AND NEW.Status = 'Active' THEN INSERT INTO Email_List (RefNo, ToCustomer, Subject, Body, SendDate) 
VALUES ( 
NEW.CustomerID, emailSubject, emailBody, CURDATE() 
); 
END IF; 
END // 
DELIMITER ;


-- Procedures here
-- Procedures
-- Procedure for calculating final price for each order
DROP PROCEDURE IF EXISTS CalculateFinalPrice;

DELIMITER $$

CREATE PROCEDURE CalculateFinalPrice()
BEGIN
    -- Declare variables
    DECLARE total_price DOUBLE DEFAULT 0;
    DECLARE discount_rate DOUBLE DEFAULT 0;
    DECLARE final_price DOUBLE DEFAULT 0;
    DECLARE order_id VARCHAR(6);
    DECLARE discount_id VARCHAR(6);

    DECLARE done INT DEFAULT 0;

    -- Declare a cursor to loop through all orders
    DECLARE order_cursor CURSOR FOR 
        SELECT OrderID, DiscountID FROM `Orders`;

    -- Continue handler for cursor loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN order_cursor;

    -- Loop through all orders
    order_loop: LOOP
        FETCH order_cursor INTO order_id, discount_id;

        -- If no more rows, exit the loop
        IF done THEN
            LEAVE order_loop;
        END IF;

        -- Calculate total price for the current order, cast Price to DECIMAL
        SELECT COALESCE(SUM(CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity), 0)
        INTO total_price
        FROM OrderItems oi
        JOIN Product p ON oi.ProductID = p.ProductID
        WHERE oi.OrderID = order_id;

        -- Retrieve the discount rate using DiscountID
        SELECT COALESCE(d.Discountrate, 0)
        INTO discount_rate
        FROM Discount d
        WHERE d.DiscountID = discount_id;

        -- Calculate the final price after applying the discount
        SET final_price = total_price - (total_price * discount_rate);

        -- Update the Orders table with the final price
        UPDATE `Orders`
        SET FinalPrice = final_price
        WHERE OrderID = order_id;

    END LOOP;

    -- Close the cursor
    CLOSE order_cursor;

END $$

DELIMITER ;




-- Procedure for calculating price before discount for each order

DROP PROCEDURE IF EXISTS PriceBeforeDiscount()

DELIMITER $$

CREATE PROCEDURE PriceBeforeDiscount()
BEGIN
    -- Declare variables
    DECLARE total_price DOUBLE DEFAULT 0;
    DECLARE order_id VARCHAR(6);

    DECLARE done INT DEFAULT 0;

    -- Cursor to loop through all orders
    DECLARE order_cursor CURSOR FOR 
        SELECT OrderID FROM `Orders`;

    -- Continue handler for cursor loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN order_cursor;

    -- Start loop to process all orders
    order_loop: LOOP
        FETCH order_cursor INTO order_id;

        -- If no more rows, exit the loop
        IF done THEN
            LEAVE order_loop;
        END IF;

        -- Calculate total price for the current order (before discount), cast Price to DECIMAL
        SELECT COALESCE(SUM(CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity), 0)
        INTO total_price
        FROM OrderItems oi
        JOIN Product p ON oi.ProductID = p.ProductID
        WHERE oi.OrderID = order_id;

        -- Update the Order table with the total price before discount in the new column
        UPDATE `Orders`
        SET PriceBeforeDiscount = total_price  -- Store the price before discount in a separate column
        WHERE OrderID = order_id;

        -- Reset the done flag
        SET done = 0;

    END LOOP;

    -- Close the cursor
    CLOSE order_cursor;

END $$

DELIMITER ;


-- Procedure to update payment amount to match the final price of the orders

DROP PROCEDURE IF EXISTS UpdatePaymentAmount()

DELIMITER $$

CREATE PROCEDURE UpdatePaymentAmount()
BEGIN
    DECLARE order_id VARCHAR(6);
    DECLARE payment_id VARCHAR(6);
    DECLARE final_price DECIMAL(10, 2);

    DECLARE done INT DEFAULT 0;

    -- Cursor to loop through all orders with PaymentID
    DECLARE order_cursor CURSOR FOR 
        SELECT OrderID, PaymentID, FinalPrice 
        FROM `Orders` 
        WHERE PaymentID IS NOT NULL;

    -- Continue handler for cursor loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN order_cursor;

    -- Start loop to process all orders
    order_loop: LOOP
        FETCH order_cursor INTO order_id, payment_id, final_price;

        -- If no more rows, exit the loop
        IF done THEN
            LEAVE order_loop;
        END IF;

        -- Update the Payment table's Amount to match the Order's FinalPrice
        UPDATE `Payment`
        SET Amount = final_price
        WHERE PaymentID = payment_id;

    END LOOP;

    -- Close the cursor
    CLOSE order_cursor;

END $$

DELIMITER ;

-- Procedure to wish customers a happy birthday on their DOB. This procedure will check if today is their birthday and print a message. 
DELIMITER //

CREATE PROCEDURE WishBirthdayWithCoupon()
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE custID VARCHAR(6);
    DECLARE custFirstName VARCHAR(25);
    DECLARE custLastName VARCHAR(25);
    DECLARE birthDate DATE;

    DECLARE cursorBirthday CURSOR FOR 
        SELECT CustomerID, CustomerFirstName, CustomerLastName, DOB 
        FROM Customer 
        WHERE DATE_FORMAT(DOB, '%m-%d') = DATE_FORMAT(CURDATE(), '%m-%d');
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN cursorBirthday;
    
    getBirthday: LOOP
        FETCH cursorBirthday INTO custID, custFirstName, custLastName, birthDate;
        IF finished = 1 THEN 
            LEAVE getBirthday;
        END IF;

        SELECT CONCAT('Happy Birthday, ', custFirstName, ' ', custLastName, '! Use coupon BDAY20 to get 20% off on all products today !!') AS BirthdayWish;
    END LOOP getBirthday;

    CLOSE cursorBirthday;
END //

DELIMITER ;

-- Functions

DROP FUNCTION IF EXISTS GetOrderTotal;

DELIMITER $$

# Total value in the cart/inventory
CREATE FUNCTION GetOrderTotal(inputOrderID VARCHAR(6))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_price DECIMAL(10, 2) DEFAULT 0;
    DECLARE discount_rate DECIMAL(10, 2) DEFAULT 0;
    DECLARE grand_total DECIMAL(10, 2) DEFAULT 0;

    -- Calculate the total price of the items in the order
    SELECT COALESCE(SUM(CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity), 0)
    INTO total_price
    FROM OrderItems oi
    JOIN Product p ON oi.ProductID = p.ProductID
    WHERE oi.OrderID = inputOrderID;

    -- Get the discount rate for the order
    SELECT COALESCE(d.Discountrate, 0)
    INTO discount_rate
    FROM Orders o
    LEFT JOIN Discount d ON o.DiscountID = d.DiscountID
    WHERE o.OrderID = inputOrderID;

    -- Calculate the grand total after discount
    SET grand_total = total_price - (total_price * discount_rate);

    -- Return the grand total
    RETURN grand_total;
END $$

DELIMITER ;

SELECT GetOrderTotal('ORD018') AS GrandTotal;
select * from department;
DROP FUNCTION IF EXISTS GetBestSalesEmployee;

DELIMITER $$

CREATE FUNCTION GetBestSalesEmployee()
RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE best_performer VARCHAR(50);

    -- Retrieve the EmployeeID, first and last name of the best-performing employee
    SELECT CONCAT(e.EmpFirstName, ' ', e.EmpLastName) INTO best_performer
    FROM Orders o
    JOIN Employee e ON o.EmployeeID = e.EmployeeID
    JOIN Department d ON e.EmployeeID = d.EmployeeID
    WHERE d.DepartmentName = 'Sales'
    GROUP BY o.EmployeeID, e.EmpFirstName, e.EmpLastName
    ORDER BY SUM(CAST(o.FinalPrice AS DECIMAL(10, 2))) DESC
    LIMIT 1;

    -- Return the name of the best performer
    RETURN best_performer;
END $$

DELIMITER ;
SELECT GetBestSalesEmployee() AS BestPerformer;

DROP FUNCTION IF EXISTS GetBestSalesEmployeeByCartValue;

DELIMITER $$
# best performing salesperson 
CREATE FUNCTION GetBestSalesEmployeeByCartValue()
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE best_performer_details VARCHAR(100);

    -- Retrieve the employee with the highest total cart value (sum of all product prices * quantity, adjusted by discounts)
    SELECT CONCAT('EmployeeID: ', e.EmployeeID, ', Name: ', e.EmpFirstName, ' ', e.EmpLastName, ', TotalCartValue: ', SUM((CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity) * (1 - COALESCE(d.Discountrate, 0))))
    INTO best_performer_details
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Product p ON oi.ProductID = p.ProductID
    JOIN Employee e ON o.EmployeeID = e.EmployeeID
    JOIN Department dpt ON e.EmployeeID = dpt.EmployeeID
    LEFT JOIN Discount d ON p.ProductID = d.DiscountID -- Apply discount if available
    WHERE dpt.DepartmentName = 'Sales'
    GROUP BY o.EmployeeID, e.EmpFirstName, e.EmpLastName
    ORDER BY SUM((CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity) * (1 - COALESCE(d.Discountrate, 0))) DESC
    LIMIT 1;

    -- Return the best performer details
    RETURN best_performer_details;
END $$

DELIMITER ;

DROP FUNCTION IF EXISTS GetDeliveryInfoByOrder;

DELIMITER $$

CREATE FUNCTION GetDeliveryInfoByOrder(inputOrderID VARCHAR(6))
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE delivery_info VARCHAR(255);
    DECLARE delivery_date DATETIME;
    DECLARE shipping_duration INT;
    DECLARE shipment_id VARCHAR(6);

    -- Retrieve the delivery date, shipment ID, and calculate the shipping duration (days between Shipdate and Deliverydate)
    SELECT s.Deliverydate, s.ShipmentID, DATEDIFF(s.Deliverydate, s.Shipdate) AS ShippingDuration
    INTO delivery_date, shipment_id, shipping_duration
    FROM Orders o
    JOIN Shipment s ON o.ShipmentID = s.ShipmentID
    WHERE o.OrderID = inputOrderID;

    -- Concatenate all information into a single string
    SET delivery_info = CONCAT('OrderID: ', inputOrderID, ', ShipmentID: ', shipment_id, 
                               ', DeliveryDate: ', DATE_FORMAT(delivery_date, '%Y-%m-%d %H:%i:%s'), 
                               ', ShippingDuration: ', shipping_duration, ' days');

    -- Return the delivery information
    RETURN delivery_info;
END $$

DELIMITER ;
SELECT GetDeliveryInfoByOrder('ORD018') AS DeliveryInfo;
select * from store;
select * from orderitems;
show tables;

DROP FUNCTION IF EXISTS GetStoreSalesAndInventory;

DELIMITER $$

CREATE FUNCTION GetStoreSalesAndInventory(inputStoreID VARCHAR(6))
RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE store_info VARCHAR(255);
    DECLARE total_sales DECIMAL(10, 2);
    DECLARE inventory_levels VARCHAR(255);

    -- Calculate the total sales made by the store (including discounts)
    SELECT COALESCE(SUM((CAST(p.Price AS DECIMAL(10, 2)) * oi.Quantity) * (1 - COALESCE(d.Discountrate, 0))), 0)
    INTO total_sales
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Product p ON oi.ProductID = p.ProductID
    JOIN Inventory i ON p.InventoryID = i.InventoryID
    LEFT JOIN Discount d ON o.DiscountID = d.DiscountID  -- Join discount if applied
    WHERE i.StoreID = inputStoreID;

    -- Concatenate the inventory levels for the store
    SELECT GROUP_CONCAT(CONCAT(p.Itemname, ': ', i.Amount) SEPARATOR ', ')
    INTO inventory_levels
    FROM Product p
    JOIN Inventory i ON p.InventoryID = i.InventoryID
    WHERE i.StoreID = inputStoreID;

    -- Prepare the final output with total sales and inventory levels
    SET store_info = CONCAT('StoreID: ', inputStoreID, 
                            ', TotalSales: ', total_sales, 
                            ', InventoryLevels: ', inventory_levels);

    -- Return the store information
    RETURN store_info;
END $$

DELIMITER ;

SELECT GetStoreSalesAndInventory('ST001') AS StoreInfo;

DELIMITER //
CREATE PROCEDURE MostSoldItemsInArea(IN area VARCHAR(25))
BEGIN
    SELECT 
        p.Itemname,
        SUM(oi.Quantity) AS TotalQuantity
    FROM 
        OrderItems oi
        JOIN Orders o ON oi.OrderID = o.OrderID
        JOIN Customer c ON o.CustomerID = c.CustomerID
        JOIN Address a ON c.AddressID = a.AddressID
        JOIN Product p ON oi.ProductID = p.ProductID
    WHERE 
        a.City = area OR a.State = area OR a.Country = area
    GROUP BY 
        p.ProductID
    ORDER BY 
        TotalQuantity DESC
    limit 10;  -- Retrieve the top 10 most sold items in the area
END //

DELIMITER ;
CALL MostSoldItemsInArea('ABu Dhabi');
-- Views
-- Sales performance 
CREATE VIEW SalesPerformance AS 
SELECT 
O.OrderID, 
O.CustomerID, 
C.CustomerFirstName, C.CustomerLastName,
 SUM(O.FinalPrice) AS TotalSales, 
COUNT(O.OrderID) AS TotalOrders FROM Orders O 
JOIN Customer C ON O.CustomerID = C.CustomerID GROUP BY O.CustomerID;


-- Financial Information

CREATE VIEW FinancialInformation AS 
SELECT P.PaymentID, 
P.Paymentmethod, 
P.Paymentdate,
P.Amount, 
O.OrderID, 
O.FinalPrice, 
D.Discountrate 
FROM Payment P 
JOIN Orders O ON P.PaymentID = O.PaymentID
 JOIN Discount D ON O.DiscountID = D.DiscountID;

-- Sales Information

CREATE VIEW SalesInformation AS 
SELECT O.OrderID, 
O.Order_Date, 
O.FinalPrice,
 E.EmpFirstName, 
E.EmpLastName, 
P.ProductID, 
P.Itemname, 
OI.Quantity FROM Orders O 
JOIN Employee E ON O.EmployeeID = E.EmployeeID 
JOIN OrderItems OI ON O.OrderID = OI.OrderID 
JOIN Product P ON OI.ProductID = P.ProductID;

-- Monthly sales analysis


CREATE VIEW MonthlySalesAnalysis AS
SELECT DATE_FORMAT(O.Order_Date, '%Y-%m') AS Month, 
SUM(O.FinalPrice) AS TotalSales, 
COUNT(O.OrderID) AS NumberOfOrders
 FROM Orders O
 GROUP BY Month 
ORDER BY Month;





-- Top customer by sales
CREATE VIEW TopCustomers AS
 SELECT C.CustomerID,
 C.CustomerFirstName, 
C.CustomerLastName, 
SUM(O.FinalPrice) AS TotalSpent, 
COUNT(O.OrderID) AS NumberOfOrders
 FROM Orders O JOIN Customer C ON O.CustomerID = C.CustomerID
 GROUP BY C.CustomerID 
ORDER BY TotalSpent DESC 
LIMIT 10;

-- Pending and completed shipments

CREATE VIEW ShipmentStatus AS 
SELECT 
S.ShipmentID,
 S.CustomerID, 
S.Shipdate, S.Deliverydate, 
CASE 
      WHEN S.Deliverydate IS NOT NULL THEN 'Completed' 
       ELSE 'Pending' 
       END AS Status
 FROM Shipment S;
-- Complex Queries

# complex queries - revenue generated by per customer
SELECT 
    c.CustomerID,
    CONCAT(c.CustomerFirstName, ' ', c.CustomerLastName) AS CustomerName,
    s.Status,
    SUM(s.Cost) AS TotalSubscriptionRevenue
FROM 
    Subscription s
    JOIN Customer c ON s.CustomerID = c.CustomerID
WHERE 
    s.Status = 'Active'
GROUP BY 
    c.CustomerID
ORDER BY 
    TotalSubscriptionRevenue DESC;


# complex queries - best selling product in the catergory 
SELECT 
    p.CategoryID,
    c.Category,
    p.ProductID,
    p.Itemname AS ProductName,
    SUM(oi.Quantity) AS TotalQuantitySold,
    SUM(oi.Quantity * p.Price) AS TotalRevenue
FROM 
    Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Product p ON oi.ProductID = p.ProductID
    JOIN Category c ON p.CategoryID = c.CategoryID
GROUP BY 
    p.CategoryID, p.ProductID
ORDER BY 
    TotalRevenue DESC;


-- Query to Find Employee Name with the total sales of the order that they have worked on 
SELECT CONCAT(EmpFirstname,EmpLastName) AS EmpName, E.EmployeeID, Total_Sales FROM
(Select SUM(CAST(FinalPrice AS DECIMAL(10,2))) AS Total_Sales, EmployeeID From Orders
Group by EmployeeID) AS O
INNER JOIN Employee E
ON O.EmployeeID = E.EmployeeID
ORDER BY Total_Sales DESC;

-- Query to Find Most Popular Item and its Inventory amount
SELECT Itemname, TotalSold, Amount AS InventoryAmount FROM
(SELECT SUM(Quantity) AS TotalSold, ProductID FROM OrderItems
GROUP BY ProductID) AS O
INNER JOIN Product P
ON O.ProductID = P.ProductID
INNER JOIN Inventory I
ON I.InventoryID = P.InventoryID
WHERE TotalSold = (SELECT MAX(TotalSold) FROM (SELECT SUM(Quantity) AS TotalSold, ProductID FROM OrderItems
GROUP BY ProductID) AS max_sales);

-- Query to find the most valuable customers based on order value and categorize then
SELECT iq.*, 
CASE
WHEN TotalPurchase > 700 THEN 'Platinum'
    	WHEN TotalPurchase <= 700 AND TotalPurchase > 500 THEN 'Gold'
    	WHEN TotalPurchase <= 500 AND TotalPurchase > 300 THEN 'Silver'
    	ELSE 'Bronze'
END AS CustomerCategory FROM
(
SELECT o.CustomerID, concat(c.CustomerFirstName, ' ', c.CustomerLastName) AS CustomerName,
sum(o.FinalPrice) as TotalPurchase
FROM orders o
left join customer c 
on o.CustomerID = c.CustomerID
group by o.CustomerID, CustomerName
) iq;

-- Query to find Category and SubCategory wise monthly Sales distribution
SELECT ct.Category, ct.SubCategory, DATE_FORMAT(o.Order_Date,'%Y-%m') as PurchaseDate,
sum(o.FinalPrice) as TotalSales 
FROM orders o 
left join orderitems oi
on o.OrderID = oi.OrderID
left join product p 
on oi.ProductID = p.ProductID
left join category ct 
on p.CategoryID = ct.CategoryID
group by ct.Category, ct.SubCategory, PurchaseDate
order by ct.Category, ct.SubCategory, PurchaseDate, TotalSales;


-- This query identifies the top 3 suppliers who offer the highest average-priced products, showing their product details and average product price.
SELECT s.SupplierID, s.SupplierName, 
       COUNT(p.ProductID) AS TotalProducts,
       ROUND(AVG(p.Price), 2) AS AverageProductPrice,
       GROUP_CONCAT(p.ItemName ORDER BY p.Price DESC SEPARATOR ', ') AS TopProducts
FROM supplier s
JOIN product p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID
ORDER BY AverageProductPrice DESC
LIMIT 3;

-- query that joins the orders and orderitems tables to retrieve detailed information about each order, 
-- including the total quantity of products ordered and the total value of each order after applying discounts.
SELECT 
    o.OrderID,
    o.CustomerID,
    o.Order_Date,
    SUM(oi.Quantity) AS TotalQuantity,
    SUM(oi.Quantity * o.FinalPrice / NULLIF(o.PriceBeforeDiscount, 0)) AS TotalOrderValue
FROM 
    orders o
JOIN 
    orderitems oi ON o.OrderID = oi.OrderID
GROUP BY 
    o.OrderID, o.CustomerID, o.Order_Date
ORDER BY 
    o.Order_Date DESC;
