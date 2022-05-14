
--(a) Pasar los datos de las 7 tablas del esquema HR al esquema RH.

INSERT INTO REGIONES_DAMC SELECT * FROM HR.REGIONS;

INSERT INTO LOCALIZACION_DAMC SELECT * FROM HR.LOCATIONS;

INSERT INTO PAISES_DAMC SELECT * FROM HR.COUNTRIES;

INSERT INTO TRABAJOS_DAMC(TRABAJO_ID, TITULO_TRABAJO, SALARIO_MIN, SALARIO_MAX) 
    SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY FROM HR.JOBS;

INSERT INTO DEPARTAMENTOS_DAMC(DEPARTAMENTO_ID, NOMBRE_DEPARTAMENTO, LOCALIZACION_ID) 
    SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM HR.DEPARTMENTS;
    
INSERT INTO EMPLEADOS_DAMC(EMPLEADO_ID, NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CORREO_ELECTRONICO,NUMERO_TELEFONO,FECHA_CONTRATACION,TRABAJO_ID,SALARIO,COMISION_PCT,DEPARTAMENTO_ID) 
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID FROM HR.EMPLOYEES;
    
INSERT INTO HISTORIA_LABORAL_DAMC(EMPLEADO_ID,FECHA_INICIO, FECHA_FINAL, TRABAJO_ID, DEPARTAMENTO_ID) 
    SELECT EMPLOYEE_ID, START_DATE, END_DATE,JOB_ID,DEPARTMENT_ID FROM HR.JOB_HISTORY;
    
    
SELECT * FROM REGIONES_DAMC;
SELECT * FROM HR.REGIONS;
--REGIONES SI

SELECT * FROM LOCALIZACION_DAMC;
SELECT  * FROM HR.LOCATIONS;
--LOCALIZACIONES SI

SELECT * FROM TRABAJOS_DAMC;
SELECT * FROM HR.JOBS;
--TRABAJOS SI
SELECT * FROM PAISES_DAMC;
SELECT * FROM HR.COUNTRIES;
--PAISES SI
SELECT * FROM HISTORIA_LABORAL_DAMC;
SELECT * FROM HR.JOB_HISTORY;
--HISTORIA LABORAL NO

SELECT * FROM EMPLEADOS_DAMC;
SELECT * FROM HR.EMPLOYEES;
--EMPLEADOS NO

SELECT * FROM DEPARTAMENTOS_DAMC;
SELECT * FROM HR.DEPARTMENTS;
--DEPARTAMENTOS SI PERO SIN EL MANAGER_ID -- ERRORES CONSTANTES


DESCRIBE TRABAJOS_DAMC;
DESCRIBE HR.JOBS;
DESCRIBE HISTORIA_LABORAL_DAMC;
DESCRIBE HR.JOB_HISTORY;
DESCRIBE EMPLEADOS_DAMC;
DESCRIBE HR.EMPLOYEES;
DESCRIBE DEPARTAMENTOS_DAMC;
DESCRIBE HR.DEPARTMENTS;

/*REGISTROS*/
--b) Insertar 5 registros a cada tabla de RH haciendo uso de las secuencias elaboradas en el Cap�tulo 11.


--5 REGIONES
INSERT INTO REGIONES_DAMC VALUES (
SEQ_REGIONES_ID.NextVal,
'Oceania');

INSERT INTO REGIONES_DAMC VALUES (
SEQ_REGIONES_ID.NextVal,
'Latin America');

INSERT INTO REGIONES_DAMC VALUES (
SEQ_REGIONES_ID.NextVal,
'South Africa');

INSERT INTO REGIONES_DAMC VALUES (
SEQ_REGIONES_ID.NextVal,
'North Africa');

INSERT INTO REGIONES_DAMC VALUES (
SEQ_REGIONES_ID.NextVal,
'South America');

COMMIT;

DESCRIBE LOCALIZACION_DAMC;
--5 LOCALIZACIONES
INSERT INTO LOCALIZACION_DAMC VALUES (
SEQ_LOCALIZACION_ID.NextVal,
'De la Mora', '98607','Guadalupe', 'Zacatecas', 'MX');

INSERT INTO LOCALIZACION_DAMC VALUES (
SEQ_LOCALIZACION_ID.NextVal,
'Ferrocarril', '98600','Guadalupe', 'Zacatecas', 'MX');

INSERT INTO LOCALIZACION_DAMC VALUES (
SEQ_LOCALIZACION_ID.NextVal,
'El caminito', '31662','Buenos Aires', 'Argentina', 'AR');

INSERT INTO LOCALIZACION_DAMC VALUES (
SEQ_LOCALIZACION_ID.NextVal,
'Colmar', '68000','Colmar', 'Gran Este', 'FR');


