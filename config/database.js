const Sequelize = require("sequelize");
module.exports = new Sequelize("airport", "User", "1", {
  dialect: "mysql",
  host: "localhost",
  define: {
    timestamps: false,
    freezeTableName: true
  }
});