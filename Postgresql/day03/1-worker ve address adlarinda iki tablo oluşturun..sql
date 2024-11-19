------------------Day 3 DT--------------------

/*Senaryo: "worker" ve "address" adlarinda iki tablo oluşturun.

worker tablosu sütunları: 
id CHAR(5), isim VARCHAR(50), maas INT, ise_baslama DATE

address tablosu sütunları:
adres_id CHAR(5), sokak VARCHAR(30), cadde VARCHAR(30), sehir VARCHAR(30)

Tablolari birbirine baglayarak, UNIQUE, NOT NULL uygulamasi yapiniz*/

/*Scenario: Create two tables named "worker" and "address".

worker table columns: 
id CHAR(5), name VARCHAR(50), salary INT, job_start DATE

address table columns:
address_id CHAR(5), street VARCHAR(30), street VARCHAR(30), city VARCHAR(30)

Apply UNIQUE, NOT NULL by linking tables together*/

--NOT: UNIQUE null kabul eder. Birden fazla da kabul eder cunku null bir deger degildir. Karsilastirma yapmaz

CREATE TABLE worker(
id char(5) PRIMARY KEY, 
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

CREATE TABLE address(
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY(adres_id) REFERENCES worker(id) 
);





INSERT INTO worker VALUES('10002', 'Donatello' ,12000, '2018-04-14'); --basarili
INSERT INTO worker VALUES('10003', null, 5000, '2018-04-14'); --basarili --unique:NULL kabul eder
INSERT INTO worker VALUES('10004', 'Donatello', 5000, '2018-04-14'); --HATA name unique olmali

INSERT INTO worker VALUES('10005', 'Michelangelo', 5000, '2018-04-14'); --basarili
INSERT INTO worker VALUES('10006', 'Leonardo', null, '2019-04-12'); --HATA, maas not null cunku
INSERT INTO worker VALUES('10007', 'Raphael', '', '2018-04-14'); --HATA, maas int bekliyor biz bos String gonderdik
INSERT INTO worker VALUES('', 'April', 2000, '2018-04-14'); --Basarili, PK hiclik kabul eder ama kullanimi onerilmez
INSERT INTO worker VALUES('', 'Ms.April', 2000, '2018-04-14'); --HATA, PK 2 tane hiclik kabul etmez cunku unique'dir
INSERT INTO worker VALUES('10002', 'Splinter', 12000, '2018-04-14'); --HATA, 10002 daha once kullanildi

INSERT INTO worker VALUES(null, 'Fred', 12000, '2018-04-14'); --HATA, PK null kabul etmez
INSERT INTO worker VALUES('10008', 'Barnie', 10000, '2018-04-14'); --basarili
INSERT INTO worker VALUES('10009', 'Wilma', 11000, '2018-04-14');
INSERT INTO worker VALUES('10010', 'Betty' ,12000, '2018-04-14');


INSERT INTO address VALUES('10003','Ninja Sok', '40.Cad.', 'IST'); --basarili
INSERT INTO address VALUES('10003','Kaya Sok', '50.Cad.', 'Ankara'); --basarili, FK dublicate olur
INSERT INTO address VALUES('10002','Taş Sok', '30.Cad.', 'Konya'); --basarili
INSERT INTO address VALUES('10012','Taş Sok', '30.Cad.', 'Konya'); --Hata, 10012 PK'de yok
INSERT INTO address VALUES(NULL,'Taş Sok', '23.Cad.', 'Konya'); --basarili
INSERT INTO address VALUES(NULL,'Taş Sok', '23.Cad.', 'Konya');


SELECT * FROM worker;
SELECT * FROM address;