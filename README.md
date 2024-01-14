# t-sql
# Задачи

## Ограничение и сортировка данных

#### Получить список с информацией обо всех сотрудниках.
Решение<br>
<pre>
SELECT * FROM employees
</pre>

#### Получить список всех сотрудников с именем 'David'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE first_name = 'David';
</pre>


#### Получить список всех сотрудников с job_id равным 'IT_PROG'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE job_id = 'IT_PROG'
</pre>


#### Получить список всех сотрудников из 50го отдела (department_id) с зарплатой(salary), большей 4000
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE department_id = 50 AND salary > 4000;
</pre>


#### Получить список всех сотрудников из 20го и из 30го отдела (department_id)
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE department_id = 20 OR department_id = 30;
</pre>


#### Получить список всех сотрудников у которых последняя буква в имени равна 'a'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE first_name LIKE '%a';
</pre>


#### Получить список всех сотрудников из 50го и из 80го отдела (department_id) у которых есть бонус (значение в колонке commission_pct не пустое)
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE     (department_id = 50 OR department_id = 80)
       AND commission_pct IS NOT NULL;
</pre>


#### Получить список всех сотрудников у которых в имени содержатся минимум 2 буквы 'n'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE first_name LIKE '%n%n%';
</pre>


#### Получить список всех сотрудников у которых длина имени больше 4 букв
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE first_name LIKE '%_____%';
</pre>


#### Получить список всех сотрудников у которых зарплата находится в промежутке от 8000 до 9000 (включительно)
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE salary BETWEEN 8000 AND 9000;
</pre>


#### Получить список всех сотрудников у которых в имени содержится символ '%'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE first_name LIKE '%\%%' ESCAPE '\';
</pre>


#### Получить список всех ID менеджеров
Решение<br>
<pre>

SELECT DISTINCT manager_id
  FROM employees
 WHERE manager_id IS NOT NULL;
</pre>


#### Получить список работников с их позициями в формате: Donald(sh_clerk)
Решение<br>
<pre>

SELECT first_name || '(' || LOWER (job_id) || ')' employee FROM employees;
</pre>



## Использование однострочных функций для настройки вывода

#### Получить список всех сотрудников у которых длина имени больше 10 букв
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE LENGTH (first_name) > 10;
</pre>


#### Получить список всех сотрудников у которых в имени есть буква 'b' (без учета регистра)
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE INSTR (LOWER (first_name), 'b') > 0;
</pre>


#### Получить список всех сотрудников у которых в имени содержатся минимум 2 буквы 'a'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE INSTR (LOWER (first_name),'a',1,2) > 0;
</pre>


#### Получить список всех сотрудников зарплата которых кратна 1000
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE MOD (salary, 1000) = 0;
</pre>


#### Получить первое 3х значное число телефонного номера сотрудника если его номер в формате ХХХ.ХХХ.ХХХХ
Решение<br>
<pre>

SELECT phone_number, SUBSTR (phone_number, 1, 3) new_phone_number
  FROM employees
 WHERE phone_number LIKE '___.___.____';
</pre>


#### Получить первое слово из имени департамента для тех у кого в названии больше одного слова
Решение<br>
<pre>

SELECT department_name,
       SUBSTR (department_name, 1, INSTR (department_name, ' ')-1)
           first_word
  FROM departments
 WHERE INSTR (department_name, ' ') > 0;
</pre>


#### Получить имена сотрудников без первой и последней буквы в имени
Решение<br>
<pre>

SELECT first_name, SUBSTR (first_name, 2, LENGTH (first_name) - 2) new_name
  FROM employees;
</pre>


#### Получить список всех сотрудников у которых последняя буква в имени равна 'm' и длинной имени большей 5ти
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE SUBSTR (first_name, -1) = 'm' AND LENGTH(first_name)>5;
</pre>


#### Получить дату следующей пятницы
Решение<br>
<pre>

SELECT NEXT_DAY (SYSDATE, 'FRIDAY') next_friday FROM DUAL;
</pre>


#### Получить список всех сотрудников которые работают в компании больше 17 лет
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE MONTHS_BETWEEN (SYSDATE, hire_date) / 12 > 17;
</pre>


#### Получить список всех сотрудников у которых последня цифра телефонного номера нечетная и состоит из 3ех чисел разделенных точкой
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE     MOD (SUBSTR (phone_number, -1), 2) != 0
       AND INSTR (phone_number,'.',1,3) = 0
       AND INSTR (phone_number,'.',1,2) > 0;
</pre>


#### Получить список всех сотрудников у которых в значении job_id после знака '_' как минимум 3 символа но при этом это значение после '_' не равно 'CLERK'
Решение<br>
<pre>

SELECT *
  FROM employees
 WHERE     LENGTH (SUBSTR (job_id, INSTR (job_id, '_') + 1)) > 3
       AND SUBSTR (job_id, INSTR (job_id, '_') + 1) != 'CLERK';
</pre>


#### Получить список всех сотрудников заменив в значении PHONE_NUMBER все '.' на '-'
Решение<br>
<pre>

SELECT phone_number, REPLACE (phone_number, '.', '-') new_phone_number
  FROM employees;
</pre>



