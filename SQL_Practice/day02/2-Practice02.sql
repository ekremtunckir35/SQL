CREATE TABLE memurlar (
    memurlar_id Int PRIMARY Key,
    ad VARCHAR(100),
    sehir VARCHAR(50),
    sirket_ismi VARCHAR(100),
    calisma_performanslari VARCHAR(255)
);
INSERT INTO memurlar (memurlar_id,ad, sehir, sirket_ismi, calisma_performanslari)
VALUES
    (100,'Ali Yılmaz', 'Ankara', 'Samsung', 'Ortalama 67'),
    (101,'Ayşe Demir', 'İstanbul', 'Iphone', 'Ortalama 72'),
    (102,'Mehmet Kaya', 'İzmir', 'xiaomi', 'Ortalama 55'),
    (103,'Ahmet Can', 'Bursa' ,'Nokia', 'Ortalama 98'),
    (104,'Ahmet Kadir'  ,'Ankara',  'Nokia' ,'Ortalama 92.5'),
    (105,'Fatma Güzel'  ,'Giresun', 'Samsung'   ,'Ortalama 92.5'),
    (106,'Furkan Yılmaz', 'İzmir', 'xiaomi', 'Ortalama 99');
	

	
-- SORU5: memurlar sayisi 2900’den cok olan sirketlerin ve
--bu sirkette calisanlarin isimlerini ve calisma performanslarini listeleyin.

select sirket_ismi from sirketler where memur_sayisi>2200;--Iphone --Philips

SELECT ad,calisma_performanslari from memurlar where sirket_ismi=(select sirket_ismi from sirketler where memur_sayisi>2200);

select * from sirketler;

select * from memurlar;



-- SORU6: Ankara'da memurlari olan sirketlerin -->memurlar
--sirket id'lerini ve memurlar sayilarini listeleyiniz -->sirketler
--subquery select sirket_ismi from memurlar where sehir='Ankara';--Nokia,Samsung


select sirket_id,memur_sayisi from sirketler where sirket_ismi in(select sirket_ismi from memurlar where sehir='Ankara');
--102 1900
--100 1750


--Soru 7: eger giresunda bir tane bile memur varsa tum sirketleri yazdirin
--EXIST 
--subquery

SELECT * FROM memurlar WHERE sehir ='Giresun';


SELECT * FROM sirketler WHERE EXISTS(SELECT * FROM memurlar WHERE sehir ='Giresun')

	