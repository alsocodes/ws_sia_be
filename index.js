require("dotenv").config();
const express = require("express");
const cors = require("cors");
const path = require("path");
const db = require("./models/index.js");
const routes = require("./routes/index.js");
const compression = require("compression");
const swagger = require("swagger-ui-express");
const docs = require("./api-docs.json");
const seederUser = require('./seeders/user.seeder');
const seederCategory = require('./seeders/category.seeder');

const app = express();

// front end domain
const corsOption = {
  origin: true, // ['clienturl']
  credentials: true,
};

app.use(compression());
app.use(cors(corsOption));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const GALLERY_DIR = '/public/images'
app.use(GALLERY_DIR, express.static(path.join(__dirname, GALLERY_DIR)));

db.sequelize
  .sync({ force: process.env.NODE_ENV !== "production" ? true : false })
  .then(() => {
    if (process.env.NODE_ENV !== "production") {
      (async () => {
        try {
          await seederUser.create();
          await seederCategory.create();

        } catch (err) {
          console.log(err);
        }
      })();
    }
  });

if (process.env.NODE_ENV !== "production") {
  app.use("/api-docs", swagger.serve, swagger.setup(docs));
}

app.get("/", (_, res) => {
  res.send({ message: "ok" });
});

routes.auth(app);
routes.post(app);

const port = process.env.PORT || 3009;
const host = process.env.HOST || "localhost";

app.listen(port, host, () => {
  console.log(`Server is running on ${host}:${port}`);
});