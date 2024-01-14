## Использование функций преобразования и условных выражений.

#### Задача 1. Получить список всех сотрудников которые пришли на работу в первый день месяца (любого)
<pre> 
SELECT *
  FROM employees
 WHERE TO_CHAR (hire_date, 'DD') = '01';
</pre> 

#### Задача 2. Получить список всех сотрудников которые пришли на работу в 2008ом году
<pre> 
SELECT *
  FROM employees
 WHERE TO_CHAR (hire_date, 'YYYY') = '2008';
</pre>  

#### Задача 3. Показать завтрашнюю дату в формате: Tomorrow is Second day of January
<pre> 
SELECT TO_CHAR (SYSDATE, 'fm""Tomorrow is ""Ddspth ""day of"" Month')     info
  FROM DUAL; 
</pre>  

#### Задача 4. Получить список всех сотрудников и дату прихода на работу каждого в формате: 21st of June, 2007
<pre> 
SELECT first_name, TO_CHAR (hire_date, 'fmddth ""of"" Month, YYYY') hire_date
  FROM employees;
</pre>  

#### Задача 5. Получить список работников с увеличенными зарплатами на 20%. Зарплату показать со знаком доллара
<pre> 
SELECT first_name, TO_CHAR (salary + salary * 0.20, 'fm$999,999.00') new_salary
  FROM employees; 
</pre>  

#### Задача 6. Получить список всех сотрудников которые приши на работу в феврале 2007го года.
<pre> 
SELECT *
  FROM employees
 WHERE hire_date BETWEEN TO_DATE ('01.02.2007', 'DD.MM.YYYY')
                     AND LAST_DAY (TO_DATE ('01.02.2007', 'DD.MM.YYYY')); 
 
SELECT *
  FROM employees
 WHERE to_char(hire_date,'MM.YYYY') = '02.2007'; 
</pre> 

#### Задача 7. Вывезти актуальную дату, + секунда, + минута, + час, + день, + месяц, + год
<pre> 
SELECT SYSDATE                          now,
       SYSDATE + 1 / (24 * 60 * 60)     plus_second,
       SYSDATE + 1 / (24 * 60)          plus_minute,
       SYSDATE + 1 / 24                 plus_hour,
       SYSDATE + 1                      plus_day,
       ADD_MONTHS (SYSDATE, 1)          plus_month,
       ADD_MONTHS (SYSDATE, 12)         plus_year
  FROM DUAL; 
</pre>  

#### Задача 8. Получить список всех сотрудников с полными зарплатами (salary + commission_pct(%)) в формате: $24,000.00
<pre> 
SELECT first_name, salary, TO_CHAR (salary + salary * NVL (commission_pct, 0), 'fm$99,999.00') full_salary
  FROM employees; 
</pre>  

#### Задача 9. Получить список всех сотрудников и информацию о наличии бонусов к зарплате (Yes/No)
<pre> 
SELECT first_name, commission_pct, NVL2 (commission_pct, 'Yes', 'No') has_bonus
  FROM employees; 
</pre>  

#### Задача 10. Получить уровень зарплаты каждого сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 и меньше 10000 считается Normal level, Больше иои равно 10000 считается High level
<pre> 
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
</pre>    

Таблица Countries. Для каждой страны показать регион в котором он находится: 1-Europe, 2-America, 3-Asia, 4-Africa (без Join)
<pre> 
SELECT country_name country,
       DECODE (region_id,
               1, 'Europe',
               2, 'America',
               3, 'Asia',
               4, 'Africa',
               'Unknown')
           region
  FROM countries;   </pre>    
SELECT country_name
           country,
       CASE region_id
           WHEN 1 THEN 'Europe'
           WHEN 2 THEN 'America'
           WHEN 3 THEN 'Asia'
           WHEN 4 THEN 'Africa'
           ELSE 'Unknown'
       END
           region
  FROM countries;   
 </pre>  
  
## Отчет об агрегированных данных с использованием групповых функций.

#### Задача 11. Получить репорт по department_id с минимальной и максимальной зарплатой, с ранней и поздней датой прихода на работу и с количествов сотрудников. Сорировать по количеству сотрудников (по убыванию)
<pre> 
  SELECT department_id,
         MIN (salary) min_salary,
         MAX (salary) max_salary,
         MIN (hire_date) min_hire_date,
         MAX (hire_date) max_hire_Date,
         COUNT (*) count
    FROM employees
GROUP BY department_id
order by count(*) desc;   
</pre>  

