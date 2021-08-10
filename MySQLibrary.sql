### Создаём и используем DB `library`
CREATE DATABASE `library`;
USE `library`;

### Создаём таблицы с данными
# Таблица 1 - С именами авторов
CREATE TABLE `authors` (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
    );
    
# Таблица 2 - С именами Студентов
CREATE TABLE `students` (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
    );

# Таблица 3 - Список книг
CREATE TABLE `books` (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	author_id INT,
    publisher VARCHAR(255),
    year DATE,
    in_stock INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES `authors`(id) # Столбец author_id привязан к колонке id из Таблицы 1 с именами авторов
    );
    
    # Таблица 4 - Список читателей 
    CREATE TABLE `readers_list` (
	id INT NOT NULL AUTO_INCREMENT,
    reader_id INT NOT NULL,
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    taken_on DATE NOT NULL,
    returned_on DATE,
	PRIMARY KEY (id),
    FOREIGN KEY (reader_id) REFERENCES `students`(id),   # Столбец reader_id привязан к колонке id из Таблицы 2 с именами Студентов
    FOREIGN KEY (book_id) REFERENCES `books`(id), 		 # Столбец book_id привязан к колонке id из Таблицы 3 - Список книг
    FOREIGN KEY (author_id) REFERENCES `authors`(id) 	 # Столбец author_id привязан к колонке id из Таблицы 1 с именами авторов
    );


### Внесём данные во все таблицы
INSERT INTO `authors`(id, name) VALUES (1, 'Артур Конан Дойл');
INSERT INTO `authors` (id, name) VALUES (2, 'Уильям Теккерей');
INSERT INTO `authors` (id, name) VALUES (3, 'Иван Гончаров');
INSERT INTO `authors` (id, name) VALUES (4, 'Константин Станюкович');
    
INSERT INTO `books`(id, name, author_id, publisher, year, in_stock) VALUES (1, 'Шерлок Холмс', 1, 'Лабиринт', '2020-01-01', 3);
INSERT INTO `books`(id, name, author_id, publisher, year, in_stock) VALUES (2, 'Ярмарка тщеславия', 2, 'Речь', '2018-01-01', 2);
INSERT INTO `books`(id, name, author_id, publisher, year, in_stock) VALUES (3, 'Обыкновенная история', 3, 'Речь', '2017-01-01',4);
INSERT INTO `books`(id, name, author_id, publisher, year, in_stock) VALUES (4, 'Обломов', 3, 'Детская литература', '2020-01-01', 2);
INSERT INTO `books`(id, name, author_id, publisher, year, in_stock) VALUES (5, 'Пассажирка', 4, 'Аркадия', '2021-01-01', 5);

INSERT INTO students (id, name) VALUES (1, 'Кропцова Дарья');
INSERT INTO students (id, name) VALUES (2, 'Бевза Жанна');
INSERT INTO students (id, name) VALUES (3, 'Красавченко Артём');
INSERT INTO students (id, name) VALUES (4, 'Митричева Анастасия');
INSERT INTO students (id, name) VALUES (5, 'Карапон Игорь');

INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on) VALUES (1, 1, 1, 1, '2020-01-03');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on) VALUES (2, 1, 2, 2, '2020-01-03');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (3, 1, 3, 3, '2020-03-15', '2020-03-27');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (4, 2, 4, 3, '2020-01-07', '2020-05-07');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (5, 2, 5, 4, '2020-01-07', '2020-07-07');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (6, 2, 1, 1, '2020-02-09', '2021-02-07');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (7, 3, 3, 3, '2020-03-15', '2020-03-27');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (8, 4, 5, 4, '2020-03-15', '2020-03-27');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (9, 5, 5, 4, '2020-03-15', '2020-03-27');
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (10, 5, 4, 3, '2020-03-15', '2020-03-22');

### Запросы для просмотра заполненных таблиц

SELECT * FROM `books`;
SELECT * FROM `authors`;
SELECT * FROM `students`;
SELECT * FROM `readers_list`;

### Выведем самого популярного автора и количество его книг, взятых из библиотеки
SELECT 
	`authors`.name AS 'Most Popular Author',
    COUNT(`readers_list`.author_id) AS 'Books Taken'
FROM `authors`
JOIN `readers_list` ON `authors`.id = `readers_list`.author_id
GROUP BY `readers_list`.author_id 
ORDER BY COUNT(`readers_list`.author_id) DESC
LIMIT 1;

### Выведем самого популярного автора за последний год и количество его книг, взятых из библиотеки 
#так как библиотека вышла закрылась, за последний год никто книги не брал
SELECT 
	`authors`.name AS 'Most Popular Author',
    COUNT(`readers_list`.author_id) AS 'Books Taken'
FROM `authors`
JOIN `readers_list` ON `authors`.id = `readers_list`.author_id
WHERE `readers_list`.taken_on > DATE_ADD(NOW(), INTERVAL -1 YEAR)
GROUP BY `readers_list`.author_id 
ORDER BY COUNT(`readers_list`.author_id) DESC
LIMIT 1;


### Выведем самого "Злостного" читателя - то есть читателя, просрочившего больше всего книг (по отношению к общему количеству взятых им книг)
SELECT
	`students`.name AS 'ZLOSTNIY Reader',
    CASE 
		WHEN `readers_list`.returned_on IS NOT NULL # В случае если дата возврата не указана, т.е. книга не возвращена
        # Посчитаем количество сданных позднее, чем 30 дней с момента взятия книг
			THEN COUNT(CASE WHEN DATE_ADD(`readers_list`.taken_on, INTERVAL 30 DAY) <= `readers_list`.returned_on AND `readers_list`.returned_on IS NOT NULL THEN 1 END)
		WHEN  `readers_list`.returned_on IS NULL # В случае если дата возврата отсутсвует
		# Посчитаем не сданные в течении более чем 30 дней с момента взятия книги
			THEN COUNT(CASE WHEN DATE_ADD(`readers_list`.taken_on, INTERVAL 30 DAY) <= NOW() AND `readers_list`.returned_on IS NULL THEN 1 END)
	END DIV COUNT(`readers_list`.taken_on) AS 'ZLOSTNOST\' Coefficient' # Поделим на общее количество взятых этим человеком книг
FROM `students`
JOIN `readers_list` ON `students`.id = `readers_list`.reader_id
GROUP BY `readers_list`.reader_id  
ORDER BY COUNT(CASE WHEN DATE_ADD(`readers_list`.taken_on, INTERVAL 30 DAY) <= `readers_list`.returned_on AND `readers_list`.returned_on IS NOT NULL THEN 1 END) DESC
LIMIT 1
;