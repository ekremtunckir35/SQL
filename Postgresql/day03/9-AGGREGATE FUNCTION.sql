                                               22 -- AGGREGATE FUNCTION   



 /*Senaryo: "brands" ve "employees3" adinda iki tablo oluşturun.*/
/*Scenario: Create two tables named "brands" and "employees3".*/


CREATE TABLE brands
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);



INSERT INTO brands VALUES(100, 'Vakko', 12000);
INSERT INTO brands VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO brands VALUES(102, 'Adidas', 10000);
INSERT INTO brands VALUES(103, 'LCWaikiki', 21000);


CREATE TABLE employees3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);



INSERT INTO employees3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO employees3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO employees3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO employees3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO employees3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO employees3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO employees3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM brands;

SELECT * FROM employees3;


--employees3 tablosunda max maaş değerini bulunuz.
--Find the max salary value in the employees3 table.

SELECT MIN(maas) FROM employees3;


--employees3 tablosunda toplam maaş değerini bulunuz.
--Find the total salary value in the employees3 table.

SELECT SUM(maas) FROM employees3; --19000


--employees3 tablosunda ortalama maaş değerini bulunuz.
--Find the average salary value in the employees3 table.

SELECT ROUND(AVG(maas), 2) FROM employees3; --2714.29


--employees3 tablosundaki kayıt sayısını bulunuz.
--Find the number of records in the employees3 table.



--employees3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.
--Find the number of records of those whose salary is 2500 in the employees3 table.



SELECT COUNT(*) FROM employees3; --7

SELECT COUNT(id) FROM employees3; --7 null sayilmaz

--employees3 tablosunda maaşı 2500 olanların kayıt sayısını bulunuz.
--Find the number of records of those whose salary is 2500 in the employees3 table.

SELECT COUNT(*) FROM employees3 WHERE maas = 2500; --2



