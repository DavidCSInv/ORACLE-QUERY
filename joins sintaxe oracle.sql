================ JOIN UTILIZANDO SINTAXE ORACLE  ==========================

Na sintaxe oracle pode ser feito o join colocando as suas informações através do WHERE e só informar as tabelas no FROM

SELECT e.employee_id,e.last_name,e.last_name,e.department_id,d.department_id,d.location
  FROM employees e,
       department d
WHERE (e.department_id = d.department_id)
order by e.department_id;

============ SINTAXE DE JOIN ENTRE VARIAS TABELAS UTILIZANDO COMO ORACLE ==================

SELECT e.employee_id,e.last_name,e.last_name,e.department_id,d.department_id,d.location_id
  FROM employees e,
       departments d,
       jobs j,
       locations l
WHERE (e.department_id = d.department_id) AND
      (e.job_id = j.job_id) AND 
      (d.location_id = l.location_id)
order by e.department_id;

=========== SINTAXE DE OUTER JOIN EM SINTAX ORACLE =======================

O outer join em SQL é representado com (+)

SELECT E.FIRST_NAME,E.last_name,D.department_id,D.department_name
  from employees E,
       departments d
 WHERE E.department_id = d.department_id(+)
 order by e.department_id;

 SELECT E.FIRST_NAME,E.last_name,D.department_id,D.department_name
  from employees E,
       departments d 
 WHERE E.department_id (+) = d.department_id
 order by e.department_id;

 ============= SELF JOIN UTILIZANDO SINTAXE ORACLE ========

 SELECT empregado.employee_id,
        empregado.last_name "sobrenome do empregado",
        gerentes.employee_id "ID DO GERENTE",
        gerentes.last_name "sobrenome gerente"
   FROM employees empregado , 
        employees gerentes
   WHERE (empregado.manager_id = gerentes.employee_id(+) );
   
================= PRODUTO CARTESIANO ============

 SELECT E.FIRST_NAME,E.last_name,J.JOB_ID,J.JOB_TITLE
  from employees E,
       jobs j
WHERE E.JOB_ID = J.JOB_ID