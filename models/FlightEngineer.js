const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Person = require('./Person');
const PDG = require('./Pdg');

const FlightEngineer = sequelize.define('FlightEngineer', {
  IdFlightEngineer: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdPerson: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Person,
      key: 'IdPerson'
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
  tableName: 'flight_engineer',
  timestamps: false
});

module.exports = FlightEngineer;