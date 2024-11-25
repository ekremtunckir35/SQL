--36-SELF JOIN : tablonun kendi içindeki bir sütunu baz alarak INNER JOIN yapılmasını sağlar.

/*Self Join, bir tablonun kendisiyle birleştirilmesi işlemidir. Yani, aynı tablodan iki kez veri alır ve bu iki örneği birleştirirsiniz. Bu tür bir işlemde, tablonun farklı alias (takma ad) kullanılarak birleştirilmesi sağlanır.

Self Join Neden Kullanılır?
Self join, genellikle şu tür durumlar için kullanılır:

Aynı Tablodaki İlişkileri Gösterme: Eğer bir tablonun verileri arasında ilişki varsa ve bu ilişkileri sorgulamak istiyorsanız, self join kullanabilirsiniz. Örneğin, bir şirketteki çalışanlar arasında yöneticileri belirlemek gibi.
Hierarşik Veriler: Bir tabloda, her kaydın başka bir kayda bağlı olduğu durumlar (örneğin, bir yönetici ve onun altındaki çalışanlar) self join ile kolayca gösterilebilir.
Veri Karşılaştırması: Aynı tablodaki verileri karşılaştırmak için de self join kullanılabilir. Örneğin, çalışanların maaşlarını karşılaştırmak ya da aynı üründen farklı zamanlarda yapılan siparişleri görmek.
Self Join Nasıl Kullanılır?
Self join yaparken, tablonun farklı kopyalarını (alias) kullanarak bu birleştirme işlemi gerçekleştirilir. İki farklı kopyayı birbirine bağlarken, her iki tablonun da anlamlı bir şekilde ilişkilendirildiğinden emin olmalısınız.

Self Join Kullanımı Adımları:

Tablonun Alias'larını Kullanmak: Aynı tablonun iki farklı örneğini (alias) kullanarak birleştirme yapılır.
İlişkiyi Tanımlamak: İki örneğin arasında bir ilişki olmalıdır (genellikle bir foreign key ile).
WHERE veya ON Koşulunu Kullanmak: Bu ilişkiyi tanımlayan bir koşul kullanarak iki tabloyu birleştirirsiniz.*/




CREATE TABLE staff  (
id int,
isim varchar(20),  
title varchar(60), 
yonetici_id int
);


INSERT INTO staff VALUES(1, 'Ali Can', 'SDET',     2);
INSERT INTO staff VALUES(2, 'Veli Cem', 'QA',      3);
INSERT INTO staff VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO staff VALUES(4, 'Fatma Can', 'CEO',    null);



SELECT * FROM staff;

/*Senaryo 5: Her bir personelin ismi ile birlikte yöneticisinin ismini de veren bir sorgu oluşturunuz.*/
/*Scenario 5: Create a query that gives the name of each staff member and the name of his/her manager.*/

SELECT p.isim AS personel, m.isim AS yonetici
FROM staff m INNER JOIN staff p 
ON p.yonetici_id = m.id;




