/*TABLA DE PAIS*/
CREATE TABLE PAISES_DAMC(
PAIS_ID CHAR(2) CONSTRAINT PAIS_ID_NN NOT NULL,
NOMBRE_PAIS VARCHAR2(40),
REGION_ID NUMBER
);
--CREAMOS ALTER DE PIRMARY KEY DE PAIS
ALTER TABLE PAISES_DAMC ADD CONSTRAINT PAIS_ID_PK PRIMARY KEY(PAIS_ID);
--CREAMOS ALTER DE LLAVE FORANEA DE PAIS
ALTER TABLE PAISES_DAMC ADD CONSTRAINT REGION_ID_FK FOREIGN KEY (REGION_ID) REFERENCES REGIONES_DAMC(REGION_ID);

--*************************************************************************--

/*TABLA DE REGION*/
CREATE TABLE REGIONES_DAMC(
REGION_ID NUMBER CONSTRAINT REGION_ID_NN NOT NULL,
NOMBRE_REGION VARCHAR2(30)
);
--CREAMOS ALTER DE PIRMARY KEY DE REGION
ALTER TABLE REGIONES_DAMC ADD CONSTRAINT REGION_ID_PK PRIMARY KEY(REGION_ID);

--*************************************************************************--
/*TABLA DE TRABAJO*/

CREATE TABLE TRABAJOS_DAMC(
TRABAJO_ID VARCHAR2(10) CONSTRAINT TRABAJO_ID_TRABAJO_NN NOT NULL,
TITULO_TRABAJO VARCHAR2(35) CONSTRAINT TITULO_TRABAJO_NN NOT NULL,
SALARIO_MIN NUMBER(6),
SALARIO_MAX NUMBER(6)
);

--CREAMOS ALTER DE PIRMARY KEY DE TRABAJOS_DAMC
ALTER TABLE TRABAJOS_DAMC ADD CONSTRAINT TRABAJO_ID_PK PRIMARY KEY(TRABAJO_ID);

--*************************************************************************--

/*TABLA DE LOCALIZACION*/
CREATE TABLE LOCALIZACION_DAMC(
LOCALIZACION_ID NUMBER(4) CONSTRAINT LOCALIZACION_ID_L_NN NOT NULL,
DIRECCION_CALLE VARCHAR2(40),
CODIGO_POSTAL VARCHAR2(12),
CIUDAD VARCHAR2(30) CONSTRAINT CIUDAD_NN NOT NULL,
ESTADO_PROVINCIA VARCHAR2(25),
PAIS_ID CHAR(2)
);

--CREAMOS ALTER DE PIRMARY KEY DE LOCALIZACION_DAMC
ALTER TABLE LOCALIZACION_DAMC ADD CONSTRAINT LOCALIZACION_ID_PK PRIMARY KEY(LOCALIZACION_ID);

--CREAMOS ALTER DE LLAVE FORANEA DE LOCALIZACION_ID
ALTER TABLE LOCALIZACION_DAMC ADD CONSTRAINT PAIS_ID_FK FOREIGN KEY (PAIS_ID) REFERENCES PAISES_DAMC(PAIS_ID);


--*************************************************************************--

/*TABLA DE DEPARTAMENTOS*/
CREATE TABLE DEPARTAMENTOS_DAMC(
DEPARTAMENTO_ID NUMBER(4) CONSTRAINT DEPARTAMENTO_ID_NN NOT NULL,
NOMBRE_DEPARTAMENTO VARCHAR2(30) CONSTRAINT NOMBRE_DEPARTAMENTO_NN NOT NULL,
GERENTE_ID NUMBER(6),
LOCALIZACION_ID NUMBER(6)
);

--CREAMOS ALTER DE PIRMARY KEY DE DEPARTAMENTOS_DAMC
ALTER TABLE DEPARTAMENTOS_DAMC ADD CONSTRAINT DEPARTAMENTO_ID_D_PK PRIMARY KEY(DEPARTAMENTO_ID);

--CREAMOS ALTER DE FOREIGN KEY DE DEPARTAMENTOS_DAMC
ALTER TABLE DEPARTAMENTOS_DAMC ADD CONSTRAINT LOCALIZACION_ID_FK FOREIGN KEY (LOCALIZACION_ID) REFERENCES LOCALIZACION_DAMC(LOCALIZACION_ID);
ALTER TABLE DEPARTAMENTOS_DAMC ADD CONSTRAINT GERENTE_ID_FK FOREIGN KEY (GERENTE_ID) REFERENCES EMPLEADOS_DAMC(EMPLEADO_ID);


--*************************************************************************--

