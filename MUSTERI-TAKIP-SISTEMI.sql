--DROP TABLE KartBilgileri
CREATE TABLE KartBilgileri(
kartSahibiKartNo numeric(16,0)primary key not null,
kartSahibiAdi varchar(20) not null,
kartSahibiSoyadi varchar(20) not null,
kartTipi varchar(10) not null, --VISA, MASTERCARD ?
kartSonKullanmaTarihi varchar(5) not null,
kartCVV varchar(3) ,
kartTuru varchar(20),
)

ALTER TABLE KartBilgileri
ALTER COLUMN kartCVV smallint not null

ALTER TABLE KartBilgileri
ALTER COLUMN kartCVV numeric(3,0)

ALTER TABLE KartBilgileri
ALTER COLUMN kartCVV numeric(3,0) not null

ALTER TABLE KartBilgileri
ADD kartTuru varchar(15)

ALTER TABLE KartBilgileri
DROP COLUMN kartTipi
--5

--DROP TABLE OdemeTipi
CREATE TABLE OdemeTipi(
odemeTipiID tinyint primary key not null,
odemeTipi money not null,
odemeTipi2 varchar(20),
odemeYapildimi int not null,
)

ALTER TABLE OdemeTipi
ALTER COLUMN odemeYapildimi varchar(20) not null;

ALTER TABLE OdemeTipi
DROP COLUMN odemeTipi;

ALTER TABLE OdemeTipi
DROP COLUMN odemeTipi2;

ALTER TABLE OdemeTipi
DROP COLUMN OdemeYapildimi;

ALTER TABLE OdemeTipi
ADD odemeSekli varchar(10) not null;
--5



--DROP TABLE Musteri
CREATE TABLE Musteri(
musteriID int primary key not null,
musteriAdi varchar(20)  not null,
musteriSoyadi varchar(20) not null,
musteriTel varchar(11),
musteriAdres varchar(40) ,
musteriSifre varchar(20) not null,
kartSahibiKartNo numeric(16,0) not null foreign key references KartBilgileri (kartSahibiKartNo),
odemeTipiID tinyint not null foreign key references OdemeTipi (OdemeTipiID),
kuryeID int not null foreign key references Kurye (kuryeID)
)

ALTER TABLE Musteri
ALTER COLUMN musteriAdres varchar(40) not null;

ALTER TABLE Musteri
ALTER COLUMN musteriTel numeric(11,0) not null;

ALTER TABLE Musteri
ADD musteriEmail varchar(40);

ALTER TABLE Musteri
ADD musteriPuan int not null;

ALTER TABLE Musteri
ALTER COLUMN musteriEmail varchar(40) not null;


--DROP TABLE Restoran
CREATE TABLE Restoran(
restoranID  int  primary key not null,
restoranAdi varchar(20) not null,
restoranAdres varchar(100),
restoranTel int,
restoranSifre varchar(20) not null,
restoranPuan int not null,
)

ALTER TABLE Restoran
ALTER COLUMN restoranTel numeric(11,0)

ALTER TABLE Restoran
ALTER COLUMN restoranTel numeric(11,0) not null

ALTER TABLE Restoran
ALTER COLUMN restoranPuan tinyint

ALTER TABLE Restoran
ALTER COLUMN restoranAdres varchar(100) not null

ALTER TABLE Restoran
ADD restoranKullaniciAdi varchar(10)



--DROP TABLE Kategoriler
CREATE TABLE Kategoriler(
kategoriID int primary key not null, 
kategoriAdi varchar(15) not null,
)

ALTER TABLE Kategoriler
ADD kategoriBilgi int not null;

ALTER TABLE Kategoriler
ALTER COLUMN kategoriBilgi varchar(20);

ALTER TABLE Kategoriler
ALTER COLUMN kategoriBilgi varchar(20) not null;

ALTER TABLE Kategoriler
ADD kategoriBilgiNo varchar(20) not null;

ALTER TABLE Kategoriler
DROP COLUMN kategoriBilgiNo;



--DROP TABLE Menuler
CREATE TABLE Menuler(
menuID int primary key not null,
menuFiyat smallmoney not null,
menuAdi varchar(15) not null,
menuAdedi tinyint not null,
menuTipi varchar(15) not null,
menuIndirim varchar(5) not null,
menuIndirim2 tinyint not null,
restoranID int   not null,--foreign key references Restoran (restoranID)
kategoriID int  not null,--foreign key references kategoriler(kategoriID)
indirimID int not null
)




ALTER TABLE Menuler
DROP COLUMN menuIndirim2 ;

ALTER TABLE Menuler
DROP COLUMN menuTipi

ALTER TABLE Menuler
ADD FOREIGN KEY  (restoranID) REFERENCES Restoran(restoranID)

