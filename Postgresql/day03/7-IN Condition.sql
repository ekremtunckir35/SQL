                                   --20-IN Condition


								   
--IN: Bir değerin belirli bir değerler listesi içinde olup olmadığını kontrol eder.

/*Senaryo: "customers" adinda bir tablo oluşturun.

customers tablosu sütunları: 
urun_id INTEGER, musteri_isim VARCHAR(50), urun_isim VARCHAR(50)

Tablo uzerinde IN kullanimi yapiniz*/

/*Scenario: Create a table named "customers".

customers table columns: 
product_id INTEGER, customer_name VARCHAR(50), product_name VARCHAR(50)

Use IN on the table */


CREATE TABLE customers  (
urun_id int,  
musteri_isim varchar(50),
urun_isim varchar(50)
);


INSERT INTO customers VALUES (10, 'Mark', 'Orange');

INSERT INTO customers VALUES (10, 'Mark', 'Orange');
INSERT INTO customers VALUES (20, 'John', 'Apple');
INSERT INTO customers VALUES (30, 'Amy', 'Palm');
INSERT INTO customers VALUES (20, 'Mark', 'Apple');
INSERT INTO customers VALUES (10, 'Adem', 'Orange');
INSERT INTO customers VALUES (40, 'John', 'Apricot');
INSERT INTO customers VALUES (20, 'Eddie', 'Apple');


SELECT * FROM customers;


--customers tablosundan ürün ismi 'Orange', 'Apple' veya 'Apricot' olan verileri listeleyiniz.
-- List the data from the customers table with product name 'Orange', 'Apple' or 'Apricot'.

--1.yol:
SELECT * FROM customers WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';


--2.yol:

SELECT * FROM customers WHERE urun_isim IN('Orange','Apple','Apricot');





--customers tablosundan ürün ismi 'Orange', 'Apple' ve 'Apricot' olmayan verileri listeleyiniz.
--List the data from the customers table that do not have the product names 'Orange', 'Apple' and 'Apricot'.



SELECT * FROM customers WHERE urun_isim NOT IN('Orange','Apple','Apricot');

