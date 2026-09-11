--Tabela: CLINICA
CREATE TABLE CLINICA
(
  CNPJ_clinica CHAR(14) NOT NULL,
  CEP CHAR(8) NOT NULL,
  Rua VARCHAR(100) NOT NULL,
  Cidade VARCHAR(50) NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(50),
  PRIMARY KEY (CNPJ_clinica)
);


--Tabela: FUNCIONARIO
CREATE TABLE FUNCIONARIO
(
  ID_funcionario INT NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Salario FLOAT NOT NULL,
  data_contratacao DATE NOT NULL,
  CEP CHAR(8) NOT NULL,
  Rua VARCHAR(100) NOT NULL,
  Cidade VARCHAR(50) NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(50),
  CNPJ_clinica CHAR(14) NOT NULL,
  PRIMARY KEY (ID_funcionario),
  FOREIGN KEY (CNPJ_clinica) REFERENCES CLINICA(CNPJ_clinica)
);


--Tabela: CONVENIO
CREATE TABLE CONVENIO
(
  ID_convenio INT NOT NULL,
  Empresa VARCHAR(100) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_convenio)
);


--Tabela: PACIENTE
CREATE TABLE PACIENTE
(
  CPF_paciente CHAR(11) NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Data_nascimento DATE NOT NULL,
  CEP CHAR(8) NOT NULL,
  Rua VARCHAR(100) NOT NULL,
  Cidade VARCHAR(50) NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(50),
  CNPJ_clinica CHAR(14) NOT NULL,
  ID_convenio INT,
  PRIMARY KEY (CPF_paciente),
  FOREIGN KEY (CNPJ_clinica) REFERENCES CLINICA(CNPJ_clinica),
  FOREIGN KEY (ID_convenio) REFERENCES CONVENIO(ID_convenio)
);


--Tabela: RECEPCIONISTA
CREATE TABLE RECEPCIONISTA
(
  ID_recepcionista INT NOT NULL,
  Turno VARCHAR(50) NOT NULL,
  ID_funcionario INT NOT NULL UNIQUE,
  PRIMARY KEY (ID_recepcionista),
  FOREIGN KEY (ID_funcionario) REFERENCES FUNCIONARIO(ID_funcionario)
);


--Tabela: DENTISTA
CREATE TABLE DENTISTA
(
  ID_dentista INT NOT NULL,
  CRO CHAR(8) NOT NULL,
  Especialidade VARCHAR(50) NOT NULL,
  ID_funcionario INT NOT NULL UNIQUE,
  PRIMARY KEY (ID_dentista),
  FOREIGN KEY (ID_funcionario) REFERENCES FUNCIONARIO(ID_funcionario)
);


--Tabela: TRATAMENTO
CREATE TABLE TRATAMENTO
(
  ID_tratamento INT NOT NULL,
  Tipo VARCHAR(100) NOT NULL,
  Valor FLOAT NOT NULL,
  PRIMARY KEY (ID_tratamento)
);



--Tabela: CONSULTA
CREATE TABLE CONSULTA
(
  ID_consulta INT NOT NULL,
  Sala INT NOT NULL,
  Data DATE NOT NULL,
  Hora TIME NOT NULL,
  CPF_paciente CHAR(11) NOT NULL,
  ID_dentista INT NOT NULL,
  ID_recepcionista INT NOT NULL,
  ID_tratamento INT NOT NULL,
  PRIMARY KEY (ID_consulta),
  FOREIGN KEY (CPF_paciente) REFERENCES PACIENTE(CPF_paciente),
  FOREIGN KEY (ID_dentista) REFERENCES DENTISTA(ID_dentista),
  FOREIGN KEY (ID_recepcionista) REFERENCES RECEPCIONISTA(ID_recepcionista),
  FOREIGN KEY (ID_tratamento) REFERENCES TRATAMENTO(ID_tratamento)
);


--Tabela: PAGAMENTO
CREATE TABLE PAGAMENTO
(
  ID_pagamento INT NOT NULL,
  Vencimento DATE NOT NULL,
  Forma_pagamento VARCHAR(50) NOT NULL,
  Valor FLOAT NOT NULL,
  Status VARCHAR(50) NOT NULL,
  ID_consulta INT NOT NULL,
  CPF_paciente CHAR(11) NOT NULL,
  PRIMARY KEY (ID_pagamento),
  FOREIGN KEY (ID_consulta) REFERENCES CONSULTA(ID_consulta),
  FOREIGN KEY (CPF_paciente) REFERENCES PACIENTE(CPF_paciente)
);


--Tabela: FORNECEDOR
CREATE TABLE FORNECEDOR
(
  ID_fornecedor INT NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  CEP CHAR(8) NOT NULL,
  Rua VARCHAR(100) NOT NULL,
  Cidade VARCHAR(50) NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  Numero INT NOT NULL,
  Complemento VARCHAR(50),
  PRIMARY KEY (ID_fornecedor)
);


--Tabela: EQUIPAMENTO
CREATE TABLE EQUIPAMENTO
(
  ID_equipamento INT NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  Status VARCHAR(50) NOT NULL,
  ID_fornecedor INT NOT NULL,
  PRIMARY KEY (ID_equipamento),
  FOREIGN KEY (ID_fornecedor) REFERENCES FORNECEDOR(ID_fornecedor)
);


--Tabela: UTILIZA
CREATE TABLE UTILIZA
(
  ID_dentista INT NOT NULL,
  ID_equipamento INT NOT NULL,
  PRIMARY KEY (ID_dentista, ID_equipamento),
  FOREIGN KEY (ID_dentista) REFERENCES DENTISTA(ID_dentista),
  FOREIGN KEY (ID_equipamento) REFERENCES EQUIPAMENTO(ID_equipamento)
);


--Tabela: REQUER
CREATE TABLE REQUER
(
  ID_tratamento INT NOT NULL,
  ID_equipamento INT NOT NULL,
  Quantidade INT NOT NULL,
  PRIMARY KEY (ID_tratamento, ID_equipamento),
  FOREIGN KEY (ID_tratamento) REFERENCES TRATAMENTO(ID_tratamento),
  FOREIGN KEY (ID_equipamento) REFERENCES EQUIPAMENTO(ID_equipamento)
);


--Tabela: FUNCIONARIO_TELEFONE
CREATE TABLE FUNCIONARIO_TELEFONE
(
  Telefone CHAR(11) NOT NULL,
  ID_funcionario INT NOT NULL,
  PRIMARY KEY (Telefone, ID_funcionario),
  FOREIGN KEY (ID_funcionario) REFERENCES FUNCIONARIO(ID_funcionario)
);


--Tabela: PACIENTE_TELEFONE
CREATE TABLE PACIENTE_TELEFONE
(
  Telefone CHAR(11) NOT NULL,
  CPF_paciente CHAR(11) NOT NULL,
  PRIMARY KEY (Telefone, CPF_paciente),
  FOREIGN KEY (CPF_paciente) REFERENCES PACIENTE(CPF_paciente)
);



--Tabela: FORNECEDOR_TELEFONE
CREATE TABLE FORNECEDOR_TELEFONE
(
  Telefone CHAR(11) NOT NULL,
  ID_fornecedor INT NOT NULL,
  PRIMARY KEY (Telefone, ID_fornecedor),
  FOREIGN KEY (ID_fornecedor) REFERENCES FORNECEDOR(ID_fornecedor)
);