create database hidrocontrol;
use hidrocontrol;

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
    
    select * from empresa;
    insert into empresa values 
    (null,'Linx','empresalinx@contato.com','linxlili','54638219023456','02201000','São Paulo','Vila Gustavo','Avenida Júlio Buono',1630,'A'),
    (null,'Bandtec','empresaband@contato.com','band.tec','54378965432190','02860001','São Paulo','Vila Souza','Avenida Deputado Cantídio',1540,'B'),
    (null,'Safra','safraempresa@contato.com','safra.banco','76543876532187','08375000','São Paulo','Jardim Três Marias','Avenida Ragueb Chohfi',1600,'A'),
    (null,'Accenture','acentureempresa@contato','accenturebaba','56437896543267','08730001','Paranapiaca','Jarbas mineirinha','Rua Carlos Pericilio',1700,'B');
    
-- selecione o IDempresa e o nome 
    select idEmpresa, nome from empresa;
    
-- selecione a  empresa que termine com a lentra do nome c 
    select nome from empresa where nome like '%c';

-- selecione o nome e o cenpj das empresas que termine com o numero 7
select nome, cnpj from empresa where cnpj like '%7';

-- selecione o idempresa, nome, email e cidade 
select idEmpresa, nome, email, cidade from empresa;

-- selecione todos os dados mais em ordem crecente pelo nome das empresas
select * from empresa order by nome; 


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

select * from funcionario;
insert into funcionario values
(null,'Nathalia Santos','Natha.Santos@contato.com','nanathi','987645390','87543612341','2003-09-23','67543210','São Paulo','Campo Limpo','Avenida Parque dos Ypês',1,'B','(11)998653579',2),
(null,'Brenda Silva','brendinha.silva@contato.com','bresilva','675498760','65432890760','1993-01-25','67890654','São Paulo','Eliseu Castro','Rua Jose Castilho Mendes',1,'B','(11)996543267',3),
(null,'Leonardo Santos','leozinho.Santos@contato.com','leleolima','876543261','87654329821','2002-08-27','76543284','Paranapiaca','Pedro Drematio','Travessa São Carlos',2,'A','(41)987654657',4),
(null,'Leticia Santos','leleh.santos@contato.com','lelesantos','876598541','76543291021','2001-02-02','76583450','São Paulo','Terezinha','Rua Luiz Palucio',4,'A','(11)965432765',1),
(null,'Dandara Silva','danda.silva@contato.com','dansilva','876532890','76543890650','1989-08-25','89765430','São Paulo','Bernardinho',' Avenida Frederico Caldeira',3,'A','(11)986543876',1); 

-- selecione o nome, idfuncionario, idempresa e o telefone 
select idfuncionario, nome, idempresa, telefone from funcionario;

-- selecione dados completos de funcionarios da mesma empresa
select idfuncionario, nome, email, senha, rg, cpf, data_nascimento, cep, cidade, bairro, logradouro, numero, complemento, telefone, idempresa from funcionario where idempresa like '1';

-- selecione os dados completos de pessoas que tem o sobrenome Silva
select idfuncionario, nome, email, senha, rg, cpf, data_nascimento, cep, cidade, bairro, logradouro, numero, complemento, telefone, idempresa from funcionario where nome like '%% Silva';

-- selecione todos os dados em ordem crescente pelo rg dos funcionarios 
select idfuncionario, nome, email, senha, rg, cpf, data_nascimento, cep, cidade, bairro, logradouro, numero, complemento, telefone, idempresa from funcionario order by rg;

-- selecione os dados completo de pessoas que contem letra L no inicio do nome 
select idfuncionario, nome, email, senha, rg, cpf, data_nascimento, cep, cidade, bairro, logradouro, numero, complemento, telefone, idempresa from funcionario where nome like 'L%';