#### Задача 12. Сколько сотрудников имена которых начинается с одной и той же буквы? Сортировать по количеству. Показывать только те где количество больше 1
<pre> 
SELECT SUBSTR (first_name, 1, 1) first_char, COUNT (*)
    FROM employees
GROUP BY SUBSTR (first_name, 1, 1)
  HAVING COUNT (*) > 1
ORDER BY 2 DESC;   
</pre>    

#### Задача 13. Сколько сотрудников которые работают в одном и тоже отделе и получают одинаковую зарплату?
<pre> 
SELECT department_id, salary, COUNT (*)
    FROM employees
GROUP BY department_id, salary
  HAVING COUNT (*) > 1;   
  </pre>    

#### Задача 14. Получить репорт сколько сотрудников приняли на работу в каждый день недели. Сортировать по количеству
<pre> 
SELECT TO_CHAR (hire_Date, 'Day') day, COUNT (*)
    FROM employees
GROUP BY TO_CHAR (hire_Date, 'Day')
ORDER BY 2 DESC;   
</pre>    

#### Задача 15. Получить репорт сколько сотрудников приняли на работу по годам. Сортировать по количеству
<pre> 
SELECT TO_CHAR (hire_date, 'YYYY') year, COUNT (*)
    FROM employees
GROUP BY TO_CHAR (hire_date, 'YYYY');   
</pre>    

#### Задача 16. Получить количество департаментов в котором есть сотрудники
<pre> 
SELECT COUNT (COUNT (*))     department_count
    FROM employees
   WHERE department_id IS NOT NULL
GROUP BY department_id;   
</pre>    

#### Задача 17. Получить список department_id в котором работают больше 30 сотрудников
<pre> 
  SELECT department_id
    FROM employees
GROUP BY department_id
  HAVING COUNT (*) > 30;   
  </pre>    

#### Задача 18. Получить список department_id и округленную среднюю зарплату работников в каждом департаменте.
<pre> 
  SELECT department_id, ROUND (AVG (salary)) avg_salary
    FROM employees
GROUP BY department_id;   </pre>    

Таблица Countries. Получить список region_id сумма всех букв всех country_name в котором больше 60ти
<pre> 
  SELECT region_id
    FROM countries
GROUP BY region_id
  HAVING SUM (LENGTH (country_name)) > 60;   
  </pre>    

#### Задача 19. Получить список department_id в котором работают работники нескольких (>1) job_id
<pre> 
  SELECT department_id
    FROM employees
GROUP BY department_id
  HAVING COUNT (DISTINCT job_id) > 1;   
  </pre>    

#### Задача 20. Получить список manager_id у которых количество подчиненных больше 5 и сумма всех зарплат его подчиненных больше 50000
<pre> 
  SELECT manager_id
    FROM employees
GROUP BY manager_id
  HAVING COUNT (*) > 5 AND SUM (salary) > 50000;   
  </pre>    

#### Задача 21. Получить список manager_id у которых средняя зарплата всех его подчиненных находится в промежутке от 6000 до 9000 которые не получают бонусы (commission_pct пустой)
<pre> 
  SELECT manager_id, AVG (salary) avg_salary
    FROM employees
   WHERE commission_pct IS NULL
GROUP BY manager_id
  HAVING AVG (salary) BETWEEN 6000 AND 9000;   
  </pre>    

#### Задача 22. Получить максимальную зарплату из всех сотрудников job_id которыз заканчивается на слово 'CLERK'
<pre> 
SELECT MAX (salary) max_salary
  FROM employees
 WHERE job_id LIKE '%CLERK';       
SELECT MAX (salary) max_salary
  FROM employees
 WHERE SUBSTR (job_id, -5) = 'CLERK';   
 </pre>    

#### Задача 23. Получить максимальную зарплату среди всех средних зарплат по департаменту
<pre> 
  SELECT MAX (AVG (salary))
    FROM employees
GROUP BY department_id;   
</pre>    

#### Задача 24. Получить количество сотрудников с одинаковым количеством букв в имени. При этом показать только тех у кого длина имени больше 5 и количество сотрудников с таким именем больше 20. Сортировать по длинне имени
<pre> 
  SELECT LENGTH (first_name), COUNT (*)
    FROM employees
GROUP BY LENGTH (first_name)
  HAVING LENGTH (first_name) > 5 AND COUNT (*) > 20
ORDER BY LENGTH (first_name);     
  SELECT LENGTH (first_name), COUNT (*)
    FROM employees
   WHERE LENGTH (first_name) > 5
GROUP BY LENGTH (first_name)
  HAVING COUNT (*) > 20
ORDER BY LENGTH (first_name);  
 </pre>    


