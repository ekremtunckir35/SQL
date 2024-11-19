--16-Tablodaki tüm kayıtları silme:TRUNCATE TABLE:DDL

/*
TRUNCATE TABLE komutunun bazı önemli özellikleri:

Hızlı Temizlik: TRUNCATE TABLE, tablodaki tüm verileri hızla silmek için kullanılır. Bu, özellikle büyük tablolar için DELETE komutundan daha verimlidir çünkü TRUNCATE log kayıtlarını daha az tutar ve tüm satırları tek seferde siler.

Koşulsuz: TRUNCATE TABLE, DELETE komutunun aksine, WHERE koşulu kullanmaz ve tablodaki tüm satırları siler.

İşlem Logları: TRUNCATE TABLE, DELETE komutuna kıyasla daha az işlem logu tutar, bu da veritabanı kaynaklarını daha az tüketmesini sağlar.

Yapıyı Korur: TRUNCATE TABLE tablonun yapısını korur, yani sütunlar ve kısıtlamalar (constraints) silinmez, sadece içerik temizlenir. (Delete'te korur)

İşlem Geri Alınamaz: Çoğu veritabanı sistemlerinde TRUNCATE TABLE komutu işlem bloğu içinde kullanılmadığı sürece geri alınamaz. Ancak, bazı sistemlerde (örneğin, PostgreSQL) TRUNCATE TABLE komutu bir işlem bloğu içinde kullanıldığında ve işlem tamamlanmadan önce ROLLBACK komutu verildiğinde geri alınabilir.*/


CREATE TABLE doctors(
	id serial,
	name varchar(30) not null,
	salary real,
	email varchar(50) unique
);

INSERT INTO doctors(name,salary,email) VALUES('Dr. Gregory House',6000,'dr@mail.com');
INSERT INTO doctors(salary,email) VALUES(6000,'doctor@mail.com');--HATA NAME NULL OLAMAZ 
INSERT INTO doctors(name,salary,email) VALUES('',6000,'doc@mail.com');


SELECT * FROM doctors;

--doctors tablosundan tüm kayıtları silelim.
--Delete all records from the doctors table.


TRUNCATE table doctors;

--TRUNCATE TABLE doctors;--where ile kullanilmaz. 


             --17-parent-child ilişkisi olan tablolardan kayıt silme
			 
--Delete records from tables with parent-child relationship

--worker tablosundan tüm kayıtları silelim.
-- delete all records from the worker table.

DELETE FROM worker;
--worker tablosunda address tarafından referans alınan kayıtlar olduğu 
--için silmeye izin yok


--id=10002 olan kayıt adresler tarafından referans alındığı 
--için silmeye izin yok.Once child'dan iliskiyi koparalim

DELETE FROM address WHERE adres_id ='10002';

--referans alınan kayıt silindi,ilişki koparıldı


SELECT * FROM worker;



DELETE FROM address; --tum baglanti koparildi

DELETE FROM worker; --artık hiçbir kayıt ref alınmadığı için başarılı.



  --      CASCADE ------

  --ON DELETE CASCADE     

  



