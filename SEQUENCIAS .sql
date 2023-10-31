============ CRIANDO E GERENCIANDO SEQUENCIAS ===========

Sequencies - tem a fun��o de gerar numeros em sequencias automaticamente sem que seja necessario informar em seu codigo
mas utilizados em chaves primarias.

Podendo ser otimizado a performance ao utilizar o CACHE de memoria.

� muito importante criar uma sequence para cada  tabela

=========== SINTAXE DE CRIA��O ================

N - UM OU MAIS NUMEROS INFORMADOS 

CREATE SEQUENCE (NOME) [INCREMENT BY N] - 'INCREMENTE POR'
[START WITH N] - 'COMECE COM' 
[{MAXVALUE N}| [NOMAXVALUE]] 
[{MINVALUE N}| [NOMINVALUE]]
[{CYCLE}| {NOCYCLE}] - 'QUANDO FOR EXECUTADO COM OS PARAMETROS ACIMA DE NUMEROS MAXIMOS OU MINIMOS, A PARTIR DE QUE CHEGUE NO NUMERO ELE COME�A DE NOVO'
[{CACHE N}| {NOCACHE}] - 'QUANDO FOR PEDIDO O NUMERO DE CACHE'

==========CRIANDO AS SEQUENCES =========

SELECT MAX (EMPLOYEE_ID)
  FROM EMPLOYEES;

DROP SEQUENCE EMPLOYEES_SEQ

CREATE SEQUENCE EMPLOYEES_SEQ
START WITH 210
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

====== CONSULTANDO SEQUENCES DO USUARIO ==============

 SELECT * 
   FROM USER_SEQUENCES;
   
======== PSEUDOCOLUNAS NEXTVAL E CURRVAL ============

para que possamos utilizar sequencias � necessario utilizar os seguintes comandos :

NEXTVAL - RETORNA O PROXIMO VALOR DA SEQUENCIA,SENDO ELE UNICO CADA VEZ QUE REFERENCIADO,N�O IMPORTANDO SE REFERENCIADO POR OUTRO USUARIO

CURRVAL - RETORNA O VALOR CORRENTE DA SEQUENCIA

ATEN��O : Na sess�o � necessario ser realizado uma referencia a pseudocoluna NEXTVAL antes de referencair a pseudocoluna CURRVAL

======= UTILIZANDO O NEXTVAL ============

SELECT EMPLOYEES_SEQ.NEXTVAL
  FROM DUAL;
  
MUITO CUIDADO POIS A PARTIR DO MOMENTO EM QUE VOC� CHAMA O NEXTVAL ELE CRIA O NUMERO REQUISITADO  
PODENDO ASSIM GERAR BURACOS NA NUMERO��O

Caso queira recome�ar esta numera��o sera necessario RECRIAR A SEQUENCIA DO ZERO
  
===== UTILIZANDO O CURRVAL ============

SELECT EMPLOYEES_SEQ.CURRVAL
  FROM DUAL;

====== MODO PRATICO DE UMA SEQUENCIA ==========

INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID)
VALUES (EMPLOYEES_SEQ.NEXTVAL,'Paul','Simon','PSIMO','525.342.237',TO_DATE('12/02/2020','DD/MM/YYYY'),'IT_PROG',15000,NULL,103,60);

COMMIT;

SELECT *
  FROM EMPLOYEES
  ORDER BY 1 DESC;
  
OBS : CASO O SEU INSERT DE UM AUTO ROLLBACK OU VOC� REALIZE O ROLLBACK, ELE IR� UTILIZAR MESMO ASSIM O NUMERO DA SEQUENCIA

======== ALTERANDO SEQUENCE ==============

ALTER SEQUENCE EMPLOYEES_SEQ
MAXVALUE 99999
CACHE 20

CACHE - seria basicamente um lote de requisi��o em quem caso um usuario queira utilizar a mesma se��o que voc�, o mesmo ira utilizar um lote da memoria do computador
caso ocorra uma queda no banco de dados ir� come�ar pela nova se��o ou se a sua se��o for fechada.

ALTER SEQUENCE - Pode ser alterado qualquer parametro e partir da altera��o ir� utilizar o que foi informado.
               - N�o se pode alterar STARWITH,
               - Sofre por valida��es tambem n�o se pode definir uma maxvalue de 1000 onde j� tem 5000 n�o ira autorizar
               - � necessario ser o dono e ou privilegios de alterar a sequence



