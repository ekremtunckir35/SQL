--38- Regular Expressions (Regex) Duzenli Ifadeler


--person tablosundaki soyismi Bulut olanları isme göre (azalan) sıralayarak listeleyiniz.
--List the people whose surname is Bulut in the person table in descending order by name.

--alternatif

SELECT *
FROM person
WHERE soyisim = 'Bulut'
ORDER BY isim DESC;


----------------REGEX ---------------------------------


CREATE TABLE words
(
 word_id int UNIQUE,
 word varchar(50) NOT NULL,
 number_of_letters int
);



INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'Hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'hAt', 3);
INSERT INTO words VALUES (1010, 'yaf', 5);
INSERT INTO words VALUES (1011, 'ahata', 3);


SELECT * FROM words;


--h harfinden sonra a veya i harfini sonra ise t harfini 
--içeren kelimelerin tum bilgilerini yazdiran QUERY yaziniz.
--put the letter a or i after the letter h and then the letter t
--Write QUERY, which prints all the information of the words containing it.
--hat/hit
--ahata,ahit,hatip


--CASE SENSITIVE-buyuk kucuk harfe duyarli

SELECT *
FROM words
WHERE word ~ 'h[ai]t';

--duyarsiz yapalim

SELECT *
FROM words
WHERE word ~* 'h[ai]t';



SELECT *
FROM words
WHERE word ~*  'h[a-k]t';


-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
-- Type QUERY, which prints all the information of words containing m or i
--mat,ilk


SELECT *
FROM words
WHERE word ~*' [mi];'



-- ^:kelimenin başlangıcını gösterir
-- $:kelimenin sonunu gösterir 

--a ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
-- type QUERY which prints all information of words starting with a

SELECT *
FROM words
WHERE word ~* '^a';


-- m ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
-- type QUERY which prints all information of words ending with m

SELECT *
FROM words
WHERE word ~* 'm$';


--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
-- type QUERY which prints all information of words starting with a or s

SELECT *
FROM words
WHERE word ~* '^[as]';


-- (.*):0 veya daha fazla karakteri temsil eder. (% gibi)
-- (.):sadece 1 karakteri temsil eder. (_ gibi)

--y ile başlayıp f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
-- Type QUERY, which prints all the information of words starting with y and ending with f

SELECT * 
FROM words
WHERE word ~* '^y(.*)f$';  -- '^y.*f$' de yazabiliriz


--y ile başlayıp f ile biten 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
-- Type QUERY, which prints all the information of 3-letter words starting with y and ending with f

SELECT *
FROM words
WHERE word ~* '^y.f$'; 




