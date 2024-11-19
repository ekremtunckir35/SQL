/*14- WHERE ifadesi, belirli koşulları karşılayan kayıtları seçmek için kullanılır.

Bir SELECT, UPDATE ya da DELETE sorgusunda, hangi satırların işleme dahil edileceğini belirtmek için WHERE koşulu eklenir.*/


--worker tablosundan ismi 'Donatello' olanların tüm bilgilerini listeleyelim
--Let's list all the information of those whose name is 'Donatello' from the worker table

SELECT * from worker;

SELECT * FROM address;



SELECT * FROM worker WHERE isim = 'Donatello';



----------------------------------------------------------------


--worker tablosundan maaşı 5000’den fazla olanların tüm bilgilerini listeleyelim
--Let's list all the information of those whose salary is more than 5000 from the worker table

SELECT * FROM worker WHERE maas > 5000;


--------------------------------------------------

--worker tablosundan maaşı 5000’den fazla olanların isim ve maaşlarını listeleyelim
--Let's list the names and salaries of those whose salary is more than 5000 from the worker table

SELECT isim, maas FROM worker WHERE maas > 5000

---------------------------------------------------


--address tablosundan sehri 'Konya' ve 
--adres_id'si 10002 olan kaydın tüm verilerini getirelim
--select the city 'Konya' from the address table and 
--Let's get all the data of the record with address_id 10002

SELECT * FROM address WHERE sehir='Konya' AND adres_id='10002';

---------------------------------------------------


--sehri 'Konya' veya 'Bursa' olan adreslerin cadde ve sehir bilgilerini getirelim.
--Let's get the street and city information for addresses whose city is 'Konya' or 'Bursa'.

SELECT cadde, sehir FROM address WHERE sehir='Konya' OR sehir='Bursa';

-------------------------------------------------------------



