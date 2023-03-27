-- MySQL, ������ 8.0.21.

--1. ������������� SQL ������ ��� �������� ������� book, ��������� ������� book:
--���� 	���, ��������
--book_id 	INT PRIMARY KEY AUTO_INCREMENT
--title 	VARCHAR(50)
--author 	VARCHAR(30)
---price 	DECIMAL(8, 2)
--amount 	INT

CREATE TABLE book ( book_id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(50), author VARCHAR(50), price DECIMAL(8, 2), amount INT);


--2. �������� ����� ������ � ������� book (��������� �������� (��� VARCHAR) ��������� ���� � �������, ���� � ��������� �������)

INSERT INTO book (title, author, price, amount)
VALUES ("������ � ���������", "�������� �.�.", 670.99, 3);


--3. �������� ��� ��������� ������ � �������book,  ������ ������ ��� ��������� �� ���������� ����:

INSERT INTO book (title, author, price, amount) VALUE("����� �������", "�������� �.�.", 540.50, 5 );
INSERT INTO book (title, author, price, amount) VALUE("�����", "����������� �.�.", 460.00, 10);
INSERT INTO book (title, author, price, amount) VALUE("������ ����������", "����������� �.�.", 799.01, 2);
SELECT * FROM book;


--4. ������� ���������� � ���� ������, ���������� �� ������.

SELECT * FROM book;


--5. ������� �������, �������� ���� � �� ���� �� ������� book.

SELECT author, title, price FROM book


--6. ������� �������� ���� � ������� �� ������� book, ��� ���� title ������ ���(���������) ��������, ��� ���� author �  �����. 

SELECT title as ��������, author as ����� FROM book


--7. ��� �������� ������ ����� ��������� ���� ���� ������, ���� �������� 1 ����� 65 ������. ��������� ��������� �������� ��� ������ ����� (������� ����� �����������, ����� ��������� ��� ���������� �����). � ������� ������� �������� �����, �� ���������� � ��������� ��������, ��������� ������� ������� pack

SELECT title, amount, amount*1.65 as pack FROM book


--8. � ����� ���� ���� ���� ���� �� ������ ������������� � ������� �� �� 30%. �������� SQL ������, ������� �� ������� book �������� ��������, �������, ���������� � ��������� ����� ���� ����. ������� � ����� ����� ������� new_price, ���� ��������� �� 2-� ������ ����� �������.

SELECT title, author, amount, ROUND((price*0.7), 2) as new_price FROM book


--9. ��� ������� ������ ���� ����������, ��� ���������� ������������� ���������� ����� ������� ���������, �� ������ ����� ����� ������ �������. ������ �� ����� ������ ������� ���� ���� ��������� �� 10%, � ���� ���� ������� - �� 5%. �������� ������, ���� �������� ������, �������� ����� � ����� ����, ��������� ������� ������� new_price. �������� ��������� �� ���� ������ ����� �������.

SELECT author, title, 
    ROUND(IF(author="�������� �.�.", price*1.1, IF(author="������ �.�.", price*1.05, price)), 2) AS new_price
    FROM book;


--10. ������� ������, ��������  � ���� ��� ����, ���������� ������� ������ 10.

SELECT author, title, price FROM book WHERE amount<10


--11. ������� ��������, ������,  ����  � ���������� ���� ����, ���� ������� ������ 500 ��� ������ 600, � ��������� ���� ����������� ���� ���� ������ ��� ����� 5000.

SELECT title, author, price, amount FROM book WHERE (price<500 or price>600) and (price*amount>=5000);


--12. ������� �������� � ������� ��� ����, ���� ������� ����������� ��������� �� 540.50 �� 800 (������� �������),  � ���������� ��� 2, ��� 3, ��� 5, ��� 7

SELECT title, author FROM book WHERE (price BETWEEN 540.50 AND 800) AND (amount IN (2, 3, 5, 7));


--13. �������  ������ � ��������  ����, ���������� ������� ����������� ��������� �� 2 �� 14 (������� �������). ����������  ������������� ������� �� ������� (� �������� ���������� �������), � ����� �� ��������� ���� (�� ��������).

SELECT author, title FROM book WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title


--14. ������� �������� � ������ ��� ����, �������� ������� ������� �� ���� � ����� ����, � �������� ������ �������� ����� �ѻ. �������, ��� � �������� ����� ���������� ���� �� ����� ��������� � �� �������� ������ ����������, ����� �������� ������ � ���������� ���������� ������, �������� ������������ ��� ������� � �������: �����, �����, �����, �����. ���������� ������������� �� �������� ����� � ���������� �������.

SELECT title, author FROM book
WHERE title like "% _%" and author like "% %�.%" 
order by title


--15. �������� ��������� (����������) �������� ������� amount ������� book.


SELECT DISTINCT amount from book


--16. �������  ���� ����� ������� �����, ���� ����� ������� � ������� ���� ���������� ���� �� ������. �������� �������� �����������_����, ������������_����, �������_���� ��������������. ������� ���� ��������� �� ���� ������ ����� �������. ���������. � ������� ����� ��������� ������� ���� ���������� ���� �� ������, � �� ������� ���� ���� ����������� ����.

SELECT MIN(price) as �����������_����, MAX(price) as ������������_����, ROUND(AVG(price), 2) as �������_���� from book


--17. ��������� ������� ���� � ��������� ��������� ��� ����, ���������� ����������� ������� ����������� ��������� �� 5 �� 14, ������������. ������� ������� �������_���� � ���������, �������� ��������� �� 2-� ������ ����� �������.

SELECT ROUND(AVG(price), 2) as �������_����, ROUND(SUM(price*amount), 2) as ��������� from book 
where amount BETWEEN 5 and 14


--18. ��������� ��������� ���� ����������� ������� ������ ��� ����� ���� ������ � ������ ��������. � ��������� �������� ������ ��� �������, � ������� ��������� ��������� ���� (��� ����� ���� ������ � ������ ��������) ����� 5000 ���. ����������� ������� ������� ���������. ��������� ������������� �� �������� ���������.

SELECT author, SUM(price * amount) AS ���������
FROM book
WHERE title <> '�����' and title <> '�����_�������'
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY ��������� DESC;


--18. ������� ���������� (������, �������� � ����) �  ������, ���� ������� ������ ��� ����� ������� ���� ���� �� ������. ���������� ������� � ��������������� �� �������� ���� ����. ������� ��������� ��� ������� �� ���� �����.

select author, title, price  from book where price<=(select avg(price) from book)
order by price desc


