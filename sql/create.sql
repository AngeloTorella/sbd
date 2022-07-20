

-- ENTIDADES FUERTES
  CREATE TABLE LUGAR(
    codigo INTEGER,
    tipo VARCHAR(20) NOT NULL , 
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_lugar PRIMARY KEY(codigo),
    CONSTRAINT tipo_lugar CHECK(tipo like 'Municipio' or tipo like 'Parroquia' or tipo like 'Estado')
  );
  
  CREATE TABLE TIENDA(
    codigo SERIAL,
    nombre VARCHAR(50) NOT NULL,
    minisweet BOOLEAN NOT NULL,
    CONSTRAINT pk_tienda PRIMARY KEY (codigo)
  );

  CREATE TABLE CARAMELO(
    codigo  serial,
    descripcion CHARACTER VARYING(10) not null,
    nombre VARCHAR(20) NOT NULL,
    tipo VARCHAR(20),
    precio_al_menor numeric(50) NOT NULL,
    precio_al_mayor numeric(50) NOT NULL,
    peso NUMERIC(5) NOT NULL,
    tamanio VARCHAR(15) NOT NULL,
    CONSTRAINT pk_caramelo PRIMARY KEY (codigo)
  );

  CREATE TABLE TELEFONO(
    codigo SERIAL,
    numero VARCHAR(20) NOT NULL,
    CONSTRAINT pk_telefono PRIMARY KEY (codigo)
  );

  CREATE TABLE BANCO(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,
    venezolano BOOLEAN NOT NULL, 
    CONSTRAINT pk_banco PRIMARY KEY (codigo)
  );

  CREATE TABLE HORARIO(
    codigo SERIAL,
    fecha DATE not null,
    hora_entrada time not null,
    hora_salida time not null,
    CONSTRAINT pk_horario PRIMARY KEY (codigo)
  );
  
    CREATE TABLE departamento(
      codigo SERIAL,
      nombre VARCHAR(20) NOT NULL,
      descripcion CHARACTER VARYING(100),
      CONSTRAINT pk_departamento PRIMARY KEY(codigo)
    );

    CREATE TABLE empleado(
      ci INTEGER,
      nombre VARCHAR(20) NOT NULL,
      apellido VARCHAR(20) NOT NULL,
      salario REAL NOT NULL,
      CONSTRAINT pk_empleado PRIMARY KEY(ci)
    );

    Create table SABOR(
      codigo SERIAL,
      Descripcion CHARACTER VARYING (300) NOT NULL,
      Nombre CHARACTER VARYING (30) NOT NULL,
      CONSTRAINT pk_sabor PRIMARY KEY(codigo)
    );


  CREATE TABLE USUARIO(
    id SERIAL,
    nombre CHARACTER VARYING(20) NOT NULL,
    contrasenia CHARACTER VARYING(20) NOT NULL,
    CONSTRAINT pk_Usuario PRIMARY KEY(id)
  );

  CREATE TABLE ROL(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,  
    descripcion CHARACTER VARYING(100),
    CONSTRAINT pk_ROL PRIMARY KEY(codigo)
  );

  CREATE TABLE ESTATUS(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,  
    descripcion CHARACTER VARYING(100),
    CONSTRAINT pk_ESTATUS PRIMARY KEY(codigo)
  );

  CREATE TABLE CONTACTO(
    codigo SERIAL,
    Nombre CHARACTER VARYING(20) NOT null,
    Apellido CHARACTER VARYING(20) NOT NULL,
    CONSTRAINT pk_contacto PRIMARY KEY(codigo)
  );

  CREATE TABLE PRIVILEGIO(
    codigo SERIAL,
    Nombre CHARACTER VARYING(15) NOT NULL,
    Descripcion CHARACTER VARYING(100),
    CONSTRAINT pk_privilegio PRIMARY KEY(codigo)
  );

    CREATE TABLE VALOR_PUNTO(
    codigo serial,
    valor integer NOT NULL,
    CONSTRAINT pk_vp PRIMARY KEY(codigo)
  );

    CREATE TABLE PRESUPUESTO(
    codigo SERIAL,
    fecha_emision DATE NOT NULL,
    IVA SMALLINT NOT NULL,
    observaciones CHARACTER VARYING(100),
    validez NUMERIC(30) NOT NULL,
    CONSTRAINT pk_PRESUPUESTO PRIMARY KEY(codigo)
  );
  
  --inicio de supertipo cliente
    CREATE TABLE CLIENTE_JURIDICO(
      RIF INTEGER,   
      Email CHARACTER VARYING(20) NOT NULL,
      Puntos INTEGER NOT NULL,
      codigo_Registro INTEGER NOT NULL,
      Detalle_Direccion CHARACTER VARYING(40) NOT NULL,
      Denominacion_comercial CHARACTER VARYING(50) NOT NULL,
      Razon_social CHARACTER VARYING(30) NOT NULL,
      Pagina_Web CHARACTER VARYING(200) NOT NULL,
      Capital_Disponible INTEGER NOT NULL,
      CONSTRAINT pk_cj PRIMARY KEY(RIF)
    );

    CREATE TABLE CLIENTE_NATURAL(
      RIF INTEGER,        
      Email CHARACTER VARYING(20) NOT NULL,
      Puntos INTEGER NOT NULL,
      codigo_Registro INTEGER NOT NULL,
      Detalle_Direccion CHARACTER VARYING(40) NOT NULL,
      CI INTEGER NOT NULL,
      Primer_Nombre CHARACTER VARYING(15) NOT NULL,
      Segundo_Nombre CHARACTER VARYING(15),
      Primer_Apellido CHARACTER VARYING(15) NOT NULL,
      Segundo_Apellido CHARACTER VARYING(15),
      CONSTRAINT pk_cn PRIMARY KEY(RIF)
    );
  --
  --inicio de supertipo compra

  CREATE TABLE COMPRA_WEB(
    codigo SERIAL,
    fecha DATE NOT NULL,
    Total REAL NOT NULL,
    IVA SMALLINT NOT NULL,
    IGTF REAL NOT NULL,
    Calificacion_Servicio numeric(5) NOT NULL,    
    CONSTRAINT pk_cw PRIMARY KEY(codigo)
  );

  CREATE TABLE COMPRA_FISICO(
    codigo SERIAL,
    fecha DATE NOT NULL,
    Total REAL NOT NULL,
    IVA SMALLINT NOT NULL,
    IGTF REAL NOT NULL,
    bolsas INTEGER NOT NULL,
    caja INTEGER NOT NULL,
    CONSTRAINT pk_cf PRIMARY KEY(codigo)
  );
  --fin de supertipo compra

  -- inicio del super tipo medio_pago
  CREATE TABLE TARJETA( --Listo
    codigo SERIAL,
    numero_tarjeta VARCHAR(40) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    creadito boolean NOT NULL,
    CONSTRAINT pk_TARJETA PRIMARY KEY(codigo)
  );

  CREATE TABLE CHEQUE(
    codigo SERIAL,
    numero INTEGER NOT NULL,
    numero_cta VARCHAR(40) NOT NULL,
    CONSTRAINT pk_CHEQUE PRIMARY KEY(codigo)
  );

  CREATE TABLE PAGO_MOVIL(
    codigo SERIAL,
    numero_ref VARCHAR(40) NOT NULL,
    CONSTRAINT pk_PAGO_MOVIL PRIMARY KEY(codigo)
  );

  CREATE TABLE EFECTIVO(
    codigo SERIAL,
    cambio REAL NOT NULL,
    moneda VARCHAR(7) NOT NULL, -- es el nombre de la moneda 
    CONSTRAINT pk_EFECTIVO PRIMARY KEY(codigo)
  );

  CREATE TABLE ZELLE(
    codigo SERIAL,
    correo CHARACTER VARYING(100) NOT NULL, -- un correo puede ser muy largo (no posee largo estandar)
    numero_confirmacion VARCHAR(40) NOT NULL,
    CONSTRAINT pk_ZELLE PRIMARY KEY(codigo)
  );

  CREATE TABLE BANCO_VIRTUAL(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,
    correo  CHARACTER VARYING(100) NOT NULL, -- un correo puede ser muy largo (no posee largo estandar)
    CONSTRAINT pk_bv PRIMARY KEY(codigo)
  );

  CREATE TABLE PUNTO_OBTENIDO(
    codigo SERIAL,
    cambio REAL NOT NULL,
    cantidad INTEGER NOT NULL,
    CONSTRAINT pk_po PRIMARY KEY(codigo)
  );

  -- 
