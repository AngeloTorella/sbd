module.exports={
  obtener:function (conexion, funcion){
    conexion.query('select*from usuario',funcion)
  },
  insertar:function(conexion,datos,funcion){
    conexion.query('insert into usuario(nombre,clave, 1) values($1,$2)',[datos.nombre, datos.clave],funcion)
  }
}