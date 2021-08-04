CREATE SCHEMA thisYear_db; 
USE thisYear_db;
CREATE TABLE monthes  
(
	monthName VARCHAR(45),
    days INT
);									/*создаем бд и таблицу для заполнения*/

DELIMITER //

CREATE FUNCTION getMonthes (currentYear INT) /*функция принимает в качестве значения текущий год*/
RETURNS VARCHAR(45)
DETERMINISTIC 								/*функция фсегда возвращает одинаковый результат для одинаковых параметров*/

BEGIN

   DECLARE monthNumb INT;

   SET monthNumb = 0;

WHILE monthNumb < 12 DO					
    SET monthNumb = monthNumb + 1;										/*перебираем все месяцы в году начиная с первого*/
    INSERT INTO thisYear_db.monthes (monthName,days) VALUES (
			MONTHNAME(CONCAT(currentYear, '-', monthNumb, '-', '01')),			/*получаем имя месяца по номеру*/
			DAYOFMONTH(LAST_DAY(CONCAT(currentYear, '-', monthNumb, '-', '01')))		/*получаем день из даты которая соответствует концу месяца*/
        );
  END WHILE;											

   RETURN 'DONE';

END; //

DELIMITER ;

SELECT getMonthes (YEAR(NOW()));
SELECT * FROM thisYear_db.monthes;
	