ALTER TABLE Menuler
ADD FOREIGN KEY  (kategoriID) REFERENCES Kategoriler(kategoriID)

ALTER TABLE Menuler
ADD FOREIGN KEY (indirimID) REFERENCES Indirim(indirimID)
--5



--DROP TABLE Indirim
CREATE TABLE Indirim(
indirimID int primary key not null,
indirimOrani int not null,
menuID int  not null,
)


ALTER TABLE Indirim
ADD indirimTipi1 int not null --öðrenci indirim

ALTER TABLE Indirim
ADD indirimTipi2 int not null --anlýk indirim

ALTER TABLE Indirim
DROP COLUMN indirimTipi1

ALTER TABLE Indirim
DROP COLUMN indirimTipi2



--DROP TABLE Sepet
CREATE TABLE Sepet(
sepetID int primary key not null,

)

ALTER TABLE Sepet
ADD sepetteIndirim money not null 

ALTER TABLE Sepet
ALTER COLUMN sepetteIndirim smallint not null

ALTER TABLE Sepet
ADD sepetteIndirimTipi int not null

ALTER TABLE Sepet
ALTER COLUMN sepetteIndirimTipi smallint not null

ALTER TABLE Sepet
DROP COLUMN sepetteIndirimTipi
--5


--DROP TABLE SepetDetayi
CREATE TABLE SepetDetayi(
sepetDetayID int primary key not null,
sepetID int  not null,--foreign key references Sepet (sepetID)
menuID int  not null,--foreign key references Menuler(menuID)
musteriID int not null,
toplamFiyat money not null,
)

ALTER TABLE SepetDetayi
ALTER COLUMN toplamFiyat smallmoney;

ALTER TABLE SepetDetayi
ADD teslimDurumu int not null;

ALTER TABLE SepetDetayi
ALTER COLUMN teslimDurumu varchar(20);

ALTER TABLE SepetDetayi
ADD FOREIGN KEY (sepetID) REFERENCES Sepet(sepetID);

ALTER TABLE SepetDetayi
ADD FOREIGN KEY (menuID) REFERENCES Menuler(menuID);

ALTER TABLE SepetDetayi
ADD FOREIGN KEY (musteriID) REFERENCES Musteri(musteriID);


--DROP TABLE Kurye
CREATE TABLE Kurye(
kuryeID int primary key not null,
kuryeAdi varchar(20) not null,
kuryeSoyadi varchar(20) not null,
kuryeTel int not null

)

ALTER TABLE Kurye
ADD kuryeMaas int not null;

ALTER TABLE Kurye
ADD kuryePrim int not null;

ALTER TABLE Kurye
ALTER COLUMN kuryeTel numeric(11,0) not null;

ALTER TABLE Kurye
ALTER COLUMN kuryeMaas money not null;

ALTER TABLE Kurye
ALTER COLUMN kuryePrim money not null;



	--VIEW-1
	--JOIN-1
--DROP VIEW SepetDetay

CREATE VIEW SepetDetay AS
SELECT musteriAdi,musteriSoyadi,musteriAdres from SepetDetayi
INNER JOIN Musteri ON Musteri.musteriID=SepetDetayi.musteriID

SELECT * FROM SepetDetay


	--VIEW-2
	--JOIN-2
--DROP VIEW MenuKategori

CREATE VIEW MenuKategori AS
SELECT kategoriAdi,Menuler.menuAdi,Menuler.menuFiyat from Kategoriler
INNER JOIN Menuler ON Kategoriler.kategoriID=Menuler.kategoriID

SELECT * FROM MenuKategori


	--VIEW-3
	--JOIN-3
--DROP VIEW MenuIndirim

CREATE VIEW MenuIndirim AS
SELECT menuAdi,menuFiyat,Indirim.indirimOrani from Menuler
INNER JOIN Indirim ON Indirim.indirimID=Menuler.indirimID

SELECT * FROM MenuIndirim


	--VIEW-4
	--JOIN-4
--DROP VIEW MusteriKuryeTel

CREATE VIEW MusteriKuryeTel AS
SELECT Kurye.kuryeID,kuryeAdi,kuryeTel,Musteri.musteriID,Musteri.musteriAdi,Musteri.musteriTel from Kurye
INNER JOIN Musteri ON Kurye.kuryeID = Musteri.kuryeID

SELECT * FROM MusteriKuryeTel


	--VIEW-5
	--JOIN-5
--DROP VIEW MusteriKarbilgi

CREATE VIEW MusteriKarbilgi AS
Select musteriAdi,musteriSoyadi,KartBilgileri.kartSahibiAdi,KartBilgileri.kartSahibiSoyadi,KartBilgileri.kartSahibiKartNo from Musteri
INNER JOIN KartBilgileri ON Musteri.kartSahibiKartNo=KartBilgileri.kartSahibiKartNo

