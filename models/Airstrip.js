const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const AirstripStatus = require('./AirstripStatus');

const Airstrip = sequelize.define('Airstrip', {
  IdAirstrip: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdAirstripStatus: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: AirstripStatus,
      key: 'IdAirstripStatus'
    },
    onUpdate: 'CASCADE',
    onDelete: 'NO ACTION'
  },
  Name: {
    type: DataTypes.STRING(50),
    allowNull: true,
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'airstrip',
  timestamps: false
});

Airstrip.belongsTo(AirstripStatus, {
  foreignKey: 'IdAirstripStatus',
  as: 'airstripStatus'
});

module.exports = Airstrip;