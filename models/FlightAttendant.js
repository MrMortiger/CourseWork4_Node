const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Person = require('./Person');
const PDG = require('./Pdg');

const FlightAttendant = sequelize.define('FlightAttendant', {
  IdFlightAttendant: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  }
}, {
  tableName: 'flight_attendant',
  timestamps: false
});

FlightAttendant.belongsTo(Person, {
  foreignKey: {
    name: 'IdPerson',
    allowNull: false
  },
  onDelete: 'CASCADE'
});

FlightAttendant.belongsTo(PDG, {
  foreignKey: {
    name: 'IdPDG',
    allowNull: false
  },
  onDelete: 'CASCADE'
});

module.exports = FlightAttendant;