var client=require('../config/conexion')
var histPunt=require('../model/histPunt')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    histPunt.obtener(client,function (err,datos) {
      console.log(datos)
      //selecciono la ruta y los datos a enviar
      res.render('histPunt/index',{title:'Historico de punto',productos:datos})
    })
  }
}