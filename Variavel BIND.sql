 ============= COMANDO BIND OU VARIABLE ============
 
 BIND - SERVE PARA FAZER COM QUE UM BLOCO DE PL/SQL, RODE EM OUTRAS LINGUAGENS DE PROGRAMA��O
 VARIABLE - � UTILIZADO PARA DECLARAR UMA VARIAVEL BIND NO SQL*PLUS E NO SQL DEVOLPER
 
 PARA DECLARAR UMA VARIAVEL QUE ESTA FORA DO BLOCO BEGIN � NECESSARIO INDICAR ATRAV�S DO (:)
 
 VARIABLE GNUMERO NUMBER
 
 SET SERVEROUTPU ON;
 
 VARIABLE GMEDIA NUMBER;
 
 DECLARE 
     VNUMERO1 NUMBER (11,2) := 2000;
     VNUMERO2 NUMBER (11,2) := 5000;
 BEGIN
     :GMEDIA := (VNUMERO1 + VNUMERO2)/2;
     DBMS_OUTPUT.PUT_LINE ('Media = ' || TO_CHAR (:GMEDIA));
EXCEPTION 
 WHEN OTHERS
            THEN 
 DBMS_OUTPUT.PUT_LINE ('Erro oracle : ' || SQLCODE || SQLERRM);
 END;
 