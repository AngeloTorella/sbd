var client=require('../config/conexion')
var descuento=require('../model/descuento')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    descuento.obtener(client,function (err,datos) {
      console.log(datos)
      descuento.myproducto(client,function (err,lprod) {
      res.render('descuento/index',{title:'decsuentos',productos:datos, prodl:lprod})
      })
    })
        
      //selecciono la ruta y los datos a enviar
  },
  crear:function(req,res){
    res.render('descuento/crear')
  }
}