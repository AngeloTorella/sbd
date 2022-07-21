// modifica todo lo que viene de la ruta maneja lo que va a la ruta y el modelo
var client=require('../config/conexion')
var usuario=require('../model/usuario')
var borrar = require('fs')
const { Console } = require('console')


module.exports={
  index:function(req,res){
    usuario.obtener(client,function(err,datos){
      console.log(datos )
      res.render('usuarios/index.ejs', { title: 'Express', usuarios: datos})
    }) 
  },  
  uno:function (conexion,res,dato,funcion) {
    res.render('usuarios/crear', { title: 'Express', noj: dato})
  } , 
  crear:function(req,res){
    res.render('usuarios/crear')
  },
  guardar:function (req,res) {
    console.log(req.body);
    usuario.insertar(client,req.body,function(err){
       res.redirect('/usuarios');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    usuario.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    usuario.borrar(client,req.params.codigo,function(err){
      res.redirect('/usuarios')
    })
  },
  editar:function (req,res) {
    usuario.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      console.log(registrosparams.rows[0])
      res.render('usuarios/editar',{usuario:registrosparams.rows[0]})
    }) 
  }, 
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) { 
    console.log(req.body.nombre)
  } 
}
