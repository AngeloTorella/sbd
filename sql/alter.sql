
--LUGAR
  -- divide
  ALTER TABLE LUGAR ADD COLUMN l_lugar INTEGER, ADD CONSTRAINT fk_lugar_lugar FOREIGN KEY(l_lugar) REFERENCES LUGAR(codigo) ON DELETE CASCADE;
--
--TIENDA
  -- ubica
  ALTER TABLE TIENDA ADD COLUMN t_lugar INTEGER not NULL;

  ALTER TABLE TIENDA ADD CONSTRAINT fk_tienda_lugar FOREIGN KEY(t_lugar) REFERENCES LUGAR(codigo) ON DELETE CASCADE;
--

--TELEFONO
  -- dispone 
  ALTER TABLE TELEFONO ADD COLUMN t_juridico INTEGER;

  ALTER TABLE TELEFONO ADD CONSTRAINT fk_telefono_juridico FOREIGN KEY(t_juridico) REFERENCES CLIENTE_JURIDICO(RIF) ON DELETE CASCADE;

  -- dispone
  ALTER TABLE TELEFONO ADD COLUMN t_natural integer;

  ALTER TABLE TELEFONO ADD CONSTRAINT fk_telefono_natural FOREIGN KEY(t_natural) REFERENCES CLIENTE_natural(RIF) ON DELETE CASCADE;

  -- tiene_habilitado
  ALTER TABLE TELEFONO ADD COLUMN t_CONTACTO INTEGER ;

  ALTER TABLE TELEFONO ADD CONSTRAINT fk_CONTACTO FOREIGN KEY(t_CONTACTO) REFERENCES CONTACTO(codigo) ON DELETE CASCADE;

  ALTER TABLE TELEFONO ADD CONSTRAINT condicion3 CHECK((t_juridico is null and t_CONTACTO is null) or (t_natural is null and t_CONTACTO is null) or (t_juridico is null and t_natural is null));

-- 
  
--EMPLEADO
  
  ALTER TABLE EMPLEADO ADD COLUMN e_usuario integer not null;

  ALTER TABLE EMPLEADO ADD CONSTRAINT fk_e_usuario FOREIGN KEY(e_usuario) REFERENCES Usuario(id) ON DELETE CASCADE;


--USUARIO

  --Relacion Usuario-Rol 
  ALTER TABLE USUARIO ADD COLUMN fk_ROL INTEGER NOT NULL;

  ALTER TABLE USUARIO ADD CONSTRAINT fk_usuario_rol FOREIGN KEY(fk_rol) REFERENCES rol(codigo) ON DELETE CASCADE;

-- 

--CONTACTO
  --
  ALTER TABLE CONTACTO ADD COLUMN fk_juridico INTEGER NOT NULL;

  ALTER TABLE CONTACTO ADD CONSTRAINT fk_contacto_juridico FOREIGN KEY(fk_juridico) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE; 

--

--PRIVILEGIO
  --
  ALTER TABLE PRIVILEGIO ADD COLUMN fk_rol integer NOT NULL;

  ALTER TABLE PRIVILEGIO ADD CONSTRAINT fk_privilegio_rol FOREIGN KEY(fk_rol) REFERENCES rol(codigo) ON DELETE CASCADE;

--CLIENTE_JURIDICO
  
  ALTER TABLE CLIENTE_JURIDICO ADD COLUMN cj_usuario integer not null;

  ALTER TABLE CLIENTE_JURIDICO ADD CONSTRAINT fk_cj_usuario FOREIGN KEY(cj_usuario) REFERENCES Usuario(id) ON DELETE CASCADE; 

  ALTER TABLE CLIENTE_JURIDICO ADD COLUMN cj_tienda integer not null;

  ALTER TABLE CLIENTE_JURIDICO ADD CONSTRAINT fk_cj_tienda FOREIGN KEY(cj_tienda) REFERENCES tienda(codigo) ON DELETE CASCADE;


--CLIENTE_NATURAL
  -- habita
  ALTER TABLE CLIENTE_NATURAL ADD COLUMN fk_lugar INTEGER NOT NULL; 

  ALTER TABLE CLIENTE_NATURAL ADD CONSTRAINT fk_NATURAL_LUGAR FOREIGN KEY(fk_LUGAR) REFERENCES LUGAR(codigo) ON DELETE CASCADE;

  ALTER TABLE CLIENTE_Natural ADD COLUMN cn_usuario integer not null;

  ALTER TABLE CLIENTE_Natural ADD CONSTRAINT fk_cn_usuario FOREIGN KEY(cn_usuario) REFERENCES Usuario(id) ON DELETE CASCADE; 

  ALTER TABLE CLIENTE_Natural ADD COLUMN cn_tienda integer not null;

  ALTER TABLE CLIENTE_Natural ADD CONSTRAINT fk_cn_tienda FOREIGN KEY(cn_tienda) REFERENCES tienda(codigo) ON DELETE CASCADE;