## Отображение данных из нескольких таблиц с помощью соединений

#### Задача 25. Departaments, Locations, Countries, Regions. Получить список регионов и количество сотрудников в каждом регионе
<pre> 
  SELECT region_name, COUNT (*)
    FROM employees e
         JOIN departments d ON (e.department_id = d.department_id)
         JOIN locations l ON (d.location_id = l.location_id)
         JOIN countries c ON (l.country_id = c.country_id)
         JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name;   
</pre>    

#### Задача 26. Departaments, Locations, Countries, Regions. Получить детальную информацию о каждом сотруднике:
First_name, Last_name, Departament, Job, Street, Country, Region
<pre> 
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
</pre>    

#### Задача 27. Показать всех менеджеров которые имеют в подчинении больше 6ти сотрудников
<pre> 
  SELECT man.first_name, COUNT (*)
    FROM employees emp JOIN employees man ON (emp.manager_id = man.employee_id)
GROUP BY man.first_name
  HAVING COUNT (*) > 6;   
  </pre>    

#### Задача 28. Показать всех сотрудников которые ни кому не подчиняются
<pre> 
SELECT emp.first_name
  FROM employees  emp
       LEFT JOIN employees man ON (emp.manager_id = man.employee_id)
 WHERE man.FIRST_NAME IS NULL;      
SELECT first_name
  FROM employees
 WHERE manager_id IS NULL;   
 </pre>    

#### Задача 29. Job_history. В таблице Employee хранятся все сотрудники. В таблице Job_history хранятся сотрудники которые покинули компанию. Получить репорт о всех сотрудниках и о его статусе в компании (Работает или покинул компанию с датой ухода)
<pre>
first_name | status
Jennifer | Left the company at 31 of December, 2006
Clara | Currently Working
<pre> 
SELECT first_name,
       NVL2 (
           end_date,
           TO_CHAR (end_date, 'fm""Left the company at"" DD ""of"" Month, YYYY'),
           'Currently Working')
           status
  FROM employees e LEFT JOIN job_history j ON (e.employee_id = j.employee_id);   
  </pre>    

#### Задача 30. Departaments, Locations, Countries, Regions. Получить список сотрудников которые живут в Europe (region_name)
<pre> 
 SELECT first_name
  FROM employees
       JOIN departments USING (department_id)
       JOIN locations USING (location_id)
       JOIN countries USING (country_id)
       JOIN regions USING (region_id)
 WHERE region_name = 'Europe';   </pre>     
 SELECT first_name
  FROM employees  e
       JOIN departments d ON (e.department_id = d.department_id)
       JOIN locations l ON (d.location_id = l.location_id)
       JOIN countries c ON (l.country_id = c.country_id)
       JOIN regions r ON (c.region_id = r.region_id)
 WHERE region_name = 'Europe';   
 </pre>    

#### Задача 31. Departaments. Показать все департаменты в которых работают больше 30ти сотрудников
<pre> 
SELECT department_name, COUNT (*)
    FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name
  HAVING COUNT (*) > 30;   
  </pre>    

#### Задача 32. Departaments. Показать всех сотрудников которые не состоят ни в одном департаменте
<pre> 
SELECT first_name
  FROM employees  e
       LEFT JOIN departments d ON (e.department_id = d.department_id)
 WHERE d.department_name IS NULL;      
SELECT first_name
  FROM employees
 WHERE department_id IS NULL;   
 </pre>    

#### Задача 33. Departaments. Показать все департаменты в которых нет ни одного сотрудника
<pre> 
SELECT department_name
  FROM employees  e
       RIGHT JOIN departments d ON (e.department_id = d.department_id)
 WHERE first_name IS NULL;   
 </pre>    

#### Задача 34. Показать всех сотрудников у которых нет ни кого в подчинении
<pre> 
SELECT man.first_name
  FROM employees  emp
       RIGHT JOIN employees man ON (emp.manager_id = man.employee_id)
 WHERE emp.FIRST_NAME IS NULL;   
 </pre>    

#### Задача 35. Jobs, Departaments. Показать сотрудников в формате: First_name, Job_title, Department_name.
Пример:
First_name | Job_title | Department_name
Donald | Shipping | Clerk Shipping
<pre> 
SELECT first_name, job_title, department_name
  FROM employees  e
       JOIN jobs j ON (e.job_id = j.job_id)
       JOIN departments d ON (d.department_id = e.department_id);   
</pre>    

