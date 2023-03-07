const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Address = require('./Address');

const Person = sequelize.define('Person', {
  idPerson: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  idAddress: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Address,
      key: 'IdAddress'
    },
    onUpdate: 'NO ACTION',
    onDelete: 'CASCADE'
  },
  name: {
    type: DataTypes.STRING(50),
    allowNull: false,
    defaultValue: '',
    collate: 'utf8mb4_0900_ai_ci'
  },
  surname: {
    type: DataTypes.STRING(50),
    allowNull: false,
    defaultValue: '',
    collate: 'utf8mb4_0900_ai_ci'
  },
  dateOfBirth: {
    type: DataTypes.DATEONLY,
    allowNull: false
  }
}, {
  tableName: 'person',
  timestamps: false
});

Person.belongsTo(Address, {
  foreignKey: 'idAddress'
});

module.exports = Person;