-- MySQL, версия 8.0.21.

--1. Сформулируйте SQL запрос для создания таблицы book, Структура таблицы book:
--Поле 	Тип, описание
--book_id 	INT PRIMARY KEY AUTO_INCREMENT
--title 	VARCHAR(50)
--author 	VARCHAR(30)
---price 	DECIMAL(8, 2)
--amount 	INT

CREATE TABLE book ( book_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), author VARCHAR(50), price DECIMAL(8, 2), amount INT);


--2. Занесите новую строку в таблицу book (текстовые значения (тип VARCHAR) заключать либо в двойные, либо в одинарные кавычки)

INSERT INTO book (title, author, price, amount)
VALUES ("Мастер и Маргарита", "Булгаков М.А.", 670.99, 3);


--3. Занесите три последние записи в таблицуbook,  первая запись уже добавлена на предыдущем шаге:

INSERT INTO book (title, author, price, amount) VALUE("Белая гвардия", "Булгаков М.А.", 540.50, 5 );
INSERT INTO book (title, author, price, amount) VALUE("Идиот", "Достоевский Ф.М.", 460.00, 10);
INSERT INTO book (title, author, price, amount) VALUE("Братья Карамазовы", "Достоевский Ф.М.", 799.01, 2);
SELECT * FROM book;


--4. Вывести информацию о всех книгах, хранящихся на складе.

SELECT * FROM book;


--5. Выбрать авторов, название книг и их цену из таблицы book.

SELECT author, title, price FROM book


--6. Выбрать названия книг и авторов из таблицы book, для поля title задать имя(псевдоним) Название, для поля author –  Автор. 

SELECT title as Название, author as Автор FROM book


--7. Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65 копеек. Посчитать стоимость упаковки для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). В запросе вывести название книги, ее количество и стоимость упаковки, последний столбец назвать pack

SELECT title, amount, amount*1.65 as pack FROM book


--8. В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. Написать SQL запрос, который из таблицы book выбирает названия, авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.

SELECT title, author, amount, ROUND((price*0.7), 2) as new_price FROM book


--9. При анализе продаж книг выяснилось, что наибольшей популярностью пользуются книги Михаила Булгакова, на втором месте книги Сергея Есенина. Исходя из этого решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. Написать запрос, куда включить автора, название книги и новую цену, последний столбец назвать new_price. Значение округлить до двух знаков после запятой.

SELECT author, title, 
    ROUND(IF(author="Булгаков М.А.", price*1.1, IF(author="Есенин С.А.", price*1.05, price)), 2) AS new_price
    FROM book;


--10. Вывести автора, название  и цены тех книг, количество которых меньше 10.

SELECT author, title, price FROM book WHERE amount<10


--11. Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих книг больше или равна 5000.

SELECT title, author, price, amount FROM book WHERE (price<500 or price>600) and (price*amount>=5000);


--12. Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, или 3, или 5, или 7

SELECT title, author FROM book WHERE (price BETWEEN 540.50 AND 800) AND (amount IN (2, 3, 5, 7));


--13. Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).

SELECT author, title FROM book WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title


--14. Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». Считать, что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в алфавитном порядке.

SELECT title, author FROM book
WHERE title like "% _%" and author like "% %С.%" 
order by title


--15. Отобрать различные (уникальные) элементы столбца amount таблицы book.


SELECT DISTINCT amount from book


--16. Вывести  цену самой дешевой книги, цену самой дорогой и среднюю цену уникальных книг на складе. Названия столбцов Минимальная_цена, Максимальная_цена, Средняя_цена соответственно. Среднюю цену округлить до двух знаков после запятой. Пояснение. В задании нужно посчитать среднюю цену уникальных книг на складе, а не среднюю цену всех экземпляров книг.

SELECT MIN(price) as Минимальная_цена, MAX(price) as Максимальная_цена, ROUND(AVG(price), 2) as Средняя_цена from book


--17. Вычислить среднюю цену и суммарную стоимость тех книг, количество экземпляров которых принадлежит интервалу от 5 до 14, включительно. Столбцы назвать Средняя_цена и Стоимость, значения округлить до 2-х знаков после запятой.

SELECT ROUND(AVG(price), 2) as Средняя_цена, ROUND(SUM(price*amount), 2) as Стоимость from book 
where amount BETWEEN 5 and 14


--18. Посчитать стоимость всех экземпляров каждого автора без учета книг «Идиот» и «Белая гвардия». В результат включить только тех авторов, у которых суммарная стоимость книг (без учета книг «Идиот» и «Белая гвардия») более 5000 руб. Вычисляемый столбец назвать Стоимость. Результат отсортировать по убыванию стоимости.