-- 19  ������� ���������� (������, �������� � ����) � ��� ������, ���� ������� ��������� ����������� ���� ����� �� ������ �� ����� ��� �� 150 ������ � ��������������� �� ����������� ���� ����.

select author, title, price from book 
where  price-(select min(price) from book) <=150 
order by price


--20  ������� ���������� (������, ����� � ����������) � ��� ������, ���������� ����������� ������� � ������� book �� �����������.

SELECT author, title, amount from book
WHERE amount IN (
        SELECT amount FROM book 
        GROUP BY amount 
        HAVING count(amount) = 1
      );

--21 ������� ���������� � ������(�����, ��������, ����), ���� ������� ������ ����� ������� �� ����������� ���, ����������� ��� ������� ������.

SELECT author, title, price from book
WHERE price < any (SELECT  min(price) from book group by author)


--22 
������� ������� �������� (supply), ������� ����� �� �� ���������, ��� � ������ book.
���� 	���, ��������
supply_id 	INT PRIMARY KEY AUTO_INCREMENT
title 	VARCHAR(50)
author 	VARCHAR(30)
price 	DECIMAL(8, 2)
amount 	INT

CREATE TABLE supply ( supply_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(50), author VARCHAR(30), price DECIMAL(8, 2), amount INT);

--23
�������� � ������� supply ������ ������, ����� ���������� ��������� �������:
supply_id 	title 	author 	price 	amount
1 	������ 	��������� �.�. 	518.99 	2
2 	������ �������  	������ �.�. 	570.20 	6
3 	����� ������� 	�������� �.�. 	540.50 	7
4 	����� 	����������� �.�. 	360.80 	3

INSERT INTO supply (title, author, price, amount) 
VALUES 
    ('������','��������� �.�.', 518.99, 2),
    ('������ �������','������ �.�.', 570.20, 6),
    ('����� �������','�������� �.�.', 540.50, 7),
    ('�����', '����������� �.�.', 360.80, 3);

--24
�������� �� ������� supply � ������� book, ��� �����, ����� ����, ���������� ���������� �.�. � ����������� �.�.

INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author NOT IN ( "�������� �.�.", "����������� �.�." );


--25
������� �� ������� supply � ������� book ������ �� �����, ������� ������� ��� �  book.

INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply
WHERE author NOT IN (SELECT author FROM book);


--26
��������� �� 10% ���� ��� ���� � ������� book, ���������� ������� ����������� ��������� �� 5 �� 10, ������� �������.

UPDATE book
SET price = price * 0.9 WHERE amount BETWEEN 5 AND 10;


--27
� ������� book ���������� ��������������� �������� ��� ���������� � ������� buy ����� �������, ����� ��� �� ��������� ���������� ����������� ����, ��������� � ������� amount. � ���� ��� ����, ������� ���������� �� ���������, ������� �� 10%

UPDATE book 
SET buy = IF(buy > amount, amount, buy), price = IF(buy = 0 , price * 0.9, price);
SELECT * FROM book;


--28
��� ��� ���� � ������� book , ������� ���� � ������� supply, �� ������ ��������� �� ���������� � ������� book ( ��������� �� ���������� �� �������� ������� amount������� supply), �� � ����������� �� ���� (��� ������ ����� ����� ����� ��� �� ������ book � supply � ��������� �� 2)

UPDATE book, supply 
SET book.amount = book.amount + supply.amount,
book.price = (book.price + supply.price)/2
WHERE book.title = supply.title AND book.author = supply.author;


--29
������� �� ������� supply ����� ��� �������, ����� ���������� ����������� ���� ������� � ������� book ��������� 10.

DELETE FROM supply 
WHERE author IN(SELECT author FROM book
     GROUP BY author
     HAVING SUM(amount) > 10);


--30
������� ������� ����� (ordering), ���� �������� ������� � �������� ��� ����, ���������� ����������� ������� � ������� book ������ �������� ���������� ����������� ���� � ������� book. � ������� �������� �������   amount, � ������� ��� ���� ���� ������� ���������� �������� - ������� ���������� ����������� ���� � ������� book.

CREATE TABLE ordering AS
SELECT author, title, 
   (SELECT ROUND(AVG(amount)) FROM book) AS amount
FROM book WHERE amount < (SELECT AVG(amount) FROM book);


--31
������� �� ������� trip ���������� � ������������� ��� �����������, ������� ������� ������������� �� ����� ��, � ��������������� �� �������� ���� ���������� ��� ������������ ����. � ��������� �������� ������� name, city, per_diem, date_first, date_last.

SELECT name, city, per_diem, date_first, date_last
FROM trip WHERE name like '%� %'
ORDER BY date_last desc;


--32
������� � ���������� ������� ������� � �������� ��� �����������, ������� ���� � ������������ � ������.

SELECT DISTINCT name
FROM trip WHERE city = '������'
ORDER BY name;


--33
��� ������� ������ ���������, ������� ��� ���������� � ��� ����.  ���������� ������� � ��������������� � ���������� ������� �� �������� �������. ����������� ������� ������� ����������. 

SELECT city, count(city) AS '����������' FROM trip 
GROUP BY city
ORDER BY city


--34
������� ��� ������, � ������� ���� ����� ���� � ������������� ����������. ����������� ������� ������� ����������.

SELECT city, count(name) as '����������' FROM trip
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2


--35
������� ���������� � ������������� �� ��� ������ ����� ������ � �����-���������� (������� � �������� �����������, ����� ,  ������������ ������������ � ����, ��� ���� ������ � ��������� ���� ��������� � ������� ������������). ��������� ������� ������� ������������. ���������� ������� � ������������� �� �������� ������������ �������, � ����� �� �������� �������� ������� (� �������� ���������� �������).

SELECT name,city,(DATEDIFF(date_last, date_first)+1) AS ������������
FROM trip WHERE city NOT IN ('������', '�����-���������')
ORDER BY ������������ DESC, city DESC;


--36
������� ���������� � ������������� ����������(��), ������� ���� ������ ��������� �� �������. � ��������� �������� ������� name, city, date_first, date_last.

SELECT name, city, date_first, date_last
FROM trip WHERE
ABS(DATEDIFF(date_first, date_last) - 1) = (SELECT MIN(ABS(DATEDIFF(date_first, date_last) - 1))
FROM trip);


--37
������� ���������� � �������������, ������ � ����� ������� ��������� � ������ ������ (��� ����� ���� �����). � ��������� �������� ������� name, city, date_first, date_last. ������ ������������� �������  � ���������� ������� �� �������� ������, � ����� �� ������� ���������� .

