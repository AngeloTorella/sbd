module.exports={
  obtener:function (conexion, funcion){
    conexion.query('select nombre from rol',funcion)
  },
  insertar:function(conexion,datos,funcion){
    conexion.query('insert into rol(nombre, descripcion) values($1,$2)',[datos.nombre, datos.descripcion],funcion)
  },  
  retornarPorClave:function (conexion,codigo,funcion) {
    conexion.query('select nombre from rol where codigo=$1',[codigo],funcion)
  }, 
  borrar:function (conexion,clave,funcion) {
    conexion.query('delete from rol where codigo=$1',[clave],funcion)
  }, 
  ordenar:function (conexion,clave,funcion) {
  },
  uno:function (conexion,clave,funcion) {
  } 
} 