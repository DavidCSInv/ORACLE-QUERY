 ================= UTILIZANDO SUBCONSULTAS ===========
 
 Subconsultas são utilizadas de maneira há qual sua chamada vem primeiro em parenteses e logo após o resto
 
 SELECT FIRST_NAME,LAST_NAME,JOB_ID,SALARY
   FROM EMPLOYEES
   WHERE SALARY > (SELECT AVG(NVL(SALARY,0))
                     FROM EMPLOYEES);
                     
============= UTILIZANDO A SUBCONSULTA UTILIZANDO HAVING ===========

    SELECT E.FIRST_NAME,E.LAST_NAME,E.JOB_ID,MAX(E.SALARY)
      FROM EMPLOYEES E
     GROUP BY E.FIRST_NAME,E.LAST_NAME,E.JOB_ID
     HAVING MAX (E.SALARY) < (SELECT AVG(NVL(E2.SALARY,0))
                                FROM EMPLOYEES E2);
                                
============ ERROS AO EXECUTAR UMA CONSULTA SUBCONSULTA SINGLE-ROW =============

Não se pode utilizar uma subconsulta single-row com mais de uma linha ocorre erro

SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME
  FROM EMPLOYEES E
 WHERE E.SALARY = 
                  (SELECT AVG(NVL(E2.SALARY,0))
                     FROM EMPLOYEES E2
                    GROUP BY E2.DEPARTMENT_ID);
                    
========= O QUE OCORRE QUANDO A SUB-CONSULTA RETORNA NENHUMA LINHA ? =========
 
 se retornar em nada o subselect o mesmo ocorre na sua consulta principal
 
 SELECT E.EMPLOYEE_ID,E.FIRST_NAME,E.LAST_NAME
   FROM EMPLOYEES E
  WHERE E.LAST_NAME = (SELECT E2.LAST_NAME
                         FROM EMPLOYEES E2
                        WHERE E2.LAST_NAME = 'Suzuki');
