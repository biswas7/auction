CREATE TABLE IF NOT EXISTS SellerInfo (
      SellerID INTEGER PRIMARY KEY,
      Name     TEXT         NOT NULL,
      Password VARCHAR (64) NOT NULL
);


CREATE TABLE IF NOT EXISTS BuyerInfo (
      BuyerID INTEGER  PRIMARY KEY,                     
      Name     TEXT         NOT NULL,
      Password VARCHAR (64) NOT NULL
);



CREATE TABLE IF NOT EXISTS Auction (
      AuctionID INTEGER PRIMARY KEY,
      BuyerID  INTEGER ,
      SellerID INTEGER ,
      Country  VARCHAR NOT NULL,
      ItemID   NUMERIC ,
      ItemName TEXT    NOT NULL,
      Description VARCHAR(10000) NULL,
      Photo TEXT,
      LowestBid DOUBLE NOT NULL,
      StartingDate DATE NULL,
      EndingDate DATE NULL,
      ActiveStatus INT(1) DEFAULT '0',
      BuyingPrice  INT(11) DEFAULT NULL,
      status INT NOT NULL,
      FOREIGN KEY(BuyerID) REFERENCES BuyerInfo(BuyerID),
      FOREIGN KEY(SellerID) REFERENCES BuyerInfo(SellerID)

);


-- INSERT INTO Auction(SellerID, Country, ItemID, ItemName, LowestBid, Photo, StartingDate, EndingDate, status)
--   VALUES (1, "UK", 1, "Book", 5000, "image_1.jpg", "2020-11-10", "2020-11-20","sold");
-- INSERT INTO Auction(SellerID, Country, ItemID, ItemName, LowestBid, Photo, StartingDate, EndingDate, status)
--   VALUES (1, "UK", 2, "Table", 4000, "image_2.jpg", "2020-11-11", "2020-11-21","sold");
-- INSERT INTO Auction(SellerID, Country, ItemID, ItemName, LowestBid, Photo, StartingDate, EndingDate, status)
--   VALUES (2, "UK", 3, "Chair", 6000, "image_3.jpg", "2020-11-12", "2020-11-22","sold");
-- INSERT INTO Auction(SellerID, Country, ItemID, ItemName, LowestBid, Photo, StartingDate, EndingDate, status)
--   VALUES (1, "UK", 4, "Door", 5664, "image_4.jpg", "2020-11-13", "2020-11-23","sold");
-- INSERT INTO Auction(SellerID, Country, ItemID, ItemName, LowestBid, Photo, StartingDate, EndingDate, status)
--   VALUES (4, "UK", 5, "NoteBook", 10000, "1605200138162.jpg", "2020-11-14", "2020-11-24","sold");



CREATE TABLE IF NOT EXISTS Bidding (
      Bid INTEGER PRIMARY KEY,
      BidderID  INTEGER   NOT NULL,
      AuctionID INTEGER   DEFAULT NULL,
      BidTime DATETIME NOT NULL,
      Amount  FLOAT NOT NULL,
      FOREIGN KEY(AuctionID) REFERENCES Auction(AuctionID)

);



CREATE TABLE IF NOT EXISTS Messages (
     MessageID INTEGER  PRIMARY KEY,
     SenderID  INTEGER   NOT NULL,
     ReceiverID INTEGER NOT NULL,
     AuctionID INTEGER  NOT NULL,
     Messages  VARCHAR  NOT NULL,
     SendDate  DATETIME NOT NULL,
     ReadStatus INT   DEFAULT '0',
     FOREIGN KEY(SenderID) REFERENCES UseerInfo(UserIDID),
     FOREIGN KEY(ReceiverID) REFERENCES UserInfo(UserID),
     FOREIGN KEY(AuctionID) REFERENCES Auction(AuctionID)
     
);


CREATE TABLE IF NOT EXISTS Notifications (
     NotificationID INTEGER PRIMARY KEY,
     Type VARCHAR NOT NULL,
     SenderID  INTEGER   NOT NULL,
     ReceiverID INTEGER NOT NULL,
     AuctionID INTEGER   NOT NULL,
     SeenStatus INT DEFAULT '0',
     DateAdded DATETIME NOT NULL,
     MessageID  INTEGER  NOT NULL,
     FOREIGN KEY(SenderID) REFERENCES UserInfo(UserID),
     FOREIGN KEY(ReceiverID) REFERENCES UserInfo(UserID),
     FOREIGN KEY(AuctionID) REFERENCES Auction(AuctionID),
     FOREIGN KEY(MessageID) REFERENCES Messages(MessageID)
     
  
  
);


CREATE TABLE IF NOT EXISTS UserInfo(
      UserID      INTEGER PRIMARY KEY,
      UserName    VARCHAR(50) NOT NULL,
      FirstName   VARCHAR(50) NOT NULL,
      LastName    VARCHAR(50) NOT NULL,
      Email       VARCHAR(50) NOT NULL,
      PhoneNumber VARCHAR(50) NOT NULL,
      Address     VARCHAR(500)  NOT NULL,
      City        VARCHAR(200)  NOT NULL,
      Country     VARCHAR(200)  NOT NULL,
      JoinDate    DATETIME  NOT NULL
      

);
