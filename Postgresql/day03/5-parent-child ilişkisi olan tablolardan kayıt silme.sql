                         --17-parent-child ilişkisi olan tablolardan kayıt silme  
			 
			 
--Delete records from tables with parent-child relationship




--worker tablosundan tüm kayıtları silelim.
-- delete all records from the worker table.

SELECT * FROM worker;

DELETE FROM worker;
--worker tablosunda address tarafından referans alınan kayıtlar olduğu için silmeye izin yok



--id=10002 olan kayıt adresler tarafından referans alındığı 
--için silmeye izin yok.Once child'dan iliskiyi koparalim


DELETE FROM address WHERE adres_id ='10002';

--referans alınan kayıt silindi,ilişki koparıldı


SELECT * FROM worker;



DELETE FROM address; --tum baglanti koparildi

DELETE FROM worker; --artık hiçbir kayıt ref alınmadığı için başarılı.



  --      CASCADE ------

  --ON DELETE CASCADE     

  