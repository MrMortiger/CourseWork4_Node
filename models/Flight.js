const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Plane = require('./Plane');
const FlightStatus = require('./FlightStatus');
const Airstrip = require('./Airstrip');

const Flight = sequelize.define('Flight', {
  IdFlight: {
    type: DataTypes.INTEGER.UNSIGNED,
    primaryKey: true,
    autoIncrement: true
  },
  IdPlane: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Plane,
      key: 'IdPlane'
    }
  },
  IdStatus: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: FlightStatus,
      key: 'IdStatus'
    }
  },
  IdAirstrip: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
    references: {
      model: Airstrip,
      key: 'IdAirstrip'
    }
  },
  NumberOfPassengers: {
    type: DataTypes.INTEGER,
    defaultValue: null
  },
  ShippingTime: {
    type: DataTypes.DATE,
    defaultValue: null
  },
  ArrivalTime: {
    type: DataTypes.DATE,
    defaultValue: null
  },
  PlaceOfDispatch: {
    type: DataTypes.STRING(50),
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  },
  PlaceOfArrival: {
    type: DataTypes.STRING(50),
    defaultValue: null,
    collate: 'utf8mb4_0900_ai_ci'
  }
}, {
  tableName: 'flights',
  timestamps: false
});

module.exports = Flight;