                                     --21-BETWEEN .. AND …

--BETWEEN operatörü, belirtilen iki değer arasında kalan değerleri seçmek için kullanılır ve her zaman AND ile birlikte kullanılır.

--customers tablosunda urun_id 20(dahil) ile 30(dahil) arasinda olan urunlerin tum bilgilerini listeleyiniz
--List all the information of the products with product_id between 20(inclusive) and 30(inclusive) in the customers table

----20++++++++30-----


--1.yol  
SELECT * 
FROM customers
WHERE urun_id >= 20 AND urun_id <= 30;  



--2.yol  

SELECT * FROM customers 
WHERE urun_id BETWEEN 20 AND 30;



--customers tablosunda urun_id degeri 20’den küçük veya 30’dan büyük olan urunlerin tum bilgilerini listeleyiniz.(yani 20 ve 30 dahil değil)
--List all the information of the products whose product_id value is less than 20 or greater than 30 in the customers table (ie 20 and 30 are not included).

+++++20————30++++++++

SELECT * FROM customers 
WHERE urun_id  NOT BETWEEN 20 AND 30;



--ODEV: Eğer kullanıcı yanlışlıkla değerleri ters girerse, bunu kontrol edip düzeltebilirsiniz. Nasil?


