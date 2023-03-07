const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Country = sequelize.define('Country', {
  IdCountry: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  CountryName: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'country',
  timestamps: false
});

module.exports = Country;