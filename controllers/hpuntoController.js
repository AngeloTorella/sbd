// modifica todo lo que viene de la ruta maneja lo que va a la ruta y el modelo
var client=require('../config/conexion')
var hpunto=require('../model/hpunto')

module.exports={
  index:function(req,res){
    hpunto.obtener(client,function(err,datos){
      console.log(datos )
      res.render('hpunto/index.ejs', { title: 'Express', hpunto: datos})
    })
  }, 
  crear:function(req,res){
    res.render('hpunto/crear')
  },
  guardar:function (req,res) {
    console.log(req.body);
    hpunto.insertar(client,req.body,function(err){
       res.redirect('/hpunto');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    hpunto.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    hpunto.borrar(client,req.params.codigo,function(err){
      res.redirect('/hpunto')
    })
  },
  editar:function (req,res) {
    hpunto.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      console.log(registrosparams.rows[0])
      res.render('hpunto/editar',{hpunto:registrosparams.rows[0]})
    }) 
  }, 
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) { 
    console.log(req.body.nombre)
  }


}
