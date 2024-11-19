--15-Tablodan kayıt silme-DELETE FROM ... komutu:DML

/*
DELETE FROM
DML (Data Manipulation Language) Komutu: DELETE FROM bir DML komutudur.

DML komutları, veritabanındaki verileri yönetir ve değiştirir.

Rollback İle Geri Alınabilir: DELETE işlemi, bir işlem (transaction) içinde yapıldığında ve işlem henüz COMMIT edilmeden

ROLLBACK komutu ile geri alınabilir.

COMMIT edilmişse, bu işlem kalıcı hale gelir ve veritabanında yapılan değişiklikler geri alınamaz.

Ayrica, transaction kullanılmadan yapılan DELETE işlemi kalıcıdır.

Performans: Büyük tablolarda DELETE komutu yavaş çalışabilir, çünkü her bir satırı tek tek siler ve işlem sırasında log kayıtları tutar.

Bu nedenle, büyük miktarlarda veriyi silmek için farklı stratejiler veya komutlar kullanmak performansı iyileştirebilir

(örneğin, TRUNCATE komutu veya verileri daha küçük parçalara bölerek silmek(LIMIT ile)).*/

------------------------------------------------------





/*Senaryo: "students1" adinda bir tablo oluşturun.

students1 tablosu sütunları: 
id INTEGER, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu INTEGER

Tablo uzerinde cesitli silme islemleri yapiniz*/

/*Scenario: Create a table named "students1".

students1 table columns: 
id INTEGER, name VARCHAR(50), parent_name VARCHAR(50), written_note INTEGER

Perform various deletion operations on the table*/


CREATE TABLE students1
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);


INSERT INTO students1 VALUES(122, 'Kerem Can', 'Fatma',75),
(123, 'Ali Can', 'Hasan',75),
(124, 'Veli Han', 'Ayse',85),
(125, 'Kemal Tan', 'Hasan',85),
(126, 'Ahmet Ran', 'Ayse',95),
(127, 'Mustafa Bak', 'Can',99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);


SELECT * FROM students1;


--id=123 olan kaydı silelim.
-- Let's delete the record with id=123.

DELETE FROM students1 WHERE id = 123;


--ismi Kemal Tan olan kaydı silelim.
-- delete the entry with the name Kemal Tan.

DELETE FROM students1 WHERE isim = 'Kemal Tan';


--ismi Ahmet Ran veya Veli Han olan kayıtları silelim
-- delete records with the name Ahmet Ran or Veli Han

DELETE FROM students1 WHERE isim = 'Ahmet Ran' OR isim = 'Veli Han';



--------------------------


--15-a-tablodaki tüm kayıtları silme:DELETE FROM: DML,rollback ile geri alınabilir

SELECT * FROM students;

--students tablosundan  tüm kayıtları silelim.
-- delete all records from the students table.

--NOT: DELETE FROM komutu koşulsuz kullanıldığında tüm satırları siler ancak tablo kalır.

--satirlari tek tek sildigi icin yavastir. Daha hizlisi var. (TRUNCATE) ABORT


