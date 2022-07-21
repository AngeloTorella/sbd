module.exports={
  obtener:function (conexion, funcion){
    conexion.query('select * from usuario',funcion)
  },
  insertar:function(conexion,datos,funcion){
    conexion.query('insert into usuario (nombre,contrasenia) values ($1,$2)',[datos.nombre, datos.clave],funcion)
  },  
  retornarPorClave:function (conexion,codigo,funcion) {
    conexion.query('select * from usuario where codigo=$1',[codigo],funcion)
  }  
} 