const { Client } = require('pg')

const client = new Client({
  host: 'localhost', 
  port: '5432',
  user: 'postgres',
  password: 'Angelo2002',
  database: 'SweetUCAB'
})


client.connect((err)=>{
  if(!err){
    console.log('conectado')
  }else
    console.log('no conectado')
})


module.exports = client;