--38- Regular Expressions (Regex) Duzenli Ifadeler

/* 
Regular Expressions (Regex), metin arama ve düzenleme işlemleri için kullanılan güçlü bir araçtır. 
PostgreSQL'de regex, metin sütunları üzerinde karmaşık arama ve desen eşleştirme işlemleri yapmak için kullanılır.

PostgreSQL'de regex işlemleri ~ ve ~* operatörleriyle gerçekleştirilir:

~: Büyük/küçük harfe duyarlı eşleştirme.

~*: Büyük/küçük harfe duyarsız eşleştirme.


Neden Kullanılır?
Veri temizleme, doğrulama ve analiz işlemlerinde kullanılır.
Karmaşık desenlerin aranması, örneğin e-posta adresleri, telefon numaraları veya özel formatlar.
Veritabanındaki metin verilerini filtrelemek veya dönüştürmek için kullanılır.


Nasıl Kullanılır?
Regex Operatörleri:

~: Desene uygun kayıtları döndürür (case-sensitive

~*: Desene uygun kayıtları döndürür (case-insensitive).


Regex Fonksiyonları:
REGEXP_MATCHES: Bir sütundaki metnin bir regex deseniyle eşleşen parçalarını döndürür.

REGEXP_REPLACE: Metni düzenli ifadeye göre değiştirir.

REGEXP_SPLIT_TO_TABLE / REGEXP_SPLIT_TO_ARRAY: Metni düzenli ifadeye göre böler.

Regex Temel Yapısı


Regex Karakteri	                            Açıklama	                            Örnek

.	                                        Herhangi bir karakter	             a.b → "a" ve "b" arasında bir karakter 

^	                                        Metnin başlangıcı	                 ^Hello → "Hello" ile başlayan metinler

$	                                        Metnin sonu	                         World$ → "World" ile biten metinler

[]	                                        Belirli karakter grubu	             [A-Z] → Büyük harfler

[^]	                                        Belirli karakter grubunun dışında	 [^0-9] → Sayı olmayan karakterler

*	                                        0 veya daha fazla tekrar	         a* → "a" harfinin tekrar ettiği tüm durumlar 

+	                                        1 veya daha fazla tekrar	         a+ → "a" harfinin bir veya daha fazla tekrar ettiği durumlar

?	                                        0 veya 1 tekrar	                     a? → "a" harfinin hiç ya da bir kez olduğu durumlar

{}	                                        Belirli sayıda tekrar	              a{2} → "aa"

`                                               	`	                        Veya (OR) operatörü
()	                                        Gruplama	                         (abc)+ → "abc" bir veya daha fazla ke



Regex Kullanım Alanları
Veri Doğrulama:

E-posta, telefon numarası, posta kodu gibi formatların kontrolü.
Veri Dönüştürme:

Karmaşık metin manipülasyonu (örneğin, özel karakterlerin kaldırılması).
Veri Analizi:

Belirli bir desene uyan verileri raporlama veya analiz etme.
Arama Fonksiyonları:

Kullanıcı girişlerine dayalı desen tabanlı aramalar.
Veri Temizliği:

Belirli bir format dışındaki kayıtların ayıklanması veya düzeltilmesi.


Regex Kullanırken Dikkat Edilmesi Gerekenler
Performans:

Regex sorguları büyük veri setlerinde maliyetli olabilir. Gereksiz karmaşıklıktan kaçının.
İndeksler regex performansını iyileştirmez.
Hata Yönetimi:

Karmaşık regex ifadeleri doğru sonuçlar vermeyebilir. Regex'i test ederek doğru çalıştığından emin olun.
Basitlik:

Regex ifadelerini mümkün olduğunca kısa ve anlaşılır tutun.
Alternatifler:

Basit aramalar için LIKE veya ILIKE kullanmayı düşünün.


*/

/*Not: PostgreSQL, doğrudan REGEXP_LIKE fonksiyonunu desteklemez. REGEXP_LIKE bir
Oracle SQL fonksiyonudur ve bir metin ifadesinin belirli bir düzenli ifade
(regular expression) kalıbına uyup uymadığını kontrol etmek için kullanılır*/








--1. '[cb]at' ==> 'cat' veya 'bat' ile eşleşir. Bir kelimenin icinde cat olsa o da eslesir.

SELECT 'cat' ~ '[cb]at' AS result; -- true


--2. [0-9] ==> 0 ile 9 arası // icinde var mi 

SELECT '4' ~ '[0-9]' AS result; --true 


--3. [a-zA-Z] ==> A’dan Z’ye veya a’dan z’ye aralığı

SELECT 'm' ~ '[a-zA-Z]' as result; --true


--4. [^a-e] ==> a'dan e'ye aralığının dışı

SELECT 'z' ~ '[^a-e]' as result;--true 



--5. ^ - Satırın Başlangıcı

SELECT 'hello world' ~ '^hello' as result; --true 



--6. $ - Satırın Sonu

SELECT 'hello world' ~ 'ld$' as result;--true


--7. .* - Sıfır veya Daha Fazla Karakter

SELECT '123abc456' ~ '.*abc' AS result; --true 


--8. . - Herhangi Bir Tek Karakter

SELECT 'cat' ~ '.a.' as result; --true








