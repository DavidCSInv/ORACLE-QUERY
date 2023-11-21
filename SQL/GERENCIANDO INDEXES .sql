================ CRIANDO E GERENCIANDO INDICES ===========

INDICE - � UM OBJETO DE SCHEMA QUE � UM IDEPENDENTE DA TABELA QUE ELE INDEXA � UTILIZADO PARA GANHO DE PERFORMANCE

� CRIADO JUNTAMENTE DE CONSTRAINTS DE PRIMARY KEY E UNIQUE, MAS PODEM SER CRIADAS MANUALMENTE TAMBEM 
Manualmente nos n�o criamos itens unicos por que isto j� � feito pelo banco de dados ao informar os seus PK OU U

============= SINTAXE ==================

CREATE [UNIQUE][BITMAP]INDEX NOME_INDICE
ON NOME_TABELA (nome_coluna[,nome_coluna])

========= CRIANDO INDEX ==============

DROP INDEX EMP_NAME_IX;
DROP INDEX EMPLOYEES_LAST_NAME_IDX;

SELECT *
  FROM EMPLOYEES 
WHERE LAST_NAME = 'Himuro';

CREATE INDEX EMPLOYEES_LAST_NAME_IDX
ON EMPLOYEES(LAST_NAME); --ESTA � UMA FORMA SIMPLES QUE BUSCA O ROWID DO COMANDO

===== CRIANDO INDEX COMPOSTO DE DUAS COLUNAS ===========

CREATE INDEX EMPLOYEES_LAST_NAME_FIRST_NAME_IDX
    ON EMPLOYEES (LAST_NAME,FIRST_NAME)

==== ANALISANDO O CUSTO DO COMANDO NO PLANO DE EXECU��O =========

SELECT * 
  FROM EMPLOYEES 
 WHERE LAST_NAME = 'Himuro'
   AND First_name = 'Guy'
   
==== Rconstruindo e reorganizando um indice ========

Toda aplica��o ao ser feita a dele��o pode ocorrer do index estar ocorrendo problema.
De certo modo � necessario recriar esse index para seu melhor funcionamento.

ALTER INDEX EMPLOYEES_LAST_NAME_FIRST_NAME_IDX REBUILD

====== consultar o index do usuario =============

select ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
  from user_indexes ix
  join user_ind_columns ic on (IC.INDEX_NAME = IX.INDEX_NAME)
                           AND (IC.TABLE_NAME = IX.TABLE_NAME)
WHERE IX.TABLE_NAME = 'EMPLOYEES'
ORDER BY IX.INDEX_NAME,IC.COLUMN_POSITION

======= REMO��O DE INDEX ===========

DROP INDEX O NOME DO INDEX