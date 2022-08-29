CREATE TABLE HOTELS
(
HotelId int IDENTITY  NOT NULL PRIMARY KEY,
HotelName varchar(20) NOT NULL,
StarsCount int NOT NULL,
Adress varchar(40)
)

INSERT INTO HOTELS(HotelName, StarsCount, Adress) VALUES
('Bukovina', 5, 'Holovta str.'),
('Narion', 4, 'Swertlo str.'),
('Wernisaw', 3, 'Rovten str.')

SELECT TOP (1000) [HotelId]
      ,[HotelName]
      ,[StarsCount]
      ,[Adress]
  FROM [Training ].[dbo].[HOTELS]

  CREATE TABLE ROOMS
  (
    RoomId int IDENTITY  NOT NULL PRIMARY KEY,
    RoomNumber int NOT NULL,
	HotelId int NOT NULL FOREIGN KEY REFERENCES HOTELS (HotelId)
)
SELECT * FROM ROOMS

INSERT INTO ROOMS (RoomNumber, HotelId) VALUES 
(100, 1),
(105, 1),
(106, 1),
(209, 2),
(104, 2)

CREATE TABLE Clients 
(
ClientsId int IDENTITY NOT NULL PRIMARY KEY,
ClientName varchar (20) NOT NULL,
Email varchar (20),
Age int NOT NULL
)


SELECT * FROM Clients

INSERT INTO Clients (ClientName, Email, Age) VALUES
('Poplavka', 'grout@com', 22),
('Lerotkin', 'dritkovsk@com', 34),
('Dritiop', 'qwert@com', 34),
('Proffesiom', 'asdre@com', 46)

CREATE TABLE Orders
(
OrderId int IDENTITY NOT NULL PRIMARY KEY,
ClientId int NOT NULL FOREIGN KEY REFERENCES Clients(ClientsId),
RoomId int NOT NULL FOREIGN KEY REFERENCES ROOMS(RoomId),
Price int NOT NULL,
DayCount int NOT NULL
)
SELECT * FROM Orders

INSERT INTO Orders (ClientId, RoomId, Price, DayCount) VALUES 
(1, 1, 100, 1),
(2, 5, 1000, 2),
(3, 2, 250, 4),
(4, 3, 800, 3)

SELECT Price, Count(Price) FROM Orders GROUP BY Price

SELECT * FROM Orders JOIN Clients on Orders.ClientId = Clients.ClientsId
SELECT * FROM Orders JOIN ROOMS on Orders.RoomId = ROOMS.RoomId
SELECT *FROM HOTELS INNER JOIN ROOMS on HOTELS.HotelId = ROOMS.HotelId