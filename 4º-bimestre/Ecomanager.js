const { Sequelize, DataTypes } = require('sequelize');

// Configurar a conexão com o banco de dados
const sequelize = new Sequelize('ecoManager', 'root', '12345678', {
  host: '127.0.0.1',
  dialect: 'mysql',
  // Outras configurações, se necessário
});

// Definir os modelos

const Empresa = sequelize.define('empresa', {
  cnpj: {
    type: DataTypes.STRING(18),
    primaryKey: true,
  },
  endereco: DataTypes.STRING(50),
  cep: DataTypes.STRING(8),
  telefone: DataTypes.STRING(50),
  senha: DataTypes.STRING(15),
  email: DataTypes.STRING(50),
});

const Administrador = sequelize.define('administrador', {
  codigo: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  email: DataTypes.STRING(50),
  nome: DataTypes.STRING(50),
  foto: DataTypes.STRING(15),
});

const Usuario = sequelize.define('usuario', {
  cpf: {
    type: DataTypes.STRING(14),
    primaryKey: true,
  },
  nome: DataTypes.STRING(50),
  cep: DataTypes.STRING(10),
  complemento: DataTypes.STRING(50),
  FK_cnpj: DataTypes.STRING(18),
  foto: DataTypes.STRING(50),
  verificacaoMensal: DataTypes.STRING(30),
  verificacaoSemanal: DataTypes.STRING(30),
  verificacaoDiaria: DataTypes.STRING(30),
  senha: DataTypes.STRING(8),
});

const Notificacao = sequelize.define('notificacao', {
  nome: DataTypes.STRING(50),
  fk_cpf: DataTypes.STRING(14),
  fk_cod_adm: DataTypes.INTEGER,
  data: DataTypes.STRING(8),
});
const TelUser = sequelize.define('teluser', {
    fk_cpf: {
      type: DataTypes.STRING(14),
      primaryKey: true,
    },
    telefone: {
      type: DataTypes.STRING(50),
      primaryKey: true,
    },
  });
  
  const UsuarioAdm = sequelize.define('usuarioAdm', {
    FK_cpf: DataTypes.STRING(14),
    FK_codigo: DataTypes.INTEGER,
  });
  
  const AdmEmpresa = sequelize.define('Admempresa', {
    FK_empresa_cnpj: DataTypes.STRING(18),
    FK_codigo: DataTypes.INTEGER,
  });
  
  const Meta = sequelize.define('meta', {
    fk_id_usuario: DataTypes.STRING(14),
    meta: DataTypes.STRING(10),
    id_meta: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    mes_meta: DataTypes.STRING(50),
  });
  const Historico = sequelize.define('historico', {
    fk_verificacaomensal: DataTypes.STRING(30),
    fk_verificacaosemanal: DataTypes.STRING(30),
    fk_verificacaodiaria: DataTypes.STRING(30),
    fk_id_usuario: {
      type: DataTypes.STRING(14),
      primaryKey: true,
    },
  });  

// Definir as associações

Usuario.belongsTo(Empresa, { foreignKey: 'FK_cnpj' });
Notificacao.belongsTo(Usuario, { foreignKey: 'fk_cpf' });
TelUser.belongsTo(Usuario, { foreignKey: 'fk_cpf' });
UsuarioAdm.belongsTo(Usuario, { foreignKey: 'FK_cpf' });
UsuarioAdm.belongsTo(Administrador, { foreignKey: 'FK_codigo' });
AdmEmpresa.belongsTo(Empresa, { foreignKey: 'FK_empresa_cnpj' });
AdmEmpresa.belongsTo(Administrador, { foreignKey: 'FK_codigo' });
Meta.belongsTo(Usuario, { foreignKey: 'fk_id_usuario' });
Historico.belongsTo(Usuario, { foreignKey: 'fk_id_usuario' });


// Sincronizar o modelo com o banco de dados
sequelize.sync({ force: true }) 
  .then(() => {
    console.log('Tabelas sincronizadas com sucesso.');
  })
  .catch((error) => {
    console.error('Erro ao sincronizar tabelas:', error);
  });
