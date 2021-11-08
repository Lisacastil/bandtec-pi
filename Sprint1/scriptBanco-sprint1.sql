/*
	Para criar um modelo representando o banco de dados:
	
    Aperte CTRL + R
    Clique em "next" 2 vezes
    Selecione "hydroworks" e clique em next até aparecer o modelo
*/

CREATE DATABASE HydroWorks;
USE HydroWorks;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(64),
	email VARCHAR(128),
    senha VARCHAR(32),
    cnpj CHAR(14),
    cep CHAR(8),
    cidade VARCHAR(64),
    bairro VARCHAR(64),
    logradouro VARCHAR(64),
    numero INT,
    complemento CHAR(1)
);

CREATE TABLE Funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(64),
	email VARCHAR(128),
    senha VARCHAR(32),
    rg VARCHAR(9),
    cpf CHAR(11),
    data_nascimento DATE,
	cep CHAR(8),
    cidade VARCHAR(64),
    bairro VARCHAR(64),
    logradouro VARCHAR(64),
    numero INT,
    complemento CHAR(1),
    telefone CHAR(13),
    idEmpresa INT
);

CREATE TABLE Hortalica (
	idHortalica INT PRIMARY KEY AUTO_INCREMENT,
    nomeHortalica VARCHAR(100)
);

CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_iNCREMENT,
    idHortalica INT,
    idFuncionario INT
);

CREATE TABLE LogsSensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	logLuminosidade VARCHAR(10),
    logUmidade VARCHAR(10),
    dataHoraLog DATETIME,
    idEstufa INT
);
/*drop table Telefone;
drop table Funcionario;
drop table Empresa;

drop database hydroworks