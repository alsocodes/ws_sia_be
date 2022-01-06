const Teacher = (sequelize, Sequelize) =>
    sequelize.define(
        'teachers',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            user_id: { type: Sequelize.INTEGER, allowNull: false },

            nip: { type: Sequelize.STRING },
            name: { type: Sequelize.STRING, allowNull: false },
            gender: { type: Sequelize.ENUM('L', 'P') },
            place_birth: { type: Sequelize.STRING },
            day_birth: { type: Sequelize.DATEONLY },
            religion: { type: Sequelize.ENUM('islam', 'katholik', 'protestan', 'hindu', 'budha', 'konghucu', 'lainnya') },
            address: { type: Sequelize.STRING(1000) },
            employee_group: { type: Sequelize.STRING },
            position: { type: Sequelize.STRING },
            last_education: { type: Sequelize.ENUM('sd', 'smp', 'sma', 'diploma', 's1', 's2', 's3', 'lainnya') },
            email: { type: Sequelize.STRING },
            phone: { type: Sequelize.STRING },
            entry_year: { type: Sequelize.DATEONLY }
        },
    )

module.exports = Teacher
