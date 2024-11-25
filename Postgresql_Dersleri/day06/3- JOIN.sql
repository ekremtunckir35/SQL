--33- JOIN IFADESI


/* 
JOIN, iki veya daha fazla tabloyu belirli bir ilişki (bağlantı) üzerinden birleştirmek için kullanılan bir SQL ifadesidir.
Amaç: İki tablo arasında bağlantı kurarak veri çekmektir. Örneğin, bir tablodan müşteri bilgilerini, 
diğer bir tablodan bu müşterilerin siparişlerini bir arada göstermek için kullanılır.

Neden Kullanılır?
Birbirleriyle ilişkili tabloları birleştirerek anlamlı ve bütünleşik veri setleri oluşturmak.
Veritabanı tasarımında normalizasyon uygulanır ve veri farklı tablolar arasında bölünür. Bu tür verileri tek bir sorguda birleştirmek için kullanılır.
Performansı optimize etmek ve gereksiz veri tekrarı olmadan veri çekmek.

JOIN Çeşitleri ve Kullanımları

1. INNER JOIN
Amaç: Her iki tablodaki eşleşen kayıtları döndürür.
Özellik: Eşleşmeyen kayıtlar sonuçta yer almaz.

2. LEFT JOIN (LEFT OUTER JOIN)
Amaç: Sol (ilk) tablodaki tüm kayıtları getirir. Sağ (ikinci) tablodan sadece eşleşen kayıtlar gelir.
Eşleşme yoksa sağ tablodan gelen değerler NULL olur.


3. RIGHT JOIN (RIGHT OUTER JOIN)
Amaç: Sağ (ikinci) tablodaki tüm kayıtları getirir.
Sol (ilk) tablodan sadece eşleşen kayıtlar gelir. Eşleşme yoksa sol tablodan gelen değerler NULL olur.

4. FULL JOIN (FULL OUTER JOIN)
Amaç: Her iki tablodaki tüm kayıtları getirir. Eşleşme varsa birleşik, eşleşme yoksa NULL olarak gösterir.

5. CROSS JOIN
Amaç: Her iki tablodaki tüm kombinasyonları (Cartesian Product) oluşturur.
Özellik: Her bir satır bir tablo ile diğer tablodaki tüm satırlar eşleştirilir.


6. SELF JOIN
Amaç: Bir tabloyu kendisiyle ilişkilendirir.


                                       JOIN Kullanım Özet Tablosu

JOIN Türü	                             Amaç	                                                  Sonuçlar

INNER JOIN	              İki tabloda eşleşen kayıtları getirir.	                              Eşleşen kayıtlar.
LEFT JOIN	              Sol tablodaki tüm kayıtları ve sağ tablodan eşleşenleri getirir.	      Eşleşme yoksa sağ tablodan NULL.
RIGHT JOIN                Sağ tablodaki tüm kayıtları ve sol tablodan eşleşenleri getirir.	      Eşleşme yoksa sol tablodan NULL.
FULL JOIN                 Her iki tablodaki tüm kayıtları getirir.	                              Eşleşme yoksa ilgili tablodan NULL.
CROSS JOIN	              İki tablo arasındaki tüm kombinasyonları oluşturur.	                  Cartesian product.
SELF JOIN	              Bir tabloyu kendisiyle ilişkilendirir.	                              Aynı tablodan farklı rollerle eşleşen kayıtlar.  SAVEPOINT



JOIN Kullanımında Önemli Noktalar 

ON ve USING Kullanımı:

ON: İki tablo arasında hangi sütunların eşleştirileceğini belirtir.

USING: Aynı sütun adlarına sahipse kullanılır. 


Alias Kullanımı:

Tablo isimlerini kısaltmak için alias kullanılır (AS).  Daha okunabilir ve anlaşılır sorgular yazılır. 


Performans:

Büyük veri setlerinde doğru indeks kullanımı ile performans artırılabilir. 

EXPLAIN komutu ile sorgunun nasıl çalıştığını analiz edebilirsiniz.









*/
--INNER JOIN: baz aldığımız sütundaki sadece ortak olan kayıtları getirir
--Bu sorgu, companies2 ve orders tablolarını sirket_id sütunu üzerinden ilişkilendirir.


CREATE TABLE companies2  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO companies2 VALUES(100, 'IBM');
INSERT INTO companies2 VALUES(101, 'GOOGLE');
INSERT INTO companies2 VALUES(102, 'MICROSOFT');
INSERT INTO companies2 VALUES(103, 'APPLE');


CREATE TABLE orders (
siparis_id int,
sirket_id int,
siparis_tarihi date
);

INSERT INTO orders VALUES(11, 101, '2023-02-17');  
INSERT INTO orders VALUES(22, 102, '2023-02-18');  
INSERT INTO orders VALUES(33, 103, '2023-01-19');  
INSERT INTO orders VALUES(44, 104, '2023-01-20');  
INSERT INTO orders VALUES(55, 105, '2022-12-21');

SELECT * FROM companies2;
SELECT * FROM orders;

/*Senaryo 1: Asagida bulunan iki tablodaki şirket id'si aynı olanların şirket id, şirket ismi, sipariş tarihini, sipariş id'sini  listeleyiniz.*/
/*Scenario 1: List the company id, company name, order date, order id of those with the same company id in the two tables below.*/