INSERT INTO LOCALIZACION_DAMC VALUES (
SEQ_LOCALIZACION_ID.NextVal,
'Isla de burano', '98600','Burano', 'Venecia', 'IT'); --ERROR A PROPOSITO PARA UPDATE

COMMIT;

--consultar para revisar
DESCRIBE DEPARTAMENTOS_DAMC;
SELECT * FROM DEPARTAMENTOS_DAMC;
SELECT * FROM LOCALIZACION_DAMC;
--5 DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS_DAMC VALUES (
SEQ_DEPARTAMENTO_ID.NextVal,'Infrastructures area',null,1500); 

INSERT INTO DEPARTAMENTOS_DAMC VALUES (
SEQ_DEPARTAMENTO_ID.NextVal,'IA Systems',null,1500); 

INSERT INTO DEPARTAMENTOS_DAMC VALUES (
SEQ_DEPARTAMENTO_ID.NextVal,'Bussiness area',null,1600); 

INSERT INTO DEPARTAMENTOS_DAMC VALUES (
SEQ_DEPARTAMENTO_ID.NextVal,'New Tecnologies',null,2500); 


INSERT INTO DEPARTAMENTOS_DAMC VALUES (
SEQ_DEPARTAMENTO_ID.NextVal,'Customer Service',null,1800); 

COMMIT;

--5 EMPLEADOS
DESCRIBE EMPLEADOS_DAMC;
SELECT * FROM EMPLEADOS_DAMC;
SELECT * FROM DEPARTAMENTOS_DAMC;
select * from trabajos_damc;


INSERT INTO EMPLEADOS_DAMC VALUES (
SEQUENCE_EMPLEADO_ID.NextVal,'Daniel', 'Morales','amcdany@gmail.com', '492.219.0147', '15/08/1999','IT_PROG', 17000, NULL,NULL, 320);  --ERROR A PROPOSITO

INSERT INTO EMPLEADOS_DAMC VALUES (
SEQ_EMPLEADO_ID.NextVal,'Jhon', 'Cena','jhoncen@gmail.com', '650.503.9899', '02/08/2012','SH_CLERK', 10000, NULL,NULL, 320); 

INSERT INTO EMPLEADOS_DAMC VALUES (
SEQ_EMPLEADO_ID.NextVal,'Jim', 'Morrinson','jimmo@hotmail.com', '650.507.7686', '06/12/2014','SH_CLERK', 12000, NULL,NULL, 110); 

INSERT INTO EMPLEADOS_DAMC VALUES (
SEQ_EMPLEADO_ID.NextVal,'Ismael', 'Morales','ismalife@gmail.com', '492.121.7597', '01/01/2017','IT_PROG', 20000, NULL,NULL, 300); 


INSERT INTO EMPLEADOS_DAMC VALUES (
SEQ_EMPLEADO_ID.NextVal,'Cristian', 'Bale','cristbal@gmail.com', '650.503.9899', '02/10/2011','IT_PROG', 10000, NULL,NULL, 230); 


COMMIT;

/*SELECTS*/
--c) Escribir las sentencias SELECT para observar el comportamiento de 
--los datos insertados en el punto 2.

SELECT * FROM REGIONES_DAMC;
SELECT * FROM LOCALIZACION_DAMC;
SELECT * FROM EMPLEADOS_DAMC;
SELECT * FROM DEPARTAMENTOS_DAMC;

/*COMMIT*/
--d) Ejecutar la sentencia COMMIT para que las inserciones queden de forma permanente en la Base de Datos.

COMMIT;


/*UPDATE*/
--e) Ejecutar 5 sentencias UPDATE para modificar datos a su criterio en el esquema RH.

UPDATE REGIONES_DAMC SET NOMBRE_REGION = 'Middle East'
WHERE NOMBRE_REGION = 'Middle East and Africa';

UPDATE LOCALIZACION_DAMC SET DIRECCION_CALLE = 'Colmar City'
WHERE DIRECCION_CALLE = 'Colmar';

UPDATE EMPLEADOS_DAMC SET CORREO_ELECTRONICO = 'amcdanymx@gmail.com'
WHERE CORREO_ELECTRONICO = 'amcdany@gmail.com';

UPDATE DEPARTAMENTOS_DAMC SET NOMBRE_DEPARTAMENTO = 'Bussiness area TI'
WHERE NOMBRE_DEPARTAMENTO = 'Bussiness area';

UPDATE EMPLEADOS_DAMC SET SALARIO = 5000
WHERE SALARIO = 4800;


COMMIT;

