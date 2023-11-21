============ CRIANDO E GERENCIANDO SEQUENCIAS ===========

Sequencies - tem a função de gerar numeros em sequencias automaticamente sem que seja necessario informar em seu codigo
mas utilizados em chaves primarias.

Podendo ser otimizado a performance ao utilizar o CACHE de memoria.

É muito importante criar uma sequence para cada  tabela

=========== SINTAXE DE CRIAÇÃO ================

N - UM OU MAIS NUMEROS INFORMADOS 

CREATE SEQUENCE (NOME) [INCREMENT BY N] - 'INCREMENTE POR'
[START WITH N] - 'COMECE COM' 
[{MAXVALUE N}| [NOMAXVALUE]] 
[{MINVALUE N}| [NOMINVALUE]]
[{CYCLE}| {NOCYCLE}] - 'QUANDO FOR EXECUTADO COM OS PARAMETROS ACIMA DE NUMEROS MAXIMOS OU MINIMOS, A PARTIR DE QUE CHEGUE NO NUMERO ELE COMEÇA DE NOVO'
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

para que possamos utilizar sequencias é necessario utilizar os seguintes comandos :

NEXTVAL - RETORNA O PROXIMO VALOR DA SEQUENCIA,SENDO ELE UNICO CADA VEZ QUE REFERENCIADO,NÃO IMPORTANDO SE REFERENCIADO POR OUTRO USUARIO

CURRVAL - RETORNA O VALOR CORRENTE DA SEQUENCIA

ATENÇÃO : Na sessão é necessario ser realizado uma referencia a pseudocoluna NEXTVAL antes de referencair a pseudocoluna CURRVAL

======= UTILIZANDO O NEXTVAL ============

SELECT EMPLOYEES_SEQ.NEXTVAL
  FROM DUAL;
  
MUITO CUIDADO POIS A PARTIR DO MOMENTO EM QUE VOCÊ CHAMA O NEXTVAL ELE CRIA O NUMERO REQUISITADO  
PODENDO ASSIM GERAR BURACOS NA NUMEROÇÃO

Caso queira recomeçar esta numeração sera necessario RECRIAR A SEQUENCIA DO ZERO
  
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
  
OBS : CASO O SEU INSERT DE UM AUTO ROLLBACK OU VOCê REALIZE O ROLLBACK, ELE IRÁ UTILIZAR MESMO ASSIM O NUMERO DA SEQUENCIA

======== ALTERANDO SEQUENCE ==============

ALTER SEQUENCE EMPLOYEES_SEQ
MAXVALUE 99999
CACHE 20

CACHE - seria basicamente um lote de requisição em quem caso um usuario queira utilizar a mesma seção que você, o mesmo ira utilizar um lote da memoria do computador
caso ocorra uma queda no banco de dados irá começar pela nova seção ou se a sua seção for fechada.

ALTER SEQUENCE - Pode ser alterado qualquer parametro e partir da alteração irá utilizar o que foi informado.
               - Não se pode alterar STARWITH,
               - Sofre por validações tambem não se pode definir uma maxvalue de 1000 onde já tem 5000 não ira autorizar
               - É necessario ser o dono e ou privilegios de alterar a sequence



