CREATE DATABASE Armydb;
USE Armydb;

DROP DATABASE  Armydb;

CREATE TABLE Cateogry (
name_  VARCHAR(70) PRIMARY KEY,
class_ VARCHAR(70)
);
SELECT * FROM Cateogry;

CREATE TABLE Squads (
squadNumber        VARCHAR(100),
Captain       INTEGER    NOT NULL,
yearNo 	      INTEGER 	 NOT NULL,
totalCapacity INTEGER    NOT NULL CHECK (totalCapacity > 0),
PRIMARY KEY(squadNumber, yearNo)
);
SELECT * FROM Squads;

CREATE TABLE Location (
PINCODE  VARCHAR(6) PRIMARY KEY CHECK (length(PINCODE) = 6),
District VARCHAR(100) NOT NULL,
State    VARCHAR(100) NOT NULL,
Country  VARCHAR(100) NOT NULL,
UNIQUE (PINCODE)
);
SELECT * FROM Location;

CREATE TABLE Soldier (
ID                 INTEGER NOT NULL,
name_               VARCHAR(100) NOT NULL,
DOJ                DATE NOT NULL,
RANK_               VARCHAR(100) NOT NULL,
SquadNo            VARCHAR(100) NOT NULL,
yearNo            INTEGER NOT NULL,
BirthPlacePinCode  VARCHAR(6) NOT NULL REFERENCES Location(PINCODE)
ON UPDATE CASCADE ON DELETE CASCADE,
Sex         INTEGER NOT NULL CHECK (SEX = 1 OR SEX = 0),
Height INTEGER CHECK (Height > 152),
Weight INTEGER CHECK (Weight > 40),
Chest  INTEGER CHECK (Chest > 50),
UNIQUE (ID),
FOREIGN KEY (SquadNo, yearNo) REFERENCES Squads(SquadNumber, yearNo),
PRIMARY KEY (ID, BirthPlacePinCode)
);
DROP table soldier;







INSERT INTO Cateogry (name_ ,class_)VALUES('AK47','semi-automatic');
INSERT INTO Cateogry (name_ ,class_)VALUES ('Ikbiza', 'ballistic-missile');
INSERT INTO Cateogry (name_ ,class_) VALUES('Agni 2', 'ballistic-missile');
INSERT INTO Cateogry (name_ ,class_) VALUES('Agni 3','ballistic-missile');
INSERT INTO Cateogry (name_ ,class_) VALUES('Agni 4','ballistic-missile');
INSERT INTO Cateogry (name_ ,class_) VALUES('Agni 5','ballistic-missile');
INSERT INTO Cateogry (name_ ,class_) VALUES('Beretta 92 A', 'Handgun');
INSERT INTO Cateogry (name_ ,class_) VALUES('Colt M1911','semi-automatic-pistol');



INSERT INTO Location (PinCode,District,State,Country) VALUES ('730552','Bhiwani','Haryana','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('648184','Itanagar','Arunachal Pradesh','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('776890','Pali','RJ','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('671365','Panjim','GA','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('454690','Chandigarh','CH','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('991955','Silvassa','DN','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('640565','Imphal','Manipur','India');
INSERT INTO Location (PinCode,District,State,Country) VALUES ('498993','Gangtok','Sikkim','India');

INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('34th Mountain Division',337201,2011,50);
INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('7th Infantry Division',16101,2010,40);
INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('25th RAPID',27989,2008,50);
INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('475th Engineering Brigade',49158,2010,45);
INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('4th Armoured Division',17694,2005,50);
INSERT INTO Squads (squadNumber,Captain,yearNo,totalCapacity) VALUES('41st Artillery Division',12874,2003,60);



SELECT * FROM soldier;
INSERT INTO Soldier (ID, name_, DOJ,RANK_, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex,  yearNo) VALUES
(44668,'Kamal Awasthi','2013-02-12','Soldier','41st Artillery Division',298144,162,65,75,1,2003);
INSERT INTO Soldier (ID, name_, DOJ,RANK_, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex,  yearNo) VALUES
(40386,'Vijay Singh Rajput','2012-4-19','Soldier','34th Mountain Division',618987,176,72,78,1, 2011);
INSERT INTO Soldier (ID, name_, DOJ,RANK_, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex, yearNo) VALUES
(13423,'Jaspreet Singh Kaur','2010-9-24','Soldier','7th Infantry Division',727545,182,75,80,1, 2010);
INSERT INTO Soldier (ID, name_,DOJ,RANK_, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex,yearNo) VALUES
(11053,'Avantika Kulkarni','2012-4-26','Soldier','25th RAPID',928032,158,58,76,0, 2008);
INSERT INTO Soldier (ID, name_,DOJ,RANK_, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex,  yearNo) VALUES
(22513,'Rajveer Singh','2010-2-15','Captain','475th Engineering Brigade',761137,184,82,84,1,2010);
INSERT INTO Soldier (ID, name_, RANK_, DOJ, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex, yearNo) VALUES
(19339,'Arjun Pratap','Soldier','2012-4-15','4th Armoured Division',144790,176,70,74,1, 2005);
INSERT INTO Soldier (ID, name_, RANK_, DOJ, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex, yearNo) VALUES
(48563,'Ajay Singh Kumnawat','Colonel','2003-07-08','41st Artillery Division',490993,178,80,84,1, 2003);
INSERT INTO Soldier (ID, name_, RANK_, DOJ, SquadNo, BirthPlacePinCode, Height, Weight, Chest, Sex, yearNo) VALUES
(48564,'Ajay Singh Kumnawat','Colonel','2003-07-08','41st Artillery Division',490993,178,80,84,1, 2003);


SELECT * FROM squads;
SELECT * FROM squads WHERE captain=337201;

select DISTINCT s.* from Soldier as sold
Inner join Squads as s on s.squadNumber = sold.SquadNo;

select count(Soldier.ID)
from Soldier
inner join Soldier as sold2 on Soldier.BirthPlacePincode = sold2.BirthPlacePincode AND Soldier.id!=sold2.id;

select Height, Weight, Chest
from Soldier
where Soldier.ID = '12105';

select sqd.Captain, sqd.totalCapacity
from Soldier as sold
inner join Squads as sqd on sqd.squadNumber = sold.SquadNo
where sold.ID = 48563;