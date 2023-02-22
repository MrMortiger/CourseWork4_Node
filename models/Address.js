const Sequelize = require('sequelize');
const sequelize = require('../config/database')

const Address = sequelize.define('address', {
  IdAdress: {
    type: Sequelize.INTEGER.UNSIGNED,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },
  IdPerson: {
    type: Sequelize.INTEGER.UNSIGNED,
    allowNull: false
  },
  IdCountry: {
    type: Sequelize.INTEGER.UNSIGNED,
    allowNull: false
  },
  Street: {
    type: Sequelize.STRING(50),
    allowNull: true
  },
  City: {
    type: Sequelize.STRING(50),
    allowNull: true
  },
  Building: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  Flat: {
    type: Sequelize.INTEGER,
    allowNull: true
  }
}, {
  tableName: 'address',
  indexes: [
    {
      name: 'FK_adress_country',
      using: 'BTREE',
      fields: ['IdCountry']
    },
    {
      name: 'FK_adress_person',
      using: 'BTREE',
      fields: ['IdPerson']
    }
  ]
});

Address.associate = function(models) {
  Address.belongsTo(models.Country, { foreignKey: 'IdCountry', targetKey: 'IdCountry' });
  Address.belongsTo(models.Person, { foreignKey: 'IdPerson', targetKey: 'IdPerson' });
};

module.exports = Address;