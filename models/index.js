const dbConfig = require('../config/db.config');
const Sequelize = require('sequelize');

const ssl = () => {
  if (process.env.NODE_ENV === 'production') {
    return {
      dialectOptions: {
        ssl: {
          require: true,
        },
      },
    };
  }
  return {};
};

const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  timezone: "+07:00",
  host: dbConfig.HOST,
  port: dbConfig.PORT,
  dialect: dbConfig.dialect,
  dialectOptions: ssl().dialectOptions,
  operatorsAlises: false,
  logging: false,
  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle,
  },
  define: {
    underscoredAll: true,
    underscored: true,
    timestamps: true,
    paranoid: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    deletedAt: 'deleted_at',
  },
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require('./user.model')(sequelize, Sequelize);
db.role = require('./role.model')(sequelize, Sequelize);

db.post = require('./post.model')(sequelize, Sequelize);
db.post_meta = require('./post-meta.model')(sequelize, Sequelize);
db.category = require('./category.model')(sequelize, Sequelize);
db.category_post = require('./category_post.model')(sequelize, Sequelize);
db.slide = require('./slide.model')(sequelize, Sequelize);
db.album = require('./album.model')(sequelize, Sequelize);
db.gallery = require('./gallery.model')(sequelize, Sequelize);
db.album_gallery = require('./album-gallery.model')(sequelize, Sequelize);
db.general = require('./general.model')(sequelize, Sequelize);
db.menu = require('./menu.model')(sequelize, Sequelize);

db.student_class = require('./student-class.model')(sequelize, Sequelize);
db.lesson_class = require('./lesson-class.model')(sequelize, Sequelize);
db.lesson_class_task = require('./lesson-class-task.model')(sequelize, Sequelize);
db.lesson_class_task_submit = require('./lesson-class-task-submit.model')(sequelize, Sequelize);
db.lesson_class_material = require('./lesson-class-material.model')(sequelize, Sequelize);
db.lesson_class_student = require('./lesson-class-student.model')(sequelize, Sequelize);
db.sia_menu = require('./sia-menu.model')(sequelize, Sequelize);
db.sia_menu_action = require('./sia-menu-action.model')(sequelize, Sequelize);
db.role_menu_action = require('./role-menu-action.model')(sequelize, Sequelize);

db.access = require('./access.model')(sequelize, Sequelize);
db.role_access = require('./role-access.model')(sequelize, Sequelize);

//sia
db.student = require('./student.model')(sequelize, Sequelize);
db.teacher = require('./teacher.model')(sequelize, Sequelize);
db.classroom = require('./classroom.model')(sequelize, Sequelize);
db.lesson = require('./lesson.model')(sequelize, Sequelize);
db.eduyear = require('./eduyear.model')(sequelize, Sequelize);
db.semester = require('./semester.model')(sequelize, Sequelize);

db.user.belongsTo(db.role, { foreignKey: 'role_id' })
db.post.belongsTo(db.user, { foreignKey: 'author_id' })

db.album.hasMany(db.album_gallery, { foreignKey: 'album_id', as: 'galleries' })
db.album_gallery.belongsTo(db.album, { foreignKey: 'album_id', as: 'galleries' })
db.gallery.hasMany(db.album_gallery, { foreignKey: 'gallery_id' })
db.album_gallery.belongsTo(db.gallery, { foreignKey: 'gallery_id' })

db.menu.hasMany(db.menu, { foreignKey: 'parent_id', as: 'children', constraints: false })
db.post.hasMany(db.post_meta, { foreignKey: 'post_id', as: 'post_meta' })
db.post.hasMany(db.post_meta, { foreignKey: 'post_id', as: 'req_post_meta' })

