const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const path = require("path");
const cors = require("cors");
const passport = require("passport");
const ngrok = require("ngrok");

const app = express();

app.use(
  bodyParser.urlencoded({
    extended: false,
  })
);
app.use(bodyParser.json());
app.use(cors());
app.use(express.static(path.join(__dirname, "public")));

app.use(passport.initialize());

// Strategy
require("./config/passport")(passport);

// Database
const db = require("./config/keys").mongoURL;
mongoose
  .connect(db, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log(`Database connected successfully ${db}`);
  })
  .catch((err) => {
    console.log(`Unable yo connect with the database${err} `);
  });

app.get("/", (req, res) => {
  return res.send("<h1>Hello world</h1>");
});

const users = require("./routes/api/users");
app.use("/api/users", users);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});

