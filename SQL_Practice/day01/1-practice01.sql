CREATE table ogrenciler(
  id int PRIMARY KEY,
  isim VARCHAR(30),
  adres VARCHAR(100),
  sinav_notu Integer
);


---- TABLOYA VERI EKLEME ABORT

INSERT INTO ogrenciler VALUES(1,'Betul Kuyucu','Istanbul',65);  
insert into ogrenciler values(8,'Ali Can','Ankara',45);
INSERT INTO ogrenciler VALUES (9,'İrfan Canan','Adana',100);
--- 2.yontem birden fazla verinin eklenmesini yani coklu verinin eklenmesini saglar 


INSERT INTO ogrenciler (id,isim,adres,sinav_notu) values
        (2,'Zeki Bey','Izmir', 90),
        (3,'Cemal Dogan','Trabzon',65),
        (4,'Mirac','Bursa',45),
        (5,'Yavuz Bal','Antalya',55);


Insert into ogrenciler(id,isim,sinav_notu)values
(6,'Bilal Degirmen',95),
(7,'Fahri Ersoz',92);

SELECT * FROM ogrenciler; 


-- SORU1: ogrenciler tablosundaki id ve isim bilgileri ile tum recordlari getirelim :

SELECT id,isim FROM ogrenciler;


-- SORU2: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele

SELECT *  FROM ogrenciler WHERE sinav_notu > 80 ;


-- SORU3: Adresi Ankara olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE adres= 'Ankara';


-- SORU4: Sinav notu 65 ve adresi Istanbul olan ogrenci ismini listele

SELECT isim FROM ogrenciler WHERE adres ='Istanbul' and sinav_notu=65;


-- SORU5: Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu = 55 or sinav_notu =100;


-- SORU6: Sinav notu 65 ve 85 arasinda olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu BETWEEN 65 and 85;


-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele

SELECT isim,sinav_notu FROM ogrenciler WHERE id not between 3 and 5;

-- SORU8: En yuksek sinav puani nedir

SELECT max(sinav_notu) FROM ogrenciler;


-- SORU9: Izmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:

SELECT * FROM ogrenciler WHERE adres ='Izmir' and sinav_notu > 50;

-- SORU10: Öğrenci sayısı ve ortalama sınav notu:

SELECT count(*),avg(sinav_notu) FROM ogrenciler;-- b9 72,444444

SELECT count(*),round(avg(sinav_notu),2) FROM ogrenciler;-- sonucu virgulden sonra sadece 2 rakam yazdirmak icin round kullandik. 


-- SORU 11: sinav_notu 55 olan satiri siliniz

DELETE from ogrenciler WHERE sinav_notu =55;


-- SORU12: ismi Derya Soylu veya Cemal Dogan olan satirlari siliniz

DELETE FROM ogrenciler where isim ='Derya Soylu' or isim ='Cemal Dogan';--- 1.yol 

DELETE FROM ogrenciler where isim in('Derya Soylu','Cemal Dogan','Ali Can'); -- 2.yol IN keword u kullaniriz.


-- SORU13 : Ogrenciler tablosunn icerigini siliniz

DELETE FROM ogrenciler;

TRUNCATE table ogrenciler;-- TRUNCATE tamamini biranda siler


---TABLO SILME ISLEMI 

--SORU14 : Ogrenciler Tablosunu siliniz

DROP TABLE ogrenciler;
