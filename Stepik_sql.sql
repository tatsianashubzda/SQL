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

UPDATE fine as f, payment as p
SET f.date_payment = p.date_payment,
    f.sum_fine = IF(DATEDIFF(f.date_payment, f.date_violation) <= 20, f.sum_fine/2, f.sum_fine)
WHERE f.name = p.name AND f.number_plate = p.number_plate AND f.violation = p.violation AND
      f.date_violation = p.date_violation AND f.date_payment IS NULL;

