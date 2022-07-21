module.exports={
  obtener:function (conexion,funcion) {
    conexion.query('select nombre from caramelo',funcion)
  }
}