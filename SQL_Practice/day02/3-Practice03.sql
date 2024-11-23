--- GROUP BY ---HAVING 

CREATE TABLE sales (
    id INT PRIMARY KEY,       -- Satış ID'si (her satışın benzersiz tanımlayıcısı)
    sales_rep VARCHAR(50),    -- Satış temsilcisi adı
    amount DECIMAL(10, 2)     -- Satış tutarı (ondalıklı değer)
);


INSERT INTO sales (id, sales_rep, amount) VALUES
(1, 'John', 500),
(2, 'Jane', 300),
(3, 'John', 700),
(4, 'Jane', 150),
(5, 'John', 200),
(6, 'Alice', 450);


SELECT * FROM SALES;


--yalnızca John'un toplam satışlarını toplayıp yazdırın

SELECT SUM(AMOUNT) FROM sales WHERE sales_rep='John';


SELECT sales_rep,SUM(amount) FROM sales GROUP BY sales_rep;'John'



--WHERE: Verileri gruplameden önce, belirli bir koşula göre satırlarda filtreleme yapar.

--HAVING: Verileri grupladıktan sonra, her bir grubun üzerinde agregat fonksiyonları ve koşullara göre filtreleme yapar.

select sales_rep,sum(amount) from sales group by sales_rep-- Having sales_rep='John';



CREATE TABLE employees
( employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100), 
 department VARCHAR(50) );
 
 INSERT INTO employees (employee_id, employee_name, department) VALUES
(1, 'John', 'Sales'),
(2, 'Jane', 'Marketing'),
(3, 'Alice', 'Sales'),
(4, 'Bob', 'Sales'),
(5, 'Charlie', 'Human Resources'),
(6, 'David', 'Sales'),
(7, 'Eva', 'Marketing'),
(8, 'Frank', 'Sales');

SELECT * FROM employees;

--tüm calısanları calıstıkları departmana gore listeleyiniz

SELECT employee_name,department FROM employees order by department;-- Aggregate function --teke indirgeme 


--tüm calisanlarin calistıkları departmana göre id toplamlarını listeleyiniz !!!
select sum(employee_id),department from employees group by department;--Agretta function --teke indirgeme



CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);
INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Doktor', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Mühendis', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Doktor', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Mühendis', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Ögretmen', '14000');

SELECT * FROM meslekler;

--Soru-1: meslekler tablosunu isime göre sıralayınız

SELECT *  FROM meslekler order by isim;


--Soru-2: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız

SELECT *  FROM meslekler order by maas DESC; 


--Soru-3: meslekler tablosunda ismi Ali olanların maaşıni büyükten küçüğe doğru sıralayınız

SELECT * FROM meslekler WHERE isim ='Ali' order by maas desc;

--Soru-4: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz

select * from meslekler where id>6 order by id limit 2;
delete from meslekler where id=7;
select * from meslekler;--her cagırdıgımda kesinlikle id degeri siralı olucak diyemem!!!
update meslekler set maas=25000 where id=6;

--Soru 5: meslkeler tablosunda maasi  en yuksek 3 kisinin bilgilerini getir

select * from meslekler order by maas desc limit 3;



--Soru-6 : meslekler tablosunda meslekleri toplam maaslarina gore listele ve toplam maaslara gore sırala

--1.yol

select meslek,sum(maas)from meslekler group by meslek order by sum(maas);

--2.yol

select meslek,sum(maas) as toplam_maas from meslekler group by meslek order by toplam_maas;



--Soru-7 : meslekler tablosunda meslekleri toplam maas degerleri 30000 ustunde olan meslekleri listele 

SELECT meslek,SUM (maas) AS toplam_maas FROM meslekler GROUP BY meslek HAVING SUM(maas) > 30000;


--Soru-8 meslekler tablosunda maas degerleri 14000'den buyuk olan degerleri toplayıp mesleklere gore listele

select meslek,sum(maas) from meslekler where maas>14000 group by meslek;


