USE sprint1;

CREATE TABLE cadastro_empresa (
idEmpresa int primary key auto_increment,
razao_social varchar(50),
CNPJ char(14),
endereco varchar (70),
CEP char(8),
cidade varchar(30),
estado varchar(30),
email varchar(40),
telefone varchar(11),
usermaster varchar(30),
senha varchar(15));

CREATE TABLE cadastro_usuario (
idUsuario int primary key auto_increment,
nome_completo varchar(50),
cargo varchar(30),
email varchar(40),
telefone varchar(11),
username varchar(30),
senha varchar (15));

CREATE TABLE sensor_umidade (
idSensor_umidade int primary key,
medicao_umidade datetime,
umidade_relativa varchar(5));

CREATE TABLE sensor_luminosidade (
idSensor_luminosidade int primary key,
medicao_luminosidade datetime,
luminosidade varchar(5));

CREATE TABLE estufa (
idEstufa int primary key,
idEmpresa int,
idUsuario int,
idSensor_umidade int,
idSensor_luminosidade int);



