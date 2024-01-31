## Использование функций преобразования и условных выражений.

#### Задача 1. Получить список всех сотрудников которые пришли на работу в первый день месяца (любого)
<pre> 
SELECT [first_name],[last_name],[hire_date]
  FROM employees
WHERE DAY(hire_date) = '01';
</pre> 

#### Задача 2. Получить список всех сотрудников которые пришли на работу в 2013 -ом году
<pre> 
SELECT *
  FROM employees
 WHERE Year(hire_date) = '2013';
</pre>  

#### Задача 3. Показать завтрашнюю дату в формате: 2013-04-30 13:10:02.0474381 -07:00
<pre> 
SELECT SYSDATETIMEOFFSET(); 
</pre>  

#### Задача 4. Получить список всех сотрудников и дату прихода на работу каждого в формате: День, Месяц, Год
<pre> 
SELECT first_name, DAY(hire_date) As N'День', Month(hire_date) As N'Месяц', Year(hire_date) As N'Год'
  FROM employees;
</pre>  

#### Задача 5. Получить список работников с увеличенными зарплатами на 20%. Зарплату показать со знаком доллара
<pre> 
SELECT first_name, Cast(salary + (salary * 0.2) As VARCHAR(10)) + '$' As new_salary
  FROM employees; 
</pre>  

#### Задача 6. Получить список всех сотрудников которые приши на работу в феврале 2013 го года.
<pre> 
SELECT *
  FROM employees
 WHERE hire_date BETWEEN '2017/02/01' AND '2017/03/01'; 
Go
</pre> 
 
