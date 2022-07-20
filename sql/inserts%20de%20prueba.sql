CREATE TABLE TIENDA(
    codigo SERIAL,
    nombre VARCHAR(50) NOT NULL,
    minisweet BOOLEAN NOT NULL,
    CONSTRAINT pk_tienda PRIMARY KEY (codigo)
  );

CREATE TABLE departamento(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,
    descripcion CHARACTER VARYING(100),
    CONSTRAINT pk_departamento PRIMARY KEY(codigo)
  );

CREATE TABLE DEP_TIENDA(
    dt_departamento INTEGER not null,
    dt_tienda INTEGER not null,
    CONSTRAINT fk_dt_departamento FOREIGN KEY(dt_departamento) REFERENCES DEPARTAMENTO(codigo),
    CONSTRAINT fk_dt_tienda  FOREIGN KEY(dt_tienda)  REFERENCES TIENDA(codigo)
  );  

INSERT INTO TIENDA(nombre,minisweet) 
VALUES('mini sweet UCAB 1',TRUE);

insert into departamento (nombre, descripcion) values ('Jarid', 'Pantoprazole Sodium');
INSERT INTO DEP_TIENDA VALUES ((SELECT codigo FROM departamento WHERE nombre = 'Jarid'),(SELECT codigo FROM TIENDA WHERE nombre = 'mini sweet UCAB 1'));
insert into departamento (nombre, descripcion) values ('Davidde', 'Glipizide');
INSERT INTO DEP_TIENDA VALUES ((SELECT codigo FROM departamento WHERE nombre = 'Davidde'),(SELECT codigo FROM TIENDA WHERE nombre = 'mini sweet UCAB 1'));
insert into departamento (nombre, descripcion) values ('Albert', 'Aspirin');
INSERT INTO DEP_TIENDA VALUES ((SELECT codigo FROM departamento WHERE nombre = 'Albert'),(SELECT codigo FROM TIENDA WHERE nombre = 'mini sweet UCAB 1'));
insert into departamento (nombre, descripcion) values ('Sheff', 'OCTINOXATE');
INSERT INTO DEP_TIENDA VALUES ((SELECT codigo FROM departamento WHERE nombre = 'Sheff'),(SELECT codigo FROM TIENDA WHERE nombre = 'mini sweet UCAB 1'));
insert into departamento (nombre, descripcion) values ('Addison', 'JACOBAEA MARITIMA, EUPHRASIA STRICTA, CALENDULA OFFICINALIS FLOWERING TOP, POTASSIUM CHLORIDE, SILICON DIOXIDE, MAGNESIUM CARBONATE');
INSERT INTO DEP_TIENDA VALUES ((SELECT codigo FROM departamento WHERE nombre = 'Addison'),(SELECT codigo FROM TIENDA WHERE nombre = 'mini sweet UCAB 1'));