const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Brand = sequelize.define('Brand', {
  IdBrand: {
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
  tableName: 'brand',
  timestamps: false
});

module.exports = Brand;