SELECT author, SUM(price * amount) AS Стоимость
FROM book
WHERE title <> 'Идиот' and title <> 'Белая_гвардия'
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Стоимость DESC;


--18. Вывести информацию (автора, название и цену) о  книгах, цены которых меньше или равны средней цене книг на складе. Информацию вывести в отсортированном по убыванию цены виде. Среднее вычислить как среднее по цене книги.

select author, title, price  from book where price<=(select avg(price) from book)
order by price desc


-- 19  Вывести информацию (автора, название и цену) о тех книгах, цены которых превышают минимальную цену книги на складе не более чем на 150 рублей в отсортированном по возрастанию цены виде.

select author, title, price from book 
where  price-(select min(price) from book) <=150 
order by price


--20  Вывести информацию (автора, книгу и количество) о тех книгах, количество экземпляров которых в таблице book не дублируется.

SELECT author, title, amount from book
WHERE amount IN (
        SELECT amount FROM book 
        GROUP BY amount 
        HAVING count(amount) = 1
      );

--21 Вывести информацию о книгах(автор, название, цена), цена которых меньше самой большой из минимальных цен, вычисленных для каждого автора.

SELECT author, title, price from book
WHERE price < any (SELECT  min(price) from book group by author)


--22 
Создать таблицу поставка (supply), которая имеет ту же структуру, что и таблиц book.
Поле 	Тип, описание
supply_id 	INT PRIMARY KEY AUTO_INCREMENT
title 	VARCHAR(50)
author 	VARCHAR(30)
price 	DECIMAL(8, 2)
amount 	INT

CREATE TABLE supply ( supply_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT);

--23
Занесите в таблицу supply четыре записи, чтобы получилась следующая таблица:
supply_id 	title 	author 	price 	amount
1 	Лирика 	Пастернак Б.Л. 	518.99 	2
2 	Черный человек  	Есенин С.А. 	570.20 	6
3 	Белая гвардия 	Булгаков М.А. 	540.50 	7
4 	Идиот 	Достоевский Ф.М. 	360.80 	3

INSERT INTO supply (title, author, price, amount) 
VALUES 
    ('Лирика','Пастернак Б.Л.', 518.99, 2),
    ('Черный человек','Есенин С.А.', 570.20, 6),
    ('Белая гвардия','Булгаков М.А.', 540.50, 7),
    ('Идиот', 'Достоевский Ф.М.', 360.80, 3);

--24
Добавить из таблицы supply в таблицу book, все книги, кроме книг, написанных Булгаковым М.А. и Достоевским Ф.М.

INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author NOT IN ( "Булгаков М.А.", "Достоевский Ф.М." );


--25
Занести из таблицы supply в таблицу book только те книги, авторов которых нет в  book.

INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author NOT IN (SELECT author FROM book);


--26
Уменьшить на 10% цену тех книг в таблице book, количество которых принадлежит интервалу от 5 до 10, включая границы.

UPDATE book
SET price = price * 0.9 WHERE amount BETWEEN 5 AND 10;


--27
В таблице book необходимо скорректировать значение для покупателя в столбце buy таким образом, чтобы оно не превышало количество экземпляров книг, указанных в столбце amount. А цену тех книг, которые покупатель не заказывал, снизить на 10%

UPDATE book 
SET buy = IF(buy > amount, amount, buy), price = IF(buy = 0 , price * 0.9, price);
SELECT * FROM book;


--28
Для тех книг в таблице book , которые есть в таблице supply, не только увеличить их количество в таблице book ( увеличить их количество на значение столбца amountтаблицы supply), но и пересчитать их цену (для каждой книги найти сумму цен из таблиц book и supply и разделить на 2)

UPDATE book, supply 
SET book.amount = book.amount + supply.amount,
book.price = (book.price + supply.price)/2
WHERE book.title = supply.title AND book.author = supply.author;


--29
Удалить из таблицы supply книги тех авторов, общее количество экземпляров книг которых в таблице book превышает 10.

DELETE FROM supply 
WHERE author IN(SELECT author FROM book
     GROUP BY author
     HAVING SUM(amount) > 10);


--30
Создать таблицу заказ (ordering), куда включить авторов и названия тех книг, количество экземпляров которых в таблице book меньше среднего количества экземпляров книг в таблице book. В таблицу включить столбец   amount, в котором для всех книг указать одинаковое значение - среднее количество экземпляров книг в таблице book.

CREATE TABLE ordering AS
SELECT author, title, 
   (SELECT ROUND(AVG(amount)) FROM book) AS amount
