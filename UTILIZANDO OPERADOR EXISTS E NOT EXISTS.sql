========== UTILIZANDO OPERADOR EXISTS E NOT EXISTS ============

---- UTILIZANDO OPERADOR EXISTS =========

SELECT D.DEPARTMENT_ID,D.department_name
  from departments d
 Where EXISTS (SELECT E.department_id
               from employees e
               WHERE D.department_id = e.department_id);

===== utilizando operador not exists =========


SELECT D.DEPARTMENT_ID,D.department_name
  from departments d
 Where not EXISTS (SELECT E.department_id
               from employees e
               WHERE D.department_id = e.department_id);