/*TABLA DE EMPLEADOS*/
CREATE TABLE EMPLEADOS_DAMC(
EMPLEADO_ID NUMBER(6) CONSTRAINT EMPLEADO_ID_NN NOT NULL,
NOMBRE_EMPLEADO VARCHAR2(20),
APELLIDO_EMPLEADO VARCHAR2(25) CONSTRAINT APELLIDO_EMPLEADO_NN NOT NULL,
CORREO_ELECTRONICO VARCHAR2(25) CONSTRAINT CORREO_ELECTRONICO_NN NOT NULL,
NUMERO_TELEFONO VARCHAR2(20),
FECHA_CONTRATACION DATE CONSTRAINT FECHA_CONTRATACION_NN NOT NULL, 
TRABAJO_ID VARCHAR2(10) CONSTRAINT TRABAJO_ID_NN NOT NULL,
SALARIO NUMBER(8,2),
COMISION_PCT NUMBER(2,2),
GERENTE_ID NUMBER(6),    
DEPARTAMENTO_ID NUMBER(4)
);

--CREAMOS ALTER DE PIRMARY KEY DE EMPLEADOS_DAMC
ALTER TABLE EMPLEADOS_DAMC ADD CONSTRAINT DEPARTAMENTO_ID_PK PRIMARY KEY(EMPLEADO_ID);
--CREAMOS ALTER DE FOREIGN KEY DE EMPLEADOS_DAMC
ALTER TABLE EMPLEADOS_DAMC ADD CONSTRAINT EMPLEADO_DEPT_FK FOREIGN KEY (DEPARTAMENTO_ID) REFERENCES DEPARTAMENTOS_DAMC(DEPARTAMENTO_ID);
ALTER TABLE EMPLEADOS_DAMC ADD CONSTRAINT EMPLEADO_TRABAJOS_FK FOREIGN KEY (TRABAJO_ID) REFERENCES TRABAJOS_DAMC(TRABAJO_ID);
--*************************************************************************--

/*TABLA DE HISTORIA LABORAL*/
CREATE TABLE HISTORIA_LABORAL_DAMC(
EMPLEADO_ID NUMBER(6) CONSTRAINT EMPLEADO_ID_HL_NN NOT NULL,
FECHA_INICIO DATE CONSTRAINT FECHA_INICIO_NN NOT NULL,
FECHA_FINAL DATE CONSTRAINT FECHA_FINAL_NN NOT NULL, 
TRABAJO_ID VARCHAR2(10) CONSTRAINT TRABAJO_ID_HL_NN NOT NULL,
DEPARTAMENTO_ID NUMBER(4)
);

ALTER TABLE HISTORIA_LABORAL_DAMC 
    ADD CONSTRAINT ID_FECHA_PK PRIMARY KEY ( EMPLEADO_ID, FECHA_INICIO ) ;
    
    ALTER TABLE HISTORIA_LABORAL_DAMC
    ADD CONSTRAINT REVISAR_FECHA 
    CHECK (FECHA_FINAL > FECHA_INICIO)
        INITIALLY IMMEDIATE 
        ENABLE 
        VALIDATE 
;


ALTER TABLE HISTORIA_LABORAL_DAMC ADD CONSTRAINT DEPARTAMENTO_ID_HL_FK FOREIGN KEY (DEPARTAMENTO_ID) REFERENCES DEPARTAMENTOS_DAMC(DEPARTAMENTO_ID);
ALTER TABLE HISTORIA_LABORAL_DAMC ADD CONSTRAINT EMP_ID_HL_FK FOREIGN KEY (EMPLEADO_ID) REFERENCES EMPLEADOS_DAMC(EMPLEADO_ID);
ALTER TABLE HISTORIA_LABORAL_DAMC ADD CONSTRAINT TRABAJO_ID_HL_FK FOREIGN KEY (TRABAJO_ID) REFERENCES TRABAJOS_DAMC(TRABAJO_ID);


--*************************************************************************--
DESCRIBE DEPARTAMENTOS_DAMC;
DESCRIBE EMPLEADOS_DAMC;
DESCRIBE HISTORIA_LABORAL_DAMC;
DESCRIBE LOCALIZACION_DAMC;
DESCRIBE PAISES_DAMC;
DESCRIBE REGIONES_DAMC;
DESCRIBE TRABAJOS_DAMC;

---BORRAR TABLAS

DROP TABLE DEPARTAMENTOS_DAMC;
DROP TABLE EMPLEADOS_DAMC;
DROP TABLE HISTORIA_LABORAL;
DROP TABLE LOCALIZACION_DAMC;
DROP TABLE PAISES_DAMC;
DROP TABLE REGIONES_DAMC;
DROP TABLE TRABAJOS_DAMC;