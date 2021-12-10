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
            password: {
                type: Sequelize.STRING,
                allowNull: true,
            },

            name: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            email: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: {
                    args: true,
                    message: 'Email terdaftar'
                }
            },

            role_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
        }
    )

module.exports = User