SELECT * FROM MusteriKarbilgi




--TRANSACTION

insert into Indirim values(1,20,1) --INSERT 1
insert into Indirim values(2,0,2)	--INSERT 2
insert into Restoran values(1,'ALKANLAR RESTORAN','GEBZE/ÝSTASYON',11111111111,'þifre',10) --INSERT 3
insert into Kategoriler values(1,'ET','PROTEÝN') --INSERT 4
insert into Kategoriler values(2,'SALATA','YEÞÝLLÝK') --INSERT 5
insert into Kategoriler values(3,'TATLI','TATLI') --INSERT 6
insert into Menuler values(1,20,'kebap',5,'1',1,1,1) --INSERT 7
insert into Menuler values(2,20,'SALATA',5,'2',1,2,2) --INSERT 8
insert into Menuler values(3,10,'baklava',15,'2',1,3,2) --INSERT 9
UPDATE Indirim SET indirimOrani=20 where indirimID=2 --UPDATE-1

DELETE FROM Menuler where menuID=1 --DELETE-1

BEGIN TRANSACTION MenuIndirimTransaction;
UPDATE Menuler SET menuIndirim='var' WHERE menuID = 1; --UPDATE-2
UPDATE Indirim SET indirimOrani=10 WHERE menuID=1 -- UPDATE-3
SAVE TRANSACTION savepoint_one;
ROLLBACK TRANSACTION savepoint_one ;
SELECT * from Menuler 
SELECT @@TRANCOUNT AS OpenTransactions
COMMIT TRANSACTION MenuIndirimTransaction;
SELECT @@TRANCOUNT AS OpenTransactions





--TRIGGER-1

SELECT * FROM SepetDetayi

SELECT * FROM Menuler

--DROP TRIGGER SiparisGir_MenuGuncelle
CREATE TRIGGER SiparisGir_MenuGuncelle
ON SepetDetayi
AFTER INSERT
AS
BEGIN
	DECLARE @MenuID int
	SELECT @MenuID = menuID from inserted
	UPDATE Menuler set menuAdedi = menuAdedi-1 where menuID=@MenuID --UPDATE-4
END

DELETE FROM SepetDetayi where sepetDetayID=2 --DELETE-2
insert into SepetDetayi VALUES(2,1,1,1,20) --INSERT-11

--TRIGGER-2

SELECT * FROM Indirim
SELECT * FROM Menuler
DROP TRIGGER IndirimGir_MenuGuncelle
CREATE TRIGGER IndirimGir_MenuGuncelle
ON Indirim
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE @MenuID int
	DECLARE @IndirimOraný int
	SELECT @MenuID = menuID from inserted
	SELECT @IndirimOraný = indirimOrani from inserted
	UPDATE Menuler SET menuFiyat=menuFiyat-menuFiyat*@IndirimOraný/100 where menuID=@MenuID --UPDATE-5
END
--Trigger'ýn tetiklenmesi için bir insert iþlemi
delete from Indirim where indirimID=3 -- DELETE-2
insert into Indirim values(3,10,1) --INSERT-11
delete from Indirim where indirimID=3 -- DELETE-3
insert into Indirim values(3,20,1) --INSERT-12


--PROCEDURES
--PROCEDURE-1
--DROP PROCEDURE MenuKontrol
CREATE PROCEDURE MenuKontrol
(
	@MenuAdi varchar(15) = NULL
)
AS
BEGIN
	SELECT menuAdi,menuAdedi from Menuler where menuAdi = @MenuAdi
END

EXEC MenuKontrol 'kebap'


--PROCEDURE-2
--DROP PROCEDURE MusteriAra

CREATE PROCEDURE MusteriAra
(
	 @MusteriAdi nvarchar(50) = NULL
)
AS
BEGIN
	SELECT * FROM Musteri where musteriAdi LIKE '%' +@MusteriAdi + '%'
END

EXEC MusteriAra 'ba'

--INDEXES
------ INDEX-1
--DROP INDEX ix_menuAdi ON Menuler
CREATE INDEX ix_menuAdi ON Menuler(menuAdi)

------ INDEX-2
--DROP INDEX ix_musteriID ON SepetDetayi
CREATE INDEX ix_musteriID ON SepetDetayi(musteriID)


------ INDEX-3
--DROP INDEX ix_kategoriAdi ON Kategoriler
CREATE INDEX ix_kategoriAdi ON Kategoriler(kategoriAdi)


------ INDEX-4
--DROP INDEX ix_musteriTel ON Musteri
CREATE INDEX ix_musteriTel ON Musteri(musteriTel)


------ INDEX-5
--DROP INDEX ix_kuryeTel ON Kurye
CREATE INDEX ix_kuryeTel ON Kurye(kuryeTel)