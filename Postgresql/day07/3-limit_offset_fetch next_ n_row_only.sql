--40- LIMIT / OFFSET - FETCH NEXT n ROW ONLY

/* 
LIMIT:
Sorgu sonucundan kaç satır döndürüleceğini belirtir. Örneğin, 5 satır döndürmek için LIMIT 5 kullanılır. 

OFFSET:
Sorgu sonucunda kaç satır atlanacağını belirtir.Örneğin, ilk 10 satırı atlayıp sonrasını döndürmek için OFFSET 10 kullanılır.

FETCH NEXT N ROWS ONLY:
LIMIT ile benzer işlev görür; ancak SQL standardına daha uygundur. Belirtilen sayıda satırı döndürür.


Niçin Kullanılır?

Sayfalama (Pagination):

Büyük veri setlerini küçük parçalar halinde almak (örneğin, bir web uygulamasında sonuçları sayfa sayfa göstermek).

Performans Optimizasyonu:

Sadece gerekli veriyi döndürerek sorgunun performansını artırmak.

Veri Analizi:

Büyük veri kümelerinde sadece belirli bir kısmını analiz etmek.

 Nerelerde Kullanılır? 
--Web Uygulamalarında Sayfalama: 

--Raporlama ve Veri Analizi:

Büyük veri setlerinde, örneklem almak veya belirli bir kısmını analiz etmek için BACKWARD


--Performans Testleri:

Sorguların performansını test etmek veya prototip oluştururken küçük veri parçaları ile çalışmak için.

--Dinamik Uygulamalar:

Kullanıcının talebine göre dinamik olarak sayfa numarasına göre veri getirmek. 


Limitasyonları ve Dikkat Edilmesi Gerekenler

OFFSET Performans Problemi:

Büyük OFFSET değerlerinde sorgunun yavaşlayabileceğini unutmayın.
Bunun nedeni, PostgreSQL’in tüm satırları taraması ve ardından belirtilen sayıda satırı atlamasıdır.

Sıralama (ORDER BY):

LIMIT ve OFFSET kullanırken sonuçların tutarlı olması için mutlaka ORDER BY ifadesi kullanılmalıdır.

PostgreSQL'de LIMIT, OFFSET ve FETCH ifadeleri, özellikle büyük veri setleriyle çalışırken gereklidir.
Sayfalama, performans optimizasyonu ve veri analizi gibi alanlarda kullanılarak hem veritabanı hem de uygulama katmanında esneklik sağlar.
Kullanım sırasında performans ve sıralama gibi noktalara dikkat ederek etkili sonuçlar elde edebilirsiniz.




*/



SELECT * FROM developers ORDER BY id OFFSET 5 ROWS FETCH NEXT 3 ROWS ONLY;

--Senaryo 1: developers tablosundan ekleme sırasına göre ilk 3 kaydı getiriniz.
--Scenario 1: Get the first 3 records from the developers table in order of insertion.

SELECT *
FROM developers
FETCH NEXT 3 ROW ONLY;


--ya da 

SELECT *
FROM developers
LIMIT 3;


/*Senaryo 2: developers tablosundan ekleme sırasına göre ilk 2 kayıttan sonraki ilk 3 kaydı getiriniz.*/
/*Scenario 2: Fetch the first 3 records after the first 2 records from the developers table in order of insertion.*/

SELECT *
FROM developers
OFFSET 2 ROW --ILK 2 SATIRI ATLA BURADA ROW YAZMAK ZORUNLU DEGIL
LIMIT 3;


--YA DA BOYLE DE YAPILABILIR 

SELECT *
FROM developers
OFFSET 2 
LIMIT 3;


/*Senaryo 3: developers tablosundan maaşı en düşük ilk 3 kaydı getiriniz.*/
/*Scenario 3: Bring the first 3 records with the lowest salaries from the developers table.*/

SELECT *
FROM developers
ORDER BY salary
LIMIT 3;


/*Senaryo 4: developers tablosundan maaşı en yüksek 2. developer'ın tüm 
bilgilerini getiriniz.*/

/*Scenario 4: From the developers table, the developer with the 2nd highest salary
Please bring your information.*/

SELECT *
FROM developers
ORDER BY salary DESC
OFFSET 1
LIMIT 1;



