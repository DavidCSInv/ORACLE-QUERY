=== EXIBINDO DADOS A PARTI DE MULTIPLAS TABELAS =======

 - JOIN - NATURAL JOIN - LEFT JOIN - RIGHT JOIN - FULL OUTER JOIN - CROSS JOIN - 

======= UTILIZANDO PREFIXOS COLUNA COM NOME DE TABELAS =========

Para que o SQL consiga entender e não ficar ambiguo é necessario indicar ou o seu ALIAS  ou o nome da tabela em seu SELECT 


SELECT EMPLOYEES.EMPLOYEE_ID,employees.last_name,employees.department_id,departments.department_name
  FROM employees JOIN departments on (EMPLOYEES.department_id = departments.department_id)
  
  

====================== UTILIZANDO ALIAS DE TABELA =====================


SELECT E.EMPLOYEE_ID,E.last_name,E.department_id,D.department_name
  FROM employees E JOIN departments D on (E.department_id = D.department_id)
  

======================= UTILIZANDO NATURAL JOIN =======

NATURAL JOIN funciona como se fosse um indicador de que há colunas iguais e não é necessario indicar 

SELECT *
  FROM DEPARTMENTs
NATURAL JOIN LOCATIONS;

====================UTILIZANDO A CLAUSULA USING ============

USING - Não se pode utilizar a clausula que esta no using no select, O MESMO IRÁ UTILIZAR UM PARAMETRO QUE TENHA EM AMBAS AS TABELAS

SELECT E.EMPLOYEE_ID,E.LAST_NAME,D.LOCATION_ID,D.DEPARTMENT_NAME
 FROM EMPLOYEES E
 JOIN DEPARTMENTS D USING (DEPARTMENT_ID);
 
====================== JOIN COM CLAUSULA ON =============

SELECT E.EMPLOYEE_ID,E.last_name,E.department_id,D.department_name
  FROM employees E 
  JOIN departments D on (E.department_id = D.department_id)
  
  =========== UTILIZANDO JOIN COM MULTIPLAS TABELAS ===================
  
  
SELECT E.EMPLOYEE_ID,E.last_name,E.department_id,D.department_name
  FROM employees E 
  JOIN departments D on (E.department_id = D.department_id)
  JOIN JOBS        J ON e.job_id = j.JOB_ID
 ORDER BY E.employee_id;
 
 =========== utilizando where com JOIN =================================
 
 SELECT E.EMPLOYEE_ID,E.last_name,E.department_id,D.department_name
  FROM employees E 
  JOIN departments D on (E.department_id = D.department_id)
  JOIN JOBS        J ON e.job_id = j.JOB_ID
 WHERE E.SALARY BETWEEN 1000 AND 1500
 ORDER BY E.employee_id;
 
 === selfjoin utilizando a clausla on ===============
 
 SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME,M.MANAGER_ID,M.LAST_NAME
   FROM EMPLOYEES E 
   JOIN EMPLOYEES M ON (M.MANAGER_ID = E.EMPLOYEE_ID)
   ORDER BY 1;
 
 