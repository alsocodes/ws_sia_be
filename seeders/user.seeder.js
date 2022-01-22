const db = require('../models');
const bcrypt = require('bcrypt');

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

const accesses = [
    {value: 'dashboard', label:'Dashboard'},
    {value: 'manage-content', label:'Manage Content', 
        children : [
            {value: 'publish-content', label:'Publish Content'},
            {value: 'edit-content-others', label:'Edit Content Others'},
            {value: 'delete-content-others', label:'Delete Content Others'},
            {value: 'add-content', label:'Add Content'},
            {value: 'edit-content', label:'Edit Content'},
            {value: 'delete-content', label:'Delete Content'},
        ]
    },
    {value: 'general-setting', label:'General Setting'},
    {value: 'menu-setting', label:'Menu Setting',
        children : [
            {value: 'add-menu', label:'Add Menu'},
            {value: 'edit-menu', label:'Edit Menu'},
            {value: 'delete-menu', label:'Delete Menu'}
        ]
    },
    {value: 'sia-dashboard', label:'SIA Dashboard'},
    {value: 'sia-master', label:'SIA Master',
        children : [
            {value: 'add-sia-master', label:'Add SIA Master'},
            {value: 'edit-sia-master', label:'Edit SIA Master'},
            {value: 'delete-sia-master', label:'Delete SIA Master'},
        ]
    },
    {value: 'sia-activity', label:'SIA Activity', 
        children : [
            {value: 'sia-student-class-activity', label:'SIA Student class Activity'},
            {value: 'sia-lesson-class-acivity', label:'SIA Lesson Class Activity'},
            {value: 'sia-lesson-class-student-activity', label:'SIA Lesson Class Student Activity'},
            {value: 'add-sia-lesson-class-student-activity', label:'Add SIA Lesson Class Student Activity'},
            {value: 'sia-teacher-class-lesson-activity', label:'Teacher Class Lesson'},
            {value: 'sia-student-class-lesson-activity', label:'Student Class Lesson'},
            {value: 'sia-one-student-class-lesson-activity', label:'One Student Class Lesson'},
        ]
    },
    {value: 'master-user', label:'Master User',
        children : [
            {value: 'add-master-user', label:'Add Master User'},
            {value: 'edit-master-user', label:'Edit Master User'},
            {value: 'delete-master-user', label:'Delete Master User'},
            {value: 'edit-master-user-others', label:'Edit Master User Others'},
            {value: 'delete-master-user-others', label:'Delete Master User Others'},
        ]
    },
    {value: 'master-role', label:'Master Role',
        children: [
            {value: 'add-master-role', label:'Add Master Role'},
            {value: 'edit-master-role', label:'Edit Master Role'},
            {value: 'delete-master-role', label:'Delete Master Role'},
        ]
    }
]


const createRole = async (name) => {
    return await db.role.create({
        name: name
    })
}

const createAccess = async() => {
    await Promise.all(accesses.map(async item=>{
        const create = await db.access.create({
            parent_id: 0,
            name: item.value,
            label: item.label
        })
        if(item.children){
            await Promise.all(item.children.map(async item=>{
                await db.access.create({
                    parent_id: create.id,
                    name: item.value,
                    label: item.label
                })
            }))
        }
    }))
}

const create = async () => {
    await createAccess();
    await Promise.all(role_accesses.map(async item=>{
        const role = await createRole(item.role)
        await Promise.all(item.accesses.map(async item=>{
            const access = await db.access.findOne({attributes:['id'], where:{name:item}})
            await db.role_access.create({
                role_id: role.id,
                access_id: access.id
            })
        }))

        if(item.role === 'superadmin'){
            return await db.user.create({
                name: 'Also codes',
                email: 'alsocodes@gmail.com',
                username: 'also',
                password: await bcrypt.hash('12345678', 10),
                role_id: role.id,
                user_type : "administrator"
            });

        }
    }))

    return true;
}

module.exports = { create }