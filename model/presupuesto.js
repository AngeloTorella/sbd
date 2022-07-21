module.exports={
  obtener:function (conexion,funcion) {
    conexion.query('select codigo from presupuesto',funcion)
  }
}