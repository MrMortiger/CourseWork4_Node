const Sequelize = require("sequelize");
const express = require("express");
 
const app = express();
const urlencodedParser = express.urlencoded({extended: false});
 
// визначаємо об'єкт Sequelize
const sequelize = new Sequelize("airport", "User", "1", {
  dialect: "mysql",
  host: "localhost",
  define: {
    timestamps: false,
    freezeTableName: true
  }
});
 
// визначаємо модель Person
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
});
 
app.set("view engine", "hbs");
 
// сінхронизація з бд, после успеной синхронізації запускаємо сервер
sequelize.sync().then(()=>{
  app.listen(3000, function(){
    console.log("Сервер ожидает подключения...");
  });
}).catch(err=>console.log(err));
 
// отримання даних
app.get("/", function(req, res){
    Person.findAll({raw: true }).then(data=>{
      res.render("index.hbs", {
        person: data
      });
    }).catch(err=>console.log(err));
});
 
app.get("/create", function(req, res){
    res.render("create.hbs");
});
 
// додання даних
app.post("/create", urlencodedParser, function (req, res) {
         
    if(!req.body) return res.sendStatus(400);
         
    const personName = req.body.name;
    const personSurname = req.body.surname;
    const persondateOfBirth = req.body.dateOfBirth;
    User.create({ name: personName, surname: personSurname, dateOfBirth: persondateOfBirth}).then(()=>{
      res.redirect("/");
    }).catch(err=>console.log(err));
});
 
// отримуємо объект по id для редактувания
app.get("/edit/:id", function(req, res){
  const personId = req.params.idPerson;
  User.findAll({where:{idPerson: personId}, raw: true })
  .then(data=>{
    res.render("edit.hbs", {
      user: data[0]
    });
  })
  .catch(err=>console.log(err));
});
 
// оновлення даних в БД
app.post("/edit", urlencodedParser, function (req, res) {
         
  if (!req.body) return res.sendStatus(400);
  
 const personId = req.body.idPerson;
  const personName = req.body.name;
  const personSurname = req.body.surname;
  const persondateOfBirth = req.body.dateOfBirth;
  User.update({name: personName, surname: personSurname, idPerson: persondateOfBirth}, {where: {idPerson: personId} }).then(() => {
    res.redirect("/");
  })
  .catch(err=>console.log(err));
});
 
// видалення даних
app.post("/delete/:id", function(req, res){  
  const personId = req.params.idPerson;
  User.destroy({where: {idPerson: personId} }).then(() => {
    res.redirect("/");
  }).catch(err=>console.log(err));
});