SELECT name, city, date_first, date_last
FROM trip WHERE MONTH(date_first) = MONTH(date_last)
ORDER BY city, name


--38
������� �������� ������ � ���������� ������������ ��� ������� ������. �������, ��� ������������ ��������� � ���������� ������, ���� ��� �������� � ���� ������. ���������� ������� ������� � ��������������� �� �������� ����������, � ����� � ���������� ������� �� �������� ������ ����. �������� �������� � ����� � ����������.

SELECT MONTHNAME(date_first) AS �����, COUNT(MONTHNAME(date_first)) AS ����������
FROM trip
GROUP BY MONTHNAME(date_first)
ORDER BY ���������� DESC, �����

--39
������� ����� �������� (������������ ���������� ���� ������������ � ������� ��������) ��� ������������, ������ ���� ������� �������� �� ������� ��� ���� 2020 ����. �������� �������� ��� ������ ������������ �������� � ������� per_diem. ������� ������� � �������� ����������, �����, ������ ���� ������������ � ����� ��������. ��������� ������� ������� �����. ���������� ������������� �������  � ���������� ������� �� �������� �����������, � ����� �� �������� ����� ��������.

SELECT name, city, date_first, DATEDIFF(date_last+1, date_first)*per_diem AS �����
FROM trip WHERE YEAR(date_first)=2020 AND MONTH(date_first)=3 OR MONTH(date_first)=2
ORDER BY name, ����� DESC;


--40
������� ������� � ���������� � ����� ����� ��������, ���������� �� ��� ������������ ��� ��� �����������, ������� ���� � ������������� ������ ��� 3 ����, � ��������������� �� �������� ���� �������� ����. ��������� ������� ������� �����.

SELECT name, SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS �����
FROM trip
GROUP BY name
HAVING COUNT(date_first) > 3
ORDER BY name



--41
������� ������� fine ��������� ���������:
���� 	��������
fine_id 	�������� ������� ������ ���� � �������������� ����������� �������� ����� �� 1
name 	������ ������ 30
number_plate 	������ ������ 6
violation 	������ ������ 50
sum_fine 	������������ �����, ������������ ����� 8, ���������� ������ ����� ������� 2
date_violation 	����
date_payment 	����

CREATE TABLE fine
(fine_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30),
number_plate VARCHAR(6),
violation VARCHAR(50),
sum_fine DECIMAL(8,2),
date_violation DATE,
date_payment DATE);


--42
� ������� fine ������ 5 ����� ��� ��������. �������� � ������� ������ � ��������� ���������� 6, 7, 8.

INSERT INTO fine
(name, number_plate, violation, date_violation)
VALUES
('������� �.�.', '�523��', '���������� ��������(�� 40 �� 60)', '2020-02-14'),
('�������� �.�.', '�111��', '������ �� ����������� ������', '2020-02-23'),
('������� �.�.', '�330��', '������ �� ����������� ������', '2020-03-03');


--43
������� � ������� fine ����� �������, ������� ������ �������� ��������, � ������������ � ������� �� ������� traffic_violation. ��� ���� ����� �������� ������ � ������ ���� �������  sum_fine.
������� traffic_violation������� � ���������.
�����! ��������� �������� ������� � ������ ��������� �������������� � ������� ��������� IS NULL.

UPDATE fine f, traffic_violation tv
SET f.sum_fine = tv.sum_fine
WHERE f.violation = tv.violation  AND f.sum_fine IS NULL;


--44
������� �������, ����� ������ � ��������� ������ ��� ��� ���������, ������� �� ����� ������ �������� ���� � �� �� �������   ��� � ����� ���. ��� ���� ��������� ��� ���������, ���������� �� ���� �������� ��� ��� ���. ���������� ������������� � ���������� �������, ������� �� ������� ��������, ����� �� ������ ������ �, �������, �� ���������.

SELECT name, number_plate, violation FROM fine
GROUP by name, number_plate, violation
HAVING count(violation) >= 2
ORDER by name, number_plate, violation


--45
� ������� fine ��������� � ��� ���� ����� ������������ ������� ��� ���������� �� ���������� ���� �������. 

UPDATE fine as f, 
(SELECT name, number_plate, violation FROM fine
GROUP BY name, number_plate, violation
HAVING count(*) >= 2 ) AS dv
   SET f.sum_fine = f.sum_fine*2
   WHERE f.date_payment IS Null
	   AND (f.name = dv.name
	   AND f.violation = dv.violation);


--46
�������� ���������� ���� ������. � ������� payment �������� ���� �� ������:
payment_id 	name 	        number_plate 	violation 	                       date_violation 	date_payment
1 	     ������� �.�. 	�701��   	���������� �������� (�� 20 �� 40) 	2020-01-12 	2020-01-22
2 	     ������� �.�. 	�523�� 	        ���������� �������� (�� 40 �� 60) 	2020-02-14 	2020-03-06
3 	     ������� �.�. 	�330�� 	        ������ �� ����������� ������ 	        2020-03-03 	2020-03-23

����������:
    � ������� fine ������� ���� ������ ���������������� ������ �� ������� payment; 
    ��������� ����������� ����� � ������� fine � ��� ����  (������ ��� ��� �������, ���������� � ������� �������� � ������� payment) , ���� ������ ����������� �� ������� 20 ���� �� ��� ���������.

UPDATE fine, payment SET fine.date_payment = payment.date_payment, fine.sum_fine = IF(DATEDIFF(fine.date_payment, fine.date_violation) <= 20, fine.sum_fine/2, fine.sum_fine)
WHERE fine.name = payment.name AND fine.number_plate = payment.number_plate AND fine.violation = payment.violation AND  fine.date_violation = payment.date_violation AND fine.date_payment IS NULL;


--47 
������� ����� ������� back_payment, ���� ������ ���������� � ������������ ������� (������� � �������� ��������, ����� ������, ���������, ����� ������  �  ���� ���������) �� ������� fine.

CREATE TABLE back_payment 
(SELECT name, number_plate, violation, sum_fine, date_violation
FROM fine WHERE date_payment IS NULL);


--48
������� �� ������� fine ���������� � ����������, ����������� ������ 1 ������� 2020 ����. 

DELETE FROM fine
WHERE date_violation < DATE(20200201) AND date_payment IS NOT NULL;


--49
������� ������� author ��������� ���������:
���� 	���, ��������
author_id 	INT PRIMARY KEY AUTO_INCREMENT
name_author 	VARCHAR(50)

CREATE TABLE author
(author_id int PRIMARY KEY AUTO_INCREMENT,
 name_author varchar(50));

