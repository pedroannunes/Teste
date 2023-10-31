create database db_livraria;
use db_livraria;
create table tb_livro(
pk_id_livro int primary key not null auto_increment,
nome_livro varchar (100),
genero_livro enum ('romance','misterio','aventura','suspense','comedia','ficcao','policial','biografia'),
autor_livro varchar (50),
editora_livro varchar (20),
data_publi date,
capa_dura enum ('roller','mole','cartao','parana'),
valor_livro decimal (10.2),
rating enum ('otimo','bom','regular','ruim','pessimo')
);

describe tb_livro;

select * from tb_livro;
select nome_livro, genero_livro from tb_livro;

select nome_livro, genero_livro from tb_livro where rating = 'otimo' and valor_livro < 80.00;

insert into tb_livro
(nome_livro,genero_livro,autor_livro,editora_livro,data_publi,capa_dura,valor_livro,rating) 
value
('1q84','ficcao','haruk murakami','saraiva','2009-08-02','mole',50,'otimo'),
('perdida','romance','Carina Rissi','verus editora','2011-08-26','roller',49,'regular'),
('garota exemplar','suspense','Gillian Fynnn','intrinseca','2011-10-11','roller',69,'otimo'),
('Operação cavalo de troia','ficcao','jj benitez','saraiva','1960-10-09','mole',79,'otimo');

create table tb_autor(
pk_id_autor int primary key not null auto_increment,
nome_autor varchar(100),
endereco_autor varchar(50),
pais_origem varchar(50)
);

describe tb_autor;
select*from tb_autor;

insert into tb_autor
(nome_autor, endereco_autor, pais_origem) value
('haruk murakami','sao paulo','Brasil'),
('Carina Rissi','Rio de Janeiro','Brasil'),
('Gillian Flynn','Pernambuco','Brasil'),
('jj benitez','Santa Catarina','Brasil');

create table tb_editora(
pk_id_editora int primary key not null auto_increment,
nome_editora varchar(20),
telefone_editora varchar(20),
endereco_editora varchar(50)
);

describe tb_editora;
select*from tb_editora;

insert into tb_editora (nome_editora,telefone_editora,endereco_editora) value
('saraiva','(11)91111-1111','Rua Lapa Tito, 54'),
('verus editora','(11)92222-2222','Rua Lapa Tito, 1'),
('intrinseca','(21)93333-3333','Rua Maikon, 10');


create table tb_pessoa(
	pk_id_nome int primary key not null auto_increment,
    nome_pessoa varchar(100),
    idade_pessoa int
);

describe tb_pessoa;

alter table tb_pessoa add time_pessoa varchar(15);

alter table tb_pessoa add peso_pessoa decimal(65.2);

alter table tb_livro drop column autor_livro, drop column editora_livro;

describe tb_livro;

alter table tb_livro add column fk_id_autor int;

alter table tb_livro add constraint fk_id_autor foreign key (fk_id_autor) references tb_autor(pk_id_autor);

alter table tb_livro add column fk_id_editora int;

alter table tb_livro add constraint fk_id_editora foreign key (fk_id_editora) references tb_editora(pk_id_editora);









