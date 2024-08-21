const express = require("express");
const app = express();
const ejs = require("ejs");
const bodyParser = require("body-parser");
const expressSession = require("express-session");
const multer = require("multer");
const fs = require("fs");
const fileUpload = require("express-fileupload");
const path = require("path");
const rateLimit = require("express-rate-limit");
const sql = require("./DB");
const dotenv = require("dotenv");
const initWebRoute = require("./routes/route");
const API_initWebRoute = require("./routes/api");
const { join } = require("path");
// template engine
app.set("view engine", "ejs");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
//config env
dotenv.config;
const port = dotenv.config.port || 1234;
//middleware
app.use(
  expressSession({
    secret: "keyboard cat",
    resave: true,
    saveUninitialized: true,
  })
);
// app.use(fileUpload())
app.use(express.static(path.join(__dirname, "public")));
//protect DDOS
const limiter = rateLimit({
  // 15 minutes
  windowMs: 60 * 15 * 1000,
  // limit each IP to 100 requests per windowMs
  max: 1000,
});
app.use(limiter);

app.use(
  "/build/",
  express.static(path.join(__dirname, "node_modules/three/build"))
);
app.use(
  "/jsm",
  express.static(path.join(__dirname, "node_modules/three/examples/jsm"))
);

//run app
app.listen(port, () =>
  console.log(`App listening at http://localhost:${port}`)
);
//connnect BD
app.use("*", (req, res, next) => {
  let accId = req.session.accountId;
  let permission = req.session.accountRole;
  let nameacc = req.session.accountName;
  let username = req.session.username;
  let email = req.session.accountEmail;
  let company = req.session.accountCompany;
  let dateStart = req.session.accountDateStart;
  let avatar = req.session.avatar;
  next();
});
initWebRoute(app);
API_initWebRoute(app);
// // SET STORAGE

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/upload");
  },
  filename: function (req, file, cb) {
    // console.log(file)
    cb(null, Date.now() + path.extname(file.originalname));
  },
});
var upload = multer({ storage: storage });
