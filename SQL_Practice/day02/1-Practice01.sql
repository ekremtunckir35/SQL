--SUBQUERY ------


SELECT * FROM sirketler;


--soru 1 :Samsungun memurlar sayisini en yüksek memurlar sayisi değerine esitleyin

SELECT MAX (memur_sayisi) FROM sirketler; ---1500

UPDATE sirketler SET memur_sayisi =(SELECT MAX (memur_sayisi) FROM sirketler) WHERE sirket_ismi ='Samsung';



--soru 2 :Nokia sirketinin memurlar sayisi değerini en düşük memurlar sayisi değerinin 1.5 katına esitleyin

--subquery en duduk memur sayisi 

(select min(memur_sayisi) from sirketler);
update sirketler set memur_sayisi=(select min(memur_sayisi) from sirketler)*1.5 where sirket_ismi='Nokia';



--soru 3 :Iphonenin memurlar sayisini nokia ve xiaomi sirketlerinin memurlar sayisinin toplamına esıtleyın

--subquery toplam memur sayisi
--(select sum(memur_sayisi) from sirketler where sirket_ismi in('Nokia','xiaomi'));

--(select sum(memur_sayisi) from sirketler where sirket_ismi='Nokia'or sirket_ismi='xiaomi');

--(select sum(memur_sayisi) from sirketler where sirket_ismi='Nokia'and sirket_ismi='xiaomi');


update sirketler set memur_sayisi=(select sum(memur_sayisi) from sirketler where sirket_ismi in('Nokia','xiaomi'))
where sirket_ismi='Iphone';


--soru 4 :Ortalama memurlar sayisi değerinden düşük olan memurlarin memur_sayisi değerlerini 400 artırın.

select avg(memur_sayisi)from sirketler;--1800
select * from sirketler where memur_sayisi<(select avg(memur_sayisi)from sirketler);
update sirketler set memur_sayisi=memur_sayisi+400 where memur_sayisi<(select avg(memur_sayisi)from sirketler);