-- 

--COMPRA 
  -- 
  -- realiza
    -- juridico web
      ALTER TABLE Compra_Web ADD COLUMN fk_web_juridico INTEGER;

      ALTER TABLE Compra_Web ADD CONSTRAINT fk_Web_juridico FOREIGN KEY(fk_web_juridico) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;
    -- nartural web
      ALTER TABLE Compra_Web ADD COLUMN fk_web_natural INTEGER ;

      ALTER TABLE Compra_Web ADD CONSTRAINT fk_Web_natural FOREIGN KEY(fk_web_natural) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE COMPRA_WEB ADD COLUMN cw_tienda integer not null;

      ALTER TABLE COMPRA_WEB ADD CONSTRAINT fk_cw_tienda FOREIGN KEY(cw_tienda) REFERENCES tienda(codigo) ON DELETE CASCADE;

      ALTER TABLE Compra_web ADD CONSTRAINT condicion CHECK((fk_web_juridico is null or fk_web_natural is not null) or (fk_web_natural is null or fk_web_juridico is not null));

    --
    -- juridico fisico
      ALTER TABLE COMPRA_FISICO ADD COLUMN fk_fisico_juridico INTEGER ;

      ALTER TABLE COMPRA_FISICO ADD CONSTRAINT fk_COMPRA_FISICO_juridico FOREIGN KEY(fk_fisico_juridico) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;
    -- natural fisico
      ALTER TABLE COMPRA_FISICO ADD COLUMN fk_fisico_natural INTEGER;

      ALTER TABLE COMPRA_FISICO ADD CONSTRAINT fk_COMPRA_FISICO_natural FOREIGN KEY(fk_fisico_natural) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE COMPRA_FISICO ADD COLUMN cf_tienda integer not null;

      ALTER TABLE COMPRA_FISICO ADD CONSTRAINT fk_cf_tienda FOREIGN KEY(cf_tienda) REFERENCES tienda(codigo) ON DELETE CASCADE;

      ALTER TABLE Compra_FISICO ADD CONSTRAINT condicion1 CHECK((fk_fisico_juridico is null or fk_fisico_natural is not null) or (fk_fisico_natural is null or fk_fisico_juridico is not null));

    --
-- 

