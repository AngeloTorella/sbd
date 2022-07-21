var client=require('../config/conexion')
var descuento=require('../model/descuento')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    descuento.obtener(client,function (err,datos) {
      console.log(datos)
      //selecciono la ruta y los datos a enviar
      res.render('descuento/index',{title:'decsuentos',productos:datos})
    })
  }
}