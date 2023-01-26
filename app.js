const mysql = require("mysql2");
const express = require("express");
 
const app = express();
const urlencodedParser = express.urlencoded({extended: false});
 
const pool = mysql.createPool({
  connectionLimit: 5,
  host: "localhost",
  user: "User",
  database: "airport",
  password: "1",
  dateStrings: true
});

app.set("view engine", "hbs");
 
// получение списка пользователей
app.get("/", function(req, res){
    pool.query("SELECT * FROM person", function(err, data) {
      if(err) return console.log(err);
      res.render("index.hbs", {
          person: data
      });
    });
});
// возвращаем форму для добавления данных
app.get("/create", function(req, res){
    res.render("create.hbs");
});
// получаем отправленные данные и добавляем их в БД 
app.post("/create", urlencodedParser, function (req, res) {
         
    if(!req.body) return res.sendStatus(400);
  const name = req.body.Name;
  const surname = req.body.Surname;
    const dateOfBirth = req.body.DateOfBirth;
    pool.query("INSERT INTO person (Name, Surname, DateOfBirth) VALUES (?,?,?)", [name, surname, dateOfBirth], function(err, data) {
      if(err) return console.log(err);
      res.redirect("/");
    });
});
 
// получем id редактируемого пользователя, получаем его из бд и отправлям с формой редактирования
app.get("/edit/:IdPerson", function(req, res){
  const id = req.params.IdPerson;
  pool.query("SELECT * FROM person WHERE IdPerson=?", [id], function(err, data) {
    if(err) return console.log(err);
     res.render("edit.hbs", {
       person: data[0]
    });
  });
});
// получаем отредактированные данные и отправляем их в БД
app.post("/edit", urlencodedParser, function (req, res) {
         
  if(!req.body) return res.sendStatus(400);
  const name = req.body.Name;
  const surname = req.body.Surname;
  const date = req.body.DateOfBirth;
  const id = req.body.IdPerson;
   
  pool.query("UPDATE person SET Name=?, Surname=?, DateOfBirth=? WHERE IdPerson=?", [name, surname, date, id], function(err, data) {
    if(err) return console.log(err);
    res.redirect("/");
  });
});
 
// получаем id удаляемого пользователя и удаляем его из бд
app.post("/delete/:IdPerson", function(req, res){
  const id = req.params.IdPerson;
  pool.query("DELETE FROM person WHERE IdPerson=?", [id], function(err, data) {
    if(err) return console.log(err);
    res.redirect("/");
  });
});

app.listen(3000, function(){
  console.log("Сервер ожидает подключения...");
});

