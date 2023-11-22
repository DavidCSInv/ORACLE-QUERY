 ========= BLOCOS DE ANINHAMENTO E ESCOPO DE IDENTIFICADOR (VARIAVEIS E CONSTANTES) ==================
 
 SET SERVEROUTPUT ON;
 
 DECLARE 
       VBLOCO1 VARCHAR2(20) := 'BANANA';
  BEGIN 
       DBMS_OUTPUT.PUT_LINE ('Referenciando variavel do bloco 1 =  ' || VBLOCO1);
       DECLARE
       VBLOCO2 VARCHAR(20) := 'Biscoito';
       
       BEGIN
       
       DBMS_OUTPUT.PUT_LINE ('Referenciando variavel do bloco 1 =  ' || VBLOCO1);
       DBMS_OUTPUT.PUT_LINE ('Referenciando variavel do bloco 2 =  ' || VBLOCO2);
       END;
       -- SE CHAMAR VARIAVEIS QUE JÁ FORAM TERMINADAS EM BLOCOS ANTERIORES IRA DAR ERRO
       DBMS_OUTPUT.PUT_LINE ('Referenciando variavel do bloco 1 =  ' || VBLOCO1);
end;
       