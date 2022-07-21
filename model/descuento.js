module.exports={
  obtener:function (conexion,funcion){
    conexion.query("SELECT p.nombre, d.porcentaje, d.fecha_inicio, d.fecha_fin FROM descuento d,caramelo p WHERE p.codigo=d.d_caramelo",funcion)
  },
  myproducto:function (conexion,funcion){
    conexion.query("select codigo, nombre from caramelo",funcion)
  },
  insertar:function(conexion,datos,funcion){
    conexion.query('insert into descuento() values($1,$2)',[datos.nombre, datos.descripcion],funcion)
  }
}