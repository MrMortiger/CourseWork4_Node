const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const PDG = sequelize.define('PDG', {
  IdPDG: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  Gender: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_0900_ai_ci'
  },
  DateOfEmployment: {
    type: DataTypes.DATEONLY,
    allowNull: false
  },
  PhoneNumber: {
    type: DataTypes.STRING(20),
    allowNull: false,
    defaultValue: '',
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'pdg',
  timestamps: false
});

module.exports = PDG;