SET SERVEROUTPUT ON;
------------------------------------------------
-- Criação das functions para ler dados das tabelas
------------------------------------------------

--------------------------
-- TABELA CLIENTE
--------------------------
CREATE OR REPLACE FUNCTION ler_cliente (
    p_id_cliente IN INTEGER
) RETURN t_rc_cliente%ROWTYPE
AS
    v_cliente t_rc_cliente%ROWTYPE;
BEGIN
    SELECT * INTO v_cliente
    FROM t_rc_cliente
    WHERE id_cliente = p_id_cliente;

    RETURN v_cliente;
END;
/
--------------------------
-- TABELA VEICULO
--------------------------
CREATE OR REPLACE FUNCTION ler_veiculo (
    p_id_veiculo IN INTEGER
) RETURN t_rc_veiculo%ROWTYPE
AS
    v_veiculo t_rc_veiculo%ROWTYPE;
BEGIN
    SELECT * INTO v_veiculo
    FROM t_rc_veiculo
    WHERE id_veiculo = p_id_veiculo;

    RETURN v_veiculo;
END;
/
--------------------------
-- TABELA RESERVA
--------------------------
CREATE OR REPLACE FUNCTION ler_reserva (
    p_id_reserva IN INTEGER
) RETURN t_rc_reserva%ROWTYPE
AS
    v_reserva t_rc_reserva%ROWTYPE;
BEGIN
    SELECT * INTO v_reserva
    FROM t_rc_reserva
    WHERE id_reserva = p_id_reserva;

    RETURN v_reserva;
END;
/

--------------------------
-- TABELA CHECK-IN
--------------------------
CREATE OR REPLACE FUNCTION ler_check_in (
    p_id_check_in IN INTEGER
) RETURN t_rc_check_in%ROWTYPE
AS
    v_check_in t_rc_check_in%ROWTYPE;
BEGIN
    SELECT * INTO v_check_in
    FROM t_rc_check_in
    WHERE id_check_in = p_id_check_in;

    RETURN v_check_in;
END;
/
--------------------------
-- TABELA CHECK-OUT
--------------------------
CREATE OR REPLACE FUNCTION ler_check_out (
    p_id_check_out IN INTEGER
) RETURN t_rc_check_out%ROWTYPE
AS
    v_check_out t_rc_check_out%ROWTYPE;
BEGIN
    SELECT * INTO v_check_out
    FROM t_rc_check_out
    WHERE id_check_out = p_id_check_out;

    RETURN v_check_out;
END;
/

--------------------------
-- TABELA PAGAMENTO
--------------------------
CREATE OR REPLACE FUNCTION ler_pagamento (
    p_id_pagamento IN INTEGER
) RETURN t_rc_pagamento%ROWTYPE
AS
    v_pagamento t_rc_pagamento%ROWTYPE;
BEGIN
    SELECT * INTO v_pagamento
    FROM t_rc_pagamento
    WHERE id_pagamento = p_id_pagamento;

    RETURN v_pagamento;
END;
/

------------------------------------------------
--Chamadas das functions para ler dados das tabelas
------------------------------------------------
--------------------------
-- CLIENTE
--------------------------
DECLARE
    v_cliente t_rc_cliente%ROWTYPE;
BEGIN
    BEGIN
        v_cliente := ler_cliente(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Cliente não encontrado.');
            RETURN;
    END;

    IF v_cliente.id_cliente IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Nome do Cliente: ' || v_cliente.nm_cliente);
        DBMS_OUTPUT.PUT_LINE('CPF do Cliente: ' || v_cliente.nr_cpf);
    END IF;
END;
/

--------------------------
-- VEICULO
--------------------------
DECLARE
    v_veiculo t_rc_veiculo%ROWTYPE;
BEGIN
    BEGIN
        v_veiculo := ler_veiculo(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Veículo não encontrado.');
            RETURN;
    END;

    IF v_veiculo.id_veiculo IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Marca do Veículo: ' || v_veiculo.marca);
        DBMS_OUTPUT.PUT_LINE('Modelo do Veículo: ' || v_veiculo.modelo);
    END IF;
END;
/

--------------------------
-- RESERVA
--------------------------
DECLARE
    v_reserva t_rc_reserva%ROWTYPE;
BEGIN
    BEGIN
        v_reserva := ler_reserva(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Reserva não encontrada.');
            RETURN;
    END;

    IF v_reserva.id_reserva IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Data e Hora de Início da Reserva: ' || TO_CHAR(v_reserva.dt_hr_inicio_reserva, 'DD/MM/YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Data e Hora de Fim da Reserva: ' || TO_CHAR(v_reserva.dt_hr_fim_reserva, 'DD/MM/YYYY HH24:MI:SS'));
    END IF;
END;
/

--------------------------
-- CHECK-IN
--------------------------
DECLARE
    v_check_in t_rc_check_in%ROWTYPE;
BEGIN
    BEGIN
        v_check_in := ler_check_in(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Check-in não encontrado.');
            RETURN;
    END;

    IF v_check_in.id_check_in IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Nível de Combustível: ' || v_check_in.nv_combustivel);
        DBMS_OUTPUT.PUT_LINE('Quilometragem Atual: ' || v_check_in.km_atual);
    END IF;
END;
/

--------------------------
-- CHECK-OUT
--------------------------
DECLARE
    v_check_out t_rc_check_out%ROWTYPE;
BEGIN
    BEGIN
        v_check_out := ler_check_out(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Check-out não encontrado.');
            RETURN;
    END;

    IF v_check_out.id_check_out IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Nível de Combustível: ' || v_check_out.nv_combustivel);
        DBMS_OUTPUT.PUT_LINE('Quilometragem Atual: ' || v_check_out.km_atual);
    END IF;
END;
/

--------------------------
-- PAGAMENTO
--------------------------
DECLARE
    v_pagamento t_rc_pagamento%ROWTYPE;
BEGIN
    BEGIN
        v_pagamento := ler_pagamento(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Pagamento não encontrado.');
            RETURN;
    END;

    IF v_pagamento.id_pagamento IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Data e Hora do Pagamento: ' || TO_CHAR(v_pagamento.dt_hr_pagamento, 'DD/MM/YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Valor do Pagamento: ' || v_pagamento.vl_pagamento);
    END IF;
END;
/


