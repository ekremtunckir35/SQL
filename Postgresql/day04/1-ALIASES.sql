


                            --23-ALIASES:Rumuz/Etiket/takma isim
							
/*Senaryo: "workers" adinda bir tablo oluşturalim.

1-calisan_id sutun ismini id olarak degistirelim
2-calisan_isim sutun ismini isim olarak degistirelim
3-workers olan tablo ismini w olarak degistirelim*/

/*Scenario: Let's create a table called "workers".

1- Let's change the name of column employee_id to id.
2-employee_name column name should be changed to name.
3- Let's change the table name workers to w*/



CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);


INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

SELECT calisan_isim isim FROM workers; --AS kullanmadan da calisir.

SELECT calisan_isim isim FROM workers AS w; --tablo ismi w oldu








							