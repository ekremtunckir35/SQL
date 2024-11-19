--18-ON DELETE CASCADE

/*Senaryo: "students2" ve "grades2" adlarinda iki tablo oluşturun.

students2 tablosu sütunları: 
id int, isim VARCHAR(50), veli_isim VARCHAR(50), yazili_notu int

grades2 tablosu sütunları:
talebe_id int, ders_adi varchar(30), yazili_notu int

Tablolari birbirine baglayarak, ON DELETE CASCADE uygulamasi yapiniz*/

/*Scenario: Create two tables named "students2" and "grades2".

students2 table columns: 
id int, name VARCHAR(50), parent_name VARCHAR(50), written_note int

grades2 table columns:
student_id int, course_name varchar(30), written_note int

Apply ON DELETE CASCADE by linking the tables together*/


CREATE TABLE students2
(
id int primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);


CREATE TABLE grades2( 
talebe_id int,
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES students2(id) ON DELETE CASCADE 	);


SELECT * FROM students2;

SELECT * FROM grades2;

INSERT INTO students2 VALUES
(122, 'Kerem Can', 'Fatma',75),
(123, 'Ali Can', 'Hasan',75),
(124, 'Veli Han', 'Ayse',85),
(125, 'Kemal Tan', 'Hasan',85),
(126, 'Ahmet Ran', 'Ayse',95),
(127, 'Mustafa Bak', 'Can',99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);


INSERT INTO grades2 VALUES 
 ('123','kimya',75),
 ('124', 'fizik',65),
 ('125', 'tarih',90),
 ('126', 'Matematik',90),
 ('127', 'Matematik',90),
 (null, 'tarih',90);



SELECT * FROM students2; --parent, referans veren
SELECT * FROM grades2; --child, referans alan


---
DELETE From grades2 WHERE talebe_id =123;    --basarili, child'dan bir kaydi dogrudan silebiliriz

DELETE FROM students2 WHERE id =126;--basarili


DELETE FROM students2; --child'da null kaydi kaldi
DELETE FROM grades2; --ile null'da silinir


                      --19-tabloyu silme

DROP TABLE students2; --HATA, tabloyu silemzsiniz cunku child'i var 
DROP TABLE students2 CASCADE; --child'daki FK kopar, child tablo silinmez

DROP TABLE IF EXISTS students18; --varsa bu tabloyu sil, yoksa hata verme
--boyle bir tablo yoksa uygulama durmasin varsa silsin demektir(IF EXISTS)








