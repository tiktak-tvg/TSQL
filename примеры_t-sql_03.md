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
``` 
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
```
#### Задача 7. Получить текущее системное время.
```
SELECT CONVERT (time, SYSDATETIME())
    ,CONVERT (time, CURRENT_TIMESTAMP)
    ,CONVERT (time, GETDATE());
 Go 
```
#### Задача 11. Получить репорт по department_id с минимальной и максимальной зарплатой, с ранней и поздней датой прихода на работу и с количествов сотрудников. Сорировать по количеству сотрудников (по убыванию).
``` 
SELECT department_id,
         MIN (salary) min_salary,
         MAX (salary) max_salary,
         MIN (hire_date) min_hire_date,
         MAX (hire_date) max_hire_Date,
         COUNT(*) count
    FROM employees
GROUP BY department_id
order by count(*) desc;   
```
#### Задача 12. Сколько сотрудников которые работают в одном и тоже отделе и получают одинаковую зарплату?
``` 
SELECT department_id, salary, COUNT (*) As N'кол. сотрудников'
    FROM employees
GROUP BY department_id, salary
  HAVING COUNT (*) > 1;  
```
#### Задача 13. Получить репорт сколько сотрудников приняли на работу в каждый день недели. Сортировать по количеству
``` 
SELECT Day(hire_Date) As N'дни', COUNT (*) As N'кол. сотрудников'
    FROM employees
GROUP BY Day(hire_Date)
ORDER BY 2 DESC;  
```
#### Задача 14. Получить репорт сколько сотрудников приняли на работу по годам. Сортировать по количеству
``` 
SELECT Year(hire_date) As N'год', COUNT (*) As N'кол. сотрудников'
    FROM employees
GROUP BY Year(hire_date); 
Go
```
#### Задача 15. Получить количество департаментов в котором есть сотрудники
``` 
SELECT department_id, (COUNT (*)) As N'кол. сотрудников'     
    FROM employees
   WHERE department_id IS NOT NULL
GROUP BY department_id; 
```
#### Задача 16. Получить список department_id в котором работают больше 30 сотрудников
``` 
SELECT department_id
    FROM employees
GROUP BY department_id
  HAVING COUNT (*) > 30;  
```
#### Задача 17. Получить список department_id и округленную среднюю зарплату работников в каждом департаменте.
``` 
SELECT department_id, AVG(salary) As avg_salary
    FROM employees
GROUP BY department_id; 
Go
```
#### Задача 18. Получить список region_id сумма всех букв всех country_name в котором больше 60ти
```
SELECT region_id
    FROM countries
GROUP BY region_id
  HAVING SUM(LEN(country_name)) > 60;  
```
#### Задача 19. Получить список department_id в котором работают работники нескольких (>1) job_id
``` 
SELECT department_id
    FROM employees
GROUP BY department_id
  HAVING COUNT(DISTINCT job_id) > 1;
```
#### Задача 20. Получить список manager_id у которых количество подчиненных больше 5 и сумма всех зарплат его подчиненных больше 50000
``` 
SELECT manager_id
    FROM employees
GROUP BY manager_id
  HAVING COUNT (*) > 5 AND SUM (salary) > 50000;  
```
#### Задача 21. Получить список manager_id у которых средняя зарплата всех его подчиненных находится в промежутке от 6000 до 9000 которые получают бонусы меньше 100(commission_pct > 100)
``` 
SELECT manager_id, AVG(salary) As avg_salary
    FROM employees
WHERE commission_pct > '100'
GROUP BY manager_id
HAVING AVG(salary) BETWEEN '2000' AND '9000';  
```
#### Задача 22. Получить максимальную зарплату из всех сотрудников job_id которыз заканчивается на слово 'CLERK'
``` 
SELECT MAX(salary) As max_salary
  FROM employees
 WHERE job_id LIKE '%CLERK';       
SELECT MAX(salary)
  FROM employees
 WHERE job_id = 'CLERK';  
```
#### Задача 23. Получить максимальную зарплату среди всех средних зарплат по департаменту
``` 
SELECT AVG(salary)
    FROM employees
ORDER BY MAX(department_id);
Go
```
#### Задача 24. Получить количество сотрудников с одинаковым количеством букв в имени. При этом показать только тех у кого длина имени больше 5 и количество сотрудников с таким именем больше 20. Сортировать по длинне имени
``` 
SELECT LEN(first_name) As N'длина имени', COUNT (*) As N'количество сотрудников'
    FROM employees
GROUP BY LEN(first_name)
  HAVING LEN(first_name) > 5 AND COUNT (*) > 20
ORDER BY LEN(first_name);     
  SELECT LEN(first_name), COUNT (*)
    FROM employees
   WHERE LEN(first_name) > 5
GROUP BY LEN(first_name)
  HAVING COUNT (*) > 20
ORDER BY LEN(first_name);  
Go
```
#### Задача 25. Departaments, Locations, Countries, Regions. Получить список регионов и количество сотрудников в каждом регионе
``` 
SELECT region_name, COUNT (*)
    FROM employees e
         JOIN departments d ON (e.department_id = d.department_id)
         JOIN locations l ON (d.location_id = l.location_id)
         JOIN countries c ON (l.country_id = c.country_id)
         JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name; 
```
#### Задача 26. Departaments, Locations, Countries, Regions. Получить детальную информацию о каждом сотруднике:
- First_name, Last_name, Departament, Job, Street, Country, Region
``` 
SELECT First_name,
       Last_name,
       Department_name,
       Job_id,
       street_address,
       Country_name,
       Region_name
  FROM employees  e
       JOIN departments d ON (e.department_id = d.department_id)
       JOIN locations l ON (d.location_id = l.location_id)
       JOIN countries c ON (l.country_id = c.country_id)
       JOIN regions r ON (c.region_id = r.region_id);  
```
#### Задача 27. Departaments. Показать все департаменты в которых работают больше 30ти сотрудников
``` 
SELECT department_name, COUNT (*)
    FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name
  HAVING COUNT (*) > 30;
```
#### Задача 28. Departaments. Показать все департаменты в которых нет ни одного сотрудника
``` 
SELECT department_name
  FROM employees  e
       RIGHT JOIN departments d ON (e.department_id = d.department_id)
 WHERE first_name IS NULL;  
```
#### Задача 29. Jobs, Departaments. Показать сотрудников в формате: First_name, Job_title, Department_name.
> Пример: First_name | Job_title | Department_name Donald | Shipping | Clerk Shipping

```
SELECT first_name, job_title, department_name
  FROM employees  e
       JOIN jobs j ON (e.job_id = j.job_id)
       JOIN departments d ON (d.department_id = e.department_id);  
```
#### Задача 30. Departaments. Показать сотрудников которые работают в департаменте IT
``` 
SELECT *
  FROM employees
 WHERE department_id = (SELECT department_id
                          FROM departments
                         WHERE department_name = 'IT'); 
```

#### Задача 31. Jobs, Departaments. Показать сотрудников в формате: First_name, Job_title, Department_name. First_name | Job_title | Department_name|Donald | Shipping | Clerk Shipping
```
SELECT first_name,
       (SELECT job_title
          FROM jobs
         WHERE job_id = e.job_id)
           job_title,
       (SELECT department_name
          FROM departments
         WHERE department_id = e.department_id)
           department_name
  FROM employees e;  
```

