
         ===== LOOPS =========
         

LOOP - FOR LOOP - WHILE LOOP - EXIT - 

LOOP - Faz uma sequencia de comandos repetidademente

FOR LOOP - FORNECE UM CONTROLE DE REPETIÇÕES DE AÇÕES BASEADP EM UM CONTADOR

WHILE LOOP - Fornece um controle de repetições baseado em uma condição 

EXIT - SAI DO LOOP ENCERRANDO O MESMO.


SET SERVEROUTPUT ON;

====================LOOP BASICO ===================================

ACCEPT PLIMITE PROMPT 'DIGITE O VALOR DO LIMITE : '
DECLARE 
        VNUMERO NUMBER(38) := 1;
        VLIMITE NUMBER (38) := &PLIMITE;
BEGIN
        -- imprimindo numeros de 1 até o limite --
LOOP 
    DBMS_OUTPUT.PUT_LINE ('Numero = ' || to_char(VNUMERO));
    EXIT WHEN VNUMERO = VLIMITE;
    VNUMERO := VNUMERO + 1;
END LOOP;
END;

================== FOR LOOP ==================

ACCEPT PLMITE PROMPT 'Digite o valor limite : '

DECLARE 
        VINICIO INTEGER (3) := 1;
        VFIM    NUMBER (38) := &PLIMITE;
BEGIN 
        FOR i in VINICIO..VFIM LOOP 
          DBMS_OUTPUT.PUT_LINE ('Numero = ' || to_char(i));
  END LOOP;
  END;
  
  =========== WHILE LOOP ========

ACCEPT PLIMITE PROMPT 'Digite o valor limite : '

DECLARE 
      VNUMERO NUMBER (38) := 1;
      VLIMITE NUMBER (38) := &PLIMITE;

-- VARIAVEL INICIALIZADAS NA SEÇÃO DECLARE

 BEGIN 
 WHILE VNUMERO <= VLIMITE LOOP

    DBMS_OUTPUT.PUT_LINE ('Numero : ' || to_char(VNUMERO)); 
    VNUMERO := VNUMERO + 1 ;
   
    END LOOP;
END;


============ LOOPs aninhados e labels ===========

 DECLARE 
      VTOTAL NUMBER (38) := 1;
  BEGIN
     <<LOOP1>> --isso aqui é um label, voce ta colocando um nome no mesmo.
    FOR i in 1..8 loop
    DBMS_OUTPUT.PUT_LINE ('I : ' || to_char(i)); 
    <<LOOP2>>
    FOR j in 1..8 loop
    DBMS_OUTPUT.PUT_LINE ('J : ' || to_char(j));
    DBMS_OUTPUT.PUT_LINE ('TOTAL : ' || to_char(VTOTAL,'99G999G999G999G999G999G999G99D99'));
    VTOTAL := VTOTAL * 2;
--    EXIT WHEN VTOTAL = 200000000; -- EXIT SEM O LABEL ELE SÓ SAI DO LOOP CORRENTE (LOOP2) 
EXIT LOOP1 WHEN VTOTAL > 1000000000; -- ESTE VOCÊ SAI DO LOOP INDICADO PELA LABEL SENDO O LOOP1
END LOOP;
    DBMS_OUTPUT.PUT_LINE ('TOTAL FINAL : ' || to_char(VTOTAL,'99G999G999G999G999G999G999G99D99'));
END LOOP;
END;
    