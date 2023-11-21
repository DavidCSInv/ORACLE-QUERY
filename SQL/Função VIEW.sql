View - � uma representa��o logica baseada em um select sobre uma ou mais  tabelas ou sobre outras vis�es,
sendo um subconjunto l�gico dos dados de uma ou mais tabelas.

Basicamente uma view, � como se tivessemos um select j� feito guardado.

Suas vantagens sendo :

Restringir acesso aos dados --- Digamos que voc� s� proporciona a view para um usuario
Tornar simples consultas complexas 
Proporcionar independencias dos dados 
Representar vis�es diferentes do mesmo dado

SINTAXE :

CREATE [OR REPLACE] [FORCE|NO FORCE] -- NO FORCE � O PADR�O MAS CASO INSIRA COM FORCE ELE ACEITA ERROS DE SELECT
VIEW NOME_VIS�O
  AS O SELECT OU SUBCONSULTA
  [WITH CHECK OPTION[CONSTRAINT NOME_CONSTRAINT]]
  [WITH READ ONLY [CONSTRAINT NOME_CONSTRAINT];


=== CRIANDO UMA VIS�O/VIEW=======

CREATE OR REPLACE VIEW vemployeedept60
as select employee_id,first_name,last_name,department_id,salary
from employees
where department_id = 60;

=== RECUPERANDO DADOS UTILIZANDO UMA VIS�O/VIEW ====

SELECT *
  FROM vemployeedept60;
  
// Adendos views podem ser classificadas em simples e ou complexas
Simples quando - Numero de tablas for uma,
               - N�o contem fun�oes (case when,etc)
               - n�o contem grupos de dados 
               - e a mesma permite opera��es DML atrav�s da vis�o (Caso for complexo vai ser um TALVEZ)

==== CRIANDO UMA VIEW COMPLEXA =====

CREATE OR REPLACE VIEW VDEPARTMENTS_TOTAL
(DEPARTMENT_ID,DEPARTMENT_NAME,MINSAL,MAXSAL,AVGSAL) -- AQUI VOC� ESTA DANDO NOMES OU ALIAS PARA AS COLUNAS DO SELECT
AS SELECT E.DEPARTMENT_ID,D.DEPARTMENT_NAME,MIN(E.SALARY),MAX(E.SALARY),AVG(E.SALARY)
     FROM EMPLOYEES E
     JOIN DEPARTMENTS D ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
     GROUP BY E.DEPARTMENT_ID,DEPARTMENT_NAME;

SELECT *
  FROM VDEPARTMENTS_TOTAL;
  
==== REGRAS PARA EXECUTAR OPERA��ES DML ATRAV�S DE UMA VIS�O ===

DELETE :

 N�O SE PRODE REMOVER LINHAS ATRAVES DE UMA VIEW COMPLEXA QUE CONT�M :
 
 - FUN��O DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 
 UPDATE 
 - FUN��O DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 - COLUNAS DEFINIDAS POR EXPRESS�ES
 
 INSERT 
 - FUN��O DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 - COLUNAS DEFINIDAS POR EXPRESS�ES
 - COLUNAS NOT NULL NAS TABELAS BASE QUE N�O ESTEJAM NO SELECT DA VIS�O
 
 ====== UTILIZANDO A CLAUSULA CHECK OPTION ====
 
 OK, ESTA CLAUSULA FUNCIONA DA SEGUINTE MANEIRA,CASO ALGU�M QUEIRA INSERIR, ATUALIZAR (DML) DADOS UTILIZANDO A VIEW ELA IR� CONSEGUIR PARA QUE SEJA FEITA A PREVE��O DISTO 
 COLOCAMOS UM CHECK OPTION PARA QUE QUANDO A CLAUSULA WHERE DE SEU SELECT (FILTRO) TENTE SER RESTRINGIDA N�O IR� CONSEGUIR.
 
 CREATE OR REPLACE VIEW VEMPLOYEESDEPT100
   AS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
        FROM EMPLOYEES
       WHERE DEPARTMENT_ID = 100
       WITH CHECK OPTION CONSTRAINT VEMPLOYEEDEPT100_CK;
       
       select *
        from VEMPLOYEESDEPT100
        
         insert into VEMPLOYEESDEPT100(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY) values (102,'banana','ma�a',90,989);
         
===== UTILIZANDO A CLAUSULA  READ ONLY =====

Bom comandos DML n�o ir�o funcionar de jeito nenhum aqui

CREATE OR REPLACE VIEW VEMPLOYEEDEPT20
  AS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
       FROM EMPLOYEES
      WHERE DEPARTMENT_ID = 20
       WITH READ ONLY;
       
==== REMOVENDO VIEW ====

DROP VIEW VEMPLOYEEDEPT20;

Nada ocorre com os objetos referenciados na view, seja valores e ou tabelas que a mesma referenciar
s� ir� focar na view.
    
        
 