--50
���������� ������ �� �������� ������� book , ����� �� ��������� ���������������
 ���������, ���������� �� ���������� ����� 
(������� genre ��� �������, ������� ���������� �������� - 
��� �� ���������� ����� � ������� book, genre_id  - ������� ����). 
��� genre_id ����������� � �������������� ������ �������� �� ��������. 
� �������� ������� ������� ��� �������� ����  genre_id ������������ ������� genre 
��������� ���������:
���� 	���, ��������
genre_id 	INT PRIMARY KEY AUTO_INCREMENT
name_genre 	VARCHAR(30)

 (����� ������� ������ ������� book):

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
������� ������� book ��� �� ���������, ��� � �� ���������� ����. ����� �������, ��� ��� �������� ������ �� ������� author, ������ ��������� ��� ������ � ������ �� ������� book, ���������� ���� �������. � ��� �������� ����� �� ������� genre ��� ��������������� ������ book ���������� �������� Null � ������� genre_id

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
�������� ��� ��������� ������ (� ��������� ���������� 6, 7, 8) � ������� book, ������ 5 ������� ��� ���������:
book_id 	title 			author_id 	genre_id 	price 	amount
1 		������ � ��������� 		1 	1 		670.99 	3
2 		����� ������� 			1 	1 		540.50 	5
3 		����� 				2 	1 		460.00 	10
4 		������ ���������� 		2 	1 		799.01 	3
5 		����� 				2 	1 		480.50 	10
6 		������������� � ����� 		3 	2 		650.00 	15
7 		������ ������� 			3 	2 		570.20 	6
8 		������ 				4 	2 		518.99 	2

INSERT INTO book(title, author_id, genre_id, price, amount)
VALUES ('������������� � �����', 3, 2, 650.00, 15),
       ('������ �������', 3, 2, 570.20, 6),
       ('������', 4, 2, 518.99, 2)


--53
������� ��������, ���� � ���� ��� ����, ���������� ������� ������ 8, � ��������������� �� �������� ���� ����.

SELECT title, name_genre, price FROM book 
JOIN genre ON book.genre_id = genre.genre_id
WHERE book.amount > 8
ORDER BY price DESC;


--54
������� ��� �����, ������� �� ������������ � ������ �� ������.

SELECT name_genre
FROM genre LEFT JOIN book 
    ON genre.genre_id = book.genre_id
WHERE title IS NULL;


--55
���� ������ �������, ���������� � ������� city:
city_id 	name_city
1 	������
2 	�����-���������
3 	�����������

���������� � ������ ������ �������� �������� ���� ������� ������ � ������� 2020 ����. ���� ���������� �������� ������� ��������� �������. ������� ������, ������� ������� �����, ������ � ���� ���������� ��������. ��������� ������� ������� ����. ���������� �������, ������������ ������� � ���������� ������� �� ��������� �������, � ����� �� �������� ��� ���������� ��������.

SELECT  name_city,name_author, DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*365) DAY) AS ����
FROM city CROSS JOIN author
ORDER BY
    name_city ASC,
    ���� DESC;


--56
������� ���������� � ��� ������, �� ������� � ������, ���� ������� ����������� ��������� �� 500  �� 700 ������  ������������.

SELECT title, name_author, name_genre, price, amount
FROM
    author 
    INNER JOIN  book ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE price BETWEEN 500 AND 700;


--57
������� ���������� � ������ (����, �����, �����), ����������� � �����, ����������� ����� ������ � ��������������� �� ��������� ���� ����.

SELECT name_genre, title, name_author  
FROM  author JOIN  book ON author.author_id = book.author_id
    JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre = '�����'
ORDER BY title;



---58
��������� ���������� �����������  ���� ������� ������ �� ������� author.  ������� ��� �������,  ���������� ���� ������� ������ 10, � ��������������� �� ����������� ���������� ����. ��������� ������� ������� ����������.

SELECT name_author, sum(amount) AS ����������
FROM author LEFT JOIN book on author.author_id = book.author_id
GROUP BY name_author
HAVING ���� is NULL
ORDER BY ���������� ASC;   


--59
������� � ���������� ������� ���� �������, ������� ����� ������ � ����� �����. ��������� � ��� � �������� ��� �������� ������, ��� � ������� ������ ����� ������ � ����� �����,  ��� ����� ������� ������ ��������� � ������� book. ����� � ���  ����� ������� ������� ������� ��������� � ����� ������, � ����� ��������� ������ �������� � ������������� (��� ��������� � ������� ��� �������).

SELECT name_author
FROM author INNER JOIN book USING(author_id)
GROUP BY name_author
HAVING COUNT(distinct(genre_id)) = 1
ORDER BY name_author;


--60
������� ���������� � ������ (�������� �����, ������� � �������� ������, �������� �����, ���� � ���������� ����������� �����), ���������� � ����� ���������� ������, � ��������������� � ���������� ������� �� �������� ���� ����. ����� ���������� ������� ����, ����� ���������� ����������� ���� �������� �� ������ �����������.

SELECT title, name_author, name_genre, price, amount FROM  
author INNER JOIN book ON author.author_id = book.author_id  
INNER JOIN ( SELECT genre_id FROM book 
  GROUP BY genre_id 
  HAVING SUM(amount) >= ALL (SELECT SUM(amount)FROM book  
  GROUP BY genre_id))
  query_in ON book.genre_id = query_in.genre_id  INNER JOIN genre ON query_in.genre_id = genre.genre_id 
ORDER BY 1;

--61
���� � �������� supply  � book ���� ���������� �����, ������� ����� ������ ����,  ������� �� �������� � ������, � ����� ��������� ����� ���������� ����������� ���� � �������� supply � book,  ������� ������� ��������, �����  � ����������

SELECT book.title AS ��������, name_author AS �����, sum(book.amount + supply.amount) AS ����������
FROM author INNER JOIN book USING (author_id)   
            INNER JOIN supply ON book.title = supply.title AND author.name_author = supply.author
WHERE book.price = supply.price
GROUP BY book.title, name_author;

--62
��� ����, ������� ��� ���� �� ������ (� ������� book), �� �� ������ ����, ���� �������� (supply),  ���������� � ������� book���������� ���������� �� ��������, ��������� � ��������,  � ����������� ����. � ��������  supply�������������������� ���� ����. ������� ��� ��������� ����:

price=(p1?k1+p2?k2)k1+k2
price=k1?+k2?(p1??k1?+p2??k2?)?���  p1, p2 - ���� ����� � �������� book��supply;

       k1, k2 - ���������� ���� � �������� book��supply.

