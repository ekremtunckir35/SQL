------------------Day 6 DT--------------------

--31- UNION - UNION ALL ifadesi  

/*

1. UNION
Amaç: İki veya daha fazla sorgunun sonuç setlerini birleştirir.

Özelliği: Çift kayıtları (aynı olan satırları) otomatik olarak kaldırır ve yalnızca benzersiz satırları döndürür.

Kullanım Durumları:

İki farklı tabloyu birleştirirken aynı veriyi tekrarlamamak için.
Raporlama ve analizlerde tekrarlı verileri istemediğiniz durumlarda.

2. UNION ALL

Amaç: İki veya daha fazla sorgunun sonuç setlerini birleştirir.

Özelliği: Çift kayıtları kaldırmaz, tüm satırları döndürür (tekrarlı satırlar dahil).

Kullanım Durumları:

Performansın önemli olduğu durumlarda (çift kayıtların kaldırılma işlemi yapılmaz, daha hızlıdır).
Tüm verileri görmek istediğiniz durumlarda.

UNION ve UNION ALL Kullanımı

Kullanım Şartları
Sorguların döndürdüğü sütun sayısı ve sıraları aynı olmalıdır.
Sütunların veri tipleri uyumlu olmalıdır (örn. bir sütun INTEGER ise diğer sorguda karşılık gelen sütun da INTEGER olmalıdır).

Hangi Durumda Hangisi Kullanılmalı?
Tekrarlı kayıtlar önemli değilse ve hız gerekiyorsa: UNION ALL kullanılır.
Tekrarlı kayıtları istemiyorsanız: UNION kullanılır.


UNION ve UNION ALL Karşılaştırması

Özellik       	      UNION	                                          UNION ALL
Çift kayıtlar	   Kaldırılır (benzersiz kayıtlar)	          Kaldırılmaz (tüm kayıtlar döner)
Performans	       Daha yavaş	                              Daha hızlı
Kullanım amacı     Benzersiz kayıtlar gerekli ise	          Tüm veriler görülmek isteniyorsa



*/

CREATE TABLE developers(
	id SERIAL PRIMARY KEY,
	name varchar(50),
	email varchar(50) UNIQUE,
	salary real,
	prog_lang varchar(20),
	city varchar(50),
	age int	
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);

CREATE TABLE contact_info(
	address_id int,
	street varchar(30),
	number int,	
	city varchar(30),
	FOREIGN KEY(address_id) REFERENCES developers(id)	
);

INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');

SELECT * FROM developers;
SELECT * FROM contact_info;
SELECT * FROM employees4; 

/*Senaryo 1: Ankara'da yaşayan developer ve İstanbul'da yaşayan çalışanların(employees4) isimlerini birlikte tekrarsız gösteren sorguyu yaziniz*/

/*Scenario 1: Write the query that shows the names of the developer living in Ankara and the employees (employees4) living in Istanbul together without duplicates*/

SELECT name FROM developers WHERE city = 'Ankara'
UNION
SELECT isim FROM employees4 WHERE sehir = 'Istanbul';

--developer ve çalışanların(employees4) isimlerini birlikte tekrarlı gösteren sorguyu yaziniz
--Write the query that shows the names of developer and employees(employees4) repeatedly together

SELECT name FROM developers WHERE city = 'Ankara'
UNION ALL
SELECT isim FROM employees4 WHERE sehir = 'Istanbul';

--union mantigi veri setlerini birlestirmedir, ancak veri type'lari ayni ya da uyumlu olmak zorundadir.

/*Senaryo 2: Yaşı 25’den büyük olan developer isimlerini ve yaşı 30'dan küçük developerların kullandığı prog. dillerini birlikte tekrarlı gösteren sorguyu yaziniz*/

/*Scenario 2: Write the query that shows the names of developers older than 25 and the prog. languages used by developers younger than 30 repeatedly together*/

SELECT name AS name_prog_lang FROM developers WHERE age>25
UNION ALL
SELECT prog_lang FROM developers WHERE age < 30;


SELECT name AS name_prog_lang FROM developers WHERE age>25
UNION ALL
SELECT prog_lang FROM developers WHERE age < 30;



/*Senaryo 3: Java kullananların maaşı ile şehrini ve 
Vakko'da çalışanların maaşı ile şehrini tekrarsız gösteren sorguyu yaziniz*/

/*Scenario 3: The salary of Java users and the city 
Write the query that shows the salary and city of Vakko employees without duplicate
*/

SELECT city,salary FROM developers WHERE prog_lang ='Java'
UNION
SELECT sehir,maas FROM employees4 WHERE isyeri = 'Vakko';

--NOT:UNION/UNION ALL birleştirdiğimiz sorgular
--aynı sayıda sütun göstermeli ve alt alta
--gelecek olan sütunların data tipleri aynı olmalı



/*Senaryo 4: id'si 8 olan developer'ın çalıştığı şehir ile maaşını ve iletişim adresindeki şehir ile kapı nosunu görüntüleyiniz.*/
/*Scenario 4: Display the city and salary of the developer with id 8 and the city and door number of his contact address.*/

SELECT city, salary FROM developers WHERE id = 8
UNION
SELECT city, number FROM contact_info WHERE address_id = 8;


/*Senaryo 2: developers tablosunda Java kullananların çalıştıkları şehirler ve employees4 tablosunda maaşı 1000 den fazla olanların sehirlerinden 
ortak olanlarını listeleyiniz.*/

/*Scenario 2: the cities where Java users work in the developers table and the cities of those whose salary is more than 1000 in the employees4 table 
List the common ones.*/

SELECT city FROM developers WHERE prog_lang ='Java'

INTERSECT
SELECT sehir FROM employees4 where maas > 1000;

--BURADA SORGU SIRASI ONEMLI MI? --Hangi tablonun uste yazilacagi onemli degildir


/*Senaryo 3: developers tablosundaki şehirleri,
employees4 tablosundaki sehirler hariç olarak listeleyiniz*/
/*Scenario 3: cities in the developers table,
list excluding cities in the employees4 table*/

SELECT CITY FROM developers
EXCEPT
SELECT SEHIR FROM employees4;


/*Senaryo 4: employees4 tablosundaki şehirleri,
developers tablosundaki sehirler hariç olarak listeleyiniz*/
/*Scenario 4: cities in the employees4 table,
list excluding cities in the developers table*/


SELECT sehir FROM employees4
except
select city from developers;



--ÖDEV:march ve april tablolarındaki tüm ürünlerin isimlerini tekrarsız listeleyiniz.  
 --ÖDEV:march ve april tablolarındaki ortak ürünlerin isimlerini listeleyiniz.
 --ÖDEV:march ayında satılıp april ayında satılmayan ürünlerin isimlerini listeleyiniz.