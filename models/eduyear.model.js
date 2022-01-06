const Eduyear = (sequelize, Sequelize) =>
    sequelize.define(
        'eduyears',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            name: { type: Sequelize.STRING, allowNull: false },
            semester: { type: Sequelize.ENUM('ganjil', 'genap') }
        },
    )

module.exports = Eduyear
