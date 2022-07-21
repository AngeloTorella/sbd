var client=require('../config/conexion')
var usuario=require('../model/usuario')

module.exports={
  index:function(req,res){
    usuario.obtener(client,function(err,datos){
      console.log(datos )
      res.render('usuarios/index.ejs', { title: 'Express', user: datos})
    })
  },
  guardar:function (req,res) {
    console.log(req.body);
    usuario.insertar(client,req.body,function(err){
       res.redirect('/usuarios');
    })
  }
}