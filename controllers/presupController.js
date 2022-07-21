var client=require('../config/conexion')
var presup=require('../model/presupuesto')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    presup.obtener(client,function (err,datos) {
      console.log(datos)
      //selecciono la ruta y los datos a enviar
      res.render('presupuesto/index',{title:'presupuestos',productos:datos})
    })
  }
}