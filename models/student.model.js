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

            nisn: { type: Sequelize.STRING, allowNull: false },
            nis: { type: Sequelize.STRING },
            nik: { type: Sequelize.STRING },
            no_akta: { type: Sequelize.STRING },
            name: { type: Sequelize.STRING, allowNull: false },
            gender: { type: Sequelize.ENUM('L', 'P') },

            place_birth: { type: Sequelize.STRING },
            day_birth: { type: Sequelize.DATEONLY },
            religion: { type: Sequelize.STRING },
            height: { type: Sequelize.FLOAT },
            weight: { type: Sequelize.FLOAT },
            special_needs: { type: Sequelize.BOOLEAN, defaultValue: false },
            email: { type: Sequelize.STRING, allowNull: false },
            phone: { type: Sequelize.STRING },
            address: { type: Sequelize.STRING(1000) }, //x
            rt: { type: Sequelize.STRING },
            rw: { type: Sequelize.STRING },
            urban: { type: Sequelize.STRING },
            sub_district: { type: Sequelize.STRING },
            city: { type: Sequelize.STRING },
            postal_code: { type: Sequelize.STRING },


            father_name: { type: Sequelize.STRING },
            father_job: { type: Sequelize.STRING },
            father_education: { type: Sequelize.STRING },
            father_email: { type: Sequelize.STRING },
            father_phone: { type: Sequelize.STRING },

            mother_name: { type: Sequelize.STRING },
            mother_job: { type: Sequelize.STRING },
            mother_education: { type: Sequelize.STRING },

            mother_email: { type: Sequelize.STRING },
            mother_phone: { type: Sequelize.STRING },

            guardian_name: { type: Sequelize.STRING },

            entry_year: { type: Sequelize.DATEONLY },
            out_year: { type: Sequelize.DATEONLY },
            out_reason: { type: Sequelize.STRING },
        },
    )

module.exports = Student
