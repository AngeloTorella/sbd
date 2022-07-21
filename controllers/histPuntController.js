var client=require('../config/conexion')
var histPunt=require('../model/histPunt')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    histPunt.obtener(client,function (err,datos) {
      console.log(datos)
      histPunt.myproducto(client,function (err,lprod) {
      res.render('histPunt/index',{title:'histPunt',productos:datos, prodl:lprod})
      })
    })
      
      //selecciono la ruta y los datos a enviar
  },
  crear:function(req,res){
    res.render('histPunt/crear')
  }, 
  guardar:function (req,res) {
    console.log(req.body);
    histPunt.insertar(client,req.body,function(err){
       res.redirect('/histPunt');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    histPunt.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    histPunt.borrar(client,req.params.codigo,function(err){
      res.redirect('/histPunt')
    })
  }, 
  editar:function (req,res) {
    histPunt.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      console.log(registrosparams.rows[0])
      res.render('histPunt/editar',{histPunt:registrosparams.rows[0]})
    }) 
  }, 
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) { 
    console.log(req.body.nombre)
  }
}