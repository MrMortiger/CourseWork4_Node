const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const PDG = require('./Pdg');
const Person = require('./Person');

const SecondPilot = sequelize.define('SecondPilot', {
  IdSecoundPilot: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdPerson: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Person,
      key: 'idPerson'
    },
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE'
  },
  IdPDG: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: PDG,
      key: 'IdPDG'
    },
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE'
  }
}, {
  tableName: 'secound_pilot',
  timestamps: false
});

module.exports = SecondPilot;