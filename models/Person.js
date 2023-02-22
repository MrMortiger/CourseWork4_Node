const Sequelize = require('sequelize')
const sequelize = require('../config/database')

const Person = sequelize.define('person', {
  idPerson: {
    type: Sequelize.INTEGER.UNSIGNED,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },
  name: {
    type: Sequelize.STRING(50),
    allowNull: false,
    defaultValue: ''
  },
  surname: {
    type: Sequelize.STRING(50),
    allowNull: false,
    defaultValue: ''
  },
  dateOfBirth: {
    type: Sequelize.DATE,
    allowNull: false
  }
}, {
  tableName: 'person',
  charset: 'utf8mb4',
  collate: 'utf8mb4_0900_ai_ci',
  timestamps: false
});

module.exports = Person;