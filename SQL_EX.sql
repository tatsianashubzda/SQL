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


