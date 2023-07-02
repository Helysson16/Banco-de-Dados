# 1. Nome dos clietes de acordo com o seu cpf
select nome as nome_cli from usuario where cpf = '333.333.333-33';
#2.Pega o telefone do cliente de acordo com o seu cpf
select telefone as tel_user from teluser where fk_cpf = '333.333.333-33';
#3. pega o telefone da empresa de acordo com o seu cnpj
select telefone as tel_emp from telepresa where fk_cnpj = '00.111.222/0001-11';
#4. pega o endereço da empresa de acordo com o seu cnpj
select endereço END_emp from empresa where cnpj = '00.111.222/0001-11';
#5. Mostra o endereço do usuario de acordo com o seu cpf
select endereço as END_user from usuario where cpf = '333.333.333-33';
#6. Mostra o código do administrador no qual o usuário já teve contato
select FK_codigo as cód_ADM from usuarioadm where FK_cpf = '333.333.333-33';
#7. mostra o código do administrador na qual a empresa já teve contato
select FK_codigo as cód_ADM from admempresa where FK_empresa_cnpj = '00.111.222/0001-11';
#8.mostra o email do administrador de acordo com o seu código
select email as Contato_adm from administrador where codigo = 1;
#9. Selecionar as empresas e seus respectivos administradores
SELECT empresa.cnpj, empresa.endereço, administrador.email FROM empresa, Admempresa, administrador
WHERE empresa.cnpj = Admempresa.FK_empresa_cnpj
AND Admempresa.FK_codigo = administrador.codigo;
#10. Selecionar as empresas que possuem administradores
SELECT empresa.cnpj, empresa.endereço FROM empresa, Admempresa
WHERE empresa.cnpj = Admempresa.FK_empresa_cnpj;
#11. Selecionar o nome e endereço dos usuários
SELECT nome, endereço FROM usuario;
#12. Selecionar todas as informações dos administradores que estão associados a uma empresa específica
SELECT administrador.* FROM administrador, Admempresa
WHERE administrador.codigo = Admempresa.FK_codigo
AND Admempresa.FK_empresa_cnpj = '00.111.222/0001-11';