SELECT * FROM REGIONES_DAMC;
SELECT * FROM LOCALIZACION_DAMC;
SELECT * FROM EMPLEADOS_DAMC;
SELECT * FROM DEPARTAMENTOS_DAMC;

--f) Ejecutar 5 sentencias DELETE para eliminar datos a su criterio en el esquema RH.

DELETE FROM EMPLEADOS_DAMC
WHERE NUMERO_TELEFONO = '492.219.0147';

DELETE FROM LOCALIZACION_DAMC
WHERE CODIGO_POSTAL = '98600';

DELETE FROM LOCALIZACION_DAMC
WHERE CODIGO_POSTAL = '98600';

DELETE FROM HISTORIA_LABORAL_DAMC
WHERE FECHA_FINAL = '31/12/07';

DELETE FROM TRABAJOS_DAMC
WHERE SALARIO_MIN < 3000;

COMMIT;

SELECT * FROM REGIONES_DAMC;
SELECT * FROM LOCALIZACION_DAMC;
SELECT * FROM EMPLEADOS_DAMC;
SELECT * FROM HISTORIA_LABORAL_DAMC;
SELECT * FROM TRABAJOS_DAMC;

--g) Elaborar las sentencias necesarias sobre el control de transacciones, haciendo uso de la siguiente estructura:
--1
SELECT * FROM EMPLEADOS_DAMC;
UPDATE REGIONES_DAMC SET NOMBRE_REGION = 'Middle East'
WHERE NOMBRE_REGION = 'Middle East and Africa';
SELECT * FROM REGIONES_DAMC;
DELETE FROM EMPLEADOS_DAMC
WHERE NUMERO_TELEFONO = '492.219.0147';
COMMIT;

--2
SELECT * FROM REGIONES_DAMC;
SELECT * FROM DEPARTAMENTOS_DAMC;
UPDATE DEPARTAMENTOS_DAMC SET NOMBRE_DEPARTAMENTO = 'IA DEVELOPMENT'
WHERE NOMBRE_DEPARTAMENTO = 'IA Systems';
SAVEPOINT DEPS_SP;
SELECT * FROM EMPLEADOS_DAMC;
DELETE FROM EMPLEADOS_DAMC
WHERE NOMBRE_EMPLEADO = 'Susan';
SELECT * FROM EMPLEADOS_DAMC;
SAVEPOINT DELETE_EMPLEADOS_SUSAN;
INSERT INTO EMPLEADOS_DAMC VALUES (
SEQUENCE_EMPLEADO_ID.NextVal,'Juan', 'Castro','juanca@gmail.com', '492.222.0347', '17/08/2009','IT_PROG', 17000, NULL,NULL, 320); 
SELECT * FROM EMPLEADOS_DAMC;
ROLLBACK TO DEPS_SP;
SELECT * FROM EMPLEADOS_DAMC;
ROLLBACK;
SELECT * FROM REGIONES_DAMC;


--3
DESCRIBE PAISES_DAMC;
SELECT * FROM PAISES_DAMC;
UPDATE PAISES_DAMC SET PAIS_ID = 'IS'
WHERE NOMBRE_PAIS = 'Israel';
SELECT * FROM HISTORIA_LABORAL_DAMC;
COMMIT;
SELECT * FROM LOCALIZACION_DAMC;

--4
DESCRIBE TRABAJOS_DAMC;
SELECT * FROM TRABAJOS_DAMC;

UPDATE TRABAJOS_DAMC SET TITULO_TRABAJO = 'Programmer SE'
WHERE TITULO_TRABAJO = 'Programmer'; 
SELECT * FROM TRABAJOS_DAMC;
SELECT * FROM HISTORIA_LABORAL_DAMC;
UPDATE HISTORIA_LABORAL_DAMC SET TRABAJO_ID = 'IT_PROG'
WHERE EMPLEADO_ID = 1; 
COMMIT;
SELECT * FROM HISTORIA_LABORAL_DAMC;
SELECT * FROM REGIONES_DAMC;
COMMIT;

SELECT * FROM PAISES_DAMC;

UPDATE PAISES_DAMC SET NOMBRE_PAIS = 'EUA'
WHERE NOMBRE_PAIS = 'United States of America';
SELECT * FROM PAISES_DAMC;
DELETE FROM PAISES_DAMC
WHERE NOMBRE_PAIS = 'Kuwait';
SELECT * FROM PAISES_DAMC;

CREATE TABLE COPA_MUNDIAL(
ID_PAIS VARCHAR2(10),
TITULOS_WC VARCHAR2(10),
POS_DECAMPEON VARCHAR2(10)
);

ROLLBACK;

SELECT * FROM COPA_MUNDIAL;

