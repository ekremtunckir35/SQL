--41- ALTER TABLE ifadesi-DDL


/* 
ALTER TABLE, bir tablo üzerinde aşağıdaki gibi değişiklikler yapmak için kullanılır:

--Yeni sütun eklemek.
--Mevcut bir sütunu değiştirmek (örneğin, veri tipini veya adını).
--Sütun veya kısıtlama (constraint) kaldırmak.
--Tablo adını değiştirmek.
--Dizinler ve yabancı anahtarlar eklemek/kaldırmak.


ALTER TABLE şu amaçlarla kullanılır:

--Tablo Yapısını Güncellemek:    Mevcut uygulama ihtiyaçlarına göre tablo yapısını değiştirmek.

--Veri Doğruluğunu Sağlamak:  Sütunlara kısıtlamalar (constraints) ekleyerek veri bütünlüğünü sağlamak.

--Performans İyileştirme:   Dizinler eklemek veya gereksiz kısıtlamaları kaldırmak.

--Esneklik:  Veritabanı yapısını daha iyi yönetmek ve değişen gereksinimlere hızlı yanıt vermek.



*/




/*Senaryo 1: employees4 tablosuna yas (int) seklinde yeni sutun ekleyiniz.*/
/*Scenario 1: Add a new column in the form of age (int) to the employees4 table.*/


ALTER TABLE employees4
ADD COLUMN yas INTEGER;

SELECT * FROM employees4;


/*Senaryo 2: employees4 tablosuna remote (boolean) seklinde yeni sutun ekleyiniz.
varsayılan olarak remote değeri TRUE olsun*/

/*Scenario 2: Add a new column as remote (boolean) to the employees4 table.
By default, the remote value is TRUE */

ALTER TABLE employees4
ADD COLUMN remote BOOLEAN DEFAULT TRUE;


/*Senaryo 3: employees4 tablosunda yas sutununu siliniz.*/
/*Scenario 3: Delete the age column in the employees4 table.*/

ALTER TABLE employees4
DROP COLUMN yas


/*Senaryo 4: employees4 tablosundaki maas sutununun data tipini 
real olarak güncelleyiniz.*/

/*Scenario 4: Set the data type of the salary column in the employees4 table
Update it to real.*/

ALTER TABLE employees4
ALTER COLUMN maas TYPE REAL;


SELECT * FROM employees4;



/*Senaryo 5: employees4 tablosundaki maas sutununun ismini 
gelir olarak güncelleyiniz.*/

/*Scenario 5: Name the salary column in the employees4 table
Update as income.*/

ALTER TABLE employees4
RENAME COLUMN maas TO gelir;


/*Senaryo 6: employees4 tablosunun ismini employees5 olarak güncelleyiniz.*/
/*Scenario 6: Update the name of the employees4 table to employees5.*/

ALTER TABLE employees4
RENAME TO employees5;

SELECT * FROM employees5;



/*Senaryo 7: employees5 tablosunda id sütununun data tipini 
varchar(20) olarak güncelleyiniz.*/

/*Scenario 7: Set the data type of the id column in the employees5 table
Update it to varchar(20).*/

ALTER TABLE employees5
ALTER COLUMN id TYPE VARCHAR(20);

SELECT * FROM employees5;


/*Senaryo 8: employees5 tablosunda id sütununun data tipini 
int olarak güncelleyiniz.*/

/*Scenario 8: Set the data type of the id column in the employees5 table
Update as int.*/


ALTER TABLE employees5
ALTER COLUMN id TYPE INTEGER  USING id :: integer;


/*Senaryo 9: employees5 tablosunda isim sütununa 
NOT NULL constrainti ekleyiniz.*/

/*Scenario 9: Name column in employees5 table
Add NOT NULL constraint.*/

ALTER TABLE employees5
ALTER COLUMN isim SET NOT NULL ;

SELECT * FROM employees5;


INSERT INTO employees5(id,sehir) VALUES(123,'Ankara');--- not null constraint ,HATA VERIR

--NOT: içinde kayıtlar bulunan bir tablo güncellenirken,
--NOT NULL,PK,FK,UNIQUE,CHECK kısıtlamalarını ekleyebilmek için
--bu sütunun değerleri, ilgili kısıtlamayı sağlıyor olmalıdir



/*Senaryo 1: companies2 tablosunda sirket_id sütununa PRIMARY KEY constraint'i ekleyiniz.*/
/*Scenario 1: Add the PRIMARY KEY constraint to the company_id column in the companies2 table.*/


SELECT * FROM companies2;

ALTER TABLE companies2
ADD /*CONSTRAINT companies2_pk */ PRIMARY KEY (sirket_id);



/*Senaryo 2: companies2 tablosunda sirket_isim sütununa UNIQUE constrainti ekleyiniz.*/
/*Scenario 2: Add UNIQUE constraint to the company_name column in the companies table.*/

ALTER TABLE companies2
ADD UNIQUE(sirket_isim);

-- tablodaki kisitlamalari gormek icin asagidaki sorguyu kullaniriz.Bir tablodaki kisitlamalari gosterir

SELECT conname, contype
FROM pg_constraint
WHERE conrelid = 
(SELECT oid FROM pg_class WHERE relname = 'companies2');


