const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Gender = sequelize.define('Gender', {
  IdGender: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  Name: {
    type: DataTypes.STRING(50),
    allowNull: true,
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'gender',
  timestamps: false
});

module.exports = Gender;