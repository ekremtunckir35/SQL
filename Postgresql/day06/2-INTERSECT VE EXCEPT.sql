-- 32-- INTERSECT VE EXCEPT OPERATORLERI

/* 
PostgreSQL'de INTERSECT ve EXCEPT, SQL sorgularında iki veya daha fazla sonuç setini karşılaştırmak için kullanılan küme operatörleridir.
Bu operatörler, belirli kriterlere göre kesişim veya fark işlemleri yaparak veri manipülasyonunu kolaylaştırır.

1. INTERSECT Operatörü
Amaç: İki sorgunun kesişim kümesini döndürür.
Özelliği:
Her iki sorguda da ortak olan satırları döndürür.
Çift kayıtları (aynı satırları) otomatik olarak kaldırır.
Kullanım Durumları:
İki tablo arasında ortak kayıtları bulmak.
İki farklı sorgunun kesişimini analiz etmek.


2. EXCEPT Operatörü
Amaç: Birinci sorguda bulunan ancak ikinci sorguda bulunmayan kayıtları döndürür.
Özelliği:
İlk sorgunun ikinci sorguda olmayan kayıtlarını listeler.
Çift kayıtları kaldırır.
Kullanım Durumları:
Bir tabloda var olan ancak diğerinde olmayan verileri bulmak.
İki farklı sorgu arasındaki farklılıkları analiz etmek.



PostgreSQL'de INTERSECT ve EXCEPT Operatörleri
PostgreSQL'de INTERSECT ve EXCEPT, SQL sorgularında iki veya daha fazla sonuç setini karşılaştırmak için kullanılan küme operatörleridir. Bu operatörler, belirli kriterlere göre kesişim veya fark işlemleri yaparak veri manipülasyonunu kolaylaştırır.

1. INTERSECT Operatörü
Amaç: İki sorgunun kesişim kümesini döndürür.
Özelliği:
Her iki sorguda da ortak olan satırları döndürür.
Çift kayıtları (aynı satırları) otomatik olarak kaldırır.
Kullanım Durumları:
İki tablo arasında ortak kayıtları bulmak.
İki farklı sorgunun kesişimini analiz etmek.


2. EXCEPT Operatörü
Amaç: Birinci sorguda bulunan ancak ikinci sorguda bulunmayan kayıtları döndürür.
Özelliği:
İlk sorgunun ikinci sorguda olmayan kayıtlarını listeler.
Çift kayıtları kaldırır.
Kullanım Durumları:
Bir tabloda var olan ancak diğerinde olmayan verileri bulmak.
İki farklı sorgu arasındaki farklılıkları analiz etmek.

INTERSECT ve EXCEPT Kullanım Şartları

Sorgu Sonuçlarının Yapısı Aynı Olmalı:

Her iki sorgunun sütun sayısı ve sıraları aynı olmalıdır.
Sütunların veri tipleri birbiriyle uyumlu olmalıdır.

Çift Kayıtlar:
Her iki operatör de çift kayıtları kaldırır. (Bu nedenle benzersiz sonuçlar döner.) HANDLER


                                    INTERSECT ve EXCEPT Karşılaştırması
									
Özellik	                               INTERSECT	                                                  EXCEPT
Amaç	                    İki sorgu arasında ortak kayıtları bulur.	           İlk sorguda olup ikinci sorguda olmayanları bulur.
Kullanım Durumu	            Kesişim kümesi analizi.	                               Fark kümesi analizi.
Çift Kayıtlar           	Çift kayıtları kaldırır.	                           Çift kayıtları kaldırır.
Performans              	İki tabloyu karşılaştırdığı için maliyetlidir.	       İki tabloyu karşılaştırdığı için maliyetlid


Hangi Durumda Hangisi Kullanılır?
INTERSECT:   İki tablo arasında ortak veri var mı?  Ortak müşteriler, ürünler veya siparişler gibi verileri analiz etmek için kullanılır.

EXCEPT:  Bir tabloda olup diğerinde olmayan veriler. Yeni eklenmiş veya eksik olan kayıtları bulmak için kullanılır.

*/


--INTERSECT 




--EXCEPT 


SELECT * FROM developers;

SELECT * FROM employees4;



/*Senaryo 1: developers tablosundaki şehirler ve employees4 tablosunda sehirlerin
aynı olanlarını tekrarsız olarak listeleyiniz*/

/*Scenario 1: cities in the developers table and cities in the employees4 table
list the same ones without repetition*/


SELECT city FROM developers
INTERSECT
SELECT sehir FROM employees4;


/*Senaryo 2: developers tablosunda Java kullananların çalıştıkları şehirler ve employees4 tablosunda maaşı 1000 den fazla olanların sehirlerinden 
ortak olanlarını listeleyiniz.*/

/*Scenario 2: the cities where Java users work in the developers table and the cities of those whose salary is more than 1000 in the employees4 table 
List the common ones.*/


SELECT sehir FROM employees4 WHERE maas > 1000
INTERSECT
SELECT city FROM developers WHERE prog_lang = 'Java';

--Hangi tablonun uste yazilacagi onemli degildir


/*Senaryo 3: developers tablosundaki şehirleri, employees4 tablosundaki sehirler hariç olarak listeleyiniz*/

/*Scenario 3: cities in the developers table,list excluding cities in the employees4 table*/

SELECT city FROM developers
EXCEPT
SELECT sehir FROM employees4;


/*Senaryo 4: employees4 tablosundaki şehirleri,developers tablosundaki sehirler hariç olarak listeleyiniz*/

/*Scenario 4: cities in the employees4 table,list excluding cities in the developers table*/

SELECT sehir FROM employees4
EXCEPT
SELECT city FROM developers


--ÖDEV:march ve april tablolarındaki tüm ürünlerin isimlerini tekrarsız listeleyiniz.  
 --ÖDEV:march ve april tablolarındaki ortak ürünlerin isimlerini listeleyiniz.
 --ÖDEV:march ayında satılıp april ayında satılmayan ürünlerin isimlerini listeleyiniz....