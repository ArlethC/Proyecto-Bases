
-- -----------------------------------------------------------------------------------
-- Autor           	: Oscar Hernandez
-- Descripcion      : Archivo maestro que ejecuta los scripts en la secuencia requerida
-- Servidor       	: ip del servidor
-- Fecha          	: 13Enero2023
-- -----------------------------------------------------------------------------------
SET DEFINE OFF
SET VERIFY ON
SET HEADING OFF
SET FEEDBACK OFF

spool  !RUN_UNDO_BDD_2023.log

PROMPT *** Iniciando la Ejecucion de Comandos ****

Select banner from v$version;

select 'Instancia=' || sys_context('USERENV','DB_NAME') as INSTANCIA FROM DUAL
UNION ALL
select 'Database =' || global_name from global_name
UNION ALL
Select 'Usuario  =' || USER AS USUARIO FROM DUAL
UNION ALL
Select 'Fecha    =' || to_char(SYSDATE,'DD/MON/YYYY HH:MM:SS AM') AS FECHA FROM DUAL;


SET HEADING ON
SET FEEDBACK ON
SET ECHO ON

Prompt ***Inicio***

Prompt ***DDL***
Prompt ./DDL/PERSONA.sql
@ ./DDL/PERSONA.sql

Prompt ***DML***

Prompt ./DML/PERSONA.sql
@ ./DML/PERSONA.sql

COMMIT;

PROMPT ----------------------------------------------------------------------------------
PROMPT    FIN DE EJECUCION DE SCRIPTS
PROMPT ----------------------------------------------------------------------------------

spool off