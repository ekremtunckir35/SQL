create table filmler (--parent
film_id int primary key,
film_name varchar(30), 
category varchar(30) 
);

insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu'); 
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler (--child
id int,
actor_name varchar(30),
id_film int,
	CONSTRAINT fk FOREIGN key(id_film) REFERENCES filmler (film_id) 
);

insert into aktorler values (1, 'Ata Demirer', 1); 
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

select * from aktorler;
select * from filmler;
delete from aktorler where id=1;
delete from filmler where film_id=1 ;
delete from filmler where film_id=2;
delete from filmler;
drop table filmler CASCADE;
drop table aktorler;

/*************************************************************
******************* ON-DELETE-CASCADE  **********************
*************************************************************

Child tabloda on delete cascade komutu yazilmazsa

1-) Child tablo silinmeden Parent tablo silinmeye calisildiginda 
		PgAdmin Eror verir. Yani Child tablo silinmeden Parent 
	    tablo silinemez
		
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda Pg Admin Eror verir. yani Child tablodaki 
		veri silinmeden Parent tablodaki veri silinemez

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
	PgAdmin Eror vermez
	
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda PgAdmin Eror vermez	Parent tablodaki veriyi 
		siler.Fakat bu durumda Child tablodaki veride silinir.
*/