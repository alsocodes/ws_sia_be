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
            semester: { type: Sequelize.ENUM('ganjil', 'genap') },
            status: { type: Sequelize.ENUM('passed', 'active', 'draft'), defaultValue: 'draft' }
        },
    )

module.exports = Eduyear
