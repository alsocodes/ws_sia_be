const role_accesses = [
    {
        role : 'superadmin', 
        accesses: [
            'dashboard', 'manage-content', 'publish-content', 'edit-content-others', 'delete-content-others', 'add-content', 'edit-content', 'delete-content', 'general-setting', 'menu-setting', 'add-menu', 'edit-menu', 'delete-menu', 'sia-dashboard', 'sia-master', 'add-sia-master', 'edit-sia-master', 'delete-sia-master', 'sia-activity', 'sia-student-class-activity', 'sia-lesson-class-acivity', 'sia-lesson-class-student-activity', 'add-sia-lesson-class-student-activity', 'master-user', 'add-master-user', 'edit-master-user', 'delete-master-user', 'edit-master-user-others', 'delete-master-user-others', 'master-role', 'add-master-role', 'edit-master-role', 'delete-master-role'
        ]
    },
    {
        role: 'teacher',
        accesses: [
            'sia-dashboard', 'sia-teacher-class-lesson-activity'
        ]
    },
    {
        role: 'student',
        accesses: [
            'sia-dashboard', 'sia-student-class-lesson-activity', 'sia-one-student-class-lesson-activity'
        ]
    }
]
module.exports = role_accesses