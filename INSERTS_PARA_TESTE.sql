INSERT INTO t_rc_autentica (id_autentica, email, senha, st_autentica, t_rc_cliente_id_cliente)
VALUES (1, 'administrador@redecar.com', 'administrador2024', 'A', 1);
INSERT INTO t_rc_check_in (id_check_in, nv_combustivel, km_atual, dt_hr_check_in, st_veiculo, t_rc_reserva_id_reserva, id_cliente)
VALUES (1, 50.25, 10000, SYSDATE, 'Bom estado', 1, 1);
INSERT INTO t_rc_check_out (id_check_out, nv_combustivel, km_atual, dt_hr_check_out, st_veiculo, t_rc_check_in_id_check_in)
VALUES (1, 30.50, 10500, SYSDATE, 'Bom estado', 1);
INSERT INTO t_rc_cliente (id_cliente, nm_cliente, nr_rg, nr_cpf, dt_nascimento, sx_cliente, gr_ensino, es_civil)
VALUES (1, 'Joâo Oliveira', '20.236.538-4', '326.068.390-99', TO_DATE('1994-01-21', 'YYYY-MM-DD'), 'M', 'Superior completo', 'Solteiro(a)');
INSERT INTO t_rc_endereco (id_endereco, nm_logradouro, nr_logradouro, cep, bairro, cidade, estado, ds_complemento, t_rc_cliente_id_cliente)
VALUES (1, 'Avenida Castelo', 123, '12345-678', 'Bairro das Flores', 'São paulo', 'SP', 'Apto 15', 1);
INSERT INTO t_rc_pagamento (id_pagamento, dt_hr_pagamento, st_pagamento, vl_pagamento, tp_pagamento, t_rc_check_out_id_check_out)
VALUES (1, SYSDATE, 'Pago', 150.00, 'Cartão de crédito', 1);
INSERT INTO t_rc_preco_veiculo (id_preco, tx_dia, tx_km)
VALUES (1, 100.00, 0.50);
INSERT INTO t_rc_reserva (id_reserva, dt_hr_inicio_reserva, dt_hr_fim_reserva, t_rc_veiculo_id_veiculo, t_rc_cliente_id_cliente)
VALUES (1, SYSDATE, SYSDATE + 7, 1, 1);
INSERT INTO t_rc_servico (id_servico, tp_servico, tx_servico)
VALUES (1, 'Lavagem externa', 50.00);
INSERT INTO t_rc_servico_reserva (id_servico_reserva, t_rc_reserva_id_reserva, t_rc_servico_id_servico, id_cliente)
VALUES (1, 1, 1, 1);
INSERT INTO t_rc_veiculo (id_veiculo, renavam, marca, modelo, placa_veiculo, tp_veiculo, cambio, t_rc_preco_veiculo_id_preco)
VALUES (1, 987654321, 'Toyota', 'Corolla', 'XYZ5678', 'Sedan', 'Auto', 1);

