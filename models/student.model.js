const Student = (sequelize, Sequelize) =>
    sequelize.define(
        'students',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            user_id: { type: Sequelize.INTEGER, allowNull: false },

            nis: { type: Sequelize.STRING },
            nisn: { type: Sequelize.STRING },
            name: { type: Sequelize.STRING, allowNull: false },
            gender: { type: Sequelize.ENUM('L', 'P') },

            place_birth: { type: Sequelize.STRING },
            day_birth: { type: Sequelize.DATEONLY },
            religion: { type: Sequelize.ENUM('islam', 'katholik', 'protestan', 'hindu', 'budha', 'konghucu', 'lainnya') },
            address: { type: Sequelize.STRING(1000) },
            email: { type: Sequelize.STRING, allowNull: false },
            phone: { type: Sequelize.STRING },
            entry_year: { type: Sequelize.DATEONLY },
            out_year: { type: Sequelize.DATEONLY },
            out_reason: { type: Sequelize.STRING },

            child_no: { type: Sequelize.INTEGER },
            father_name: { type: Sequelize.STRING },
            mother_name: { type: Sequelize.STRING },
            father_job: { type: Sequelize.STRING },
            mother_job: { type: Sequelize.STRING },
            father_education: { type: Sequelize.ENUM('sd', 'smp', 'sma', 'diploma', 's1', 's2', 's3', 'lainnya') },
            mother_education: { type: Sequelize.ENUM('sd', 'smp', 'sma', 'diploma', 's1', 's2', 's3', 'lainnya') },
            father_address: { type: Sequelize.STRING(1000) },
            mother_address: { type: Sequelize.STRING(1000) },
            father_email: { type: Sequelize.STRING },
            mother_email: { type: Sequelize.STRING },
            father_phone: { type: Sequelize.STRING },
            mother_phone: { type: Sequelize.STRING },

            guardian_name: { type: Sequelize.STRING },
            guardian_address: { type: Sequelize.STRING(1000) },
            guardian_phone: { type: Sequelize.STRING },
            guardian_relation: { type: Sequelize.STRING },
        },
    )

module.exports = Student
