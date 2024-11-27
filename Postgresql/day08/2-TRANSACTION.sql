-- 42-TRANSACTION

/* 
1. Transaction Nedir? Transaction, veritabanı yönetim sistemlerinde (DBMS) bir veya daha fazla işlemi tek bir birim olarak gerçekleştiren bir yapıdır.
Transaction, genellikle birden fazla SQL sorgusunun, veritabanına olan etkilerini gruplandırarak, 
işlemlerin atomik (tam ya da hiç) bir şekilde çalışmasını sağlar. Bu, veritabanındaki veri tutarlılığını korumak için oldukça önemlidir.

Transaction’ın Özellikleri (ACID):

Atomicity (Atomiklik): Transaction içindeki tüm işlemler başarılı olmalıdır; eğer biri başarısız olursa tüm işlemler geri alınır (rollback edilir).

Consistency (Tutarlılık): Transaction sonunda, veritabanı geçerli bir durumda olmalıdır. Yani, veri bütünlüğü korunur.

Isolation (Yalnızlık): Her transaction, diğer transaction’lardan bağımsız olarak çalışmalıdır.
Diğer işlemler henüz tamamlanmamış bir transaction'ın verilerini görmemelidir.

Durability (Dayanıklılık): Bir transaction başarıyla tamamlandığında, sistem çökse bile, veriler kalıcı olur.

2. Transaction Neden Kullanılır?

Veri Tutarlılığını Sağlama: Birden fazla işlem yapılacaksa, tüm işlemler başarılı olana kadar değişiklikler uygulanmaz.
Eğer bir işlem başarısız olursa, tüm değişiklikler geri alınır, böylece veritabanı tutarlı kalır.

Veritabanı Bütünlüğünü Koruma:   ACID özelliklerini kullanarak veritabanındaki veri bütünlüğünü sağlamada önemli bir rol oynar.

Veri Çakışmalarını Önleme: Birden fazla kullanıcının aynı veriye erişmesi durumunda, transaction’lar birbirini etkilemeden işlemleri yapmalarını sağlar.

Çiftlik ve Karmaşık İşlemler: Çeşitli veri güncellemeleri, silme ve ekleme işlemlerinin doğru sırayla yapılması gerektiği durumlar için idealdir.


3. Transaction Nasıl Kullanılır? PostgreSQL’de transaction kullanımı, temel olarak üç ana komuttan oluşur:

BEGIN: Transaction başlatmak için kullanılır.

COMMIT: Transaction başarıyla tamamlandığında, yapılan değişikliklerin veritabanına kaydedilmesi için kullanılır.

ROLLBACK: Transaction sırasında bir hata meydana geldiğinde, yapılan tüm değişikliklerin geri alınması için kullanılır.  


4. Transaction Nerelerde Kullanılır? Transaction’lar genellikle şu tür durumlarda kullanılır:

Bankacılık ve Finansal Uygulamalar: Para transferleri, hesap bakiyelerinin güncellenmesi gibi işlemlerde transaction’lar
veri tutarlılığını sağlamak için kullanılır.

E-ticaret Uygulamaları: Sipariş ve ödeme işlemleri gibi çok aşamalı işlemler için transaction kullanılır.
Örneğin, bir sipariş oluşturulurken, stoktan ürün düşülmeli ve ödeme onaylanmalıdır.

Kritik Veri İşlemleri: Büyük veritabanı işlemleri (örneğin, birden fazla tablodaki verilerin güncellenmesi) transaction’larla yapılmalıdır.

Veri Göçü ve Yedekleme: Verilerin taşınması veya yedeklenmesi sırasında herhangi bir hata olması durumunda,
transaction sayesinde işlemler geri alınabilir.

Sonuç: PostgreSQL’de transaction’lar, veritabanı işlemlerini güvenilir, tutarlı ve izole bir şekilde gerçekleştirmek için kullanılır.
ACID özellikleri, veri bütünlüğünü sağlamak için kritik öneme sahiptir.



*/


