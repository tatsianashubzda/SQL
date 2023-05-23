Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model)
 и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). 
Предполагается, что номера моделей в таблице Product уникальны для всех производителей
 и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code,
 указаны модель – model (внешний ключ к таблице Product),
 скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), 
размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x')
 и цена - price (в долларах). 
Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит
 размер экрана -screen (в дюймах). 
В таблице Printer для каждой модели принтера указывается, 
является ли он цветным - color ('y', если цветной), 
тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') 
и цена - price.



1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

Select model, speed, hd from PC where price<500



2. Найдите производителей принтеров. Вывести: maker

Select distinct maker from product where type = 'Printer'



3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

select model, ram, screen from Laptop where price > 1000



4. Найдите все записи таблицы Printer для цветных принтеров.

Select * from Printer where  color = 'y'



5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

Select model, speed, hd from pc 
where   (cd = '12x' or cd = '24x' )  and  price < 600



6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

select distinct Product.maker, Laptop.speed  from product inner join  laptop  on Product.model = Laptop.model  where  laptop.hd>=10



7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT NEW.model, price 
FROM (SELECT model, price 
 FROM PC 
 UNION
 SELECT model, price 
  FROM Laptop
 UNION
 SELECT model, price 
 FROM Printer
 ) AS NEW JOIN 
 Product  ON NEW.model = Product.model
WHERE Product.maker = 'B'



8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.

select maker from product
where type = 'pc' 

except 

select maker from product
where type = 'laptop'


9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select distinct maker from product join pc
on product.model = pc.model
where speed>=450



10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

Select model, price from printer
where price = (select max(price) from printer)


11. Найдите среднюю скорость ПК.

select avg(speed) from pc




12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

select avg(speed) from laptop where price>1000




13. Найдите среднюю скорость ПК, выпущенных производителем A.

select avg(speed) from pc join product on pc.model = product.model 
where maker = 'A'



Рассматривается БД кораблей, участвовавших во второй мировой войне. Имеются следующие отношения:
Classes (class, type, country, numGuns, bore, displacement)
Ships (name, class, launched)
Battles (name, date)
Outcomes (ship, battle, result)
Корабли в «классах» построены по одному и тому же проекту, и классу присваивается либо имя первого корабля, построенного по данному проекту, либо названию класса дается имя проекта, которое не совпадает ни с одним из кораблей в БД. Корабль, давший название классу, называется головным.
Отношение Classes содержит имя класса, тип (bb для боевого (линейного) корабля или bc для боевого крейсера), страну, в которой построен корабль, число главных орудий, калибр орудий (диаметр ствола орудия в дюймах) и водоизмещение ( вес в тоннах). В отношении Ships записаны название корабля, имя его класса и год спуска на воду. В отношение Battles включены название и дата битвы, в которой участвовали корабли, а в отношении Outcomes – результат участия данного корабля в битве (потоплен-sunk, поврежден - damaged или невредим - OK).
Замечания. 1) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships. 2) Потопленный корабль в последующих битвах участия не принимает.

14. 

select classes.class, ships.name, country from ships join classes 
on ships.class=classes.class 
where numGuns>=10





