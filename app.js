const express = require("express");
const hbs = require("hbs");
hbs.registerPartials(__dirname + "/views/partials");

// // Допоміжний блок Handlebars для знаходження назви статусу по IdStatus
// hbs.registerHelper('lookup', function(obj, id) {
//   return obj[id];
// });

const app = express();
const urlencodedParser = express.urlencoded({ extended: false });

app.use(express.static(__dirname + '/views'))

app.set("view engine", "hbs");

// сінхронизація з бд, после успеной синхронізації запускаємо сервер
const sequelize = require('./config/database')
sequelize.sync().then(()=>{
  app.listen(3000, function(){
    console.log("Сервер ожидает подключения...");
  });
}).catch(err=>console.log(err));

app.get("/", function (req, res) {
  res.render("index.hbs");
})

// отримання даних
const Person = require('./models/Person')
app.get("/personTable", function(req, res){
    Person.findAll({raw: true }).then(data=>{
      res.render("personTable.hbs", {
        person: data
      });
    }).catch(err=>console.log(err));
});

const Flight = require('./models/Flight')
const FlightStatus = require('./models/FlightStatus')


app.get("/flightTable", function(req, res){
    Flight.findAll({raw: true }).then(data=>{
      res.render("flightTable.hbs", {
        flight: data
      });
    }).catch(err=>console.log(err));
});

// app.get("/flightTable", function(req, res){
//   Flight.findAll({ raw: true })
//     .then(flightData => {
//       FlightStatus.findAll({ raw: true })
//         .then(flightStatusData => {
//           res.render("flightTable.hbs", {
//             flight: flightData,
//             flightStatus: flightStatusData
//           });
//         })
//         .catch(flightStatusErr => console.log(flightStatusErr));
//     })
//     .catch(flightErr => console.log(flightErr));
// });

app.get("/personTable/create", function(req, res){
    res.render("create.hbs");
});

// додання даних
app.post("/personTable/create", urlencodedParser, function (req, res) {
         
    if(!req.body) return res.sendStatus(400);
         
    const personName = req.body.name;
    const personSurname = req.body.surname;
    const persondateOfBirth = req.body.dateOfBirth;
    Person.create({ name: personName, surname: personSurname, dateOfBirth: persondateOfBirth}).then(()=>{
      res.redirect("/personTable");
    }).catch(err=>console.log(err));
});
 
// отримуємо объект по id для редактувания
app.get("/personTable/edit/:idPerson", function(req, res){
  const personId = req.params.idPerson;
  Person.findAll({where:{idPerson: personId}, raw: true })
  .then(data=>{
    res.render("edit.hbs", {
      person: data[0]
    });
  })
  .catch(err=>console.log(err));
});
 
// оновлення даних в БД
app.post("/personTable/edit", urlencodedParser, function (req, res) {
         
  if (!req.body) return res.sendStatus(400);
  
 const personId = req.body.idPerson;
  const personName = req.body.name;
  const personSurname = req.body.surname;
  const persondateOfBirth = req.body.dateOfBirth;
  Person.update({name: personName, surname: personSurname, idPerson: persondateOfBirth}, {where: {idPerson: personId} }).then(() => {
    res.redirect("/personTable");
  })
  .catch(err=>console.log(err));
});
 
// видалення даних
app.post("/personTable/delete/:idPerson", function(req, res){  
  const personId = req.params.idPerson;
  Person.destroy({where: {idPerson: personId} }).then(() => {
    res.redirect("/personTable");
  }).catch(err=>console.log(err));
});