db.student.hasMany(db.student_class, { foreignKey: 'student_id' })
db.student.hasOne(db.student_class, { foreignKey: 'student_id', as: 'active_class' })
db.student_class.belongsTo(db.student, { foreignKey: 'student_id', as: 'student' })
db.classroom.hasMany(db.student_class, { foreignKey: 'classroom_id' })
db.student_class.belongsTo(db.classroom, { foreignKey: 'classroom_id' })
db.eduyear.hasMany(db.student_class, { foreignKey: 'eduyear_id' })
db.student_class.belongsTo(db.eduyear, { foreignKey: 'eduyear_id' })

db.lesson.hasMany(db.lesson_class, { foreignKey: 'lesson_id' })
db.lesson_class.belongsTo(db.lesson, { foreignKey: 'lesson_id' })
db.classroom.hasMany(db.lesson_class, { foreignKey: 'classroom_id' })
db.lesson_class.belongsTo(db.classroom, { foreignKey: 'classroom_id' })
db.eduyear.hasMany(db.lesson_class, { foreignKey: 'eduyear_id' })
db.lesson_class.belongsTo(db.eduyear, { foreignKey: 'eduyear_id' })
db.teacher.hasMany(db.lesson_class, { foreignKey: 'teacher_id' })
db.lesson_class.belongsTo(db.teacher, { foreignKey: 'teacher_id' })
db.semester.hasMany(db.lesson_class, { foreignKey: 'semester_id' })
db.lesson_class.belongsTo(db.semester, { foreignKey: 'semester_id' })

db.student.hasMany(db.lesson_class_student, { foreignKey: 'student_id' })
db.lesson_class_student.belongsTo(db.student, { foreignKey: 'student_id' })
db.lesson_class.hasMany(db.lesson_class_student, { foreignKey: 'lesson_class_id' })
db.lesson_class_student.belongsTo(db.lesson_class, { foreignKey: 'lesson_class_id' })

db.student.hasOne(db.lesson_class_task_submit, { foreignKey: 'student_id' })
db.lesson_class_task_submit.belongsTo(db.student, { foreignKey: 'student_id' })

db.lesson_class.hasMany(db.student_class, { foreignKey: 'classroom_id' })
db.student_class.belongsTo(db.lesson_class, { foreignKey: 'classroom_id' })


db.role.hasMany(db.sia_menu_action, { foreignKey: 'role_id' })
db.sia_menu_action.belongsTo(db.role, { foreignKey: 'role_id' })

db.sia_menu.hasMany(db.sia_menu_action, { foreignKey: 'sia_menu_id' })
db.sia_menu_action.belongsTo(db.sia_menu, { foreignKey: 'sia_menu_id' })

db.role.hasMany(db.role_menu_action, { foreignKey: 'role_id' })
db.role_menu_action.belongsTo(db.role, { foreignKey: 'role_id' })

db.sia_menu_action.hasMany(db.role_menu_action, { foreignKey: 'sia_menu_action_id' })
db.role_menu_action.belongsTo(db.sia_menu_action, { foreignKey: 'sia_menu_action_id' })
db.sia_menu.hasMany(db.role_menu_action, { foreignKey: 'sia_menu_id' })
db.role_menu_action.belongsTo(db.sia_menu, { foreignKey: 'sia_menu_id' })

// db.student.belongsTo(db.lesson_class_student, { foreignKey: 'lesson_class_id' })
// db.lesson_class_student.hasMany(db.student, { foreignKey: 'lesson_class_id' })


db.role.hasMany(db.role_access, { foreignKey: 'role_id' })
db.role_access.belongsTo(db.role, { foreignKey: 'role_id' })
db.access.hasMany(db.role_access, { foreignKey: 'access_id' })
db.role_access.belongsTo(db.access, { foreignKey: 'access_id' })

db.user.hasOne(db.teacher, { foreignKey: 'user_id' })
db.teacher.belongsTo(db.user, { foreignKey: 'user_id' })
db.user.hasOne(db.student, { foreignKey: 'user_id' })
db.student.belongsTo(db.user, { foreignKey: 'user_id' })

module.exports = db;
