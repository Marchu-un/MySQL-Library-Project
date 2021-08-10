### Выведем самого популярного автора и количество его книг, взятых из библиотеки
SELECT 
	`authors`.name AS 'Most Popular Author',
    COUNT(`readers_list`.author_id) AS 'Books Taken'
FROM `authors`
JOIN `readers_list` ON `authors`.id = `readers_list`.author_id
GROUP BY `readers_list`.author_id 
ORDER BY COUNT(`readers_list`.author_id) DESC
#LIMIT 1
;

### Выведем самого популярного автора за последний год и количество его книг, взятых из библиотеки 
SELECT 
	`authors`.name AS 'Most Popular Author',
    COUNT(`readers_list`.author_id) AS 'Books Taken'
FROM `authors`
JOIN `readers_list` ON `authors`.id = `readers_list`.author_id
WHERE `readers_list`.taken_on > DATE_ADD(NOW(), INTERVAL -1 YEAR)
GROUP BY `readers_list`.author_id 
ORDER BY COUNT(`readers_list`.author_id) DESC
LIMIT 1
;


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
