const LessonClassMeeting = (sequelize, Sequelize) =>
    sequelize.define(
        'lesson_class_meetings',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            lesson_class_id : {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            no : {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            date : {
                type: Sequelize.DATE,
                allowNull: false
            },
            name : {
                type: Sequelize.STRING,
                allowNull: false
            },
            description : {
                type: Sequelize.STRING(1000),
                allowNull: false
            },
            status : {
                type: Sequelize.ENUM('active', 'passed'),
                allowNull: false,
                defaultValue:'active'
            },
            passed_at :{
                type: Sequelize.DATE
            },
            passed_by : {
                type: Sequelize.INTEGER,
            },
            created_by :{
                type: Sequelize.INTEGER,
                allowNull: false
            },
            updated_by:{
                type: Sequelize.INTEGER,
                allowNull: false
            },
            deleted_by:{
                type: Sequelize.INTEGER,
            }
        },
    )

module.exports = LessonClassMeeting
