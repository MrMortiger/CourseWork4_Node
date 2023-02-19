const Sequelize = require('sequelize')
const sequelize = require('../config/database')

const Person = sequelize.define("person", {
        idPerson: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true,
            allowNull: false
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        surname: {
            type: Sequelize.STRING,
            allowNull: false
        },
        dateOfBirth: {
            type: Sequelize.DATEONLY,
            allowNull: false
        }
})
    module.exports = Person