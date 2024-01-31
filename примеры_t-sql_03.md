## Использование функций преобразования и условных выражений.

#### Задача 1. Получить список всех сотрудников которые пришли на работу в первый день месяца (любого)
<pre>
Use HRdb;
Go
SELECT [first_name],[last_name],[hire_date]
  FROM employees
WHERE DAY(hire_date) = '01';
 Go 
</pre> 

#### Задача 2. Получить список всех сотрудников которые пришли на работу в 2013 -ом году
<pre> 
SELECT *
  FROM employees
 WHERE Year(hire_date) = '2013';
 Go 
</pre>  

#### Задача 3. Показать завтрашнюю дату в формате: 2013-04-30 13:10:02.0474381 -07:00
<pre> 
SELECT SYSDATETIMEOFFSET(); 
 Go 
</pre>  

#### Задача 4. Получить список всех сотрудников и дату прихода на работу каждого в формате: День, Месяц, Год
<pre> 
SELECT first_name, DAY(hire_date) As N'День', Month(hire_date) As N'Месяц', Year(hire_date) As N'Год'
  FROM employees;
 Go 
</pre>  

#### Задача 5. Получить список работников с увеличенными зарплатами на 20%. Зарплату показать со знаком доллара
<pre> 
SELECT first_name, Cast(salary + (salary * 0.2) As VARCHAR(10)) + '$' As new_salary
  FROM employees; 
Go  
</pre>  

#### Задача 6. Получить список всех сотрудников которые приши на работу в феврале 2017 го года.
<pre> 
SELECT *
  FROM employees
 WHERE hire_date BETWEEN '2017/02/01' AND '2017/03/01'; 
Go
</pre> 

#### Задача 7. Получить текущую дату, год, месяц, день, час, минута, секунда.
```
DECLARE @sdt SMALLDATETIME = GETDATE();
SELECT @sdt AS [SMALLDATETIME];
Go
```
#### Задача 8. Получить список всех сотрудников с зарплатами в формате: $24,000.00
```
SELECT first_name, '$' + Cast(salary + (salary * 0.20) As VARCHAR(10)) As new_salary
  FROM employees;
 Go  
```
#### Задача 9. Получить текущую системную дату.
```
SELECT CONVERT (date, SYSDATETIME())
    ,CONVERT (date, CURRENT_TIMESTAMP)
    ,CONVERT (date, GETDATE());
 Go 
```
#### Задача 10. Получить уровень зарплаты каждого сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 и меньше 10000 считается Normal level, Больше иои равно 10000 считается High level
 
SELECT first_name,
       salary,
       CASE
           WHEN salary < 5000 THEN 'Low'
           WHEN salary >= 5000 AND salary < 10000 THEN 'Normal'
           WHEN salary >= 10000 THEN 'High'
           ELSE 'Unknown'
       END
           salary_level
  FROM employees; 
 Go 
#### Задача 7. Получить текущее системное время.
```
	SELECT CONVERT (time, SYSDATETIME())
    ,CONVERT (time, CURRENT_TIMESTAMP)
    ,CONVERT (time, GETDATE());
 Go 
```
#### Задача 11. Получить репорт по department_id с минимальной и максимальной зарплатой, с ранней и поздней датой прихода на работу и с количествов сотрудников. Сорировать по количеству сотрудников (по убыванию)
``` 
  SELECT department_id,
         MIN (salary) min_salary,
         MAX (salary) max_salary,
         MIN (hire_date) min_hire_date,
         MAX (hire_date) max_hire_Date,
         COUNT (*) count
    FROM employees
GROUP BY department_id
order by count(*) desc;   
```













