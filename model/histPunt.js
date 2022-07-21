module.exports={
  obtener:function (conexion, funcion){
    conexion.query('select*from historico_punto',funcion)
  },
  insertar:function(conexion,datos,funcion){
    conexion.query('insert into historico_punto(nombre, descripcion) values($1,$2)',[datos.nombre, datos.descripcion],funcion)
  }
} 