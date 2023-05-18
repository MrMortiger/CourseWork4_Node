const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Brand = require('./Brand');
const Captain = require('./Captain');
const SecondPilot = require('./SecondPilot');
const FlightEngineer = require('./FlightEngineer');
const FlightAttendant = require('./FlightAttendant');

const Plane = sequelize.define('Plane', {
  IdPlane: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdBrand: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Brand,
      key: 'IdBrand'
    }
  },
  IdCaptain: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Captain,
      key: 'IdCaptain'
    }
  },
  IdSecondPilot: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: SecondPilot,
      key: 'IdSecondPilot'
    }
  },
  IdFlightEngineer: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: FlightEngineer,
      key: 'IdFlightEngineer'
    }
  },
  IdFlightAttendant: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: FlightAttendant,
      key: 'IdFlightAttendant'
    }
  },
  Status: {
    type: DataTypes.STRING(50),
    allowNull: true,
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  },
  NumOfPassengers: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: null
  }
}, {
  tableName: 'plane',
  timestamps: false
});

module.exports = Plane;