FROM book WHERE amount < (SELECT AVG(amount) FROM book);


--31
Вывести из таблицы trip информацию о командировках тех сотрудников, фамилия которых заканчивается на букву «а», в отсортированном по убыванию даты последнего дня командировки виде. В результат включить столбцы name, city, per_diem, date_first, date_last.

SELECT name, city, per_diem, date_first, date_last
FROM trip WHERE name like '%а %'
ORDER BY date_last desc;


--32
Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.

SELECT DISTINCT name
FROM trip WHERE city = 'Москва'
ORDER BY name;


--33
Для каждого города посчитать, сколько раз сотрудники в нем были.  Информацию вывести в отсортированном в алфавитном порядке по названию городов. Вычисляемый столбец назвать Количество. 

SELECT city, count(city) AS 'Количество' FROM trip 
GROUP BY city
ORDER BY city


--34
Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.

SELECT city, count(name) as 'Количество' FROM trip
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2


--35
Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).

SELECT name,city,(DATEDIFF(date_last, date_first)+1) AS Длительность
FROM trip WHERE city NOT IN ('Москва', 'Санкт-Петербург')
ORDER BY Длительность DESC, city DESC;


--36
Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. В результат включить столбцы name, city, date_first, date_last.

SELECT name, city, date_first, date_last
FROM trip WHERE
ABS(DATEDIFF(date_first, date_last) - 1) = (SELECT MIN(ABS(DATEDIFF(date_first, date_last) - 1))
FROM trip);


--37
Вывести информацию о командировках, начало и конец которых относятся к одному месяцу (год может быть любой). В результат включить столбцы name, city, date_first, date_last. Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника .

SELECT name, city, date_first, date_last
FROM trip WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city, name


--38
Вывести название месяца и количество командировок для каждого месяца. Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце. Информацию вывести сначала в отсортированном по убыванию количества, а потом в алфавитном порядке по названию месяца виде. Название столбцов – Месяц и Количество.

SELECT MONTHNAME(date_first) AS Месяц, COUNT(MONTHNAME(date_first)) AS Количество
FROM trip
GROUP BY MONTHNAME(date_first)
ORDER BY Количество DESC, Месяц

--39
Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок, первый день которых пришелся на февраль или март 2020 года. Значение суточных для каждой командировки занесено в столбец per_diem. Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных. Последний столбец назвать Сумма. Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников, а затем по убыванию суммы суточных.

SELECT name, city, date_first, DATEDIFF(date_last+1, date_first)*per_diem AS Сумма
FROM trip WHERE YEAR(date_first)=2020 AND MONTH(date_first)=3 OR MONTH(date_first)=2
ORDER BY name, Сумма DESC;


--40
Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников, которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде. Последний столбец назвать Сумма.

SELECT name, SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS Сумма
FROM trip
GROUP BY name
HAVING COUNT(date_first) > 3
ORDER BY name



--41
Создать таблицу fine следующей структуры:
Поле 	Описание
fine_id 	ключевой столбец целого типа с автоматическим увеличением значения ключа на 1
name 	строка длиной 30
number_plate 	строка длиной 6
violation 	строка длиной 50
sum_fine 	вещественное число, максимальная длина 8, количество знаков после запятой 2
date_violation 	дата
date_payment 	дата

CREATE TABLE fine
(fine_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30),
number_plate VARCHAR(6),
violation VARCHAR(50),
sum_fine DECIMAL(8,2),
date_violation DATE,
date_payment DATE);


--42
В таблицу fine первые 5 строк уже занесены. Добавить в таблицу записи с ключевыми значениями 6, 7, 8.

INSERT INTO fine
(name, number_plate, violation, date_violation)
VALUES
('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14'),
('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', '2020-02-23'),
('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03');


--43
Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. При этом суммы заносить только в пустые поля столбца  sum_fine.
Таблица traffic_violationсоздана и заполнена.
Важно! Сравнение значения столбца с пустым значением осуществляется с помощью оператора IS NULL.

UPDATE fine f, traffic_violation tv
SET f.sum_fine = tv.sum_fine
WHERE f.violation = tv.violation  AND f.sum_fine IS NULL;


--44
Вывести фамилию, номер машины и нарушение только для тех водителей, которые на одной машине нарушили одно и то же правило   два и более раз. При этом учитывать все нарушения, независимо от того оплачены они или нет. Информацию отсортировать в алфавитном порядке, сначала по фамилии водителя, потом по номеру машины и, наконец, по нарушению.

SELECT name, number_plate, violation FROM fine
GROUP by name, number_plate, violation
HAVING count(violation) >= 2
ORDER by name, number_plate, violation


