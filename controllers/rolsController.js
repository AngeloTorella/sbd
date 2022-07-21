// modifica todo lo que viene de la ruta maneja lo que va a la ruta y el modelo
var client=require('../config/conexion')
var rol=require('../model/rol')
var borrar = require('fs')
const { Console } = require('console')


module.exports={
  index:function(req,res){
    rol.obtener(client,function(err,datos){
      console.log(datos )
      res.render('rols/index.ejs', { title: 'Express', rols: datos})
    })
  }, 
  crear:function(req,res){
    res.render('rols/crear')
  },
  guardar:function (req,res) {
    console.log(req.body);
    rol.insertar(client,req.body,function(err){
       res.redirect('/rols');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    rol.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    rol.borrar(client,req.params.codigo,function(err){
      res.redirect('/rols')
    })
  },
  editar:function (req,res) {
    res.render('rols/editar')
  },
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) {
    console.log(req.body.nombre)
  }


}
