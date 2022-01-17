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
const seederGenral = require('./seeders/general.seeder');
const seederPost = require('./seeders/post.seeder');
const seederSlide = require('./seeders/slide.seeder');
const seederGallery = require('./seeders/galeri.seeder');
const seederMenu = require('./seeders/menu.seeder');

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
const TEMP_DIR = '/public/temp'
app.use(TEMP_DIR, express.static(path.join(__dirname, TEMP_DIR)));

db.sequelize.sync({ force: false })
if (process.env.RESEED == 1) {
  db.sequelize
    .sync({ force: process.env.NODE_ENV !== "production" ? true : false })
    .then(() => {
      if (process.env.NODE_ENV !== "production") {
        (async () => {
          try {
            await seederUser.create();
            await seederGenral.create();
            await seederPost.create();
            await seederSlide.create();
            await seederGallery.create();
            await seederMenu.create();
          } catch (err) {
            console.log(err);
          }
        })();
      }
    });

}

if (process.env.NODE_ENV !== "production") {
  app.use("/api-docs", swagger.serve, swagger.setup(docs));
}

app.get("/", (_, res) => {
  res.send({ message: "ok" });
});

routes.auth(app);
routes.post(app);
routes.slide(app);
routes.albumGallery(app);
routes.general(app);
routes.menu(app);
routes.public(app);
routes.seeder(app);
routes.settingmaster(app);
routes.lessonmaster(app);
routes.eduyearmaster(app);
routes.classroommaster(app);
routes.teachermaster(app);
routes.studentmaster(app);
routes.student_class_activity(app);
routes.lesson_class_activity(app);
routes.lesson_class_student_activity(app);

routes.usermaster(app);
routes.rolemaster(app);

const port = process.env.PORT || 3009;
const host = process.env.HOST || "localhost";

app.listen(port, host, () => {
  console.log(`Server is running on ${host}:${port}`);
});