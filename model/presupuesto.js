module.exports={
  obtener:function (conexion,funcion) {
    conexion.query('select*from presupuesto',funcion)
  }
}