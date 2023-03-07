const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const AirstripStatus = sequelize.define('AirstripStatus', {
  IdAirstripStatus: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  Status: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'airstrip_status',
  timestamps: false
});

module.exports = AirstripStatus;