UPDATE book as b JOIN author as a USING(author_id) JOIN supply as s ON b.title=s.title AND a.name_author=s.author
SET b.amount=b.amount + s.amount,
    b.price=(b.price*b.amount + s.price*s.amount)/(b.amount+s.amount),
    s.amount=0
WHERE b.price <> s.price;


--63
�������� ����� ������� � ������� author � ������� ������� �� ����������, � ����� ������� ��� ������ �� ������� author.  ������ ��������� ������, ������� ���� � ������� supply, �� ��� � ������� author.

INSERT INTO author (name_author)
SELECT supply.author FROM author RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;

--64
�������� ����� ����� �� ������� supply � ������� book �� ������ ��������������� ���� �������. ����� ������� ��� ��������� ������� book.

INSERT INTO book (title, author_id, price, amount)
SELECT title, author_id, price, amount
FROM author INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;

--65
�������� ��� ����� �������������� � ������ ���������� ���� ��������, � ��� ����� ���������������� ���������� - �������������. (������������ ����������).

UPDATE book, genre
SET book.genre_id = CASE
    WHEN book_id = 10 THEN (SELECT genre_id FROM genre WHERE name_genre = '������')
    WHEN book_id = 11 THEN (SELECT genre_id FROM genre WHERE name_genre = '�����������')
    ELSE book.genre_id
    END;

--66
������� ���� ������� � ��� �� �����, ����� ���������� ���� ������� ������ 20.
DELETE FROM author
WHERE author_id IN
    (SELECT author_id FROM book
    GROUP BY author_id
    HAVING SUM(amount) < 20);


--67
������� ��� �����, � ������� ��������� ������ 4-� ����. � ������� book ��� ���� ������ ���������� �������� Null.

DELETE FROM genre WHERE genre_id in 
(select genre_id   from book 
 group by genre_id 
 having count(amount) < 4);


--68
������� ���� �������, ������� ������ ����� "������". �� ������� book ������� ��� ����� ���� �������. � ������� ��� ������ ������� ������������ ������ �������� �����, � �� ��� id.

DELETE FROM author
USING book INNER JOIN author ON author.author_id = book.author_id
INNER JOIN genre ON book.genre_id = genre.genre_id
WHERE genre.name_genre = '������'


--69
������� ��� ������ �������� ����� (id ������, ����� �����, �� ����� ���� � � ����� ���������� �� �������) � ��������������� �� ������ ������ � ��������� ���� ����.

SELECT buy_book.buy_id, title, price, buy_book.amount
FROM client INNER JOIN buy ON client.client_id = buy.client_id
 INNER JOIN buy_book ON buy_book.buy_id = buy.buy_id
 INNER JOIN book ON buy_book.book_id=book.book_id
WHERE name_client LIKE '������� �����'
ORDER BY buy_book.buy_id, title;


--70
���������, ������� ��� ���� �������� ������ �����, ��� ����� ������� �� ������ (����� ���������, � ����� ���������� ������� ���������� ������ �����).  ������� ������� � �������� ������, �������� �����,���������� ������� ������������������.���������� ������������� ������ࠠ�� �������� �������, � ����� �� ��������� ����.

SELECT author.name_author, book.title, COUNT(buy_book.book_id) AS ����������
FROM book INNER JOIN author ON author.author_id = book.author_id
LEFT JOIN buy_book ON buy_book.book_id = book.book_id
LEFT JOIN buy ON buy.buy_id = buy_book.buy_id
GROUP BY author.name_author, book.title
ORDER BY author.name_author, book.title



--71
������� ������, � ������� ����� �������, ����������� ������ � ��������-��������. ������� ���������� ������� � ������ �����, ����������� ������� ����������. ���������� ������� �� �������� ���������� �������, � ����� � ���������� ������� �� �������� �������.

SELECT city.name_city, COUNT(client_id) AS ����������
FROM buy INNER JOIN client USING (client_id)
INNER JOIN city USING (city_id)
GROUP BY buy.client_id
ORDER BY ���������� DESC, name_city;


--72
������� ������ ���� ���������� ������� � ����, ����� ��� ���� ��������.

SELECT buy_id, date_step_end 
FROM step INNER JOIN buy_step ON step.step_id = buy_step.step_id
WHERE buy_step.step_id = 1 and date_step_end IS NOT NULL;


--73
������� ���������� � ������ ������: ��� �����, ��� ��� ����������� (������� ������������)
 � ��� ��������� (����� ������������ ���������� ���������� ���� � �� ����), � ��������������� �� ������ ������ ����.
���������� ������� ������� ���������.

SELECT buy_id, name_client, SUM(price * buy_book.amount) as ���������
FROM buy INNER JOIN client using(client_id) INNER JOIN buy_book using(buy_id) INNER JOIN book using(book_id)
GROUP BY buy_book.buy_id
ORDER BY 1;


--74
������� ������ ������� (buy_id)�� ���������������,  �� ������� ��� � ������ ������ ���������. 
���� ����� ��������� �  ���������� � ��� �� ��������. ���������� ������������� �� ����������� buy_id.

SELECT buy_id, name_step
FROM buy_step JOIN step USING(step_id)
WHERE date_step_beg IS NOT NULL and date_step_end IS NULL
ORDER BY buy_id


--75
� ������� city ��� ������� ������ ������� ���������� ����, �� ������� ����� ����� ���� ��������� � ���� �����
 (��������������� ������ ���� ���������������). ��� ��� �������, ������� ������ ���� ���������������, �������
 ���������� ���� �� ������� ����� ������� ��������� � �����. � �����, ���� ����� ��������� � ����������, 
������� ���������� ���� ��������, � ��������� ������ ������� 0. 
� ��������� �������� ����� ������ (buy_id), � ����� ����������� ������� ����������_���� � ���������. 
���������� ������� � ��������������� �� ������ ������ ����.

SELECT buy_id, DATEDIFF(date_step_end, date_step_beg) AS ����������_����, 
IF(DATEDIFF(date_step_end, date_step_beg)<=days_delivery, 0, DATEDIFF(date_step_end, date_step_beg) - days_delivery) AS ���������
FROM buy_step JOIN buy USING(buy_id) JOIN client USING(client_id) JOIN city USING(city_id)              
WHERE step_id=3 AND DATEDIFF(date_step_end, date_step_beg) IS NOT NULL
ORDER BY buy_id


--76
������� ���� ��������, ������� ���������� ����� ������������, ���������� ������� � ��������������� �� �������� ����. 
� ������� ����������� ������� ������, � �� ��� id.

