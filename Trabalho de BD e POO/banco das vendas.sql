create database venda;
use venda;

create table cliente(
nome varchar(50),
cpf varchar(14) not null,
endereco varchar(50),
telefone varchar(30),
primary key(cpf)
);

create table loja(
nome varchar(50),
cnpj varchar(18) not null, 
primary key(cnpj)
);

create table pedido(
quantidade varchar(50),
numeroDoPedido int auto_increment,
dataDopedido varchar(20) ,
valorDoFrete varchar(15),
fk_cpf_cliente varchar(14),
fk_cnpj_loja varchar(18),
foreign key (fk_cpf_cliente) references cliente(cpf),
foreign key (fk_cnpj_loja) references loja(cnpj), 
primary key(numeroDoPedido, fk_cpf_cliente, fk_cnpj_loja)
);

create table produto(
precoUnitario varchar(50),
nomeDoProduto varchar(50),
id int auto_increment,
primary key(id)
);

create table itemPedido(
fk_numero_pedido int,
fk_id_produto int,
qntd int,
primary key(fk_numero_pedido, fk_id_produto),
foreign key (fk_numero_pedido) references pedido(numeroDoPedido),
foreign key (fk_id_produto) references produto(id)
);