--45
В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. 

UPDATE fine as f, 
(SELECT name, number_plate, violation FROM fine
GROUP BY name, number_plate, violation
HAVING count(*) >= 2 ) AS dv
   SET f.sum_fine = f.sum_fine*2
   WHERE f.date_payment IS Null
	   AND (f.name = dv.name
	   AND f.violation = dv.violation);


--46
Водители оплачивают свои штрафы. В таблице payment занесены даты их оплаты:
payment_id 	name 	        number_plate 	violation 	                       date_violation 	date_payment
1 	     Яковлев Г.Р. 	М701АА   	Превышение скорости (от 20 до 40) 	2020-01-12 	2020-01-22
2 	     Баранов П.Е. 	Р523ВТ 	        Превышение скорости (от 40 до 60) 	2020-02-14 	2020-03-06
3 	     Яковлев Г.Р. 	Т330ТТ 	        Проезд на запрещающий сигнал 	        2020-03-03 	2020-03-23

Необходимо:
    в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
    уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов, информация о которых занесена в таблицу payment) , если оплата произведена не позднее 20 дней со дня нарушения.

UPDATE fine, payment SET fine.date_payment = payment.date_payment, fine.sum_fine = IF(DATEDIFF(fine.date_payment, fine.date_violation) <= 20, fine.sum_fine/2, fine.sum_fine)
WHERE fine.name = payment.name AND fine.number_plate = payment.number_plate AND fine.violation = payment.violation AND  fine.date_violation = payment.date_violation AND fine.date_payment IS NULL;


--47 
Создать новую таблицу back_payment, куда внести информацию о неоплаченных штрафах (Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа  и  дату нарушения) из таблицы fine.

CREATE TABLE back_payment 
(SELECT name, number_plate, violation, sum_fine, date_violation
FROM fine WHERE date_payment IS NULL);


--48
Удалить из таблицы fine информацию о нарушениях, совершенных раньше 1 февраля 2020 года. 

DELETE FROM fine
WHERE date_violation < DATE(20200201) AND date_payment IS NOT NULL;


--49
Создать таблицу author следующей структуры:
Поле 	Тип, описание
author_id 	INT PRIMARY KEY AUTO_INCREMENT
name_author 	VARCHAR(50)

CREATE TABLE author
(author_id int PRIMARY KEY AUTO_INCREMENT,
 name_author varchar(50));

--50
Перепишите запрос на создание таблицы book , чтобы ее структура соответствовала
 структуре, показанной на логической схеме 
(таблица genre уже создана, порядок следования столбцов - 
как на логической схеме в таблице book, genre_id  - внешний ключ). 
Для genre_id ограничение о недопустимости пустых значений не задавать. 
В качестве главной таблицы для описания поля  genre_id использовать таблицу genre 
следующей структуры:
Поле 	Тип, описание
genre_id 	INT PRIMARY KEY AUTO_INCREMENT
name_genre 	VARCHAR(30)

 (нужно создать только таблицу book):

CREATE TABLE book 
(   book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8, 2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id),
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id) );


--51 
Создать таблицу book той же структуры, что и на предыдущем шаге. Будем считать, что при удалении автора из таблицы author, должны удаляться все записи о книгах из таблицы book, написанные этим автором. А при удалении жанра из таблицы genre для соответствующей записи book установить значение Null в столбце genre_id

CREATE TABLE book
(   book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    genre_id INT,
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id) ON DELETE SET NULL
);


--52
Добавьте три последние записи (с ключевыми значениями 6, 7, 8) в таблицу book, первые 5 записей уже добавлены:
book_id 	title 			author_id 	genre_id 	price 	amount
1 		Мастер и Маргарита 		1 	1 		670.99 	3
2 		Белая гвардия 			1 	1 		540.50 	5
3 		Идиот 				2 	1 		460.00 	10
4 		Братья Карамазовы 		2 	1 		799.01 	3
5 		Игрок 				2 	1 		480.50 	10
6 		Стихотворения и поэмы 		3 	2 		650.00 	15
7 		Черный человек 			3 	2 		570.20 	6
8 		Лирика 				4 	2 		518.99 	2

INSERT INTO book(title, author_id, genre_id, price, amount)
VALUES ('Стихотворения и поэмы', 3, 2, 650.00, 15),
       ('Черный человек', 3, 2, 570.20, 6),
       ('Лирика', 4, 2, 518.99, 2)


--53
Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.

SELECT title, name_genre, price FROM book 
JOIN genre ON book.genre_id = genre.genre_id
WHERE book.amount > 8
ORDER BY price DESC;