#### Задача 36. Получить список сотрудников менеджеры которых устроились на работу в 2005ом году но при это сами эти работники устроились на работу до 2005 года
<pre> 
SELECT emp.*
  FROM employees emp JOIN employees man ON (emp.manager_id = man.employee_id)
 WHERE     TO_CHAR (man.hire_date, 'YYYY') = '2005'
       AND emp.hire_date < TO_DATE ('01012005', 'DDMMYYYY');   
</pre>    

#### Задача 37. Получить список сотрудников менеджеры которых устроились на работу в январе месяце любого года и длина job_title этих сотрудников больше 15ти символов
<pre> 
SELECT emp.*
  FROM employees  emp
       JOIN employees man ON (emp.manager_id = man.employee_id)
       JOIN jobs j ON (emp.job_id = j.job_id)
 WHERE TO_CHAR (man.hire_date, 'MM') = '01' AND LENGTH (j.job_title) > 15;   
 </pre>    


## Использование подзапросов для решения запросов

#### Задача 38. Получить список сотрудников с самым длинным именем.
<pre> 
SELECT *
  FROM employees
 WHERE LENGTH (first_name) =
       (SELECT MAX (LENGTH (first_name)) FROM employees);   </pre>    

#### Задача 39. Получить список сотрудников с зарплатой большей средней зарплаты всех сотрудников.
<pre> 
SELECT *
  FROM employees
 WHERE salary > (SELECT AVG (salary) FROM employees);   </pre>    

#### Задача 40. Departments, Locations. Получить город в котором сотрудники в сумме зарабатывают меньше всех.
<pre> 
SELECT city
    FROM employees e
         JOIN departments d ON (e.department_id = d.department_id)
         JOIN locations l ON (d.location_id = l.location_id)
GROUP BY city
  HAVING SUM (salary) =
         (  SELECT MIN (SUM (salary))
              FROM employees e
                   JOIN departments d ON (e.department_id = d.department_id)
                   JOIN locations l ON (d.location_id = l.location_id)
          GROUP BY city);   </pre>    

#### Задача 41. Получить список сотрудников у которых менеджер получает зарплату больше 15000.
<pre> 
SELECT *
  FROM employees
 WHERE manager_id IN (SELECT employee_id
                        FROM employees
                       WHERE salary > 15000)
</pre>

#### Задача 42. Departaments. Показать все департаменты в которых нет ни одного сотрудника
<pre> 
SELECT *
  FROM departments
 WHERE department_id NOT IN (SELECT department_id
                               FROM employees
                              WHERE department_id IS NOT NULL);   </pre>    

#### Задача 43. Показать всех сотрудников которые не являются менеджерами
<pre> 
SELECT *
  FROM employees
 WHERE employee_id NOT IN (SELECT manager_id
                             FROM employees
                            WHERE manager_id IS NOT NULL);
</pre>

#### Задача 44. Показать всех менеджеров которые имеют в подчинении больше 6ти сотрудников
<pre> 
SELECT *
  FROM employees e
 WHERE (SELECT COUNT (*)
          FROM employees
         WHERE manager_id = e.employee_id) > 6;   </pre>    

#### Задача 45. Departaments. Показать сотрудников которые работают в департаменте IT
<pre> 
SELECT *
  FROM employees
 WHERE department_id = (SELECT department_id
                          FROM departments
                         WHERE department_name = 'IT');   </pre>    

#### Задача 46. Jobs, Departaments. Показать сотрудников в формате: First_name, Job_title, Department_name.
<pre>
First_name | Job_title | Department_name
Donald | Shipping | Clerk Shipping

SELECT first_name,
       (SELECT job_title
          FROM jobs
         WHERE job_id = e.job_id)
           job_title,
       (SELECT department_name
          FROM departments
         WHERE department_id = e.department_id)
           department_name
  FROM employees e;   </pre>    

#### Задача 47. Получить список сотрудников менеджеры которых устроились на работу в 2005ом году но при это сами эти работники устроились на работу до 2005 года
<pre> 
SELECT *
  FROM employees
 WHERE     manager_id IN (SELECT employee_id
                            FROM employees
                           WHERE TO_CHAR (hire_date, 'YYYY') = '2005')
       AND hire_date < TO_DATE ('01012005', 'DDMMYYYY');   </pre>    

#### Задача 48. Получить список сотрудников менеджеры которых устроились на работу в январе месяце любого года и длина job_title этих сотрудников больше 15ти символов
<pre> 
SELECT *
  FROM employees e
 WHERE     manager_id IN (SELECT employee_id
                            FROM employees
                           WHERE TO_CHAR (hire_date, 'MM') = '01')
       AND (SELECT LENGTH (job_title)
              FROM jobs
             WHERE job_id = e.job_id) > 15;   
</pre>    
