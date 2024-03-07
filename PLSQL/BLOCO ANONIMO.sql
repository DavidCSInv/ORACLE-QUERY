 =============== BLOCO ANONIMO =================
 
 
- DECLARE - BEGIN - EXCEPTION-
 
 DECLARE - CONTEM A DECLARA??O DE VARIAVEIS,CONSTANTES,CURSORES E EXCE??ES DEFINIDAS PELO USUARIO - PARA PROCEDURE ? OPCIONAL
 
 BEGIN - CONTEM OS COAMANDOS SQL E PL/SQL QUE SER?O EXECUTADOS NO BLOCO. - ? obrigatorio.
 
 EXCEPTION - Contem a?oes a serem executadas para tratamento das exce??es que forem disparadas pelos comandos na se??o BEGIN
 
 ===========================================================================================================================================
 
 DBMS_OUTPUT - PACKAGE PRE-FEITA DO BANCO DE DADOS QUE PODE IMPRIMIR O RESULTADO DA PROCEDURE(Mensagens ou para depurar)

PARA UTILIZAR A MESMA ? NECESSARIO HABILITAR UM BUFFER DE OUTPUT COM O COMANDO SET SERVEROUTPUT ON
PARA ALTERAR A VARIAVEL DE AMBIENTE.

DBMS_OUTPUT.PUT_LINE('Texto')



:= COMANDO DE INICIALIZA??O, SENDO COLOCADO UMA VARIAVEL PARA COME?AR, CASO N?O SEJA DECLARADO COME?A NO NULL

SINTAX DE UM BLOCO ANONIMO 

[DECLARE]
BEGIN 
[EXCEPTION]
END;
 
 
 
 EXEMPLO 
 SET SERVEROUTPUT ON
 
 DECLARE VNUMERO1 NUMBER (11,2) := 500;
         VNUMERO2 NUMBER (11,2):= 400;
         VMEDIA NUMBER (11,2);
 BEGIN 
  VMEDIA := (VNUMERO1 + VNUMERO2)/2;
  DBMS_OUTPUT.PUT_LINE ('MEDIA : ' || VMEDIA);
END;



 SET SERVEROUTPUT ON - HABILITA UM BUFFER DE SAIDA NA PACKAGE DBMS OUTPUT
  
 DECLARE VTEXTO VARCHAR2(100):= 'Seja bem vindo ao pl/sql';
 
 BEGIN 
    DBMS_OUTPUT.PUT_LINE(VTEXTO);
EXCEPTION 
      WHEN OTHERS 
      THEN 
      DBMS_OUTPUT.PUT_LINE('Erro oracle : ' || SQLCODE || SQLERRM);
END;

