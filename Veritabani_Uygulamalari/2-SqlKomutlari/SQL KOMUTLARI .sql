--SQL KOMUTLARI 

-- SELECT KOMUTLARI 

--TABLODAKI ISTENILEN KAYITLARI LISTELEMEK ICIN KULLANILIR. 

-- SELECT * FROM tablo_ismi

SELECT * FROM fakulteler;

SELECT * FROM ogrenciler;

--tabloda belirli alanlardaki bilgiler listenecek ise 

SELECT  ogrenci_ad,ogrenci_soyad FROM ogrenciler;--ogrenciler tablosundaki butun ad soyad listeneleceky=tir.

--tabloda istenilen sartlara uygun kayitlarin listelenmesi icin "WHERE" KOMUTUNU kullaniriz.

SELECT * FROM ogrenciler WHERE ogrenci_ad ='Ali';

--soyadi Can olan ogrencileri listeleyelim

SELECT * FROM ogrenciler WHERE ogrenci_soyad ='ÇELIK';

--Ismi cem olan ogrencilerin ad,soyad ve dogum tarihlerini gosterin

select  ogrenci_ad,ogrenci_soyad,dogum_tarihi FROM ogrenciler where ogrenci_ad ='Cem';

--Sayisal alanlara gore sorgulama 

--ogrenci numarasi 15 den buyuk ve bayan olan kayitlari getirmek

SELECT * FROM ogrenciler WHERE ogrenci_no >15 AND cinsiyet =False;

--Bilgisayar Muhendislik veya Hukuk faultesinde okuyan ogrencileri listeleyelim

SELECT * FROM ogrenciler WHERE bolum_kod =5  or bolum_kod=2;


SELECT * FROM fakulteler;

SELECT * FROM bolumler;

SELECT * FROM dersler;

SELECT * FROM ogrenciler;

SELECT * FROM notlar;


--Matematik veya Bilgisayar Muhendisligi bolumunde okuyan bayanlarin listesini yaoin

SELECT * FROM ogrenciler WHERE (bolum_kod =3 OR bolum_kod=2) AND cinsiyet=false;


--IN ,NOT IN 

--Bilhisayar muhendisligi veya Matematik bolumu veya biyoloji bolumunde okuyan ogrencileri listeleyiniz

SELECT * FROM ogrenciler 
where bolum_kod =2 OR bolum_kod =3 OR bolum_kod =3



--BETWEEN 
--Aralikli sorgulama yapmak icin kullanilir.Genellikle sayisal alanalar uzerinde kullanilir.
--Amac iki deger arasinda kayitlari listelemektir.

--Numarasi 12 ile 15 arasinda olan ogrencileri listeleyiniz

SELECT * FROM ogrenciler where ogrenci_no >=12 AND ogrenci_no<=15;

--LIKE, NOT LIKE 
--Karakter turu alanlar uzerinde islem yapan komutlardir.
--Belirtilen alna icinde istenilen karakterlerin sorgulanmasini saglayan komutlardir.
--LIKE operatornde % isareti kullanilir.

--Ismi A ile baslayan ogrencileri listeleyiniz

SELECT * FROM ogrenciler where ogrenci_ad LIKE 'A%';

SELECT * FROM ogrenciler where ogrenci_ad NOT LIKE 'A%';



---ORDER BY  --->KAYITLARIN SIRALANMASI

--Sorgulamalar sonucunda listelenen kayitlarin belilrl alanlara gore
--alfabetlik veya sayisal olrak artan ya da azalan seklinde sirlanmasi icin ORDER BY komutu kullanilir.
--artan olrak  ASC 
--azalan olrak DESC parametleri kullanilir.

--ogrenci listesinin alfabetik listeleyiniz

SELECT * FROM  ogrenciler order by ogrenci_ad;

SELECT * FROM  ogrenciler order by ogrenci_ad ASC;

SELECT * FROM  ogrenciler order by ogrenci_ad DESC;

-- ogrenci listesini ogrenci numaralarina gore kucukten buyuge listeyiniz
SELECT * FROM ogrenciler order by ogrenci_no

SELECT * FROM ogrenciler order by ogrenci_no ASC;

SELECT * FROM ogrenciler order by ogrenci_no DESC;

---DISTINCT 
-- Bir alanda biribirini ayni kayit olabilir.Bir tabloda ayni isimde  ogrencilerini bulunmasi durumunda ,
--ayni isimlerin bir defa yazilmasi icin DISTINCT deyimi kullanilir.
--DISTINCT  SELECT ten sonra belirtilir.tekrarlanmais istenmeyen alanin basinda yazilir.

SELECT ogrenci_ad from ogrenciler order by ogrenci_ad;

SELECT DISTINCT ogrenci_ad from ogrenciler order by ogrenci_ad;

