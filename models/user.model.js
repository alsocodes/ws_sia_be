const User = (sequelize, Sequelize) =>
    sequelize.define(
        'users',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            username: {
                type: Sequelize.STRING,
                allowNull: true,
                unique: {
                    args: true,
                    message: 'Username sudah terdaftar'
                }
            },
            nisn: { type: Sequelize.STRING },
            nip: { type: Sequelize.STRING },
            password: { type: Sequelize.STRING, allowNull: true },

            name: { type: Sequelize.STRING },
            email: { type: Sequelize.STRING },
            user_type: { type: Sequelize.ENUM('administrator', 'teacher', 'student'), allowNull: false },
            role_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            last_login: {
                type: Sequelize.DATE
            },
            current_login: {
                type: Sequelize.DATE
            },
            photo: {
                type: Sequelize.STRING,
            }
        }
    )

module.exports = User
