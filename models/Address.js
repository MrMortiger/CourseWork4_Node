const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Country = require('./Country');

const Address = sequelize.define('Address', {
  IdAddress: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdCountry: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Country,
      key: 'IdCountry'
    },
    onUpdate: 'NO ACTION',
    onDelete: 'NO ACTION'
  },
  Street: {
    type: DataTypes.STRING(50),
    allowNull: true,
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  },
  City: {
    type: DataTypes.STRING(50),
    allowNull: true,
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  },
  Building: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  },
  Flat: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  }
}, {
  tableName: 'address',
  timestamps: false
});

module.exports = Address;