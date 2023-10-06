-- Utilizando o operador UNION 

O operador Union utiliza-se de dois selects onde os seus tipos (VAR,NUMBER,ETC..) e quantidades que s�o requisitadas em seu select tem de ser iguais,
o mesmo n�o duplica valores que sejam iguais

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Utilizando o operador UNION ALL

J� o union all ir� trazer ambos os resultado com suas duplicidades ou n�o.

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id = 60
ORDER BY employee_id;

-- Utilizando operador INTERSECT

Este operador funciona de uma certa forma onde o mesmo s� ira pegar os dados onde eles s�o iguais em ambos os selects

SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
ORDER BY employee_id;

-- Utilizando operador MINUS

O mesmo funciona da seguinte maneira pega os dois selects e compara e pega o resultado em base do segundo select

SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
MINUS
SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Utilizando mais de um operador SET

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
(SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  salary > 10000)
ORDER BY employee_id;