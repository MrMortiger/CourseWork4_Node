const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Gender = require('./Gender');
const Person = require('./Person');
const Flight = require('./Flight');

const Passenger = sequelize.define('Passenger', {
  IdPassenger: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdGender: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Gender,
      key: 'IdGender'
    },
    onUpdate: 'CASCADE',
    onDelete: 'NO ACTION'
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
  IdFlight: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Flight,
      key: 'IdFlight'
    },
    onUpdate: 'NO ACTION',
    onDelete: 'NO ACTION'
  },
  TicketNumber: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'passenger',
  timestamps: false
});

module.exports = Passenger;