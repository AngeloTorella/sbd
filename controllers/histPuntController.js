// modifica todo lo que viene de la ruta maneja lo que va a la ruta y el modelo
var client=require('../config/conexion')
var punto=require('../model/histPunt')
var borrar = require('fs')
const { Console } = require('console')


module.exports={
  index:function(req,res){
    punto.obtener(client,function(err,datos){
      console.log(datos )
      res.render('punto/index.ejs', { title: 'Express', punto: datos})
    })
  }, 
  crear:function(req,res){
    res.render('punto/crear')
  },
  guardar:function (req,res) {
    console.log(req.body);
    punto.insertar(client,req.body,function(err){
       res.redirect('/punto');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    punto.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    punto.borrar(client,req.params.codigo,function(err){
      res.redirect('/punto')
    })
  },
  editar:function (req,res) {
    punto.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      console.log(registrosparams.rows[0])
      res.render('punto/editar',{punto:registrosparams.rows[0]})
    }) 
  }, 
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) { 
    console.log(req.body.nombre)
  }


}
