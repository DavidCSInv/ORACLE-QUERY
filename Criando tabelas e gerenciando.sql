============ Criando e Gerenciando Tabelas ==============

SELECT *
FROM   user_objects
ORDER BY Object_type;

-- Criando Tabelas

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 DESC projects
 
 SELECT *
 FROM projects;
 
DROP TABLE TEAMS;

CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL);

-- Consultando a Estrutura da Tabela

DESC projects;

DESC teams;

-- Tipo ROWID

DESC employees

O TIPO ROWID É O ENDEREÇO LOGICO FISICO DE UMA COLUNA E TABELA, O MESMO É O JEITO DE SE CONSULTAR MAIS RAPIDO
POIS SE FAZ A CONSULTA A NIVEL ARQUIVO E PEGA A INFORMAÇÃO PRECISAMENTE.

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees
WHERE rowid = 'AAAR6YAAEAAALBbAAE';

-- Consultando as Tabelas existentes pelo DicionÃ¡rio de Dados

DESC user_tables

SELECT table_name
FROM   user_tables;

-- Consultando os Objetos do tipo TABLE do usuÃ¡rio

DESC user_objects

SELECT object_name, object_type
FROM   user_objects
WHERE  object_type = 'TABLE';

-- Criando uma Tabela utilizando uma Sub-consulta

DROP TABLE employees_department60;

 Este utiliza de um select de uma tabela já existente para criar mais uma já com as informações de outra, podendo seu ALIAS ser o nome da coluna
 
CREATE TABLE employees_department60
AS
SELECT employee_id, last_name,salary*12 ANNSAL, hire_date
FROM employees
WHERE department_id = 60;

DESC employees_department60

SELECT *
FROM   employees_department60;

-- TRUNCATE TABLE

Truncate acaba que corta e limpa todas as informações, o mesmo não gera algum metodo de retorno ao seu antigo estado.

TRUNCATE TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- DROP TABLE

DROP TABLE employees_department60;


Tambem há caso a tabela tenha diversas primary keys não ira permitir ser apagada é necessario fazer da seguinte maneira

DROP TABLE employees_department60 CASCADE CONSTRAINTS - APAGA MESMO QUE TENHA ALGUMAS PRIMARY KEYS

E caso não queira que a mesma vá para a lixeira do seu banco - PURGE APAGA DE VEZ

DROP TABLE employees_department60 CASCADE CONSTRAINTS PURGE

SELECT *
FROM   employees_department60;

-- Consultando a Lixeira

SELECT *
FROM user_recyclebin;