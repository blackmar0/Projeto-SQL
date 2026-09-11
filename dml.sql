--Inserindo dados na tabela CLINICA
INSERT INTO CLINICA (CNPJ_clinica, CEP, Rua, Cidade, Bairro, Numero, Complemento)
VALUES 
('12345678901234', '09820-480', 'Rua Carlos del Prete', 'São Bernardo do Campo', 'Centro', 63, NULL),
('09876543210987', '09280-000', 'Rua Oratório', 'Santo André', 'Parque das nações', 2027, NULL);


--Inserindo dados na tabela CONVENIO
INSERT INTO CONVENIO (ID_convenio, Empresa, Tipo) VALUES 
(1, 'Amil Dental', 'Premium'),
(2, 'Unimed Odonto', 'Básico'),
(3, 'Bradesco Saúde', 'Pleno');


--Inserindo dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (ID_funcionario, Nome, Salario, data_contratacao, CEP, Rua, Cidade, Bairro, Numero, Complemento, CNPJ_clinica) VALUES
(1, 'Alice Souza', 2500.00, '2023-01-10', '02340-050', 'Av Paulista', 'São Paulo', 'Bela Vista', 234, 'Casa 2', '12345678901234'),
(2, 'Bruno Lima', 2500.00, '2023-02-15', '03498-450', 'Av Paulista', 'São Paulo', 'Bela Vista', 541, NULL, '09876543210987'),
(3, 'Carlos Silva', 6000.00, '2022-05-20', '04532-678', 'Rua Itaim', 'São Paulo', 'Itaim', 156, NULL, '12345678901234'),
(4, 'Daniela Reis', 6000.00, '2022-06-01', '43567-540', 'Rua Itaim', 'São Paulo', 'Itaim', 14,  NULL, '12345678901234'),
(5, 'Eduardo Gomes', 6000.00, '2022-08-10', '03450-650', 'Rua Direita', 'São Paulo', 'Sé', 5430, 'Bloco 2 apt.23', '09876543210987'),
(6, 'Fernanda Lima', 2500.00, '2023-05-20', '34220-032', 'Rua Direita', 'São Paulo', 'Sé', 1561,  NULL, '09876543210987'),
(7, 'Gabriel Costa', 6000.00, '2022-09-12', '02348-040', 'Rua Itaim', 'São Paulo', 'Itaim Bibi', 63, NULL, '09876543210987'),
(8, 'Helena Souza', 2500.00, '2023-06-15', '45322-645', 'Rua Itaim', 'São Paulo', 'Itaim Bibi', 641, 'Bloco 2 apt.23', '12345678901234');


--Inserindo dados na tabela RECEPCIONISTA
INSERT INTO RECEPCIONISTA (ID_recepcionista, Turno, ID_funcionario) VALUES 
(1, 'Manhã', 1),
(2, 'Manhã', 2),
(3, 'Tarde', 6),
(4, 'Tarde', 8);


--Inserindo dados na tabela DENTISTA
INSERT INTO DENTISTA (ID_dentista, CRO, Especialidade, ID_funcionario) VALUES 
(1, '12345SP', 'Ortodontia', 3),
(2, '67890SP', 'Odontopediatria', 4),
(3, '12345SP', 'Ortodontia', 5),
(4, '67890SP', 'Odontopediatria', 7);


--Inserindo dados na tabela PACIENTE
INSERT INTO PACIENTE (CPF_paciente, Nome, Data_nascimento, CEP, Rua, Cidade, Bairro, Numero, CNPJ_clinica, ID_convenio) VALUES
('11122233344', 'João das Neves', '1990-05-15', '12345-600', 'Rua Voluntários', 'São Paulo', 'Santana', 100, '12345678901234', 1),
('55566677788', 'Maria Clara', '1985-08-20', '75245-000', 'Rua das verdades', 'São Paulo', 'tatué', 105, '09876543210987', 1),
('99900011122', 'Ricardo Jorge', '1978-12-01', '65445-857', 'Rua Bresser', 'São Paulo', 'Mooca', 20, '12345678901234', 2);


--Inserindo dados na tabela TRATAMENTO
INSERT INTO TRATAMENTO (ID_tratamento, Tipo, Valor) VALUES 
(1, 'Limpeza', 200.00), 
(2, 'Canal', 800.00), 
(3, 'Aparelho Ortodôntico', 1500.00);


--Inserindo dados na tabela CONSULTA
INSERT INTO CONSULTA (ID_consulta, Sala, Data, Hora, CPF_paciente, ID_dentista, ID_recepcionista, ID_tratamento) VALUES
(1, 101, '2024-03-01', '09:00', '11122233344', 1, 1, 3),
(2, 201, '2024-03-01', '10:00', '55566677788', 3, 2, 2), 
(3, 101, '2024-03-02', '14:00', '99900011122', 1, 4, 1);


--Inserindo dados na tabela PAGAMENTO
INSERT INTO PAGAMENTO (ID_pagamento, Vencimento, Forma_pagamento, Valor, Status, ID_consulta, CPF_paciente) VALUES
(1, '2024-03-10', 'Cartão de Crédito', 1500.00, 'Pago', 1, '11122233344'),
(2, '2024-03-10', 'Boleto', 800.00, 'Pendente', 2, '55566677788'),
(3, '2024-03-12', 'Dinheiro', 200.00, 'Pago', 3, '99900011122');


--Inserindo dados na tabela FORNECEDOR
INSERT INTO FORNECEDOR (ID_fornecedor, Nome, CEP, Rua, Cidade, Bairro, Numero) VALUES 
(1, 'Dental Show', '05050000', 'Rua Roma', 'São Paulo', 'Lapa', 50);


--Inserindo dados na tabela EQUIPAMENTO
INSERT INTO EQUIPAMENTO (ID_equipamento, Tipo, Status, ID_fornecedor) VALUES 
(1, 'Cadeira Odontológica', 'Ativo', 1), (2, 'Raio-X Digital', 'Ativo', 1);


--Inserindo dados na tabela UTILIZA
INSERT INTO UTILIZA (ID_dentista, ID_equipamento) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 1);


--Inserindo dados na tabela REQUER
INSERT INTO REQUER (ID_tratamento, ID_equipamento, Quantidade) VALUES 
(1, 1, 1),
(2, 1, 1),
(2, 2, 1),
(3, 1, 1);


--Inserindo dados na tabela FUNCIONARIO_TELEFONE
INSERT INTO FUNCIONARIO_TELEFONE (Telefone, ID_funcionario) VALUES 
('119111-2222', 1),
('119222-3333', 2),
('119333-4444', 3),
('11333-4444', 3),
('119444-5555', 4),
('119555-5666', 5),
('119666-7777', 6),
('119777-8888', 7),
('119888-8999', 8);


--Inserindo dados na tabela PACIENTE_TELEFONE
INSERT INTO PACIENTE_TELEFONE (Telefone, CPF_paciente) VALUES 
('119000-1111', '11122233344'),
('119000-2222', '55566677788'),
('119000-5555', '99900011122'),
('119233-1231', '11122233344');


--Inserindo dados na tabela FORNECEDOR_TELEFONE
INSERT INTO FORNECEDOR_TELEFONE (Telefone, ID_fornecedor) VALUES 
('11999998888', 1);