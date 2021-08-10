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
INSERT INTO `readers_list`(id, reader_id, book_id, author_id, taken_on, returned_on) VALUES (10, 5, 4, 3, '2021-03-15', '2021-03-22');