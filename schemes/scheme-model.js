const db = require('../data/db-config.js');

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes')
    .where({id: id});
}

// select st.id, sc.scheme_name, st.step_number, st.instructions
// from schemes as sc
// join steps as st
// on sc.id = st.scheme_id

function findSteps(id) {
  return db('schemes as sc')
    .join('steps as st', 'sc.id', 'st.scheme_id')
    .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
    .where({ 'sc.id': id });
}

function add(schemeData) {
  return db('schemes')
    .insert(schemeData);
}

function update(changes, id) {
  return db('schemes')
    .where({ id: id })
    .update(changes);
}

function remove(id) {
  return db('schemes')
    .where({ id: id })
    .del();
}


module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};