SELECT companies2.sirket_id ,sirket_isim,siparis_id,siparis_tarihi
FROM companies2 
INNER JOIN  orders ON orders.sirket_id = companies2.sirket_id;
-- ON ile soft relationship yaptik



--34-LEFT JOIN: Baz aldığımız sütundaki, SOL(ilk) tablodaki tüm kayıtları getirir.
--RIGHT JOIN: Baz aldığımız sütundaki, SAĞ(ikinci) tablodaki tüm kayıtları getirir.



/*Senaryo 2: companies2 tablosundaki tüm kayıtların şirket id, şirket ismi,
sipariş tarihini, sipariş id'sini listeleyiniz.*/

/*Scenario 2: Company id, company name of all records in companies2 table,
list order date, order id.*/

SELECT companies2.sirket_id ,sirket_isim,siparis_id,siparis_tarihi
FROM companies2 LEFT JOIN orders ON orders.sirket_id = companies2.sirket_id;



--ARASTIRMA ODEVI: Normalde bu soruyu subquery ile de yapabilirdik. Peki JOIN ile yapmanin farki ne?
--Bu soruyu subquery ile cozunuz.

/*JOIN ile yapılan sorgu, iki tabloyu belirli bir ilişki (bu durumda sirket_id) üzerinden birleştirir ve tüm satırları döndürür.
Buradaki temel fark, JOIN kullanıldığında tüm şirketler ve varsa onlara ait siparişler gösterilirken, 
alt sorgu (subquery) kullanıldığında daha dar bir veri kümesi üzerinde işlem yapılır.

JOIN ile:

Ana tabloyu (companies2) baz alarak tüm veriyi getirebilirsiniz.
LEFT JOIN kullanıldığı için, her şirket için sipariş olup olmadığına bakılmaksızın tüm şirketler gösterilir, 
sipariş bilgisi eksik olanlar için NULL değerleri yer alır.

Subquery ile:

Subquery, daha bağımsız bir işlem yaparak, belirli bir alt küme üzerinde çalışmanıza olanak tanır.
Örneğin, sadece siparişli şirketleri göstermek ya da yalnızca belirli siparişlerle ilgili bilgileri çekmek için kullanabilirsiniz.*/

SELECT companies2.sirket_id, companies2.sirket_isim, 
       (SELECT siparis_id 
        FROM orders 
        WHERE orders.sirket_id = companies2.sirket_id
        LIMIT 1) AS siparis_id, 
       (SELECT siparis_tarihi 
        FROM orders 
        WHERE orders.sirket_id = companies2.sirket_id
        LIMIT 1) AS siparis_tarihi
FROM companies2;

/*Bu sorguda:

companies2 tablosundaki her bir şirket için bir alt sorgu çalıştırılır.
Her şirketin sirket_id'sine bağlı olarak, orders tablosunda yalnızca bir sipariş ID ve tarih bilgisi alınır (bu örnekte sadece ilk siparişi alıyoruz).

LIMIT 1 komutu ile sadece ilk eşleşen sipariş alınır. Eğer birden fazla sipariş varsa, sadece ilk sipariş bilgisi getirilir.

Farklar:

JOIN: Tek bir sorguda her iki tablodan tüm veriler getirilir. Tüm şirketler ve ilişkili siparişler bir arada döner.

Subquery: Her bir şirket için bağımsız olarak alt sorgu çalıştırılır.

Bu durumda sadece belirli bir sipariş bilgisi alınır ve işlemler daha izole bir şekilde yapılır.
Eğer belirli bir amacınız varsa
(örneğin, her şirketin tüm siparişlerinin listelenmesi) JOIN daha verimli olabilir, 
ancak yalnızca spesifik bir alt küme üzerinde işlem yapmak için subquery tercih edilebilir.*/



/*Senaryo 3: orders tablosundaki tüm kayıtların şirket id, şirket ismi,
sipariş tarihini, sipariş id'sini  listeleyiniz.*/ 



/*Scenario 3: company id, company name of all records in the orders table,
list order date, order id.*/

SELECT orders.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM companies2 RIGHT JOIN orders ON companies2.sirket_id = orders.sirket_id;


--ayni soruyu LEFT JOIN le cozersek 

--NOT:LEFT/RIGHT JOIN tablo sırası değiştirilerek birbirinin yerine alternatif olarak kullanılabilir.

SELECT orders.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM orders LEFT JOIN companies2 ON companies2.sirket_id = orders.sirket_id;


--35-FULL JOIN: Baz aldığımız sütundaki, her iki tablodaki tüm kayıtları getirir.

/*Senaryo 4: Her iki tablodaki tüm kayıtları listeleyiniz.*/
/*Scenario 4: List all records in both tables.*/

SELECT companies2.sirket_id,sirket_isim,orders.sirket_id,siparis_id,siparis_tarihi

FROM companies2 FULL JOIN orders

ON orders.sirket_id = companies2.sirket_id;


SELECT companies2.sirket_id, sirket_isim, orders.sirket_id, siparis_id, siparis_tarihi
FROM orders FULL JOIN companies2 
ON orders.sirket_id = companies2.sirket_id;


SELECT *
FROM companies2 FULL JOIN orders
ON orders.sirket_id = companies2.sirket_id;


