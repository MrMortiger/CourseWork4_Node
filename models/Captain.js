const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const PDG = require('./PDG');
const Person = require('./Person');

const Captain = sequelize.define('Captain', {
  IdCaptain: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  }
}, {
  tableName: 'captain',
  timestamps: false
});

Captain.belongsTo(PDG, {
  foreignKey: 'IdPDG',
  onUpdate: 'CASCADE',
  onDelete: 'CASCADE'
});

Captain.belongsTo(Person, {
  foreignKey: 'IdPerson',
  onUpdate: 'CASCADE',
  onDelete: 'CASCADE'
});

module.exports = Captain;