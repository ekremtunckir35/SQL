------------------------Day 2 DT---------------------

/*Senaryo: "actors" adında bir tablo oluşturun ve şu sütunları ekleyin:

id INTEGER
name VARCHAR(30) 
email VARCHAR(50) 

Scenario: Create a table called "actors" and add the following columns:

id INTEGER
name VARCHAR(30) 
email VARCHAR(50) 
*/

/*1- CREATE TABLE IF NOT EXISTS, tablonun var olup olmadığını kontrol eder. Eğer tablo zaten mevcutsa, CREATE TABLE komutu hiçbir şey yapmaz. Yani, PostgreSQL herhangi bir hata vermeden ve tabloyu yeniden oluşturmadan komutu yoksayar.
Eğer tablo yoksa, yeni bir tablo oluşturur.*/

CREATE TABLE IF NOT EXISTS actors(
id INTEGER,
name VARCHAR(30),
email VARCHAR(50)
);

SELECT * FROM actors;


INSERT INTO actors VALUES(1001, 'Kemal Sunal', 'aktor@gmail.com');
INSERT INTO actors VALUES(1002, 'Sener Sen', 'aktor@gmail.com'); --mail unique olmaliydi

INSERT INTO actors(name) VALUES ('Turkan Soray'); --deger girilmeyen diger sutunlar null oldu


-------------------------------
--9-Tabloya UNIQUE constraint’i ekleme
--Bir sütuna tekrarlı verilerin eklenememesi için tablo ve sütunları tanımlanırken UNIQUE kısıtlaması eklenir.

/*Senaryo: “programmers" adında bir tablo oluşturun ve şu sütunları ekleyin:

id SERIAL
name VARCHAR(30) 
email VARCHAR(50)
salary REAL
prog_lang VARCHAR(20)  
ve email’i unique yapin*/

/*Scenario: Create a table named "programmers" and add the following columns:

id SERIAL
name VARCHAR(30) 
email VARCHAR(50)
salary REAL
prog_lang VARCHAR(20)  
and make the email unique*/


CREATE TABLE programmers(

id SERIAL,
name VARCHAR(30),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)

);


SELECT * FROM programmers;


INSERT INTO programmers(name, email, salary, prog_lang) VALUES('Tom', 'mail@mail.com', 5000, 'Java');
--INSERT INTO programmers(name, email, salary, prog_lang) VALUES('Jerry', 'mail@mail.com', 4000, 'SQL'); HATA, mail unique olmaliydi

INSERT INTO programmers(name, email, salary, prog_lang) VALUES('Jerry', 'jerry@mail.com', 4000, 'SQL');


-------------------------------
--10-Tabloya NOT NULL constraint'i ekleme
--Bir sütuna NULL değerlerin  eklenememesi için tablo ve sütunları tanımlanırken NOT NULL kısıtlaması eklenir.

--name bilgisini girmeyelim. 

INSERT INTO programmers(email, salary, prog_lang) VALUES('python1@gmail.com', 4000, 'Python');

SELECT * FROM programmers;

----------


----------

CREATE TABLE programmers1(

id SERIAL,
name VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)

);


SELECT * FROM programmers1;

INSERT INTO programmers1(name, email, salary, prog_lang) VALUES('Tom', 'mail@mail.com', 5000, 'Java');
INSERT INTO programmers1(name, email, salary, prog_lang) VALUES('Jerry', 'jerry@mail.com', 4000, 'SQL');
INSERT INTO programmers1(email, salary, prog_lang) VALUES('python1@gmail.com', 4000, 'Python');

-------------------------------



--11-Tabloya PK constraint’i ekleme

--1.yol: PK secilecek sutunun yanina ekleme

/*Senaryo: “actors1” adında bir tablo oluşturun ve şu sütunları ekleyin:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Not: Id’yi primary key olarak belirleyin*/

/*Scenario: Create a table called "actors1" and add the following columns:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Note: Set Id as primary key*/


CREATE TABLE actors1(
	id INTEGER PRIMARY KEY, --NOT NULL ve Unique
	name VARCHAR(30),
	surname VARCHAR(30),	
	film VARCHAR(50)
);


SELECT * FROM actors1;


--2.yol: Ayri bir sutun gibi ekleme

/*Senaryo: “actors2” adında bir tablo oluşturun ve şu sütunları ekleyin:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Not: Id’yi primary key olarak belirleyin*/

/*Scenario: Create a table called "actors2" and add the following columns:
id INTEGER
name VARCHAR(30) 
surname VARCHAR(30)
film VARCHAR(50)
Note: Set Id as primary key*/

CREATE TABLE actors2(
	id INTEGER, 
	name VARCHAR(30),
	surname VARCHAR(30),	
	film VARCHAR(50),
	CONSTRAINT act_pk PRIMARY KEY(id)
);


SELECT * FROM actors2;


--composite key

CREATE TABLE company(
	job_id INTEGER, --PK
	name VARCHAR(30), --PK
	company VARCHAR(30),
	CONSTRAINT com_pk PRIMARY KEY(job_id, name)
);

SELECT * FROM company;


