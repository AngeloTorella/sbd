var client=require('../config/conexion')
var descuento=require('../model/descuento')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    descuento.obtener(client,function (err,datos) {
      console.log(datos)
      descuento.myproducto(client,function (err,lprod) {
      res.render('descuento/index',{title:'descuento',productos:datos, prodl:lprod})
      })
    })
      
      //selecciono la ruta y los datos a enviar
  },
  crear:function(req,res){
    res.render('descuento/crear')
  }, 
  guardar:function (req,res) {
    console.log(req.body);
    rol.insertar(client,req.body,function(err){
       res.redirect('/descuento');
    })
  },
  eliminar:function (req,res) {
    console.log('recepcion de datos')
    console.log(req.params.codigo)
    rol.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      
    })
    rol.borrar(client,req.params.codigo,function(err){
      res.redirect('/descuento')
    })
  },
  editar:function (req,res) {
    rol.retornarPorClave(client,req.params.codigo,function (err,registrosparams) {
      console.log(registrosparams.rows[0])
      res.render('descuento/editar',{rol:registrosparams.rows[0]})
    }) 
  }, 
  actualizar:function (req,res) {
    console.log(req.body.nombre)
  },
  ordenar:function (req,res) { 
    console.log(req.body.nombre)
  }
}