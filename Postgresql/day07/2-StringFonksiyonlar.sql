--39- STRING FONKSIYONLAR---





CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,	
city varchar(20),
course_name varchar(20),
salary real	
);


INSERT INTO teachers VALUES(111,'AhmeT  ','  Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES(112,'Mehmet','Ran ',33,'Van','HTML',4000);
INSERT INTO teachers VALUES(113,' Bilal','Fan ',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES(114,'Celal',' San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES(115,'Deniz',' Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES(116,'ekreM','Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES(117,'Fatma','Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES(118,'Hakan','Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES(119,'mert','Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES(120,'Nilay','Cetin',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES(121,'Selma','Celik',40,'Ankara','SpringBOOT',5550);
INSERT INTO teachers VALUES(122,'fatiH','Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES(123,'Nihat','Keskin',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES(124,'Hasan','Temel',37,'Istanbul','S.Security',3000.5);

SELECT * FROM teachers;




--teachers tablosundaki tüm kayıtların 
--firstname değerlerini büyük harfe, 
-- lastname değerlerini küçük harfe çevirerek, 
--uzunlukları ile birlikte listeleyiniz.

--all records in the teachers table
--firstname values to uppercase,
-- converting lastname values to lowercase,
--list them with their lengths.


SELECT UPPER(firstname) AS fname,LENGTH(firstname),LOWER(lastname) AS lname,LENGTH(lastname) FROM teachers;





--teachers tablosunda firstname ve lastname değerlerindeki 
--başlangıç ve sondaki boşlukları kaldırınız.

--in the firstname and lastname values in the teachers table
--remove the starting and trailing spaces.

UPDATE teachers
SET firstname =TRIM(firstname,lastname = TRIM(lastname)
					
					
--teachers tablosunda tüm kayıtların firstname değerlerini
-- ilk harfini büyük diğerleri küçük harfe çevirerek görüntüleyiniz.

--get the firstname values of all records in the teachers table
-- display by changing the first letter to uppercase and the rest to lowercase.
					

SELECT INITCAP(firstname)  
			 FROM teachers;					
					
					
					
--teachers tablosunda firstname değerlerinde ‘Celal’ kelimesini ‘Cemal’ ile değiştiriniz.
--Replace the word ‘Celal’ with ‘Cemal’ in the firstname values in the teachers table.
					
UPDATE teachers
SET firstname = REPLACE(firstname, 'Celal','Cemal');	
					
SELECT * FROM teachers;	
					
					
					
SELECT * FROM employees4;				
					
					
					
--employees4 tablosunda isyeri='Vakko' olan kayıtlarda 
--son ' Şubesi' ifadesini siliniz.

--in records with workplace='Vakko' in the employees4 table
--end Delete the ‘ Şubesi' statement.
					
SELECT SUBSTRING('sqlders',1,3);--sql	
					
					
UPDATE employees4
SET sehir =SUBSTRING(sehir,1,LENGTH(sehir)-7)
WHERE isyeri ='Vakko';

					
SELECT * FROM employees4;	
					

					
--Sadece ilk harfleri istesek;
					
SELECT SUBSTRING(sehir,1,1)
FROM employees4					
					
					
SELECT SUBSTRING(sehir, 2, 4)
FROM employees4; --2'den basla 4 karakter al, stan			
					
					
--words tablosunda tüm kelimeleri ve tüm kelimelerin(word) ilk 2 harfini görüntüleyiniz.
--Display all words and the first 2 letters of all words in the words table.

SELECT word, SUBSTRING(word, 1, 2)
FROM words