var client=require('../config/conexion')
var prod=require('../model/prod')

module.exports={
  index:function (req,res) {
    //hago uso de lo que tenemos en modelo 
    prod.obtener(client,function (err,datos) {
      console.log(datos)
      res.render('productos/index',{title:'Aplicacion'})
    })
    
  }
}