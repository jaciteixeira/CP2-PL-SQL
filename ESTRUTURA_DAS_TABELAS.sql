--criação das tabelas 

CREATE TABLE t_rc_autentica (
    id_autentica              INTEGER PRIMARY KEY,
    email                     VARCHAR2(150) NOT NULL,
    senha                     VARCHAR2(30) NOT NULL,
    st_autentica              VARCHAR2(1) NOT NULL,
    t_rc_cliente_id_cliente INTEGER NOT NULL
);

CREATE TABLE t_rc_check_in (
    id_check_in             INTEGER PRIMARY KEY,
    nv_combustivel          NUMBER(5, 2) NOT NULL,
    km_atual                NUMBER NOT NULL,
    dt_hr_check_in          DATE NOT NULL,
    st_veiculo              VARCHAR2(255) NOT NULL,
    t_rc_reserva_id_reserva INTEGER NOT NULL,
    id_cliente              INTEGER NOT NULL
);

CREATE TABLE t_rc_check_out (
    id_check_out              INTEGER PRIMARY KEY,
    nv_combustivel            NUMBER(5, 2) NOT NULL,
    km_atual                  NUMBER,
    dt_hr_check_out           DATE NOT NULL,
    st_veiculo                VARCHAR2(255) NOT NULL,
    t_rc_check_in_id_check_in INTEGER NOT NULL
);

CREATE TABLE t_rc_cliente (
    id_cliente    INTEGER PRIMARY KEY,
    nm_cliente    VARCHAR2(90) NOT NULL,
    nr_rg         VARCHAR2(18),
    nr_cpf        VARCHAR2(14) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sx_cliente    VARCHAR2(1),
    gr_ensino     VARCHAR2(20),
    es_civil      VARCHAR2(20)
);

CREATE TABLE t_rc_endereco (
    id_endereco               INTEGER PRIMARY KEY,
    nm_logradouro             VARCHAR2(90) NOT NULL,
    nr_logradouro             INTEGER,
    cep                       VARCHAR2(10) NOT NULL,
    bairro                    VARCHAR2(90) NOT NULL,
    cidade                    VARCHAR2(90) NOT NULL,
    estado                    VARCHAR2(2) NOT NULL,
    ds_complemento            VARCHAR2(90),
    t_rc_cliente_id_cliente INTEGER NOT NULL
);

CREATE TABLE t_rc_pagamento (
    id_pagamento                INTEGER PRIMARY KEY,
    dt_hr_pagamento             DATE NOT NULL,
    st_pagamento                VARCHAR2(20) NOT NULL,
    vl_pagamento                NUMBER(5, 2) NOT NULL,
    tp_pagamento                VARCHAR2(20) NOT NULL,
    t_rc_check_out_id_check_out INTEGER NOT NULL
);

CREATE TABLE t_rc_preco_veiculo (
    id_preco INTEGER PRIMARY KEY,
    tx_dia   NUMBER(5, 2) NOT NULL,
    tx_km    NUMBER(5, 2) NOT NULL
);

CREATE TABLE t_rc_reserva (
    id_reserva                INTEGER PRIMARY KEY,
    dt_hr_inicio_reserva      DATE NOT NULL,
    dt_hr_fim_reserva         DATE NOT NULL,
    t_rc_veiculo_id_veiculo   INTEGER NOT NULL,
    t_rc_cliente_id_cliente   INTEGER NOT NULL
);

CREATE TABLE t_rc_servico (
    id_servico INTEGER PRIMARY KEY,
    tp_servico VARCHAR2(20) NOT NULL,
    tx_servico NUMBER(5, 2) NOT NULL
);

CREATE TABLE t_rc_servico_reserva (
    id_servico_reserva      INTEGER PRIMARY KEY,
    t_rc_reserva_id_reserva INTEGER NOT NULL,
    t_rc_servico_id_servico INTEGER NOT NULL,
    id_cliente              INTEGER NOT NULL
);

CREATE TABLE t_rc_veiculo (
    id_veiculo                  INTEGER PRIMARY KEY,
    renavam                     INTEGER,
    marca                       VARCHAR2(50) NOT NULL,
    modelo                      VARCHAR2(50) NOT NULL,
    placa_veiculo               VARCHAR2(10) NOT NULL,
    tp_veiculo                  VARCHAR2(10),
    cambio                      VARCHAR2(10),
    t_rc_preco_veiculo_id_preco INTEGER NOT NULL
);

-- UNIQUE CONSTRAINTS

--UNIQUE CONSTRAINT EM t_rc_autentica PARA EMAIL 
ALTER TABLE t_rc_autentica
ADD CONSTRAINT t_rc_autentica_email_un UNIQUE (email);

-- unique constraint em t_rc_cliente para nr_cpf
ALTER TABLE t_rc_cliente
ADD CONSTRAINT t_rc_cliente_nr_cpf_un UNIQUE (nr_cpf);

-- unique constraint em t_rc_veiculo para renavam e placa_veiculo
ALTER TABLE t_rc_veiculo
ADD CONSTRAINT t_rc_veiculo_renavam_un UNIQUE (renavam);

ALTER TABLE t_rc_veiculo
ADD CONSTRAINT t_rc_veiculo_placa_veiculo_un UNIQUE (placa_veiculo);

--RELACIONAMENTOS 

ALTER TABLE t_rc_check_out
    ADD CONSTRAINT fk_check_out_check_in FOREIGN KEY (t_rc_check_in_id_check_in)
        REFERENCES t_rc_check_in (id_check_in);

ALTER TABLE t_rc_endereco
    ADD CONSTRAINT fk_endereco_cliente FOREIGN KEY (t_rc_cliente_id_cliente)
        REFERENCES t_rc_cliente (id_cliente);

ALTER TABLE t_rc_pagamento
    ADD CONSTRAINT fk_pagamento_check_out FOREIGN KEY (t_rc_check_out_id_check_out)
        REFERENCES t_rc_check_out (id_check_out);

ALTER TABLE t_rc_servico_reserva
    ADD CONSTRAINT fk_servico_reserva_reserva FOREIGN KEY (t_rc_reserva_id_reserva)
        REFERENCES t_rc_reserva (id_reserva);

ALTER TABLE t_rc_servico_reserva
    ADD CONSTRAINT fk_servico_reserva_servico FOREIGN KEY (t_rc_servico_id_servico)
        REFERENCES t_rc_servico (id_servico);

ALTER TABLE t_rc_veiculo
    ADD CONSTRAINT fk_veiculo_preco FOREIGN KEY (t_rc_preco_veiculo_id_preco)
        REFERENCES t_rc_preco_veiculo (id_preco);