-------------
--Not 1: “Parent Table”da olmayan bir id’ye sahip datayi “Child Table”’a ekleyemezsiniz
--Not 2: Child Table’i silmeden Parent Table’i silemezsiniz. Once “Child Table” silinir, 
--sonra  “Parent Table” silinir.

-------------------------------
--12-Tabloya FK constraint’i ekleme

/*Senaryo: “companies” ve “employees” adlarinda iki tablo oluşturun.

companies tablosu sütunları: 
sirket_id INTEGER, sirket VARCHAR(50), personel_sayisi INTEGER
employees tablosu sütunları:
id INTEGER, isim VARCHAR(50), sehir VARCHAR(50), maas REAL, sirket VARCHAR(50)*/

/*Scenario: Create two tables named "companies" and "employees".

Companies table columns: 
company_id INTEGER, company VARCHAR(50), number_of_employees INTEGER
employees table columns:
id INTEGER, name VARCHAR(50), city VARCHAR(50), salary REAL, company VARCHAR(50)*/


CREATE TABLE companies(
sirket_id INTEGER,
sirket VARCHAR(50) PRIMARY KEY,
personel_sayisi INTEGER
);

SELECT * FROM companies;

CREATE TABLE employees(
id INTEGER, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas REAL, 
sirket VARCHAR(50),
CONSTRAINT per_fk FOREIGN KEY(sirket) REFERENCES companies(sirket)
);

SELECT * FROM employees;


-------------------------------
--13-Tabloya CHECK constraint’i ekleme

--CHECK ile bir alana girilebilecek değerleri sınırlayabiliriz.

/*Senaryo: “person” adinda bir tablo oluşturun.
person tablosu sütunları: 

id INTEGER, name VARCHAR(50), salary REAL, age INTEGER olsun. Salary 5000’den kucuk ve yas negatif girilemesin*/

/*Scenario: Create a table named "person".
person table columns: 

id INTEGER, name VARCHAR(50), salary REAL, age INTEGER. Salary cannot be less than 5000 and age cannot be negative*/


CREATE TABLE person(
	id INTEGER,
	name VARCHAR(50),
	salary REAL CHECK(salary>5000), --5000 den az kabul etmez
	age INTEGER CHECK(age>0) --negatif kabul etmez
);

INSERT INTO person VALUES(11, 'Ali Can', 6000, 35);
--INSERT INTO person VALUES(11, 'Ali Can', 6000, -3); --HATA, person_age_check
--INSERT INTO person VALUES(11, 'Ali Can', 4000, 45); --HATA, person_salary_check

SELECT * FROM person;


---------
/*Senaryo: “worker” ve “address” adlarinda iki tablo oluşturun.

worker tablosu sütunları: 
id CHAR(5), isim VARCHAR(50), maas INT, ise_baslama DATE

address tablosu sütunları:
adres_id CHAR(5), sokak VARCHAR(30), cadde VARCHAR(30), sehir VARCHAR(30)

Tablolari birbirine baglayarak, UNIQUE, NOT NULL uygulamasi yapiniz*/

/*Scenario: Create two tables named "worker" and "address".

worker table columns: 
id CHAR(5), name VARCHAR(50), salary INT, job_start DATE

address table columns:
address_id CHAR(5), street VARCHAR(30), street VARCHAR(30), city VARCHAR(30)

Apply UNIQUE, NOT NULL by linking tables together*/

--NOT: UNIQUE null kabul eder. Birden fazla da kabul eder cunku null bir deger degildir. Karsilastirma yapmaz

CREATE TABLE worker(
	id char(5) PRIMARY KEY, 
	isim varchar(50) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
);

CREATE TABLE address(
	adres_id char(5),
	sokak varchar(30),
	cadde varchar(30),
	sehir varchar(30),
	FOREIGN KEY(adres_id) REFERENCES worker(id) 
);

SELECT * FROM worker;
SELECT * FROM address;

INSERT INTO worker VALUES('10002', 'Donatello' ,12000, '2018-04-14'); --basarili
INSERT INTO worker VALUES('10003', null, 5000, '2018-04-14'); --basarili --unique:NULL kabul eder
INSERT INTO worker VALUES('10004', 'Donatello', 5000, '2018-04-14'); --HATA name unique olmali
INSERT INTO worker VALUES('10005', 'Michelangelo', 5000, '2018-04-14'); --basarili
INSERT INTO worker VALUES('10006', 'Leonardo', null, '2019-04-12'); --HATA, maas not null cunku
INSERT INTO worker VALUES('10007', 'Raphael', '', '2018-04-14'); --HATA, maas int bekliyor biz bos String gonderdik
INSERT INTO worker VALUES('', 'April', 2000, '2018-04-14'); --Basarili, PK hiclik kabul eder ama kullanimi onerilmez
INSERT INTO worker VALUES('', 'Ms.April', 2000, '2018-04-14'); --HATA, PK 2 tane hiclik kabul etmez cunku unique'dir
INSERT INTO worker VALUES('10002', 'Splinter', 12000, '2018-04-14'); --HATA, 10002 daha once kullanildi


