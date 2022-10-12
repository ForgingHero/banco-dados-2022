
CREATE DATABASE software_vida_financeira;

USE software_vida_financeira;

CREATE TABLE cliente (
ID_CLIENTE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
NOME_COMPLETO VARCHAR(75) NOT NULL,
CPF VARCHAR(11) NOT NULL,
EMAIL VARCHAR(75) NOT NULL,
SENHA VARCHAR(20) NOT NULL,
DATA_NASCIMENTO DATE,
PROFISSAO VARCHAR(50),
GENERO ENUM('M', 'F'),
AVISOS_PELO_DISPOSITIVO_MOVEL BIT(1)
);

CREATE TABLE endereco (
ID_ENDERECO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ID_CLIENTE INT UNSIGNED NOT NULL,
CPF CHAR(11) NOT NULL,
CEP CHAR(8),
RUA VARCHAR(50) NOT NULL,
NUMERO SMALLINT UNSIGNED NOT NULL,
COMPLEMENTO VARCHAR(15),
BAIRRO VARCHAR(50) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
ESTADO CHAR(2) NOT NULL,
PAIS VARCHAR(50) NOT NULL,
FOREIGN KEY (ID_CLIENTE) REFERENCES cliente(ID_CLIENTE) on delete cascade
);

CREATE TABLE conta_corrente (
ID_CONTA_CORRENTE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ID_CLIENTE INT UNSIGNED NOT NULL,
CPF CHAR(11) NOT NULL,
CODIGO_DO_BANCO VARCHAR(8) NOT NULL,
NUMERO_DA_CONTA VARCHAR(5) NOT NULL,
AGENCIA VARCHAR(4) NOT NULL,
APELIDO VARCHAR(15) NOT NULL,
SALDO FLOAT, 
FOREIGN KEY (ID_CLIENTE) REFERENCES cliente(ID_CLIENTE) on delete cascade
);

CREATE TABLE movimentacao_financeira (
ID_MOVIMENTACAO_FINANCEIRA INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
ID_CONTA_CORRENTE INT UNSIGNED NOT NULL,
VALOR FLOAT NOT NULL,
DATA DATE NOT NULL,
CATEGORIA VARCHAR(50) NOT NULL,
FOREIGN KEY (ID_CONTA_CORRENTE) REFERENCES conta_corrente(ID_CONTA_CORRENTE) on delete cascade
);

