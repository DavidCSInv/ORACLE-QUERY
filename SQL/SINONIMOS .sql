======= GERENCIANDO SINONIMOS E CRIANDO ========

OS Sinonimos como o nome implica é para ser feita um sinonimo para uma tabela, podendo ser referenciadas 
de outro modo.

=== CRIANDO SINONIMOS PRIVADOS ============

Pode ser criados sinonimos somente para o usuario que os referenciaram 
Porém o DBA deve permitir o uso do comando SYNONYM

CREATE SYNONYM DEPARTAMENTOS 
  FOR DEPARTMENTS;
  
CREATE SYNONYM DEPT
  FOR DEPARTMENTS;

Agora se pode utilizar em seu SELECT os dois como os seus sinonimos

SELECT *
  FROM DEPT;

SELECT *
  FROM DEPARTAMENTOS;
  
====== REMOVENDO SINONIMOS =========

DROP SYNONYM DEPT;

DROP SYNONYM DEPARTAMENTOS;

===== CRIANDO SINONIMOS PUBLICOS ===========

======== CRIANDO SINONIMOS PUBLICOS =========

CREATE PUBLIC SYNONYM DEPT
FOR HR.DEPARTMENTS;

CREATE PUBLIC SYNONYM DEPARTAMENTOS
FOR HR.DEPARTMENTS;

CRIAR SINONIMOS PUBLICOS SOMENTE O DBA.

DROP PUBLIC SYNONYM DEPARTAMENTOS;

DROP PUBLIC SYNONYM DEPT;