SELECT DISTINCT name_client
FROM client INNER JOIN buy USING (client_id)
INNER JOIN buy_book USING (buy_id)
INNER JOIN book USING (book_id)
INNER JOIN author USING (author_id)
WHERE name_author LIKE "�����������%"
ORDER BY name_client


--77
������� ���� (��� �����), � ������� ���� �������� ������ ����� ����������� ����, ������� ��� ����������. 
��������� ������� ������� ����������.

SELECT name_genre, SUM(buy_book.amount) AS ����������
FROM buy_book
JOIN book USING(book_id)
JOIN genre USING(genre_id)
GROUP BY name_genre 
HAVING ����������  = (SELECT SUM(buy_book.amount) FROM buy_book JOIN book USING(book_id) JOIN genre USING(genre_id)
                    GROUP BY name_genre
                    ORDER BY SUM(buy_book.amount) DESC
                    LIMIT 1)


--78
�������� ����������� ������� �� ������� ���� �� ������� � ���������� ����. 
��� ����� ������� ���, �����, ����� ������� � ��������������� ������� �� ����������� �������, 
����� �� ����������� ��� ����. �������� ��������: ���, �����, �����.

SELECT YEAR(date_payment) AS ���, MONTHNAME(date_payment) AS �����, SUM(amount*price) AS �����
FROM buy_archive
GROUP BY ���, �����
UNION ALL
SELECT YEAR(date_step_end) AS ���, MONTHNAME(date_step_end) AS �����, SUM(bb.amount*price) AS �����
FROM buy_book bb  JOIN buy_step bs ON bb.buy_id = bs.buy_id  AND bs.date_step_end  AND bs.step_id = 1
JOIN book USING(book_id)
GROUP BY ���, �����
ORDER BY �����, ���;


--79
�������� ������ �������� � ������� � ���������. ��� ��������� ����, ��� email�popov@test, ��������� �� �������.

INSERT INTO client(name_client,city_id,email)
SELECT '����� ����', city_id, 'popov@test'
FROM city
WHERE name_city = '������';


--80
������� ����� ����� ��� ������ ����. ��� ����������� ��� ������: ���������� �� ���� �� ������� ��������.

INSERT buy (buy_description, client_id)
SELECT '��������� �� ���� �� ������� ��������', client_id
FROM client
WHERE name_client IN ('����� ����');


--81
� ������� buy_book��������� ����� � ������� 5. ���� ����� ������ ��������� ����� ���������� ������� � ���������� ���� ����������� � ����� ��������� ������ �������� � ����� ����������.

INSERT INTO buy_book (buy_id, book_id, amount)
VALUES
    (5, (SELECT book_id FROM 
         book JOIN author USING(author_id) 
         WHERE title='������' AND name_author LIKE '���������%'), 2),
    (5, (SELECT book_id 
         FROM book JOIN author USING(author_id) 
         WHERE title='����� �������' AND name_author LIKE '��������%'), 1);


--82
���������� ��� ���� �� ������, ������� ���� �������� � ����� � ������� 5, ��������� �� �� ����������, ������� � ������ � ������� 5  �������.
UPDATE book, buy_book
SET    book.amount = book.amount - buy_book.amount
WHERE  buy_book.buy_id = 5 AND book.book_id = buy_book.book_id


--83
C������ ���� (������� buy_pay) �� ������ ������ � ������� 5, � ������� �������� �������� ����, �� ������, ����, ���������� ���������� ���� �  ���������. ��������� ������� ������� ���������. ���������� � ������� ������� � ��������������� �� ��������� ���� ����.

CREATE TABLE buy_pay AS
SELECT 
    title, name_author, book.price,buy_book.amount, book.price * buy_book.amount AS '���������'
FROM
    buy_book  INNER JOIN book USING (book_id) INNER JOIN author USING (author_id)
WHERE
    buy_id = 5
ORDER BY title


--84
������� ����� ���� (������� buy_pay) �� ������ ������ � ������� 5. ���� �������� ����� ������, ���������� ���� � ������ (�������� ������� ����������) � ��� ����� ��������� (�������� ������� �����). ��� ������� ����������� ���� ������.

CREATE TABLE buy_pay
SELECT buy_id, sum(buy_book.amount) as ����������, sum(book.price*buy_book.amount) as �����
FROM buy_book JOIN book USING(book_id) JOIN author USING(author_id)
WHERE buy_id=5
GROUP BY 1;


--85
� ������� buy_step ��� ������ � ������� 5 �������� ��� ����� �� ������� step, ������� ������ ������ ���� �����. � ������� date_step_beg � date_step_end ���� ������� ������� Null

INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end)
SELECT buy_id, step_id, Null, Null
FROM buy
CROSS JOIN step
WHERE buy_id = 5;


--86
� ������� buy_step ������� ���� 12.04.2020 ����������� ����� �� ������ ������ � ������� 5.
���������� ���� �� ������� �� ����������, � ������� ����. ��� ����� ������� � ������� ������� Now(). �� ��� ���� � ������ ��� ����� ����������� ������ ����, � ������� ������ ����� ���������, �������  ������� ���� 12.04.2020.

UPDATE buy_step SET date_step_beg = '2020-04-12'
WHERE buy_id = 5 AND step_id = 1;


--87
��������� ���� ������� ��� ������ � ������� 5, ������� � ������� date_step_end ���� 13.04.2020, � ������ ��������� ���� (���������), ����� � ������� date_step_beg ��� ����� ����� �� �� ����.
����������� ��� ������� ��� ���������� ����� � ������ ����������. ��� ������ ���� �������� � ����� ����, ����� ��� ����� ���� ��������� ��� ����� ������, ������� ������ ������� ����. ��� ������� ����� ��� ����� ���� �������.

UPDATE buy_step
SET date_step_end = IF(buy_id = 5 AND step_id = 1, '2020-04-13', date_step_end),
    date_step_beg = IF(buy_id = 5 AND step_id = 2, '2020-04-13', date_step_beg);


--88
������� ���������, ������� ������� ���������� ������� ��� �������, ������� ���� ������� � ���������. ���������� ������� �� �������� ����������� ������������.

SELECT name_student, date_attempt, result
FROM student
    INNER JOIN attempt USING(student_id)
    INNER JOIN subject USING(subject_id)
WHERE name_subject = '������ ��� ������'
ORDER BY result DESC


--89
�������, ������� ������� ������� �������� �� ������ ����������, � ����� ������� ��������� �������, ������� ��������� �� 2 ������ ����� �������. ��� ����������� ������� ���������� ������� ���������� ������� �� ������� �����, ������� ������� � ������� result.  � ��������� �������� �������� ����������, � ����� ����������� ������� ���������� � �������. ���������� ������� �� �������� ������� �����������.