--54
Вывести все жанры, которые не представлены в книгах на складе.

SELECT name_genre
FROM genre LEFT JOIN book 
    ON genre.genre_id = book.genre_id
WHERE title IS NULL;


--55
Есть список городов, хранящийся в таблице city:
city_id 	name_city
1 	Москва
2 	Санкт-Петербург
3 	Владивосток

Необходимо в каждом городе провести выставку книг каждого автора в течение 2020 года. Дату проведения выставки выбрать случайным образом. Создать запрос, который выведет город, автора и дату проведения выставки. Последний столбец назвать Дата. Информацию вывести, отсортировав сначала в алфавитном порядке по названиям городов, а потом по убыванию дат проведения выставок.

SELECT  name_city,name_author, DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*365) DAY) AS Дата
FROM city CROSS JOIN author
ORDER BY
    name_city ASC,
    Дата DESC;


--56
Вывести информацию о тех книгах, их авторах и жанрах, цена которых принадлежит интервалу от 500  до 700 рублей  включительно.

SELECT title, name_author, name_genre, price, amount
FROM
    author 
    INNER JOIN  book ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE price BETWEEN 500 AND 700;


--57
Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово «роман» в отсортированном по названиям книг виде.

SELECT name_genre, title, name_author  
FROM  author JOIN  book ON author.author_id = book.author_id
    JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre = 'Роман'
ORDER BY title;



---58
Посчитать количество экземпляров  книг каждого автора из таблицы author.  Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию количества виде. Последний столбец назвать Количество.

SELECT name_author, sum(amount) AS Количество
FROM author LEFT JOIN book on author.author_id = book.author_id
GROUP BY name_author
HAVING Ково is NULL
ORDER BY Количество ASC;   


--59
Вывести в алфавитном порядке всех авторов, которые пишут только в одном жанре. Поскольку у нас в таблицах так занесены данные, что у каждого автора книги только в одном жанре,  для этого запроса внесем изменения в таблицу book. Пусть у нас  книга Есенина «Черный человек» относится к жанру «Роман», а книга Булгакова «Белая гвардия» к «Приключениям» (эти изменения в таблицы уже внесены).

SELECT name_author
FROM author INNER JOIN book USING(author_id)
GROUP BY name_author
HAVING COUNT(distinct(genre_id)) = 1
ORDER BY name_author;


--60
Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпляров книги), написанных в самых популярных жанрах, в отсортированном в алфавитном порядке по названию книг виде. Самым популярным считать жанр, общее количество экземпляров книг которого на складе максимально.

SELECT title, name_author, name_genre, price, amount FROM  
author INNER JOIN book ON author.author_id = book.author_id  
INNER JOIN ( SELECT genre_id FROM book 
  GROUP BY genre_id 
  HAVING SUM(amount) >= ALL (SELECT SUM(amount)FROM book  
  GROUP BY genre_id))
  query_in ON book.genre_id = query_in.genre_id  INNER JOIN genre ON query_in.genre_id = genre.genre_id 
ORDER BY 1;

--61
Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,  вывести их название и автора, а также посчитать общее количество экземпляров книг в таблицах supply и book,  столбцы назвать Название, Автор  и Количество

SELECT book.title AS Название, name_author AS Автор, sum(book.amount + supply.amount) AS Количество
FROM author INNER JOIN book USING (author_id)   
            INNER JOIN supply ON book.title = supply.title AND author.name_author = supply.author
WHERE book.price = supply.price
GROUP BY book.title, name_author;

--62
Для книг, которые уже есть на складе (в таблице book), но по другой цене, чем в поставке (supply),  необходимо в таблице book увеличить количество на значение, указанное в поставке,  и пересчитать цену. А в таблице  supply обнулить количество этих книг. Формула для пересчета цены:

price=(p1?k1+p2?k2)k1+k2
price=k1?+k2?(p1??k1?+p2??k2?)?где  p1, p2 - цена книги в таблицах book и supply;

       k1, k2 - количество книг в таблицах book и supply.

UPDATE book as b JOIN author as a USING(author_id) JOIN supply as s ON b.title=s.title AND a.name_author=s.author
SET b.amount=b.amount + s.amount,
    b.price=(b.price*b.amount + s.price*s.amount)/(b.amount+s.amount),
    s.amount=0
WHERE b.price <> s.price;


--63
Включить новых авторов в таблицу author с помощью запроса на добавление, а затем вывести все данные из таблицы author.  Новыми считаются авторы, которые есть в таблице supply, но нет в таблице author.

INSERT INTO author (name_author)
SELECT supply.author
FROM author RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;