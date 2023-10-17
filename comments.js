// Create web server

const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = 3000;

const comments = [
  {
    username: "tuananh",
    content: "Hello",
  },
  {
    username: "tuananh",
    content: "Hi",
  },
];

// Use body parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Use ejs
app.set("view engine", "ejs");

// Path: /
app.get("/", (req, res) => {
  res.render("home");
});

// Path: /comments
app.get("/comments", (req, res) => {
  res.render("comments", { comments });
});

// Path: /comments/new
app.get("/comments/new", (req, res) => {
  res.render("new_comment");
});

// Path: /comments
app.post("/comments", (req, res) => {
  const { username, content } = req.body;
  comments.push({ username, content });
  res.redirect("/comments");
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