SELECT name_subject, 
       COUNT(attempt_id) AS ����������,
       ROUND(AVG(result), 2) AS �������
FROM subject
       LEFT JOIN attempt USING(subject_id)
GROUP BY name_subject
ORDER BY ������� DESC



--90

������� ��������� (��������� ���������), ������� ������������ ���������� �������. ���������� ������������� � ���������� ������� �� ������� ��������.
������������ ��������� �� ����������� ����� 100%, ������� ���� ��� �������� � ������� �� ��������.

SELECT name_student, result
FROM student
    INNER JOIN attempt USING(student_id)
WHERE result = (
         SELECT MAX(result) 
         FROM attempt
      )
ORDER BY name_student;


--91
���� ������� �������� ��������� ������� �� ����� � ��� �� ����������, �� ������� ������� � ���� ����� ������ � ��������� ��������. � ��������� �������� ������� � ��� ��������, �������� ���������� � ����������� ������� ��������. ���������� ������� �� ����������� �������. ���������, ��������� ���� ������� �� ����������, �� ���������. 

SELECT name_student,
       name_subject, 
       DATEDIFF(MAX(date_attempt), MIN(date_attempt)) AS ��������
  FROM subject 
       JOIN attempt USING (subject_id)
       JOIN student USING (student_id)
 GROUP BY name_student, name_subject
 HAVING COUNT(attempt_id) > 1 
 ORDER BY 3;  


--92
�������� ����� ������������� �� ����� ��� ���������� ����������� (�� ����������� �� ����). ������� ���������� � ���������� ���������� ��������� (������� ������� ����������), ������� �� ��� ��������� ������������ . ���������� ������������� ������� �� �������� ����������, � ����� �� �������� ����������. � ��������� �������� � ����������, ������������ �� ������� �������� ��� �� ���������, � ���� ������ ������� ���������� ��������� 0.

SELECT name_subject, COUNT(DISTINCT student_id) AS '����������'
FROM subject LEFT JOIN attempt USING(subject_id)
GROUP BY name_subject
ORDER BY COUNT(DISTINCT student_id) DESC, name_subject;

--93
��������� ������� �������� 3 ������� �� ���������� ������� ��� �������. � ��������� �������� ������� question_id � name_question.

SELECT question_id, name_question
FROM subject INNER JOIN question USING(subject_id)
WHERE subject.subject_id = 2
ORDER BY RAND()
LIMIT 3



--94
������� �������, ������� ���� �������� � ���� ��� �������� ����� �� ���������� ������� SQL� 2020-05-17  (�������� attempt_id ��� ���� ������� ����� 7). �������, ����� ����� ��� ������� � ���������� �� ��� ��� (������� ����� ��� �������). � ��������� �������� ������, ����� � ����������� �������  ���������

SELECT name_question, name_answer, IF(is_correct, '�����', '�������') AS ���������
FROM question
     INNER JOIN testing USING(question_id)
     INNER JOIN answer USING(answer_id)
WHERE attempt_id = 7


--95
��������� ���������� ������������. ��������� ������� ��������� ��� ���������� ���������� �������, �������� �� 3 (���������� �������� � ������ �������) � ���������� �� 100. ��������� ��������� �� ���� ������ ����� �������. ������� ������� ��������, �������� ��������, ���� � ���������. ��������� ������� ������� ���������. ���������� ������������� ������� �� ������� ��������, ����� �� �������� ���� �������.

SELECT name_student, name_subject, date_attempt, ROUND(SUM(is_correct)*100/3,2) ���������
FROM answer
    JOIN testing USING(answer_id)
    JOIN attempt USING(attempt_id)
    JOIN subject USING(subject_id)
    JOIN student USING(student_id)
GROUP BY name_student, name_subject, date_attempt
ORDER BY name_student,  date_attempt DESC


--96
��� ������� ������� ������� ������� �������� �������, �� ���� ��������� ���������� ������ ������� � ������ ���������� �������, �������� ��������� �� 2-� ������ ����� �������. ����� ������� �������� ��������, � �������� ��������� ������, � ����� ���������� ������� �� ���� ������. � ��������� �������� �������� ����������, ������� �� ��� (������� ������� ������), � ����� ��� ����������� ������� �����_������� � ����������. ���������� ������������� ������� �� �������� ����������, ����� �� �������� ����������, � ����� �� ������ ������� � ���������� �������.
��������� ������ �������� ����� ���� ��������, �������� �� 30 �������� � �������� ���������� "...".

SELECT name_subject, 
       CONCAT(LEFT(name_question, 30), '...') AS ������, 
       COUNT(t.answer_id) AS �����_�������, 
       ROUND(SUM(is_correct) / COUNT(t.answer_id) * 100, 2) AS ����������
  FROM subject
       JOIN question USING(subject_id)
       JOIN testing t USING(question_id)
       LEFT JOIN answer a USING(answer_id)
 GROUP BY 1, 2
 ORDER BY 1, 4 DESC, 2;



--97
� ������� attempt �������� ����� ������� ��� �������� �������� ����� �� ���������� ������� ��� �������. ���������� ������� ���� � �������� ���� ���������� �������.

INSERT INTO attempt(student_id, subject_id, date_attempt)
SELECT 
    (SELECT student_id FROM student WHERE name_student = '������� �����'), 
    (SELECT subject_id FROM subject WHERE name_subject = '������ ��� ������'), 
    NOW();


--98
��������� ������� ������� ��� ������� (������) �� ����������, ������������ �� ������� ���������� ��������� �������, ���������� � ������� attempt ���������, � �������� �� � ������� testing. id ��������� ������� �������� ��� ������������ �������� id �� ������� attempt.

INSERT INTO testing (attempt_id, question_id)
SELECT attempt_id, question_id
FROM question
JOIN attempt USING(subject_id)
WHERE attempt_id = (SELECT MAX(attempt_id) FROM attempt)
ORDER BY RAND()
limit 3;

--99
������� ������ ������������ (�� ���� ��� ��� ������ �������� � ������� testing), ����� ���������� ��������� ���������(������) � ������� ��� � ������� attempt ��� ��������������� �������.  ��������� ������� ��������� ��� ���������� ���������� �������, �������� �� 3 (���������� �������� � ������ �������) � ���������� �� 100. ��������� ��������� �� ������.
����� �������, ��� �� ����� id �������,  ��� ������� ����������� ���������, � ����� ������ ��� 8.


