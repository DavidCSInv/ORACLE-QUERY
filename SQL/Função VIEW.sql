View - é uma representação logica baseada em um select sobre uma ou mais  tabelas ou sobre outras visões,
sendo um subconjunto lógico dos dados de uma ou mais tabelas.

Basicamente uma view, é como se tivessemos um select já feito guardado.

Suas vantagens sendo :

Restringir acesso aos dados --- Digamos que você só proporciona a view para um usuario
Tornar simples consultas complexas 
Proporcionar independencias dos dados 
Representar visões diferentes do mesmo dado

SINTAXE :

CREATE [OR REPLACE] [FORCE|NO FORCE] -- NO FORCE É O PADRÃO MAS CASO INSIRA COM FORCE ELE ACEITA ERROS DE SELECT
VIEW NOME_VISÃO
  AS O SELECT OU SUBCONSULTA
  [WITH CHECK OPTION[CONSTRAINT NOME_CONSTRAINT]]
  [WITH READ ONLY [CONSTRAINT NOME_CONSTRAINT];


=== CRIANDO UMA VISÃO/VIEW=======

CREATE OR REPLACE VIEW vemployeedept60
as select employee_id,first_name,last_name,department_id,salary
from employees
where department_id = 60;

=== RECUPERANDO DADOS UTILIZANDO UMA VISÃO/VIEW ====

SELECT *
  FROM vemployeedept60;
  
// Adendos views podem ser classificadas em simples e ou complexas
Simples quando - Numero de tablas for uma,
               - Não contem funçoes (case when,etc)
               - não contem grupos de dados 
               - e a mesma permite operações DML através da visão (Caso for complexo vai ser um TALVEZ)

==== CRIANDO UMA VIEW COMPLEXA =====

CREATE OR REPLACE VIEW VDEPARTMENTS_TOTAL
(DEPARTMENT_ID,DEPARTMENT_NAME,MINSAL,MAXSAL,AVGSAL) -- AQUI VOCÊ ESTA DANDO NOMES OU ALIAS PARA AS COLUNAS DO SELECT
AS SELECT E.DEPARTMENT_ID,D.DEPARTMENT_NAME,MIN(E.SALARY),MAX(E.SALARY),AVG(E.SALARY)
     FROM EMPLOYEES E
     JOIN DEPARTMENTS D ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
     GROUP BY E.DEPARTMENT_ID,DEPARTMENT_NAME;

SELECT *
  FROM VDEPARTMENTS_TOTAL;
  
==== REGRAS PARA EXECUTAR OPERAÇÕES DML ATRAVÉS DE UMA VISÃO ===

DELETE :

 NÃO SE PRODE REMOVER LINHAS ATRAVES DE UMA VIEW COMPLEXA QUE CONTÉM :
 
 - FUNÇÃO DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 
 UPDATE 
 - FUNÇÃO DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 - COLUNAS DEFINIDAS POR EXPRESSÕES
 
 INSERT 
 - FUNÇÃO DE GRUPO
 - CLAUSULA GROUP BY
 - PALAVRA CHAVE DISTINCT 
 - A PSEUDOCOLUNA ROWNUM
 - COLUNAS DEFINIDAS POR EXPRESSÕES
 - COLUNAS NOT NULL NAS TABELAS BASE QUE NÃO ESTEJAM NO SELECT DA VISÃO
 
 ====== UTILIZANDO A CLAUSULA CHECK OPTION ====
 
 OK, ESTA CLAUSULA FUNCIONA DA SEGUINTE MANEIRA,CASO ALGUÉM QUEIRA INSERIR, ATUALIZAR (DML) DADOS UTILIZANDO A VIEW ELA IRÁ CONSEGUIR PARA QUE SEJA FEITA A PREVEÇÃO DISTO 
 COLOCAMOS UM CHECK OPTION PARA QUE QUANDO A CLAUSULA WHERE DE SEU SELECT (FILTRO) TENTE SER RESTRINGIDA NÃO IRÁ CONSEGUIR.
 
 CREATE OR REPLACE VIEW VEMPLOYEESDEPT100
   AS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
        FROM EMPLOYEES
       WHERE DEPARTMENT_ID = 100
       WITH CHECK OPTION CONSTRAINT VEMPLOYEEDEPT100_CK;
       
       select *
        from VEMPLOYEESDEPT100
        
         insert into VEMPLOYEESDEPT100(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY) values (102,'banana','maça',90,989);
         
===== UTILIZANDO A CLAUSULA  READ ONLY =====

Bom comandos DML não irão funcionar de jeito nenhum aqui

CREATE OR REPLACE VIEW VEMPLOYEEDEPT20
  AS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
       FROM EMPLOYEES
      WHERE DEPARTMENT_ID = 20
       WITH READ ONLY;
       
==== REMOVENDO VIEW ====

DROP VIEW VEMPLOYEEDEPT20;

Nada ocorre com os objetos referenciados na view, seja valores e ou tabelas que a mesma referenciar
só irá focar na view.
    
        
 