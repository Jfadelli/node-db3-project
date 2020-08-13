const db = require('../data/db-config')

function find(){
return db('schemes')
}

function findById(id){
    return db('schemes')
        .where({id})
        .first()
}

function findSteps(scheme_id){
    return db('steps')
    .where({scheme_id})
    .join('schemes', 'steps.scheme_id', 'schemes.id')
    .orderBy('steps.step_number')
}

function add(scheme){
    return (
        db('schemes')
            .insert(scheme)
            .returning('id')
            .then(ids => {
                const id = ids [0];
                return findById(id)
        })
    )
}

function update(changes, id){
    return db('schemes')
    .where("id", id)
    .update(changes)
}

function remove(id){
    return db('schemes').where("id", id).del()
}

module.exports={ 
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}