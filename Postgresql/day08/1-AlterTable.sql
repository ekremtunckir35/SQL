------------------ DAY 8 DT ------------------

--41- ALTER TABLE ifadesi-DDL

/*Senaryo 3: orders tablosunda sirket_id sütununa FOREIGN KEY constraint’i ekleyiniz.*/
/*Scenario 3: Add FOREIGN KEY constraint to the company_id column in the orders table.*/

ALTER TABLE orders
ADD FOREIGN KEY(sirket_id) REFERENCES companies2(sirket_id);

DELETE FROM orders WHERE sirket_id IN(104, 105);

SELECT * FROM orders;

SELECT conname, contype
FROM pg_constraint
WHERE conrelid = 
(SELECT oid FROM pg_class WHERE relname = 'orders'); 

/*Senaryo 4: orders tablosundaki FK constraintini kaldırınız.*/
/*Scenario 4: Remove the FK constraint in the orders table.*/

ALTER TABLE orders
DROP CONSTRAINT orders_sirket_id_fkey;

/*Senaryo 5: employees5 tablosunda isim sütununda 
NOT NULL constraintini kaldırınız.*/

/*Scenario 5: Name column in employees5 table
Remove the NOT NULL constraint.*/

--isnullabla null kontrolu yapar
--NO notnull kisitlamasi var anlamina gelir

SELECT * FROM employees5;

SELECT column_name, is_nullable
FROM information_schema.columns
WHERE table_name = 'employees5' AND column_name = 'isim';

ALTER TABLE employees5
ALTER COLUMN isim DROP NOT NULL;

INSERT INTO employees5(isim) VALUES('');
INSERT INTO employees5(id) VALUES(123321);