--MEDIO_PAGO
  -- tiene
    -- otorga
      ALTER TABLE TARJETA ADD COLUMN fk_banco integer NOT NULL, ADD CONSTRAINT fk_tarjeta_banco FOREIGN KEY(fk_banco) REFERENCES BANCO(codigo)  ON DELETE CASCADE;
    -- genera
      ALTER TABLE CHEQUE ADD COLUMN fk_banco INTEGER NOT NULL, ADD CONSTRAINT fk_CHEQUE_banco FOREIGN KEY(fk_banco) REFERENCES BANCO(codigo)  ON DELETE CASCADE;
    --
      ALTER TABLE PAGO_MOVIL ADD COLUMN fk_banco INTEGER NOT NULL, ADD CONSTRAINT fk_PAGO_MOVIL_banco FOREIGN KEY(fk_banco) REFERENCES BANCO(codigo)  ON DELETE CASCADE;
    -- diligencia
      ALTER TABLE ZELLE ADD COLUMN fk_banco INTEGER NOT NULL, ADD CONSTRAINT fk_ZELLE_banco FOREIGN KEY(fk_banco) REFERENCES BANCO(codigo) ON DELETE CASCADE;

      ALTER TABLE TARJETA ADD COLUMN ta_cj integer;
      
      ALTER TABLE TARJETA ADD COLUMN ta_cn integer;

      ALTER TABLE CHEQUE ADD COLUMN ch_cj integer;
      
      ALTER TABLE CHEQUE ADD COLUMN ch_cn integer;

      ALTER TABLE PAGO_MOVIL ADD COLUMN pm_cj integer;
      
      ALTER TABLE PAGO_MOVIL ADD COLUMN pm_cn integer;

      ALTER TABLE EFECTIVO ADD COLUMN ef_cj integer;
      
      ALTER TABLE EFECTIVO ADD COLUMN ef_cn integer;

      ALTER TABLE ZELLE ADD COLUMN ze_cj integer;
      
      ALTER TABLE ZELLE ADD COLUMN ze_cn integer;

      ALTER TABLE BANCO_VIRTUAL ADD COLUMN bv_cj integer;
      
      ALTER TABLE BANCO_VIRTUAL ADD COLUMN bv_cn integer;

      ALTER TABLE PUNTO_OBTENIDO ADD COLUMN po_cj integer;
      
      ALTER TABLE PUNTO_OBTENIDO ADD COLUMN po_cn integer;

      ALTER TABLE TARJETA ADD CONSTRAINT fk_ta_cj FOREIGN KEY(ta_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE TARJETA ADD CONSTRAINT fk_ta_cn FOREIGN KEY(ta_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE CHEQUE ADD CONSTRAINT fk_ch_cj FOREIGN KEY(ch_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE CHEQUE ADD CONSTRAINT fk_ch_cn FOREIGN KEY(ch_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE PAGO_MOVIL ADD CONSTRAINT fk_pm_cj FOREIGN KEY(pm_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE PAGO_MOVIL ADD CONSTRAINT fk_pm_cn FOREIGN KEY(pm_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE EFECTIVO ADD CONSTRAINT fk_ef_cj FOREIGN KEY(ef_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE EFECTIVO ADD CONSTRAINT fk_ef_cn FOREIGN KEY(ef_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE ZELLE ADD CONSTRAINT fk_ze_cj FOREIGN KEY(ze_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE ZELLE ADD CONSTRAINT fk_ze_cn FOREIGN KEY(ze_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE BANCO_VIRTUAL ADD CONSTRAINT fk_bv_cj FOREIGN KEY(bv_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE BANCO_VIRTUAL ADD CONSTRAINT fk_bv_cn FOREIGN KEY(bv_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE PUNTO_OBTENIDO ADD CONSTRAINT fk_po_cj FOREIGN KEY(po_cj) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE;

      ALTER TABLE PUNTO_OBTENIDO ADD CONSTRAINT fk_po_cn FOREIGN KEY(po_cn) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE TARJETA ADD CONSTRAINT cliente_diferente_ta CHECK((ta_cj is null and ta_cn is not null) or (ta_cj is not null and ta_cn is null));
      
      ALTER TABLE CHEQUE ADD CONSTRAINT cliente_diferente_ch CHECK((ch_cj is null and ch_cn is not null) or (ch_cj is not null and ch_cn is null));
      
      ALTER TABLE PAGO_MOVIL ADD CONSTRAINT cliente_diferente_pm CHECK((pm_cj is null and pm_cn is not null) or (pm_cj is not null and pm_cn is null));
      
      ALTER TABLE EFECTIVO ADD CONSTRAINT cliente_diferente_ef CHECK((ef_cj is null and ef_cn is not null) or (ef_cj is not null and ef_cn is null));
      
      ALTER TABLE ZELLE ADD CONSTRAINT cliente_diferente_ze CHECK((ze_cj is null and ze_cn is not null) or (ze_cj is not null and ze_cn is null));
      
      ALTER TABLE BANCO_VIRTUAL ADD CONSTRAINT cliente_diferente_bv CHECK((bv_cj is null and bv_cn is not null) or (bv_cj is not null and bv_cn is null));
      
      ALTER TABLE PUNTO_OBTENIDO ADD CONSTRAINT cliente_diferente_po CHECK((po_cj is null and po_cn is not null) or (po_cj is not null and po_cn is null));

--

--PRESUPUESTO
  -- solicita
      ALTER TABLE PRESUPUESTO ADD COLUMN pr_departamento integer not null,
      ADD CONSTRAINT fk_pr_departamento FOREIGN KEY(pr_departamento) REFERENCES departamento(codigo) ON DELETE CASCADE;
      ALTER TABLE PRESUPUESTO ADD COLUMN pr_juridico integer,
      ADD COLUMN pr_natural integer,
      ADD CONSTRAINT fk_pr_juridico FOREIGN KEY(pr_juridico) REFERENCES cliente_juridico(RIF) ON DELETE CASCADE,
      ADD CONSTRAINT fk_pr_natural FOREIGN KEY(pr_natural) REFERENCES cliente_natural(RIF) ON DELETE CASCADE;

      ALTER TABLE Presupuesto ADD CONSTRAINT condicion2 CHECK((pr_juridico is null and pr_natural is not null) or (pr_natural is null and pr_juridico is not null));

                
  -- 

--