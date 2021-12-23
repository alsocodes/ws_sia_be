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
db.category = require('./category.model')(sequelize, Sequelize);
db.category_post = require('./category_post.model')(sequelize, Sequelize);
db.slide = require('./slide.model')(sequelize, Sequelize);
db.album = require('./album.model')(sequelize, Sequelize);
db.gallery = require('./gallery.model')(sequelize, Sequelize);
db.album_gallery = require('./album-gallery.model')(sequelize, Sequelize);

db.user.belongsTo(db.role, { foreignKey: 'role_id' })
db.post.belongsTo(db.user, { foreignKey: 'author_id', as: 'author' })

db.album.hasMany(db.album_gallery, { foreignKey: 'album_id' })
db.album_gallery.belongsTo(db.album, { foreignKey: 'album_id' })
db.gallery.hasMany(db.album_gallery, { foreignKey: 'gallery_id' })
db.album_gallery.belongsTo(db.gallery, { foreignKey: 'gallery_id' })


module.exports = db;
