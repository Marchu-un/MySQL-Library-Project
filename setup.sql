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