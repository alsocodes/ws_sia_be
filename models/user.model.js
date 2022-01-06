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
            password: { type: Sequelize.STRING, allowNull: true },

            name: { type: Sequelize.STRING },
            email: { type: Sequelize.STRING, allowNull: false },
            user_type: { type: Sequelize.ENUM('administrotor', 'teacher', 'student'), allowNull: false },
            role_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
        }
    )

module.exports = User
