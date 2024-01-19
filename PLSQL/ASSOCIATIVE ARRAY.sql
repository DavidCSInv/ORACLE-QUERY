==== COLLECTIONS ====

COLLECTIONS S�O ESTRUTURAS DE DADOS UTILIZADAS PARA GERENCIAMENTO DE MULTIPLAS LINHAS DE DADOS

COLLECTIONS S�O LISTAS(VETORES)

===== ASSOCIATIVE ARRAY =========

- � uma estrutura unidimensional de tipos de dados.

- Registro e tipos podem ser definidos pelos usuarios (VARCHAR2 e 1,2,3)

- Pode-se indexar valores numericos ou caracteres,permite buracos na numera��o tambem
 EX : [2, ,4,5,6,8,-1,-4,0]

- � semelhante a um vetor,n�o pode ser armazenada no banco de dados

- Em sua indexa��o de valores sera aceita valores positivos,negativos,zero e string de caracteres.

- � obrigatorio utilizar a clausula INDEX BY na defini��o de seu tipo

SINTAX BASE :

DECLARE 
 TYPE nome_table_type
 IS TABLE OF  nome_tabela.nome_coluna%type -- tambem se pode indicar o seu tipo como num declare normal nome_tabela VARCHAR2
 INDEX BY BINARY_INTEGER;  --(TIPO, NUMBER,VARCHAR2,ETC.)
 
 nome_variavel_table nome_tipo_table;
 
 ====== REFERENCIANDO UM ASSOCIATIVE ARRAY  ======
 
 BEGIN 
 NOME_VARIAVEL_TABLE(INDICE) := VALOR|EXPRESS�O;
 
 EXEMPLO :
 
 DECLARE
    TYPE NUMERO_TABLE_TYPE 
    IS TABLE OF NUMBER (2)
    INDEX BY BINARY_INTEGER;
    
NUMERO_TABLE NUMERO_TABLE_TYPE;


SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE 
    TYPE NUMERO_TABLE_TYPE 
    IS  TABLE OF NUMBER (2)
    INDEX BY BINARY_INTEGER;
    
NUMERO_TABLE NUMERO_TABLE_TYPE;

BEGIN 
-- ARMAZENA NUMEROS DE 1 A 10 EM UM ASSOCIATIVE ARRAY
 FOR i in 1..10
 
 LOOP 
    NUMERO_TABLE (i) := i;
 END LOOP;
 
 FOR i in 1..10
 LOOP 
  DBMS_OUTPUT.PUT_LINE('Associative arrya : INDICE  = ' || TO_CHAR (i) || ', Valor recebido = ' || TO_CHAR (NUMERO_TABLE(i)));  
 END LOOP;
 END;