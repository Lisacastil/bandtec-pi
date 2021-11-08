CREATE DATABASE Plantec;
USE Plantec;

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
    complemento VARCHAR(15));

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
    complemento VARCHAR(15),
    telefone CHAR(13),
    fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa));

select * from Empresa,Funcionario;

CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_iNCREMENT,
    idHortalica INT
);

CREATE TABLE LogsSensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	logLuminosidade VARCHAR(10),
    logUmidade VARCHAR(10),
    dataHoraLog DATETIME,
    FkEstufa INT,
    foreign key (FkEstufa) references estufa(idEstufa)
);

Create table consulta (
fkFuncionario int,
foreign key (fkfuncionario) references Funcionario(Idfuncionario),
fkEstufa int,
foreign key (fkEstufa) references Estufa(IdEstufa),
datahora DATETIME,
relatorio VARCHAR(60),
primary key (fkFuncionario, fkEstufa, datahora)
);

drop TABLE LogsSensor;
drop table Funcionario;
drop table Empresa;
drop database Plantec;