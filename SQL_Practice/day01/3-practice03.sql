CREATE TABLE sirketler(
sirket_id INT PRIMARY KEY,
sirket_ismi VARCHAR(50),
memur_sayisi INT
);

INSERT INTO sirketler(sirket_id,sirket_ismi,memur_sayisi)
VALUES(100,'Nokia',1000),
(101,'Iphone',900),
(102,'Samsung',1200),
(103,'xiaomi',1500);


--soru 1 :en yüksek memurlar sayisi değerini getiriniz

SELECT max(memur_sayisi)FROM sirketler;

select sirket_ismi,memur_sayisi from sirketler where memur_sayisi=(select max(memur_sayisi)from sirketler);--1500

--soru 2 : en düşük memurlar sayisi değerinin 1.5 katını getirin

SELECT min(memur_sayisi) FROM sirketler;-- en dusuk memur sayisini getirdik

SELECT min(memur_sayisi)* 1.5 FROM sirketler; -- en dusuk memur sayisinin 1.5 kati

SELECT min(memur_sayisi)*1.5 AS en_dusuk_memur_sayisi FROM sirketler;--burada as ile sutun adini degistirdik



--soru 3 : nokia ve xiaomi  memurlar sayisinin toplamını bulunuz

--1.yol 

SELECT sum(memur_sayisi)FROM sirketler WHERE sirket_ismi='Nokia' or sirket_ismi ='xiaomi';

--2.yol

SELECT sum(memur_sayisi)as toplam FROM sirketler WHERE sirket_ismi in('Nokia', 'xiaomi');


--soru 4 :Ortalama memurlar sayisi degerini bulunuz

SELECT avg(memur_sayisi) FROM sirketler;-- 1150.000000000

SELECT  round (avg(memur_sayisi)) FROM sirketler;


-- soru 5 : toplam sirketler sayisini getiriniz.ABORT

SELECT count(sirket_id) FROM sirketler;

INSERT INTO sirketler VALUES(104,'Sony');
INSERT INTO sirketler VALUES(106,NULL,'1350');


SELECT * FROM sirketler;

--soru 4 :Ortalama memurlar sayisi değerinden düşük olan memurlarin memur_sayisi değerlerini 400 artırın.

UPDATE sirketler
SET memur_sayisi = memur_sayisi + 400
WHERE memur_sayisi < (SELECT avg(memur_sayisi) FROM sirketler);
