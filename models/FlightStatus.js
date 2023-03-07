const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const FlightStatus = sequelize.define('FlightStatus', {
  IdStatus: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  Name: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'flight_status',
  timestamps: false
});

module.exports = FlightStatus;