-- 
-- ENTIDADES DEBILES   
  CREATE TABLE SABOR_CARAMELO(
    codigo SERIAL,
    sc_caramelo INTEGER not null,
    sc_sabor INTEGER not null,
    CONSTRAINT fk_sc_caramelo FOREIGN KEY(sc_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT fk_sc_sabor FOREIGN KEY(sc_sabor) REFERENCES sabor (codigo),
    CONSTRAINT pk_sc PRIMARY KEY(codigo,sc_caramelo,sc_sabor)
  );

  CREATE TABLE IMAGEN(
    codigo SERIAL,
    nombre CHARACTER VARYING(30) NOT NULL,
    ruta CHARACTER VARYING(300) NOT NULL,
    i_caramelo INTEGER not null,
    CONSTRAINT fk_imagen_caramelo FOREIGN KEY(i_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT pk_imagen PRIMARY KEY(codigo,i_caramelo)
  );

  CREATE TABLE DESCUENTO(
    codigo SERIAL,
    porcentaje SMALLINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE not NULL,
    d_caramelo INTEGER not null,
    d_empleado INTEGER not null,
    CONSTRAINT fk_descuento_caramelo FOREIGN KEY(d_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT fk_descuento_empleado FOREIGN KEY(d_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT pk_descuento PRIMARY KEY(codigo,d_caramelo,d_empleado)
  );

  CREATE TABLE HORARIO_EMPLEADO(
    he_empleado INTEGER not null,
    he_horario INTEGER not null,
    CONSTRAINT fk_he_empleado FOREIGN KEY(he_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT fk_he_horario  FOREIGN KEY(he_horario)  REFERENCES horario(codigo),
    CONSTRAINT pk_he          PRIMARY KEY(he_empleado,he_horario)
  );

  CREATE TABLE DEP_EMPLEADO(
    asistio BOOLEAN NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    de_departamento INTEGER not null,
    de_empleado INTEGER not null,
    CONSTRAINT fk_dep_empleado_dep FOREIGN KEY(de_departamento) REFERENCES DEPARTAMENTO(codigo),
    CONSTRAINT fk_dep_empleado_empleado FOREIGN KEY(de_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT pk_dep_empleado PRIMARY KEY(de_departamento,de_empleado)
  );
  -- 
  CREATE TABLE DEP_TIENDA(
    dt_departamento INTEGER not null,
    dt_tienda INTEGER not null,
    CONSTRAINT fk_dt_departamento FOREIGN KEY(dt_departamento) REFERENCES DEPARTAMENTO(codigo),
    CONSTRAINT fk_dt_tienda  FOREIGN KEY(dt_tienda)  REFERENCES TIENDA(codigo)
  );

  CREATE TABLE LISTA_PRESUPUESTO(
    precio INTEGER NOT NULL,
    cantidad SMALLINT NOT NULL,
    lp_presupuesto INTEGER not null,
    lp_caramelo INTEGER not null,
    CONSTRAINT fk_lp_presupuesto FOREIGN KEY(lp_presupuesto) REFERENCES PRESUPUESTO(codigo),
    CONSTRAINT fk_lp_caramelo    FOREIGN KEY(lp_caramelo)    REFERENCES CARAMELO(codigo), 
    CONSTRAINT pk_lp PRIMARY KEY(lp_caramelo,lp_presupuesto)
  );

  CREATE TABLE LISTA_COMPRA(
    codigo serial,
    precio INTEGER NOT NULL,
    cantidad SMALLINT NOT NULL,
    lcw_compra INTEGER,
    lcf_compra INTEGER,
    lc_caramelo INTEGER not null,
    CONSTRAINT fk_lc_compraW FOREIGN KEY(lcw_compra) REFERENCES COMPRA_WEB(codigo),
    CONSTRAINT fk_lc_compraF FOREIGN KEY(lcf_compra) REFERENCES COMPRA_FISICO(codigo),
    CONSTRAINT fk_lc_caramelo    FOREIGN KEY(lc_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT Lc_no_vacia  check(Not(lcw_compra is null and lcf_compra is null)),
    CONSTRAINT pk_lc PRIMARY KEY(lc_caramelo,codigo)
  );

  CREATE TABLE orden_compra(
    codigo SERIAL,
    reservado BOOLEAN NOT NULL,
    fecha_acuerdo DATE NOT NULL,
    listo BOOLEAN NOT NULL,
    numero_pedido INTEGER NOT NULL,
    oc_tienda INTEGER not null,
    oc_empleado INTEGER not null,
    oc_presupuesto INTEGER not null,
    CONSTRAINT fk_oc_tienda FOREIGN KEY(oc_tienda) REFERENCES TIENDA(codigo),
    CONSTRAINT fk_oc_empleado FOREIGN KEY(oc_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT fk_oc_presupuesto FOREIGN KEY(oc_presupuesto) REFERENCES PRESUPUESTO(codigo),
    CONSTRAINT pk_oc PRIMARY KEY(codigo)
  );

  CREATE TABLE reposicion(
    codigo SERIAL,
    cantidad SMALLINT NOT NULL,
    fecha_emision DATE NOT NULL,
    r_tienda INTEGER not NULL,
    r_empleado INTEGER not null,
    CONSTRAINT fk_reposicion_tienda FOREIGN KEY(r_tienda) REFERENCES TIENDA(codigo),
    CONSTRAINT fk_reposicion_empleado FOREIGN KEY(r_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT pk_reposicion PRIMARY KEY(codigo)
  );

  CREATE TABLE ALMACEN(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,  
    mts_cuadrados SMALLINT NOT NULL,
    a_tienda integer NOT NULL,
    CONSTRAINT fk_ALMACEN FOREIGN KEY(a_tienda) REFERENCES TIENDA(codigo),
    CONSTRAINT pk_ALMACEN PRIMARY KEY(codigo)
  );

  CREATE TABLE ANAQUEL(
    codigo SERIAL,
    nombre VARCHAR(20) NOT NULL,  
    mts_cuadrados SMALLINT not NULL,
    an_tienda integer not NULL,
    CONSTRAINT fk_an_tienda FOREIGN KEY(an_tienda) REFERENCES TIENDA(codigo),
    CONSTRAINT pk_ANAQUEL PRIMARY KEY(codigo)
  );

  CREATE TABLE ANAQUEL_CARAMELO(
    codigo serial,
    cantidad SMALLINT NOT NULL,
    zona VARCHAR(3) NOT NULL,
    ac_empleado INTEGER,
    ac_anaquel INTEGER NOT NULL,
    ac_caramelo INTEGER not NULL,
    CONSTRAINT fk_ac_empleado FOREIGN KEY(ac_empleado) REFERENCES EMPLEADO(ci),
    CONSTRAINT fk_ac_anaquel FOREIGN KEY(ac_anaquel) REFERENCES ANAQUEL(codigo),
    CONSTRAINT fk_ac_caramelo FOREIGN KEY(ac_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT pk_ac PRIMARY KEY(codigo)
  );
  CREATE TABLE PASILLO(
    codigo SERIAL,
    estantes SMALLINT NOT NULL,
    zona INTEGER NOT NULL,
    p_an_caramelo integer NOT NULL,
    CONSTRAINT fk_pasillo_an_caramelo FOREIGN KEY(p_an_caramelo) REFERENCES ANAQUEL_CARAMELO(codigo),
    CONSTRAINT pk_codigo PRIMARY KEY(codigo)
  ); 
  
  CREATE TABLE ESTATUS_REPOSICION(
    er_estatus INTEGER NOT NULL,
    er_reposicion INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    CONSTRAINT fk_er_estatus FOREIGN KEY(er_estatus) REFERENCES ESTATUS(codigo),
    CONSTRAINT fk_er_reposicion FOREIGN KEY(er_reposicion) REFERENCES REPOSICION(codigo),
    CONSTRAINT pk_er PRIMARY KEY(er_estatus,er_reposicion) 
  );

  CREATE TABLE ESTATUS_COMPRA(
    codigo serial,
    ecf_estatus INTEGER,
    ecf_compra INTEGER,
    ecw_compra INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    CONSTRAINT fk_ecf_estatus FOREIGN KEY(ecf_estatus) REFERENCES ESTATUS(codigo),
    CONSTRAINT fk_ecf_compra_fisico FOREIGN KEY(ecf_compra) REFERENCES COMPRA_FISICO(codigo),
    CONSTRAINT fk_ecw_compra_web FOREIGN KEY(ecw_compra) REFERENCES COMPRA_WEB(codigo),
    CONSTRAINT Exclusivo CHECK((ecf_compra is null and ecw_compra is not null) or (ecw_compra is null and ecf_compra is not null)),
    CONSTRAINT pk_ecf PRIMARY KEY(codigo)
  );

  CREATE TABLE ESTATUS_ORDEN_COMPRA(
    fecha_inicio date not null,
    fecha_fin date,
    eoc_estatus integer not null,
    eoc_oc integer not null,
    CONSTRAINT fk_eoc_estatus FOREIGN KEY(eoc_estatus) REFERENCES ESTATUS(codigo),
    CONSTRAINT fk_eoc_oc  FOREIGN KEY(eoc_oc) REFERENCES orden_compra(codigo),
    CONSTRAINT pk_eoc PRIMARY KEY(eoc_estatus,eoc_oc)
  );

  -- LE FALTAN FORANEAS
  CREATE TABLE PAGO(
    codigo SERIAL,
    fecha DATE NOT NULL,
    monto REAL NOT NULL,
    p_cw integer,
    p_cf integer,
    p_tarjeta integer,
    p_cheque integer,
    p_pm integer,
    p_efectivo integer,
    p_zelle integer,
    p_bv integer,
    p_po integer,
    CONSTRAINT fk_p_cw FOREIGN KEY(p_cw) REFERENCES Compra_Web(codigo),
    CONSTRAINT fk_p_cf FOREIGN KEY(p_cf) REFERENCES Compra_fisico(codigo),
    CONSTRAINT c_no_vacia CHECK(not(p_cw is null and p_cf is null)),
    CONSTRAINT fk_p_tarjeta FOREIGN KEY(p_tarjeta) REFERENCES Tarjeta(codigo),
    CONSTRAINT fk_p_cheque FOREIGN KEY(p_cheque) REFERENCES Cheque(codigo),
    CONSTRAINT fk_p_pm FOREIGN KEY(p_pm) REFERENCES Pago_Movil(codigo),
    CONSTRAINT fk_p_efectivo FOREIGN KEY(p_efectivo) REFERENCES Efectivo(codigo),
    CONSTRAINT fk_p_zelle FOREIGN KEY(p_zelle) REFERENCES Zelle(codigo),
    CONSTRAINT fk_p_bv FOREIGN KEY(p_bv) REFERENCES Banco_Virtual(codigo),
    CONSTRAINT fk_p_po FOREIGN KEY(p_po) REFERENCES Punto_obtenido(codigo),
    CONSTRAINT mp_no_vacio CHECK(NOT(p_tarjeta is null and p_cheque is null and p_pm is null and p_efectivo is null and p_zelle is null and p_bv is null and p_po is null)),
    CONSTRAINT pk_pago PRIMARY KEY(codigo)
  );

  CREATE TABLE HISTORICO_PUNTOS(
    codigo serial,
    fecha_inicio date not null,
    fecha_fin date,
    hp_vp integer NOT NULL,
    hp_po integer NOT NULL,
    hp_cf integer not null,
    CONSTRAINT fk_hp_vp FOREIGN KEY(hp_vp) REFERENCES VALOR_PUNTO(codigo),
    CONSTRAINT fk_hp_po FOREIGN KEY(hp_po) REFERENCES PUNTO_OBTENIDO(codigo),
    CONSTRAINT fk_hp_cf FOREIGN KEY(hp_cf) REFERENCES COMPRA_FISICO(codigo),
    CONSTRAINT pk_hp PRIMARY KEY(codigo)
  );
  
  CREATE TABLE LISTA_REPOSICION(
    cantidad SMALLINT NOT NULL,
    precio REAL NOT NULL,
    lr_caramelo INTEGER NOT NULL,
    lr_reposicion INTEGER NOT NULL,
    CONSTRAINT fk_lr_caramelo FOREIGN KEY(lr_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT fk_lr_reposicion FOREIGN KEY(lr_reposicion) REFERENCES reposicion(codigo),
    CONSTRAINT pk_lr PRIMARY KEY(lr_caramelo,lr_reposicion)
  );
  
  CREATE TABLE RESIDENCIA(
    codigo serial,
    nombre VARCHAR(20) NOT NULL,
    r_cj INTEGER NOT NULL,
    r_lugar INTEGER NOT NULL,
    CONSTRAINT fk_r_cj FOREIGN KEY(r_cj) REFERENCES cliente_juridico(RIF),
    CONSTRAINT fk_r_lugar FOREIGN KEY(r_lugar) REFERENCES LUGAR(codigo),
    CONSTRAINT pk_residencia PRIMARY KEY(codigo)
  );
  
  CREATE TABLE ALMACEN_CARAMELO(
    codigo SERIAL,
    cantidad SMALLINT NOT NULL,
    zona SMALLINT NOT NULL,
    ac_almacen INTEGER NOT NULL,
    ac_caramelo INTEGER NOT NULL,
    CONSTRAINT fk_ac_almacen FOREIGN KEY(ac_almacen) REFERENCES ALMACEN(codigo),
    CONSTRAINT fk_ac_caramelo FOREIGN KEY(ac_caramelo) REFERENCES CARAMELO(codigo),
    CONSTRAINT pk_almacen_caramelo PRIMARY KEY(codigo)
  );
--
