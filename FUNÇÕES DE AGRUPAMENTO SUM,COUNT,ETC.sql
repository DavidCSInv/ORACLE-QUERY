FUNÇÕES DE AGREGAÇÃO

AVG - COUNT - MAX - MIN - SUM - STDDEV - VARIANCE 

=======================================================
AVG - TRAZ A MEDIA DOS VALORES INDICADOS

COUNT - Conta o numero de linhas indicadas e ignora os nulos

MAX - O maior valor indicado

SUM - Soma 

STDDEV - Desvio padrão do grupo

VARIANCE - Traz a variancia do grupo

==========UTILIZANDO SUM E AVG==================================================

SELECT SUM (EMP.SALARY),AVG(EMP.SALARY)
  FROM EMPLOYEES EMP;
  
========== UTILIZANDO MIN E MAX ======================================

SELECT MIN(EMP.HIRE_DATE),MAX(EMP.HIRE_DATE)
  FROM EMPLOYEES EMP
  
SELECT MIN (EMP.SALARY),MAX(EMP.SALARY)
  FROM EMPLOYEES EMP;
  
======== UTILIZANDO COUNT ==============================================

SELECT COUNT(*)
  FROM EMPLOYEES EMP;
  
SELECT COUNT(EMP.COMMISSION_PCT)
  FROM EMPLOYEES EMP;
  
SELECT COUNT(EMP.COMMISSION_PCT),COUNT(*)
  FROM EMPLOYEES EMP;

SELECT COUNT(NVL(EMP.COMMISSION_PCT,0)) --- AQUI ELE CONTOU TODOS POIS TRANSFORMEI NULO EM ZERO
  FROM EMPLOYEES EMP;

==== UTILIZANDO COUNT COM DISTINCT =============

SELECT EMP.DEPARTMENT_ID
  FROM EMPLOYEES EMP;
  
SELECT COUNT(EMP.DEPARTMENT_ID)
  FROM EMPLOYEES EMP;
  
SELECT COUNT (DISTINCT(EMP.DEPARTMENT_ID))
  FROM EMPLOYEES EMP;
  
==========TRATAMENTO DE NULOS EM FUNÇÕES DE GRUPO ==============

Por que ? bom para isso é necessario pensar em um geral, se você traz a função se em um função de media os valores nulos não contam isto esta certo ?:
Não

SELECT AVG(EMP.COMMISSION_PCT)
  FROM EMPLOYEES EMP;
  
  ENTRE OS DOIS HÁ UMA DIFERENÇA
   
SELECT AVG (NVL(EMP.COMMISSION_PCT,0))
  FROM EMPLOYEES EMP;
  
==== CRIANDO GRUPOS UTILIZANDO A CLAUSULA GROUP BY =======

