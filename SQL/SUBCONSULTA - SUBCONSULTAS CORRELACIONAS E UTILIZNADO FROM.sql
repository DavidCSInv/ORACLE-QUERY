==== utilizando sub-consultas correlacionadas =======

SELECT E1.EMPLOYEE_ID,E1.FIRST_NAME,E1.LAST_NAME,E1.DEPARTMENT_ID,E1.SALARAY
  FROM EMPLOYEES E1
 WHERE E1.SALARY >= (SELECT TRUNC(AVG(NVL(SALARY,0)),0)
                       FROM EMPLOYEES
                      WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID);

========== UTILIZANDO SUB-CONSULTAS MULTIPLE-COLUMN ===========

PARA REALIZAR ESTE TIPO DE CONSULTA ONDE O SEU NUMERO DE COLUNAS TEM DE SER O MESMO TANTO NO SEU FILTRO QUNATO NA SUA SUBCONSULTA


ESTE SELECT TRAZ O NUMERO MAXIMO E NELE OS FUNCIONARIOS QUE O MESMO TEM ESTES NUMEROS MAXIMOS DE SALARIO.

SELECT E1.EMPLOYEE_ID,E1.FIRST_NAME,E1.LAST_NAME,E1.DEPARTMENT_ID,E1.SALARAY
  FROM EMPLOYEES E1
 WHERE (E1.JOB_ID,E1.SALARY) IN (SELECT E2.JOB_ID,MAX(E2.SALARY)
                                   FROM EMPLOYEES E2
                                   GROUP BY E2.JOB_ID);
============= UTILIZANDO SUB-CONSULTAS NA CLÁUSULA FROM ======================

-- é como se Fizéssemos uma pequena view onde damos alias para o mesmo para chamarmos 

SELECT empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id, 
       empregados.salary, ROUND(max_salary_job.max_salary,2) MAX_SALARY, empregados.salary - ROUND(max_salary_job.max_salary,2) DIFERENÃ‡A
FROM   employees empregados
  LEFT JOIN (SELECT  e2.job_id, MAX(e2.salary) max_salary
             FROM     employees e2
             GROUP by e2.job_id) max_salary_job
       ON empregados.job_id = max_salary_job.job_id;