UPDATE attempt
    SET result = (SELECT ROUND((SUM(is_correct)/3)*100, 2)
        FROM answer INNER JOIN testing ON answer.answer_id = testing.answer_id
        WHERE testing.attempt_id = 8)
    WHERE attempt.attempt_id = 8;



--100
������� �� ������� attempt ��� �������, ����������� ������ 1 ��� 2020 ����. ����� ������� � ��� ��������������� ���� �������� ������� �� ������� testing, ������� ����������� ��������� ��������:

CREATE TABLE testing (
    testing_id INT PRIMARY KEY AUTO_INCREMENT, 
    attempt_id INT, 
    question_id INT, 
    answer_id INT,
    FOREIGN KEY (attempt_id)  REFERENCES attempt (attempt_id) ON DELETE CASCADE
);



DELETE FROM attempt
WHERE date_attempt < '2020-05-01';



--101
������� ������������, ������� ����� ��������� �� ��������������� ��������� ������������ � ������������� � ��������������� �� �������� ����.


SELECT name_enrollee
FROM enrollee INNER JOIN program_enrollee USING(enrollee_id)
INNER JOIN program USING(program_id)
WHERE name_program = '����������� � �������������'
ORDER BY name_enrollee 



--102
������� ��������������� ���������, �� ������� ��� ����������� ��������� ������� ������������. ��������� ������������� � �������� ���������� �������.

�������� ���������� ����� ���� ������:

SELECT name_program FROM program
INNER JOIN program_subject USING(program_id)
INNER JOIN subject USING(subject_id)
WHERE name_subject = '�����������'
ORDER BY name_program DESC;



--103
�������� ���������� ������������, ������� ��� �� ������� ��������, ������������, ����������� � ������� �������� ������ �� �������� ���. ����������� ������� ������� ����������, ��������, �������, �������. ���������� ������������� �� �������� �������� � ���������� �������, ������� �������� ��������� �� ������ ����� ����� �������.

SELECT name_subject, 
       COUNT(enrollee_id) AS ����������,
       MAX(result) AS ��������,
       MIN(result) AS �������,
       ROUND(AVG(result), 1) AS �������
FROM subject
       INNER JOIN enrollee_subject USING(subject_id)
GROUP BY name_subject
ORDER BY name_subject;


--104
������� ��������������� ���������, ��� ������� ����������� ���� ��� �� ������� �������� ������ ��� ����� 40 ������. ��������� ������� � ��������������� �� �������� ����.

SELECT name_program
FROM (
    SELECT name_program, MIN(min_result) r
    FROM program
        NATURAL JOIN program_subject
    GROUP BY 1
    HAVING r >= 40) table1
ORDER BY name_program




--105
������� ��������������� ���������, ������� ����� ����� ������� ���� ������,  ������ � ���� ���������.

SELECT name_program, plan
FROM program
WHERE plan = (SELECT MAX(plan) FROM program) 


--106
���������, ������� �������������� ������ ������� ������ ����������. ������� � ��������������� ������� ������� �����. ���������� ������� � ��������������� �� �������� ����.

SELECT name_enrollee,
       IFNULL(SUM(achievement.bonus),0) AS �����
FROM enrollee
     LEFT JOIN enrollee_achievement USING(enrollee_id)
     LEFT JOIN achievement USING(achievement_id)
GROUP BY name_enrollee
ORDER BY name_enrollee;



--107
�������� ������� ������� ������ ��������� �� ������ ��������������� ��������� � ������� �� ��� (����� �������� ��������� �������� �� ���������� ���� �� �����), ����������� �� 2-� ������ ����� �������. � ������� ������� �������� ����������, � �������� ��������� ��������������� ���������, �������� ��������������� ���������, ���� ������ ������������ �� ��������������� ��������� (plan), ���������� �������� ��������� (����������) � �������. ���������� ������������� � ������� �������� ��������.

SELECT name_department, name_program, plan,
	COUNT(*) AS ����������,
	ROUND(COUNT(*)/plan ,2) AS �������
FROM program_enrollee
	JOIN program USING (program_id)
	JOIN department USING (department_id)
GROUP BY name_department, name_program, plan
ORDER BY plan, name_program DESC



--108
������� ��������������� ���������, �� ������� ��� ����������� ���������� ������� ������������ � ����������� � ��������������� �� �������� �������� ����.

SELECT name_program
FROM program
    JOIN program_subject ps USING(program_id)
    JOIN subject s ON ps.subject_id=s.subject_id AND name_subject IN ('�����������','����������')
GROUP BY name_program
HAVING COUNT(name_subject)=2
ORDER BY name_program




--109
��������� ���������� ������ ������� ����������� �� ������ ��������������� ���������, �� ������� �� ����� ���������, �� ����������� ���. � ��������� �������� �������� ��������������� ���������, ������� � ��� �����������, � ����� ������� � ������ ������, ������� ������� itog. ���������� ������� � ��������������� ������� �� ��������������� ���������, � ����� �� �������� ����� ������ ����.

SELECT p.name_program, e.name_enrollee, SUM(es.result) AS itog
FROM program_subject ps
    INNER JOIN program p USING(program_id)
    INNER JOIN program_enrollee pe USING(program_id)
    INNER JOIN enrollee e USING(enrollee_id)
    INNER JOIN enrollee_subject es ON es.subject_id = ps.subject_id AND es.enrollee_id = pe.enrollee_id
GROUP BY p.name_program, e.name_enrollee
ORDER BY p.name_program,  SUM(es.result) DESC;



--110
������� �������� ��������������� ��������� � ������� ��� ������������, ������� �������� ��������� �� ��� ��������������� ���������, �� �� ����� ���� ��������� �� ���. ��� ����������� ����� ��������� �� ������ ��� ���������� ��������� ���, ����������� ��� ����������� �� ��� ��������������� ���������, ������ ������������ �����. ���������� ������� � ��������������� ������� �� ����������, � ����� �� �������� ������������ ����.
��������, ������� ����� �� ������� ������ 41 ����, �  ��� ��������������� ��������� ����������� �������� ����������� ���� �� ����� �������� ��������� � 45 ������. �������������, ���������� �� ������ ��������� �� ����� ���������.

SELECT name_program, name_enrollee
FROM enrollee
     JOIN program_enrollee USING(enrollee_id)
     JOIN program USING(program_id)
     JOIN program_subject USING(program_id)
     JOIN subject USING(subject_id)
     JOIN enrollee_subject USING(subject_id)
WHERE enrollee_subject.enrollee_id = enrollee.enrollee_id and result < min_result
ORDER BY name_program, name_enrollee



--111

