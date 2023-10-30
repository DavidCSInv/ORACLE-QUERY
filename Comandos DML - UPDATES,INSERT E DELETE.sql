Comandos DML - Manipulando dados 
 
-- Utilizando o Comando INSERT
Comando de insert basico onde você ira adicionar valores a uma tabela

INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400);

-- Inserindo Linhas com valores NULOS de modo explicito

Modo explicito seria você literalemente dando NULL em colunas nas tabelas.

INSERT INTO departments
VALUES (290, 'Data Science', NULL, NULL);

-- Inserindo Linhas com valores NULOS de modo implicito

Insert nulo de modo implicito, onde o programa irá colocar NULL em valores não chamados

INSERT INTO departments(department_id,
department_name)
VALUES (300, 'Business Intelligence');
desc departments

-- Inserindo valores especiais retornados de função 

SYSDATE É uma função e pode ser utilizado para averiguar o qual a data, pode ser chamado em seu insert

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

-- Insert utilizando data e hora especificas

TO_CHAR assim como outras funções tambem podem ser utilizadas para o insert

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
SELECT *
FROM   employees
ORDER BY employee_id DESC;

COMMIT;

-- Utilizando variavel de substituição em inserts

eu acho isso banal e burro, pois isto é chamado uma tela para adicionar valores que você pode digitar em seu codigo, mas tambem vai criar um insert pelos valores que você colocar na tela

SELECT *
FROM departments
ORDER BY department_id DESC;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

COMMIT;

-- Inserindo linhas a partir de uma Sub-consulta

DROP TABLE sales_reps;

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR2(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));


Famosos select insert - ele você pode dar insert a partir de um select que você já tem de uma tabela onde os valores são os mesmos.

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

COMMIT;

SELECT *
FROM sales_reps;

-- Utilizando o comando UPDATE

UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT *
FROM employees
WHERE last_name = 'King';

-- Utilizando o comando UPDATE com Sub-consultas

UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 141)
WHERE employee_id = 140;

COMMIT;

-- Utilizando o comando DELETE

DELETE FROM countries
WHERE  country_name = 'Nigeria';

ROLLBACK;

-- Utilizando o comando ROLLBACK

DELETE FROM employees
WHERE employee_id = 208;

-- Utilizando o comando COMMIT

COMMIT;

-- Utilizando o comando COMMIT

-- Utilizando Savepoint

DELETE FROM employees
WHERE employee_id IN (207,208);

COMMIT;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

SAVEPOINT A;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
ROLlBACK TO SAVEPOINT  A;

COMMIT; 

SELECT *
FROM employees
ORDER BY employee_id DESC;

-- CLAUSULA FOR UPDATE no comando SELECT 

Este aqui serve para que não haja uma alteração enquanto você estiver utiliznado o select,
é necessario realizar commits para destravar.

SELECT employee_id, salary, commission_pct, job_id
FROM   employees
WHERE  job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id = 'ST_CLERK'
AND location_id = 1500
FOR UPDATE of e.salary
ORDER BY e.employee_id;

COMMIT;