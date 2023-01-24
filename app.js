const mysql = require("mysql2");
const express = require("express");
 
const app = express();
const urlencodedParser = express.urlencoded({extended: false});
 
const pool = mysql.createPool({
  connectionLimit: 5,
  host: "localhost",
  user: "User",
  database: "airport",
  password: "1"
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
  const name = req.body.name;
  const surname = req.body.surname;
    const dateOfBirth = req.body.dateOfBirth;
    pool.query("INSERT INTO person (Name, Surname, DateOfBirth) VALUES (?,?,?)", [name, surname, dateOfBirth], function(err, data) {
      if(err) return console.log(err);
      res.redirect("/");
    });
});
 
// получем id редактируемого пользователя, получаем его из бд и отправлям с формой редактирования
app.get("/edit/:id", function(req, res){
  const id = req.params.id;
  pool.query("SELECT * FROM person WHERE idPerson=?", [id], function(err, data) {
    if(err) return console.log(err);
     res.render("edit.hbs", {
        person: data[0]
    });
  });
});
// получаем отредактированные данные и отправляем их в БД
app.post("/edit", urlencodedParser, function (req, res) {
         
  if(!req.body) return res.sendStatus(400);
  const name = req.body.name;
  const surname = req.body.age;
  const id = req.body.id;
   
  pool.query("UPDATE person SET Name=?, Surname=? WHERE IdPerson=?", [name, surname, id], function(err, data) {
    if(err) return console.log(err);
    res.redirect("/");
  });
});
 
// получаем id удаляемого пользователя и удаляем его из бд
app.post("/delete/:id", function(req, res){
          
  const id = req.params.id;
  pool.query("DELETE FROM person WHERE IdPerson=?", [id], function(err, data) {
    if(err) return console.log(err);
    res.redirect("/");
  });
});
 
app.listen(3000, function(){
  console.log("Сервер ожидает подключения...");
});