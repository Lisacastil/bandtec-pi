CREATE DATABASE Plantec;
USE Plantec;

-- Criação da tabela Empresa!

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(64),
	email VARCHAR(128),
    senha VARCHAR(32),
    cnpj CHAR(19),
    cep CHAR(11),
    logradouro VARCHAR(45),
    cidade VARCHAR(64),
    bairro VARCHAR(64),
    numero INT,
    complemento VARCHAR(15)
    );

-- Criação da tabela Funcionario!

CREATE TABLE Funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(64),
    senha VARCHAR(64),
    fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa))AUTO_INCREMENT=1000;

-- ALTER TABLE Funcionario ADD FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa);

-- Criação da tabela Estufa!

CREATE TABLE Estufa (
	idEstufa INT PRIMARY KEY AUTO_iNCREMENT,
    idFuncionario INT,
    fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
)AUTO_INCREMENT= 10000;

-- Criação da tabela LogsSensor!

CREATE TABLE LogsSensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	logLuminosidade VARCHAR(10),
    logUmidade VARCHAR(10),
    dataHoraLog DATETIME,
    fkEstufa INT,
FOREIGN KEY (fkEstufa) REFERENCES Estufa(idEstufa)
)AUTO_INCREMENT = 10;

Create table permissão(
fkfuncionario INT,
FOREIGN KEY (fkfuncionario) REFERENCES Funcionario(idFuncionario),
fkEstufa INT,
FOREIGN KEY (fkestufa) REFERENCES Estufa(idEstufa)
);

-- Inserindo dados na tabela Empresa!

INSERT INTO Empresa VALUES
(null,'Seu João','seujoão@hotmail.com','joão123','56.814.395/0001-10','18915-118','Rua Ipê','São Paulo','Estação','56',null),
(null,'Camil','camil@hotmail.com','camil456','64.904.295/0001-03','05093-902','Rua Fortunato Ferraz','São Paulo','Vila Anastácio','1001',null),
(null,'ambev','ambev@outlook.com','ambev789','07.526.557/0001-00','04530-001','Rua Dr. Renato Paes de Barros','São Paulo','Itaim Bibi','1017','03º andar'),
(null,'bunge alimentos','bungeali@gmail.com','bunge222','84.046.101/0379-41','11013-928','Rua Diogo Moreira','Santos','Paqueta','86',null),
(null,'Amaggi','amggi@gmail.com','amaggi111','77.294.254/0001-94','78049-080','Avenida André Antônio Maggi','Mato grosso','Alvorada Cuiabá','303',null);

-- Inserindo dados na tabela Funcionario!

INSERT INTO Funcionario(idFuncionario, nome, senha, fkempresa) VALUES
(null,'André Silva','90909090','3'),
(null,'Antonio Bandeira','12121212','2'),
(null,'José Augusto','34343434','4'),
(null,'Maria Paula','56565656','5'),
(null,'Fernando Brandão','78787878','1');
 
 -- Inserindo dados na tabela Estufa!
 
 INSERT INTO Estufa VALUES
 (null,'1001',3),
 (null,'1002',2),
 (null,'1004',4),
 (null,'1003',1),
 (null,'1000',5);

-- Inserindo dados na tabela LogsSensor!

 INSERT INTO LogsSensor VALUES
 (null,'1002','80%','2021-05-08 12:35:29','10000'),
 (null,'1004','55%','2021-06-09 13:21:30','10002'),
 (null,'945','95%','2021-05-13 15:22:44','10003'),
 (null,'900','30%','2021-11-20 22:55:14','10004'),
 (null,'1000','60%','2021-01-01 11:35:12','10001');
 
 -- Inserindo dados na tabela permissão!
 
 INSERT INTO permissão VALUES
 (1000,10000),
 (1001,10001),
 (1002,10002),
 (1003,10003),
 (1004,10004);
 
 -- Exibir tabela Empresa!
 
SELECT * FROM Empresa;
 
 -- Exibir tabela funcionario!
 
 SELECT * FROM funcionario;
 
  -- Exibir tabela Estufa!
 
 SELECT * FROM Estufa;
 
 
 -- Exibir tabela Estufa!
 
 SELECT * FROM LogsSensor;
 
 
  -- Exibir tabela Estufa/Funcionario!

SELECT * FROM Empresa
				INNER JOIN Funcionario
						ON idEmpresa = FkEmpresa;
                        
-- Exibir tabela Empresa/Estufa/Sensor!                        
                        
SELECT * FROM Empresa
				INNER JOIN Estufa
						ON idEmpresa = FkEmpresa
							INNER JOIN LogsSensor
								ON idEstufa = FkEstufa;
                                
-- Exibir tabela Empresa/Funcionario/Permissão/Estufa!                                 

SELECT * FROM Empresa
				INNER JOIN Funcionario
						ON idEmpresa = FkEmpresa
								INNER JOIN Permissão
										ON idFuncionario = FkFuncionario
											INNER JOIN Estufa
												ON fkEstufa = idEstufa;
                                                
 -- Exibir tabela Estufa/Sensor!                                                  
					
SELECT * FROM Estufa 
			INNER JOIN LogsSensor 
					ON idEstufa = FkEstufa;


DROP TABLE Empresa;
DROP TABLE Funcionario;
DROP TABLE Permissão;
DROP TABLE Estufa;
DROP TABLE LogsSensor; 

                    
