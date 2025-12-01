-- Inlämning 1 (Databaser)
-- Zahra Hadadi YH25

-- Skapar databasen och använder den så vi kan ändra, lägga till osv
CREATE DATABASE Bokhandel;
USE Bokhandel;

-- Skapa Kundertabellen
CREATE TABLE Kunder(
KundID INT AUTO_INCREMENT PRIMARY KEY,
Namn VARCHAR (100) NOT NULL,
Email VARCHAR (100) UNIQUE NOT NULL,
    Telefon VARCHAR (30) NOT NULL,
    Adress VARCHAR (200) NOT NULL
    );
    
    -- Skapa Bockertabellen
    CREATE TABLE Bocker (
    ISBN VARCHAR (30) PRIMARY key NOT NULL,
    Titel VARCHAR (200) NOT NULL,
    Forfattare VARCHAR (100) NOT NULL,
    Pris DECIMAL (10,2) NOT NULL CHECK (Pris>0),
    Lagerstatus INT NOT NULL
    );
    
    -- Skapa Bestallningartabellen
    CREATE TABLE Bestallningar (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL, 
    Datum DATE NOT NULL,
    Totalbelopp DECIMAL (10,2) NULL,
    FOREIGN KEY (KundID) REFERENCES Kunder (KundID)
    );
    
    -- Skapa Orderradertabellen
    CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY key,
    OrderID INT NOT NULL,
    ISBN VARCHAR (30) NOT NULL,
    Antal INT NOT NULL,
    Pris DECIMAL (10,2) NOT NULL ,
    FOREIGN KEY (OrderID) REFERENCES Bestallningar (OrderID),
    FOREIGN KEY (ISBN) REFERENCES Bocker (ISBN)
    );
    
    -- Testa och kolla undertiden som vi bygger
SHOW TABLES;
DESCRIBE Kunder;
DESCRIBE Bocker;
DESCRIBE Bestallningar;
DESCRIBE Orderrader;

-- Inforga  data i Kunder
    
    INSERT INTO Kunder (Namn, Email, Telefon, Adress) VALUES
    ('Zahra Hadadi', 'Zahra@gmail.com', '0761547560', 'Kalmar'),
('Sara Gustafsson', 'sara@gmail.com', '0729856543', 'Helsingborg'),
 ('Emil Eriksson', 'Emil@gmail.com', '0768547520', 'Stockholm'),
('Nicklas Petersson', 'Nicklas@gmail.com', '0719856543', 'Göteborg'),
 ('Markus Arko', 'Markus@gmail.com', '0731544521', 'Malmö'),
('Sigrid Persson', 'Sigrid@gmail.com', '0749856541', 'Linköping');
   
   -- Hämtar kunder data 
   SELECT * FROM Kunder;
   
   -- Inforga  data i Bocker
   
   INSERT INTO Bocker (ISBN, Titel, Forfattare, Pris, Lagerstatus) VALUES
   ('9789144131234', 'Databasteknik', 'Sofia Andersson', 399.00, 10),
('9779123456789', 'SQL och Databaser', 'Maria Svensson', 249.00, 7),
('9789334501235', 'Programmering med Python', 'Karl Andersson', 329.00, 12),
('9789149129871', 'Datastrukturer', 'Emma Petersson', 459.00, 5),
('9789171799691', 'Nätverksteknik', 'Lars Johansson', 379.00, 9);

 -- Hämtar Bocker data
   SELECT * FROM Bocker; 
   
    -- Inforga  data i Bestallningar
   INSERT INTO Bestallningar (KundID, Datum) VALUES
   (1, '2025-11-20'),
   (2, '2025-11-22'),
   (3, '2025-11-21'),
   (5, '2025-11-23');
   
 -- Hämtar bestallningar data
   SELECT * FROM Bestallningar ;
   
    -- Inforga  data i Orderrader
   INSERT INTO Orderrader (OrderID, ISBN, Antal, Pris)
VALUES
(1, '9789144131234', 1, 399.00),
(1, '9779123456789', 1, 249.00),
(2, '9789149129871', 1, 459.00),
(3, '9789171799691', 1, 379.00),
(4, '9789334501235', 1, 329.00),
(4, '9789171799691', 1, 379.00);

 -- Hämtar Orderrader data
   SELECT * FROM Orderrader ;

-- Räkna ut totalbelopp för varje beställning 
UPDATE Bestallningar b
JOIN (
    SELECT OrderID, SUM(pris * antal) AS summa
    FROM Orderrader
    -- Group By, räknar antal beställninar per kund
    GROUP BY OrderID
) AS x ON b.OrderID = x.OrderID
SET b.Totalbelopp = x.summa
WHERE b.OrderID > 0;

 -- Hämtar Beställningar data
   SELECT * FROM Bestallningar;
  
   
   
   
   
    
    
    
