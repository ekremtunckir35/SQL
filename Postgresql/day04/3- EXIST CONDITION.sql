-- 25   EXIST CONDITION

/*Senaryo 1: "march" ve "april" adlarinda iki tablo oluşturunuz 
ve Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.*/
/*Scenario : Create two tables named "march" and "april" and list the information of all products in April if 'Toyota' was sold in March.*/



CREATE TABLE march
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO march VALUES (10, 'Mark', 'Honda');
INSERT INTO march VALUES (20, 'John', 'Toyota');
INSERT INTO march VALUES (30, 'Amy', 'Ford');
INSERT INTO march VALUES (20, 'Mark', 'Toyota');
INSERT INTO march VALUES (10, 'Adam', 'Honda');
INSERT INTO march VALUES (40, 'John', 'Hyundai');
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE april 
(     
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO april VALUES (10, 'Hasan', 'Honda');
INSERT INTO april VALUES (10, 'Kemal', 'Honda');
INSERT INTO april VALUES (20, 'Ayse', 'Toyota');
INSERT INTO april VALUES (50, 'Yasar', 'Volvo');
INSERT INTO april VALUES (20, 'Mine', 'Toyota');

SELECT * FROM march;

SELECT * FROM april;


SELECT * 
FROM april
WHERE EXISTS(SELECT FROM march WHERE urun_isim= 'Toyota');



/*Senaryo 2: Mart ayında 'Volvo' satışı yapılmışsa, Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.*/
/*Scenario 2: If 'Volvo' was sold in March, list the information of all products in April.*/

SELECT *
FROM april
WHERE EXISTS(SELECT FROM march where urun_isim ='Volvo');


/*Senaryo 3: Mart ayında satılan ürünlerin urun_id ve musteri_isim'lerini, eğer urun(urun_isim) Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız.*/
/*Scenario 3: Write a query that lists the product_id and customer_name of the products sold in March, if the product(urun_isim) was also sold in April.*/

SELECT urun_id,musteri_isim
FROM march AS m -- tablo isim m oldu
WHERE EXISTS(SELECT urun_isim FROM april AS a where a.urun_isim =m.urun_isim);


/*Senaryo 4: Her iki ayda birden satılan ürünlerin urun_isim'lerini, bu ürünleri NİSAN ayında satın alan musteri_isim'lerine gore listeleyen bir sorgu yazınız*/
/*Scenario 4: Write a query that lists the product names of the products sold in both months according to the customer names that purchased these products in APRIL*/

SELECT urun_isim,musteri_isim
FROM april a
WHERE EXISTS(SELECT * FROM march m where m.urun_isim = a.urun_isim);



-- ÖDEV: Martta satılıp Nisanda satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--MART ayında satın alan musteri isimlerini listeleyen bir sorgu yazınız.
-- HOMEWORK: Identify the product names of the products that were sold in March but not in April and
--Write a query that lists the names of customers who purchased in March.