/*Senaryo:
1- accounts adında bir tablo oluşturulacak.
2- Tabloya iki kayıt eklenecek.
3- Hesaplar arasında 1000 TL para transferi yapılacaktır.
4- Para transferi sırasında bir hata oluşacaktır.
5- Hata oluştuğunda, ROLLBACK komutu ile transaction iptal edilecek
   ve 1. hesaptan çekilen 1000 TL iade edilecektir.*/

/*Scenario:
1- A table named accounts will be created.
2- Two records will be added to the table.
3- 1000 TL money transfer will be made between accounts.
4- An error will occur during money transfer.
5- When an error occurs, the transaction will be cancelled with the ROLLBACK command
   and the 1000 TL withdrawn from the 1st account will be refunded.*/
   
 ------------------------------------------------------hata seneryasu  
-- Tablo Oluşturma

CREATE TABLE accounts
(
hesap_no int UNIQUE,
isim VARCHAR(50),
bakiye real
);

--Veri Ekleme

INSERT INTO accounts VALUES(1234,'Harry Potter',10000.3);
INSERT INTO accounts VALUES(5678,'Jack Sparrow',5000.5);

SELECT * FROM accounts;

--Para Transferi 

UPDATE accounts SET bakiye = bakiye-1000 WHERE hesap_no =1234;



--Sistemsel hata oluştu. Jack bu 1000 tl’yi alamadi

UPDATE accounts SET bakiye =bakiye + 1000 WHERE hesap_no =5678; ---hata ,calismadi


--Basarisiz transaction senaryosu


--BEGIN: Transaction başlatmak için kullanılır.


BEGIN;
CREATE TABLE accounts
(
hesap_no int UNIQUE,
isim VARCHAR(50),
bakiye real       
);

--COMMIT: Transaction'ı onaylamak ve değişiklikleri kalıcı hale getirmek için kullanılır.

COMMIT;

BEGIN;

INSERT INTO accounts VALUES(1234,'Harry Potter',10000.3); 
INSERT INTO accounts VALUES(5678,'Jack Sparrow',5000.5);   

SELECT * FROM accounts;
   

--SAVEPOINT <savepoint_name>: Transaction içinde belirli bir noktada kayıt oluşturmak için kullanılır.
--Bu, hata durumunda tüm transaction'ı geri almak yerine belirli bir noktaya dönüş yapmayı sağlar.

SAVEPOINT x;


--try{

   UPDATE accounts SET bakiye = bakiye + 1000 WHERE hesap_no = 5678
   
   --UPDATE hesaplar SET bakiye=bakiye+1000 WHERE hesap_no=5678;  HATA
   --COMMIT; --CALISMAZ
   
--catch(){

    ROLLBACK TO x;
	COMMIT;


--}


    SELECT * FROM accounts;
	
	
	
	
	-------------------------------------------BASARILI SENERYO ---------------  
	
BEGIN;

CREATE TABLE accounts
(
hesap_no int UNIQUE,
isim VARCHAR(50),
bakiye real       
);


BEGIN;
INSERT INTO accounts VALUES(1234,'Harry Potter',10000.3);
INSERT INTO accounts VALUES(5678,'Jack Sparrow',5000.5);

--try{
UPDATE accounts SET bakiye=bakiye-1000 WHERE hesap_no=1234;--başarılı
UPDATE accounts SET bakiye=bakiye+1000 WHERE hesap_no=5678;--başarılı
COMMIT;
--}catch(){

SAVEPOINT x;

--try{
UPDATE accounts SET bakiye=bakiye-1000 WHERE hesap_no=1234;--başarılı
UPDATE accounts SET bakiye=bakiye+1000 WHERE hesap_no=5678;--başarılı

COMMIT;
--}catch(){

ROLLBACK to x;


SELECT * FROM accounts;



	
	
	
	