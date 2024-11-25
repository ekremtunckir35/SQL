--37-- LIKE , ILIKE 

/*LIKE ve ILIKE operatörleri, metin aramalarında kullanılan iki farklı operatördür. Her ikisi de belirli bir desenle eşleşen verileri sorgulamak için kullanılır, ancak aralarındaki temel fark büyüklük/küçüklük hassasiyetidir.

LIKE:
LIKE, büyük/küçük harf duyarlı bir eşleştirme yapar. Yani, arama yapılan metin ile sorgulanan metin arasında büyük/küçük harf farkı varsa, bu eşleşme gerçekleşmez.
ILIKE:
ILIKE, büyük/küçük harf duyarsız bir eşleştirme yapar. Yani, harflerin büyük ya da küçük olmasına bakmaz ve eşleşmeler yine yapılır.
LIKE Operatörü Neden Kullanılır?
LIKE operatörü, veritabanlarında metin (string) veri türündeki sütunlarda belirli bir deseni aramak için kullanılır. Kullanıcıların belirli bir karakter veya karakter dizisi içeren verileri bulmalarını sağlar. Bu işlemde, desenler için wildcard karakterleri kullanılır:

%: Herhangi bir sayıda (0 veya daha fazla) karakteri temsil eder.
_: Bir tek karakteri temsil eder*/

/*ILIKE Operatörü Neden Kullanılır?

ILIKE operatörü, aynı şekilde metin verileri üzerinde desen araması yapar ancak büyük/küçük harf farkını göz ardı eder.
Bu, kullanıcının daha esnek bir şekilde veri araması yapmasını sağlar.
Kullanıcılar, verilerdeki harflerin büyük veya küçük olmasına bakılmaksızın aynı sonuca ulaşır.

Nasıl Kullanılır?

LIKE Kullanımı
Büyük/küçük harfe duyarlı bir desen araması yapar.
% ve _ joker karakterleri ile kullanılır:
%: Sınırsız sayıda karakter yerine geçer.
_: Tek bir karakter yerine geçer.

ILIKE Kullanımı
Büyük/küçük harfe duyarsız bir desen araması yapar.
% ve _ joker karakterleri yine kullanılır.


LIKE ve ILIKE Joker Karakterleri 

Karakter	Açıklama	                                          Örnek	                                   Açıklama
%	       Sıfır veya daha fazla karakter	                    LIKE 'A%'                                 "A" ile başlayan her şey

_	       Tek bir karakter yerine geçer	                    LIKE 'A_'	                              "A" ile başlayıp, ardından bir karakter

[]	       Belirli bir karakter setini eşleştirir	            LIKE '[A-C]%'	                          "A", "B", veya "C" ile başlayanlar 

[^]	       Belirli bir karakter seti dışındakileri eşleştirir 	LIKE '[^A-C]%'	                          "A", "B", veya "C" dışında başlayanlar


LIKE ve ILIKE ile Performans İpuçları

İndeks Kullanımı:

PostgreSQL'de LIKE ile bir metin üzerinde arama yaparken indeks kullanılır.
Ancak ILIKE genelde indeks kullanmaz (case-insensitive olduğu için). Bu durumda, arama performansı düşebilir.

Büyük Veri Setlerinde Performans:

% operatörü metnin başında kullanılırsa (örneğin, '%pattern'), indeksler kullanılamaz ve sorgu yavaşlar.

Trigram İndeksi (pg_trgm Modülü):

PostgreSQL'de ILIKE performansını artırmak için trigram indeksler oluşturulabilir.


*/




SELECT * FROM developers WHERE name = 'Ayse Gul';

--SELECT * FROM developers WHERE name = 'A...'; --A ile baslayanlara boyle ulasamayiz

--wildcard(joker, %): 0 veya daha fazla karakteri temsil eder


/*LIKE ve ILIKE Kullanımında Wildcard Karakterleri

%: Herhangi bir sayıda karakteri temsil eder (boş string de dahil).
Örnek: LIKE 'a%' → "a" ile başlayan tüm veriler.
Örnek: ILIKE '%abc%' → İçinde "abc" geçen tüm veriler.
_: Sadece tek bir karakteri temsil eder.
Örnek: LIKE 'a_c' → "a" ile başlayıp, ortada bir karakter ve "c" ile biten veriler (örneğin "abc" veya "acc").
Özet:
LIKE: Büyük/küçük harf duyarlı eşleşmeler yapar.
ILIKE: Büyük/küçük harf duyarsız eşleşmeler yapar.
Her iki operatör de metin aramalarında oldukça kullanışlıdır. 
ILIKE, kullanıcıların farklı yazım biçimleriyle (büyük/küçük harf farkı olmadan) arama yapabilmelerini sağlar, 
LIKE ise daha sıkı bir eşleşme sağlar ve harf duyarlıdır.*/



SELECT * FROM developers;


SELECT * FROM developers
where name LIKE 'A%' --- A, Ab ,ABc


--Küçük/büyük harf duyarlılığı olmasın 
SELECT * FROM developers
where name ILIKE 'a%'; 



--Ismi T ile başlayıp n harfi ile biten dev isimlerini ve maaşlarını yazdiran QUERY yazin
--Write QUERY, whose name starts with T and ends with the letter n, to write the names of giants and their salaries

SELECT name,salary
FROM developers
where name LIKE 'T%n';  ---Tan,Tn  

--Ismi soyismi içinde 'an' olan dev isimlerini ve soyisimlerini ve maaşlarını yazdiran QUERY yazin
--Write QUERY with 'an' in the first name, last name and surname and their salaries

SELECT name, salary
FROM  developers
where name LIKE '%an%';


--Ismi içinde e ve a olan developerlarin tüm bilgilerini yazdiran QUERY yazin
--Write QUERY that prints all the information of developers with e and a in their name

SELECT *
FROM developers
WHERE name LIKE '%e%a%' OR name LIKE '%a%e%';

--alternatif

SELECT *
FROM developers
WHERE name LIKE '%e%' AND name LIKE '%A%';


--underscore(_)=sadece 1 karakteri temsil eder.

--Isminin ikinci harfi u olan developerlarin tum bilgilerini yazdiran QUERY yazin
--Type QUERY, which prints all the information of developers with the second letter u in their name.

SELECT *
FROM developers
WHERE name LIKE '_u%';


--Kullandığı prog. dili 4 harfli ve üçüncü harfi v olan developerlarin tum bilgilerini yazdiran QUERY yazin
--Write QUERY that prints all the information of developers whose prog. language has 4 letters and the third letter is v

SELECT * 
FROM developers
WHERE prog_lang LIKE '__v_';

--ÖDEV : Kullandığı prog. dili en az 5 harfli ve ilk harfi J olan developerlarin tum bilgilerini yazdiran QUERY yazin.

SELECT * 
FROM developers
WHERE prog_lang LIKE 'J____%';


--ÖDEV:  Isminin 2. harfi e,4. harfi y olan developerlarin tum bilgilerini yazdiran QUERY yazin. 

SELECT * 
FROM developers
WHERE name ~ '^.e.y';


SELECT * 
FROM developers 
WHERE name LIKE '_e_y%';

--ÖDEV:  ismi boşluk içeren developerlarin tum bilgilerini yazdiran QUERY yazin.

SELECT * 
FROM developers 
WHERE name LIKE '% %';